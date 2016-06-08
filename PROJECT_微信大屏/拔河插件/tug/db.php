<?php
@header("Content-type: text/html; charset=utf-8");
        include(dirname(__FILE__).'/../files/db.class.php');
        $wall_config=new M('wall_config');
        $conf=$wall_config->find();
        $bh_config=new M('bh_config');
        $bhconf=$bh_config->find();
        $ads=unserialize($bhconf['ads']);
$link= M::$wlink;
        
define("Web_ROOT",$conf['web_root']);