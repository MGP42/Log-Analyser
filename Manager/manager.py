from datetime import datetime
from datetime import date
import requests
import psycopg2
import copy
from collections import defaultdict


from config import *

#Programm version
version = 2


#text color
def dye(color,text):
    match color:
        case 'red':
            return "\033[91m"+text+"\033[0m"
        case 'green':
            return "\033[32m"+text+"\033[0m"
        case _:
            return text

# Database connection
def connect_db(host,user,database,psw):
    print ("Establishing Database connection")
    print(database+" @ "+host)
    try:
        con = psycopg2.connect(
        host = host,
        user = user,
        database = database,
        password = psw
        )
        print(dye("green","Connection established"))
        db=con.cursor()
    except:
        print(dye("red","Database connection failed"))
        connect_db(input("host: "), input("user: "), input("db: "), input("psw: "))
    print("")
    return [db,con]

#SQL request with return
def sql_request(sql):
    db.execute(sql)
    try:
        fetch=db.fetchall()
    except:
        return ""
    if not fetch:
        fetch=""
    return fetch

#anti bullshit input
def confirmed_input(text, allowed, default):
    tmp=""
    while (tmp not in allowed):
        tmp=input(text)
        if tmp=="":
            tmp=default
    return tmp

#selects account
def select_player(player):
    tmp=player
    player=sql_request("select account_name, nick_name from player where account_name='"+player+"';")
    if player =="":
        print (dye("red","Player '"+tmp+"' doesn't exist!"))
        tmp=confirmed_input("do you want to choose a different player [y/N] ", ["y","Y","n","N"], "n")
    if tmp == 'y':
        quit(input("\nnot implemented yet"))
    elif tmp == 'n':
        quit(input("\npress any key to exit..."))
    print("Player: "+player[0][1]+" ("+player[0][0]+")")
    return player[0][0]

#selects group
def select_group(gw2_acc):
    groups=sql_request("\
        select g.tag, g.name, g.id\
        from groups as g, member as m, player as p\
        where p.id=m.player_id and g.id=m.groups_id\
        and p.account_name='"+gw2_acc+"';")

    if groups=="":
        print("No groups for "+gw2_acc)
    else:
        tmp=""
        while (tmp==""):                        #repeat till valuable input
            print("Select Group")
            print ("0. Exit")
            for g in range(len(groups)):
                print(str(g+1)+". ["+groups[g][0]+"] "+groups[g][1]+" (id: "+str(groups[g][2])+")");
            print("")

            try:                                #catch DAU
                tmp=int(input("default 0: ") or 0)-1
                if tmp not in range(-1,len(groups)):
                    tmp=""
                    print(dye("red","Not a Group"))
            except:
                print ("NaN\n")
    
        if tmp not in range(len(groups)):
            quit("Quit by User")
        else:
           return str(groups[tmp][2])

#create new run
def new_run(gw2_acc,gw2_group):
    print('')
    r_name=''
    while r_name == '':
        r_name=input("name: ")
    r_notes=input("notes: ")
    r_logs=[]
    tmp=input("Logs:\n")
    while tmp != '':
        r_logs.append(tmp)
        tmp=input()

    r_id=sql_request("select distinct r.id, r.name from run as r, logs as l where r.id=l.run_id and l.path in ("+ str(r_logs)[1:-1]+");")
    #logs from more than one run, the fuck is your input
    if len(r_id) > 1:
        print(dye("red", "Logs exist in "+str(len(r_id))+" seperate runs\nabborting"))
        return
    #one run already exists
    if len(r_id) == 1:
        print("One or more Logs already exist in '"+r_id[0][1]+"'")
        tmp = confirmed_input("do you want to add the remaining logs to this run? [Y/n] ",["y","Y","n","N"],"y")
        if tmp in ["y","Y"]:
            r_id=r_id[0][0]
            r_logs = logs_clean(r_id,r_logs)
        else:
            return
    #yay new run
    else:
        print('Adding Run Data')
        r_id='new'
    
    #PROCESS
    for log in r_logs:
        #COLLECT
        l_data = logs_coll(log)
        #ADD RUN IF NOT EXISTING
        if r_id == 'new':
            print("Getting new run ID")
            r_id = sql_request("insert into run (name, notes, groups_id) values ('"+r_name+"', '"+r_notes+"', '"+gw2_group+"') returning id")[0][0]
        #ADD
        logs_add(l_data,r_id)
    return

