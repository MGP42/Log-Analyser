<?php
    include '../_config/paths.php';
    #$x=$directory_scripts.'db_access.php';
    #include "$x";
    include "{$directory_scripts}db_access.php";    
    #include '/home/dki/Documents/arc-v2/Git/Website/_scripts/'.'db_access.php';
    $query = pg_query("select * from run");
    while ($row = pg_fetch_row($query)) {
        echo $row[0];
    }
?>