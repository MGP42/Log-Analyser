<html>

<head>
    <link rel="stylesheet" href="../_style/dark/general.css">
    <link rel="stylesheet" href="../_style/dark/tabs.css">
    <script src="https://cdn.plot.ly/plotly-2.6.3.min.js"></script>
    <script src=Run/cookie.js></script>
    <title>Run Details</title>
</head>

<body>
    <!-- Get Data from Database -->
    <?php
    include '../_config/paths.php';
    include "{$directory_scripts}db_access.php";
    $groups = pg_fetch_all(pg_query("select id, tag, name from groups"));
    $content = pg_fetch_all(pg_query("select content from boss group by content"));
    ?>

    <!-- Navbar -->
    <div class="tab">
        <button class="tablinks" onclick="openCity(event, 'settings')">Settings</button>
        <button class="tablinks" onclick="openCity(event, 'general')" id="defaultOpen">General</button>
        <button class="tablinks" onclick="openCity(event, 'logs')">Logs</button>
        <button class="tablinks" onclick="openCity(event, 'players')">Players</button>
        <button class="tablinks" onclick="openCity(event, 'records')">Records</button>
    </div>

    <div id="settings" class="tabcontent"></div>
    <div id="general" class="tabcontent">Loading</div>
    <div id="logs" class="tabcontent"></div>
    <div id="players" class="tabcontent"></div>
    <div id="records" class="tabcontent"></div>

    <!-- NAVBAR -->
    <script>
        function openCity(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }

        // Get the element with id="defaultOpen" and click on it
        document.getElementById("defaultOpen").click();
    </script>

    <!-- Settings -->
    <script>
        sout=[];
        sout=["abc"];
        saveCookie("xyz","abababa","2");
        cookies=loadCookies();
        extendCookies("28");
        document.getElementById('settings').innerHTML = (sout.join(' \n'));
    </script>

    <?php
    $data = pg_query("select * from run");
    ?>
</body>

</html>