#add log data
def logs_add(data,run):
    print("Adding Data for "+data["path"])
    id = sql_request("insert into logs (arc_version,db_version,path,run_id) values ('"+data["arc_version"]+"','"+str(data["db_version"])+"','"+data["path"]+"','"+str(run)+"') returning id")[0][0]
    encounter_add(data["encounter"],id,run)
    con.commit()
    return

#add encounter data
def encounter_add(data,log,run):
    print("  Adding Encounter Data")
    id = sql_request("insert into encounter (boss_id,duration,logs_id,run_id,success,time_end,time_start) values ('"+str(data["boss_id"])+"','"+str(data["duration"])+"','"+str(log)+"','"+str(run)+"','"+str(data["success"])+"','"+data["time_end"]+"','"+data["time_end"]+"') returning id")[0][0]
    for c in range (len(data["combat_stats"])):
        combat_stats_add(data["combat_stats"][c],data["combat_stats"][c]["character_id"],id)

    for p in range(len(data["phases"])):
        p_id = phases_add(data["phases"][p],id)
        for c in range(len(data["combat_stats"])):
            phases_stats_add(data["combat_stats"][c],p_id,p)
    return

def combat_stats_add(data,character_id,encounter_id):
    #print ("    Adding Character Details")
    sql_request("insert into combat_stats (character_id, concentration, condition, encounter_id, healing, subgroup) values('"+str(character_id)+"','"+str(data["concentration"])+"','"+str(data["condition"])+"','"+str(encounter_id)+"','"+str(data["healing"])+"','"+str(data["subgroup"])+"') returning id")[0][0]
    
    return

def phases_stats_add(data,phase_id,phase):
    stats_defensive_add(data["stats_defensive"][phase],data["character_id"],phase_id)
    stats_support_add(data["stats_support"][phase],data["character_id"],phase_id)
    stats_damage_add(data["stats_damage"][phase],data["character_id"],phase_id)
    buffs_add(data["buffs"],data["character_id"],phase_id,phase)
    return

def buffs_add(data,character,phase_id,phase):
    id = sql_request("insert into buffs (character_id,phases_id) values('"+str(character)+"','"+str(phase_id)+"') returning id")[0][0]
    boons_generation_group_add(data["boons_generation_group"][phase], id)
    boons_generation_offgroup_add(data["boons_generation_offgroup"][phase], id)
    boons_generation_self_add(data["boons_generation_self"][phase], id)
    boons_generation_squad_add(data["boons_generation_squad"][phase], id)
    boons_uptime_add(data["boons_uptime"][phase], id)
    return

def boons_generation_group_add(data,buffs):
    keys, values = dict_to_str(data)
    sql_request("insert into boons_generation_group (buffs_id"+keys+") values('"+str(buffs)+"'"+values+") returning id")
    return

def boons_generation_squad_add(data,buffs):
    keys, values = dict_to_str(data)
    sql_request("insert into boons_generation_squad (buffs_id"+keys+") values('"+str(buffs)+"'"+values+") returning id")
    return

def boons_generation_self_add(data,buffs):
    keys, values = dict_to_str(data)
    sql_request("insert into boons_generation_self (buffs_id"+keys+") values('"+str(buffs)+"'"+values+") returning id")
    return

def boons_generation_offgroup_add(data,buffs):
    keys, values = dict_to_str(data)
    sql_request("insert into boons_generation_offgroup (buffs_id"+keys+") values('"+str(buffs)+"'"+values+") returning id")
    return

def boons_uptime_add(data,buffs):
    keys, values = dict_to_str(data)
    sql_request("insert into boons_uptime (buffs_id"+keys+") values('"+str(buffs)+"'"+values+") returning id")
    return

def dict_to_str(data):
    if not data:
        return "",""
    values=""
    keys=""  
    for x in data.items():
        keys+=","+str(x[0])
        values+=",'"+str(x[1])+"'"
    return keys, str(values)

