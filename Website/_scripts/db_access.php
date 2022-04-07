<?php
    include dirname(__FILE__).'/../_config/db_access.php';
    $db_conn = pg_connect("host=".$db_host." port=".$db_port." dbname=".$db_name." user=".$db_uname." password=".$db_passwd);
?>