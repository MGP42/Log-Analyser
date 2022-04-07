--
-- PostgreSQL database dump
--

-- Dumped from database version 13.6
-- Dumped by pg_dump version 13.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: boons_generation_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boons_generation_group (
    buffs_id bigint NOT NULL,
    aegis double precision DEFAULT 0 NOT NULL,
    alacrity double precision DEFAULT 0 NOT NULL,
    fury double precision DEFAULT 0 NOT NULL,
    might double precision DEFAULT 0 NOT NULL,
    protection double precision DEFAULT 0 NOT NULL,
    quickness double precision DEFAULT 0 NOT NULL,
    regeneration double precision DEFAULT 0 NOT NULL,
    resistance double precision DEFAULT 0 NOT NULL,
    retaliation double precision DEFAULT 0 NOT NULL,
    stability double precision DEFAULT 0 NOT NULL,
    swiftness double precision DEFAULT 0 NOT NULL,
    vigor double precision DEFAULT 0 NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.boons_generation_group OWNER TO postgres;

--
-- Name: boons_generation_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boons_generation_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boons_generation_group_id_seq OWNER TO postgres;

--
-- Name: boons_generation_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boons_generation_group_id_seq OWNED BY public.boons_generation_group.id;


--
-- Name: boons_generation_offgroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boons_generation_offgroup (
    buffs_id bigint,
    aegis double precision DEFAULT 0,
    alacrity double precision DEFAULT 0,
    fury double precision DEFAULT 0,
    might double precision DEFAULT 0,
    protection double precision DEFAULT 0,
    quickness double precision DEFAULT 0,
    regeneration double precision DEFAULT 0,
    resistance double precision DEFAULT 0,
    retaliation double precision DEFAULT 0,
    stability double precision DEFAULT 0,
    swiftness double precision DEFAULT 0,
    vigor double precision DEFAULT 0,
    id bigint NOT NULL
);


ALTER TABLE public.boons_generation_offgroup OWNER TO postgres;

--
-- Name: boons_generation_offgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boons_generation_offgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boons_generation_offgroup_id_seq OWNER TO postgres;

--
-- Name: boons_generation_offgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boons_generation_offgroup_id_seq OWNED BY public.boons_generation_offgroup.id;


--
-- Name: boons_generation_self; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boons_generation_self (
    buffs_id bigint,
    aegis double precision DEFAULT 0,
    alacrity double precision DEFAULT 0,
    fury double precision DEFAULT 0,
    might double precision DEFAULT 0,
    protection double precision DEFAULT 0,
    quickness double precision DEFAULT 0,
    regeneration double precision DEFAULT 0,
    resistance double precision DEFAULT 0,
    retaliation double precision DEFAULT 0,
    stability double precision DEFAULT 0,
    swiftness double precision DEFAULT 0,
    vigor double precision DEFAULT 0,
    id bigint NOT NULL
);


ALTER TABLE public.boons_generation_self OWNER TO postgres;

--
-- Name: boons_generation_self_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boons_generation_self_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boons_generation_self_id_seq OWNER TO postgres;

--
-- Name: boons_generation_self_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boons_generation_self_id_seq OWNED BY public.boons_generation_self.id;


--
-- Name: boons_generation_squad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boons_generation_squad (
    buffs_id bigint,
    aegis double precision DEFAULT 0,
    alacrity double precision DEFAULT 0,
    fury double precision DEFAULT 0,
    might double precision DEFAULT 0,
    protection double precision DEFAULT 0,
    quickness double precision DEFAULT 0,
    regeneration double precision DEFAULT 0,
    resistance double precision DEFAULT 0,
    retaliation double precision DEFAULT 0,
    stability double precision DEFAULT 0,
    swiftness double precision DEFAULT 0,
    vigor double precision DEFAULT 0,
    id bigint NOT NULL
);


ALTER TABLE public.boons_generation_squad OWNER TO postgres;

--
-- Name: boons_generation_squad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boons_generation_squad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boons_generation_squad_id_seq OWNER TO postgres;

--
-- Name: boons_generation_squad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boons_generation_squad_id_seq OWNED BY public.boons_generation_squad.id;


--
-- Name: boons_uptime; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boons_uptime (
    buffs_id bigint,
    aegis double precision DEFAULT 0,
    alacrity double precision DEFAULT 0,
    fury double precision DEFAULT 0,
    might double precision DEFAULT 0,
    protection double precision DEFAULT 0,
    quickness double precision DEFAULT 0,
    regeneration double precision DEFAULT 0,
    resistance double precision DEFAULT 0,
    retaliation double precision DEFAULT 0,
    stability double precision DEFAULT 0,
    swiftness double precision DEFAULT 0,
    vigor double precision DEFAULT 0,
    id bigint NOT NULL
);


ALTER TABLE public.boons_uptime OWNER TO postgres;

--
-- Name: boons_uptime_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boons_uptime_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boons_uptime_id_seq OWNER TO postgres;

--
-- Name: boons_uptime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boons_uptime_id_seq OWNED BY public.boons_uptime.id;


--
-- Name: boss; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boss (
    id bigint NOT NULL,
    name character varying NOT NULL,
    content character varying NOT NULL,
    wing character varying NOT NULL,
    encounter character varying NOT NULL
);


ALTER TABLE public.boss OWNER TO postgres;

--
-- Name: boss_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boss_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boss_id_seq OWNER TO postgres;

--
-- Name: boss_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boss_id_seq OWNED BY public.boss.id;


--
-- Name: buffs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.buffs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.buffs_id_seq OWNER TO postgres;

--
-- Name: buffs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buffs (
    id bigint DEFAULT nextval('public.buffs_id_seq'::regclass) NOT NULL,
    character_id bigint NOT NULL,
    phases_id bigint NOT NULL
);


ALTER TABLE public.buffs OWNER TO postgres;

--
-- Name: character_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.character_id_seq OWNER TO postgres;

--
-- Name: character; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."character" (
    id bigint DEFAULT nextval('public.character_id_seq'::regclass) NOT NULL,
    player_id bigint NOT NULL,
    name character varying NOT NULL,
    profession character varying NOT NULL
);


ALTER TABLE public."character" OWNER TO postgres;

--
-- Name: combat_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.combat_stats (
    id bigint NOT NULL,
    character_id bigint NOT NULL,
    encounter_id bigint NOT NULL,
    condition bigint NOT NULL,
    concentration bigint NOT NULL,
    healing bigint NOT NULL,
    toughness bigint NOT NULL,
    subgroup bigint NOT NULL
);


ALTER TABLE public.combat_stats OWNER TO postgres;

--
-- Name: character_stats_concentration_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_stats_concentration_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.character_stats_concentration_seq OWNER TO postgres;

--
-- Name: character_stats_concentration_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.character_stats_concentration_seq OWNED BY public.combat_stats.concentration;


--
-- Name: character_stats_condition_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_stats_condition_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.character_stats_condition_seq OWNER TO postgres;

--
-- Name: character_stats_condition_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.character_stats_condition_seq OWNED BY public.combat_stats.condition;


--
-- Name: character_stats_healing_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_stats_healing_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.character_stats_healing_seq OWNER TO postgres;

--
-- Name: character_stats_healing_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.character_stats_healing_seq OWNED BY public.combat_stats.healing;


--
-- Name: character_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.character_stats_id_seq OWNER TO postgres;

--
-- Name: character_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.character_stats_id_seq OWNED BY public.combat_stats.id;


--
-- Name: character_stats_phases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_stats_phases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.character_stats_phases_id_seq OWNER TO postgres;

--
-- Name: character_stats_phases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.character_stats_phases_id_seq OWNED BY public.combat_stats.encounter_id;


--
-- Name: character_stats_toughness_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_stats_toughness_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.character_stats_toughness_seq OWNER TO postgres;

--
-- Name: character_stats_toughness_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.character_stats_toughness_seq OWNED BY public.combat_stats.toughness;


--
-- Name: encounter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.encounter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.encounter_id_seq OWNER TO postgres;

--
-- Name: encounter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.encounter (
    id bigint DEFAULT nextval('public.encounter_id_seq'::regclass) NOT NULL,
    run_id bigint NOT NULL,
    logs_id bigint NOT NULL,
    boss_id bigint NOT NULL,
    duration integer NOT NULL,
    time_start timestamp with time zone NOT NULL,
    time_end timestamp with time zone NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.encounter OWNER TO postgres;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id bigint NOT NULL,
    tag character varying NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logs_id_seq OWNER TO postgres;

--
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs (
    id bigint DEFAULT nextval('public.logs_id_seq'::regclass) NOT NULL,
    run_id bigint NOT NULL,
    arc_version character varying NOT NULL,
    path character varying NOT NULL,
    db_version integer NOT NULL
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- Name: member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.member_id_seq OWNER TO postgres;

--
-- Name: member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member (
    id bigint DEFAULT nextval('public.member_id_seq'::regclass) NOT NULL,
    player_id bigint NOT NULL,
    groups_id bigint NOT NULL,
    "from" timestamp without time zone,
    "to" timestamp without time zone
);


ALTER TABLE public.member OWNER TO postgres;

--
-- Name: phases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.phases_id_seq OWNER TO postgres;

--
-- Name: phases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phases (
    id bigint DEFAULT nextval('public.phases_id_seq'::regclass) NOT NULL,
    encounter_id bigint NOT NULL,
    breakbar boolean NOT NULL,
    name character varying NOT NULL,
    start bigint NOT NULL,
    ende bigint NOT NULL
);


ALTER TABLE public.phases OWNER TO postgres;

--
-- Name: player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.player_id_seq OWNER TO postgres;

--
-- Name: player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player (
    id bigint DEFAULT nextval('public.player_id_seq'::regclass) NOT NULL,
    account_name character varying NOT NULL,
    nick_name character varying NOT NULL
);


ALTER TABLE public.player OWNER TO postgres;

--
-- Name: run_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.run_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.run_id_seq OWNER TO postgres;

--
-- Name: run; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.run (
    id bigint DEFAULT nextval('public.run_id_seq'::regclass) NOT NULL,
    groups_id bigint NOT NULL,
    name character varying NOT NULL,
    notes text
);


ALTER TABLE public.run OWNER TO postgres;

--
-- Name: stats_damage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stats_damage (
    character_id bigint NOT NULL,
    phases_id bigint NOT NULL,
    all_cc double precision NOT NULL,
    all_total double precision NOT NULL,
    all_condition double precision NOT NULL,
    all_power double precision NOT NULL,
    target_cc double precision NOT NULL,
    target_total double precision NOT NULL,
    target_condition double precision NOT NULL,
    target_power double precision NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.stats_damage OWNER TO postgres;

--
-- Name: stats_damage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stats_damage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stats_damage_id_seq OWNER TO postgres;

--
-- Name: stats_damage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stats_damage_id_seq OWNED BY public.stats_damage.id;


--
-- Name: stats_defensive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stats_defensive (
    character_id bigint NOT NULL,
    phases_id bigint NOT NULL,
    absorbed bigint NOT NULL,
    blocked bigint NOT NULL,
    damage_taken bigint NOT NULL,
    dead bigint NOT NULL,
    dodges bigint NOT NULL,
    downed bigint NOT NULL,
    evaded bigint NOT NULL,
    interrupted bigint NOT NULL,
    invuled bigint NOT NULL,
    missed bigint NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.stats_defensive OWNER TO postgres;

--
-- Name: stats_defensive_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stats_defensive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stats_defensive_id_seq OWNER TO postgres;

--
-- Name: stats_defensive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stats_defensive_id_seq OWNED BY public.stats_defensive.id;


--
-- Name: stats_support; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stats_support (
    character_id bigint NOT NULL,
    phases_id bigint NOT NULL,
    boon_strips bigint NOT NULL,
    cleanse_other bigint NOT NULL,
    cleanse_self bigint NOT NULL,
    ressurect_time double precision NOT NULL,
    ressurects bigint NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.stats_support OWNER TO postgres;

--
-- Name: stats_support_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stats_support_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stats_support_id_seq OWNER TO postgres;

--
-- Name: stats_support_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stats_support_id_seq OWNED BY public.stats_support.id;


--
-- Name: boons_generation_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boons_generation_group ALTER COLUMN id SET DEFAULT nextval('public.boons_generation_group_id_seq'::regclass);


--
-- Name: boons_generation_offgroup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boons_generation_offgroup ALTER COLUMN id SET DEFAULT nextval('public.boons_generation_offgroup_id_seq'::regclass);


--
-- Name: boons_generation_self id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boons_generation_self ALTER COLUMN id SET DEFAULT nextval('public.boons_generation_self_id_seq'::regclass);


--
-- Name: boons_generation_squad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boons_generation_squad ALTER COLUMN id SET DEFAULT nextval('public.boons_generation_squad_id_seq'::regclass);


--
-- Name: boons_uptime id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boons_uptime ALTER COLUMN id SET DEFAULT nextval('public.boons_uptime_id_seq'::regclass);


--
-- Name: boss id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boss ALTER COLUMN id SET DEFAULT nextval('public.boss_id_seq'::regclass);


--
-- Name: combat_stats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combat_stats ALTER COLUMN id SET DEFAULT nextval('public.character_stats_id_seq'::regclass);


--
-- Name: combat_stats encounter_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combat_stats ALTER COLUMN encounter_id SET DEFAULT nextval('public.character_stats_phases_id_seq'::regclass);


--
-- Name: combat_stats condition; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combat_stats ALTER COLUMN condition SET DEFAULT nextval('public.character_stats_condition_seq'::regclass);


--
-- Name: combat_stats concentration; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combat_stats ALTER COLUMN concentration SET DEFAULT nextval('public.character_stats_concentration_seq'::regclass);


--
-- Name: combat_stats healing; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combat_stats ALTER COLUMN healing SET DEFAULT nextval('public.character_stats_healing_seq'::regclass);


--
-- Name: combat_stats toughness; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combat_stats ALTER COLUMN toughness SET DEFAULT nextval('public.character_stats_toughness_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: stats_damage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats_damage ALTER COLUMN id SET DEFAULT nextval('public.stats_damage_id_seq'::regclass);


--
-- Name: stats_defensive id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats_defensive ALTER COLUMN id SET DEFAULT nextval('public.stats_defensive_id_seq'::regclass);


--
-- Name: stats_support id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats_support ALTER COLUMN id SET DEFAULT nextval('public.stats_support_id_seq'::regclass);


--
-- Name: buffs unique_Buffs_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buffs
    ADD CONSTRAINT "unique_Buffs_id" UNIQUE (id);


--
-- Name: member unique_Member_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT "unique_Member_id" UNIQUE (id);


--
-- Name: boons_generation_group unique_boons_generation_group_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boons_generation_group
    ADD CONSTRAINT unique_boons_generation_group_id UNIQUE (id);


--
-- Name: boons_generation_offgroup unique_boons_generation_offgroup_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boons_generation_offgroup
    ADD CONSTRAINT unique_boons_generation_offgroup_id UNIQUE (id);


--
-- Name: boons_generation_self unique_boons_generation_self_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boons_generation_self
    ADD CONSTRAINT unique_boons_generation_self_id UNIQUE (id);


--
-- Name: boons_generation_squad unique_boons_generation_squad_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boons_generation_squad
    ADD CONSTRAINT unique_boons_generation_squad_id UNIQUE (id);


--
-- Name: boons_uptime unique_boons_uptime_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boons_uptime
    ADD CONSTRAINT unique_boons_uptime_id UNIQUE (id);


--
-- Name: boss unique_boss_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boss
    ADD CONSTRAINT unique_boss_id UNIQUE (id);


--
-- Name: character unique_character_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."character"
    ADD CONSTRAINT unique_character_id UNIQUE (id);


--
-- Name: combat_stats unique_character_stats_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combat_stats
    ADD CONSTRAINT unique_character_stats_id UNIQUE (id);


--
-- Name: encounter unique_encounter_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.encounter
    ADD CONSTRAINT unique_encounter_id UNIQUE (id);


--
-- Name: groups unique_group_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT unique_group_id UNIQUE (id);


--
-- Name: logs unique_logs_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT unique_logs_id UNIQUE (id);


--
-- Name: phases unique_phases_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phases
    ADD CONSTRAINT unique_phases_id UNIQUE (id);


--
-- Name: player unique_player_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT unique_player_id UNIQUE (id);


--
-- Name: run unique_run_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.run
    ADD CONSTRAINT unique_run_id UNIQUE (id);


--
-- Name: stats_defensive unique_stats_defensive_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats_defensive
    ADD CONSTRAINT unique_stats_defensive_id UNIQUE (id);


--
-- Name: stats_support unique_stats_support_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats_support
    ADD CONSTRAINT unique_stats_support_id UNIQUE (id);


--
-- Name: encounter boss_encounter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.encounter
    ADD CONSTRAINT boss_encounter_fkey FOREIGN KEY (boss_id) REFERENCES public.boss(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: boons_generation_group buffs_boons_generation_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boons_generation_group
    ADD CONSTRAINT buffs_boons_generation_group_fkey FOREIGN KEY (buffs_id) REFERENCES public.buffs(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: boons_generation_offgroup buffs_boons_generation_offgroup_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boons_generation_offgroup
    ADD CONSTRAINT buffs_boons_generation_offgroup_fkey FOREIGN KEY (buffs_id) REFERENCES public.buffs(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: boons_generation_self buffs_boons_generation_self_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boons_generation_self
    ADD CONSTRAINT buffs_boons_generation_self_fkey FOREIGN KEY (buffs_id) REFERENCES public.buffs(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: boons_generation_squad buffs_boons_generation_squad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boons_generation_squad
    ADD CONSTRAINT buffs_boons_generation_squad_fkey FOREIGN KEY (buffs_id) REFERENCES public.buffs(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: boons_uptime buffs_boons_uptime_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boons_uptime
    ADD CONSTRAINT buffs_boons_uptime_fkey FOREIGN KEY (buffs_id) REFERENCES public.buffs(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: buffs character_buffs_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buffs
    ADD CONSTRAINT character_buffs_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: combat_stats character_combat_stats_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combat_stats
    ADD CONSTRAINT character_combat_stats_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: stats_damage character_stats_damage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats_damage
    ADD CONSTRAINT character_stats_damage_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: stats_defensive character_stats_defensive_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats_defensive
    ADD CONSTRAINT character_stats_defensive_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: stats_support character_stats_support_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats_support
    ADD CONSTRAINT character_stats_support_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: combat_stats encounter_combat_stats_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combat_stats
    ADD CONSTRAINT encounter_combat_stats_fkey FOREIGN KEY (encounter_id) REFERENCES public.encounter(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: phases encounter_phases_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phases
    ADD CONSTRAINT encounter_phases_fkey FOREIGN KEY (encounter_id) REFERENCES public.encounter(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: member groups_member_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT groups_member_fkey FOREIGN KEY (groups_id) REFERENCES public.groups(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: run groups_run_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.run
    ADD CONSTRAINT groups_run_fkey FOREIGN KEY (groups_id) REFERENCES public.groups(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: encounter logs_encounter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.encounter
    ADD CONSTRAINT logs_encounter_fkey FOREIGN KEY (logs_id) REFERENCES public.logs(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: buffs phases_buffs_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buffs
    ADD CONSTRAINT phases_buffs_fkey FOREIGN KEY (phases_id) REFERENCES public.phases(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: stats_damage phases_stats_damage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats_damage
    ADD CONSTRAINT phases_stats_damage_fkey FOREIGN KEY (phases_id) REFERENCES public.phases(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: stats_defensive phases_stats_defensive_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats_defensive
    ADD CONSTRAINT phases_stats_defensive_fkey FOREIGN KEY (phases_id) REFERENCES public.phases(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: stats_support phases_stats_support_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats_support
    ADD CONSTRAINT phases_stats_support_fkey FOREIGN KEY (phases_id) REFERENCES public.phases(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: character player_character_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."character"
    ADD CONSTRAINT player_character_fkey FOREIGN KEY (player_id) REFERENCES public.player(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: member player_member_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT player_member_fkey FOREIGN KEY (player_id) REFERENCES public.player(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: encounter run_encounter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.encounter
    ADD CONSTRAINT run_encounter_fkey FOREIGN KEY (run_id) REFERENCES public.run(id) MATCH FULL ON DELETE CASCADE;


--
-- Name: logs run_logs_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT run_logs_fkey FOREIGN KEY (run_id) REFERENCES public.run(id) MATCH FULL ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