def stats_defensive_add(data,character,phase):
    sql_request("insert into stats_defensive (absorbed, blocked, character_id, damage_taken, dead, dodges, downed, evaded, interrupted, invuled, missed, phases_id) values('"+str(data["absorbed"])+"','"+str(data["blocked"])+"','"+str(character)+"','"+str(data["damage_taken"])+"','"+str(data["dead"])+"','"+str(data["dodges"])+"','"+str(data["downed"])+"','"+str(data["evaded"])+"','"+str(data["interrupted"])+"','"+str(data["invuled"])+"','"+str(data["missed"])+"','"+str(phase)+"') returning id")[0][0]
    return

def stats_support_add(data,character,phase):
    sql_request("insert into stats_support (boon_strips, character_id, cleanse_other, cleanse_self, phases_id, ressurect_time, ressurects) values('"+str(data["boon_strips"])+"','"+str(character)+"','"+str(data["cleanse_other"])+"','"+str(data["cleanse_self"])+"','"+str(phase)+"','"+str(data["ressurect_time"])+"','"+str(data["ressurects"])+"') returning id")[0][0]
    return

def stats_damage_add(data,character,phase):
    sql_request("insert into stats_damage (all_cc, all_condition, all_power, all_total, character_id, phases_id, target_cc, target_condition, target_power, target_total) values(\
        '"+str(data["all_cc"])+"','"+str(data["all_condition"])+"','"+str(data["all_power"])+"','"+str(data["all_total"])+"','"+str(character)+"','"+str(phase)+"','"+str(data["target_cc"])+"','"+str(data["target_condition"])+"','"+str(data["target_power"])+"','"+str(data["target_total"])+"') returning id")[0][0]
    return

#add phases data
def phases_add(data,encounter):
    print("    Adding Data for Phase: "+data["name"])
    id = sql_request("insert into phases (breakbar, encounter_id, name, start, ende) values('"+str(data["breakbar"])+"','"+str(encounter)+"','"+data["name"]+"','"+str(data["start"])+"','"+str(data["end"])+"') returning id")[0][0]
    return id

#ignore existing logs
def logs_clean(run_id,logs):
    tmp=sql_request("select path from logs where run_id='"+str(run_id)+"'")
    logs_exist=[]
    for c in tmp:
        logs_exist.append(c[0])
    tmp=logs
    logs=[]
    for c in tmp:
        if c not in logs_exist:
            logs.append(c)
    return logs

#Convert arcdps duration to miliseconds
def arctime_to_ms(time):
    total = 0
    for v in time.split():
        n = int(''.join(i for i in v if(i.isdigit())))
        t =     ''.join(i for i in v if(i.isalpha()))
        if t == "m":
            total += n*60000
        if t =="s":
            total += n*1000
        if t == "ms":
            total += n
    return total

#collect log data
def logs_coll(log):
    jsn = requests.get("https://dps.report/getJson?permalink=" + log).json()
    #collecting data
    print('Collecting Data for '+log)
    print('  Collectin Log Information')
    data = defaultdict(lambda: defaultdict(str))
    data['path']=log
    data['db_version']=db_version
    data['arc_version']=jsn["arcVersion"]
    data['encounter']=encounter_coll(jsn)
    return data

#collect encounter data
def encounter_coll(jsn):
    print('  Collecting Encounter Information')
    data = defaultdict(lambda: defaultdict(str))
    data['duration'] = arctime_to_ms(jsn["duration"])
    data['success'] = jsn["success"]
    data['time_start'] = jsn["timeStart"]
    data['time_end'] = jsn["timeEnd"]
    data['boss_id'] = boss_get(jsn["fightName"])
    data['phases'] = phases_coll(jsn)
    data['combat_stats'] = combat_stats_coll(jsn["players"])
    return data

#collect combat stat data
def combat_stats_coll(jsn):
    print('    Collecting Player Information')
    data = []
    for c in range(len(jsn)):
        print("      Collecting Information for "+jsn[c]["name"])
        player = defaultdict(lambda: defaultdict(str))
        player["concentration"] = jsn[c]["concentration"]
        player["healing"] = jsn[c]["healing"]
        player["toughness"] = jsn[c]["toughness"]
        player["condition"] = jsn[c]["condition"]
        player["subgroup"] = jsn[c]["group"]
        player["character_id"] = character_get(jsn[c]["account"], jsn[c]["name"], jsn[c]["profession"])
        player["stats_defensive"] = stats_defensive_coll(jsn[c]["defenses"])
        player["stats_support"] = stats_support_coll(jsn[c]["support"])
        player["stats_damage"] = stats_damage_coll(jsn[c]["dpsAll"],jsn[c]["dpsTargets"][0])
        player["buffs"] = buffs_coll(jsn[c])
        data.append(player)
    return data

