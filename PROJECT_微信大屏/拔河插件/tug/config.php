<?php
// 加载weixin config
if(file_exists("../api/weixin.php") && $conf['weixin_switch']){
    $weixin=1;
    $flag=new M('weixin_config');
    $weixinconf=$flag->find();
}else{
    $weixin=0;
}
// 加载weibo config 
if(file_exists("../api/weibo.php") && $conf['weibo_switch']){
    $weibo=1;
    $flag=new M('weibo_config');
    $weiboconf=$flag->find();
}else{
    $weibo=0;
}
// 加载插件config
$plugc=new M('plugs');
$plugconf=$plugc->find('name="tug"');