#collect buff stats
def buffs_coll(jsn):
    data = defaultdict(lambda: defaultdict(str))
    try:
        data["boons_uptime"] = boons_uptime_coll(jsn["buffUptimes"])
    except:
        print(dye("red","no boon uptime"))
    try:
        data["boons_generation_group"] = boons_generation_coll(jsn["groupBuffs"])
    except:
        print(dye("red","no boon group generation"))    
    try:
        data["boons_generation_self"] = boons_generation_coll(jsn["selfBuffs"])
    except:
        print(dye("red","no boon self generation"))
    try:
        data["boons_generation_offgroup"] = boons_generation_coll(jsn["offGroupBuffs"])
    except:
        print(dye("red","no boon offgroup generation"))
    try:
        data["boons_generation_squad"] = boons_generation_coll(jsn["squadBuffs"])
    except:
        print(dye("red","no boon squad generation"))
    return data

#collect boon generation stats
def boons_generation_coll(jsn):
    data = []
    for p in range(len(jsn[0]["buffData"])):
        boon = defaultdict(lambda: defaultdict(str))        
        for b in range(len(jsn)):
            name = boon_resolver(jsn[b]["id"])
            if name:
                boon[name] = jsn[b]["buffData"][p]["generation"]
        data.append(boon)
    return data

#collect boon uptime stats
def boons_uptime_coll(jsn):
    data = []
    for p in range(len(jsn[0]["buffData"])):
        boon = defaultdict(lambda: defaultdict(str))        
        for b in range(len(jsn)):
            name = boon_resolver(jsn[b]["id"])
            if name:
                boon[name] = jsn[b]["buffData"][p]["uptime"]
        data.append(boon)
    return data

#resolves boon name by id
def boon_resolver(id):
    match id:
        case 717:
            return "protection"
        case 718:
            return "regeneration"
        case 719:
            return "swiftness"
        case 725:
            return "fury"
        case 726:
            return "vigor"
        case 740:
            return "might"
        case 743:
            return "aegis"
        case 873:
            return "regeneration"
        case 1122:
            return "stability"
        case 1187:
            return "quickness"
        case 26980:
            return "resistance"
        case 30328:
            return "alacrity"
        case _:
            return""

#collect damage stats
def stats_damage_coll(all,target):
    data=[]
    for c in range(len(all)):
        damage = defaultdict(lambda: defaultdict(str))
        damage["all_cc"] = all[c]["breakbarDamage"]
        damage["all_condition"] = all[c]["condiDps"]
        damage["all_power"] = all[c]["powerDps"]
        damage["all_total"] = all[c]["dps"]
        damage["target_cc"] = target[c]["breakbarDamage"]
        damage["target_condition"] = target[c]["condiDps"]
        damage["target_power"] = target[c]["powerDps"]
        damage["target_total"] = target[c]["dps"]
        data.append(damage)
    return data

#collect support stats
def stats_support_coll(jsn):
    data=[]
    for c in range(len(jsn)):
        support = defaultdict(lambda: defaultdict(str))
        support["boon_strips"] = jsn[c]["boonStrips"]
        support["cleanse_other"] = jsn[c]["condiCleanse"]
        support["cleanse_self"] = jsn[c]["condiCleanseSelf"]
        support["ressurect_time"] = jsn[c]["resurrectTime"]
        support["ressurects"] = jsn[c]["resurrects"]
        data.append(support)
    return data

#collect defensive stats
def stats_defensive_coll(jsn):
    data=[]
    for c in range(len(jsn)):
        defensive = defaultdict(lambda: defaultdict(str))
        defensive["absorbed"] = jsn[c]["damageBarrier"]
        defensive["blocked"] = jsn[c]["blockedCount"]
        defensive["damage_taken"] = jsn[c]["damageTaken"]
        defensive["dead"] = jsn[c]["deadCount"]
        defensive["dodges"] = jsn[c]["dodgeCount"]
        defensive["downed"] = jsn[c]["downCount"]
        defensive["evaded"] = jsn[c]["evadedCount"]
        defensive["interrupted"] = jsn[c]["interruptedCount"]
        defensive["invuled"] = jsn[c]["invulnedCount"]
        defensive["missed"] = jsn[c]["missedCount"]
        data.append(defensive)
    return data

#get character id
def character_get(account,name,profession):
    account=account.replace("'","")
    name=name.replace("'","")
    id = sql_request("select c.id from character as c, player as p where c.player_id=p.id and\
    p.account_name = '"+account+"' and \
    c.name = '"+name+"' and \
    c.profession = '"+profession+"'")
    if not id:
        id = player_get(account)
        id = character_add(id,name,profession)
    else:
        id = id[0][0]
    return id

#new character
def character_add(player_id, name, profession):
    print("        Adding Character "+name+" as new "+profession)
    id = sql_request("insert into character (player_id, name, profession) values ('"+str(player_id)+"', '"+name+"', '"+profession+"') returning id")[0][0]
    con.commit()
    return id

#get player id
def player_get(account):
    id = sql_request("select id from player where account_name='"+account+"'")
    if not id:
        print(dye("red","Player "+account+" not known"))
        id = player_add(account)
    else:
        id=id[0][0]
    return id

#add new player
def player_add(account):
    nick = input("enter nickname: ["+account[0:-5]+"] ")
    if not nick:
        nick = account[0:-5]
    id = sql_request("insert into player (account_name, nick_name) values ('"+account+"', '"+nick+"') returning id")[0][0]
    con.commit()
    return id

#collect phases data
def phases_coll(jsn):
    print('    Collecting Phase Information')
    data = []
    phases = jsn["phases"]
    for c in range(len(phases)):
        print("      Collecting Information for "+phases[c]["name"])
        phase = defaultdict(lambda: defaultdict(str))
        phase["breakbar"] = phases[c]["breakbarPhase"]
        phase["start"] = phases[c]["start"]
        phase["end"] = phases[c]["end"]
        phase["name"] = phases[c]["name"]
        data.append(phase)
    return data

#get boss id
def boss_get(name):
    id = sql_request("select id from boss where name='"+name+"';")
    if not id:
        print('')
        print(dye("red","Boss "+name+" not known"))
        id = boss_add(name)
        return id
    else:
        return id[0][0]

#add new boss
def boss_add(name):
    content = input("enter content: ")
    wing = input("enter wing: ")
    encounter = input("encounter number: ")
    id = sql_request("insert into boss (name, content, wing, encounter) values ('"+name+"', '"+content+"', '"+wing+"', '"+encounter+"') returning id")[0][0]
    con.commit()
    return id


#MAIN
print("\nElos raiding analyser DB-Managing Tool V2\n")
db,con=connect_db(db_host, db_user, db_db, db_psw)

gw2_acc=select_player(gw2_acc)

if gw2_group:
    info=sql_request("\
        select m.to, g.tag, g.name\
        from member as m, groups as g, player as p\
        where p.id=m.player_id and g.id=m.groups_id\
        and p.account_name='"+gw2_acc+"' and g.id='"+gw2_group+"'\
        order by m.to desc\
        ")
    if info:
        #player is member of group
        if info[0][0]==None:
            print("Group:  ["+info[0][1]+"] "+info[0][2])
        #player is no longer member of group    
        else:
            print(dye("red", "\nYou are no longer part of this group"))
            gw2_group=select_group(gw2_acc)
    #player has no relation to group
    else:
        print(dye("red", "\nYou were never part of this group or the group doesn't exist"))
        gw2_group=select_group(gw2_acc)

#Main Menu
menu=[]
menu.append("Exit")
menu.append("new Run")
menu.append("change Run")
menu.append("Group Management")
menu.append("Delete Data")
while(True):
    print("\nTask")
    

 
    tmp=[]
    for i in range(len(menu)):
        tmp.append(str(i))
        print(str(i)+". "+menu[i])
    match confirmed_input("select: ", tmp, "0"):
        case '0':
            quit()
        case '1':
            new_run(gw2_acc,gw2_group)

    

    if(iexit):
        break
quit("\nAll Done")