<?php
session_start();
require('db.php');
include 'db.mem.class.php';
$openid=$_GET['wecha_id'];
$_SESSION['openid']=$openid;
if(empty($openid)){
    die('非法访问！');
}
$bhuserc=new C('bh_user');
$bhuserm=new M('bh_user');
$userinfo=$bhuserm->find('wecha_id="'.$openid.'"');
if($userinfo){
    if($bhconf['zjpaichu']){
        $zjc=new M('zjlist');
        $zjuser=$zjc->find("wecha_id='$openid' and fromplug='tug'");
        if($zjuser){
            include('mobile/zjed.php');
            die;
        }
    }
    @$team=$_GET['team'];
    if(!empty($team)){
        $upreturn=$bhuserc->update('id="'.$userinfo['id'].'"',array('whoteam'=>$team),1);
        if($upreturn){
            //进入摇一摇界面
            include('mobile/tug.php');
            die;
        }
    }
    
}else{
    if($bhconf['zjpaichu']){
        $zjc=new M('zjlist');
        $zjuser=$zjc->find("wecha_id='$openid' and fromplug='tug'");
        if($zjuser){
            include('mobile/zjed.php');
            die;
        }
    }

    $replayc=new C('bh_replay');
    $replay=$replayc->find('id=1');
    if($replay['status']){
        //  游戏已经开始等待下一局
        include('mobile/wait.php');
        die;
    }else{
        $flagc=new M('flag');
        $flag=$flagc->find("openid='$openid'");
        
        if($flag){
            $bhuserm=new C('bh_user');
            $data=array(
                "wecha_id"=>$openid,
                "pic"=>$flag['avatar'],
                "uname"=>$flag['nickname'],
                );
            $bhuserm->add($data);
        }else{
            die("出现错误，请返回重新签到！");
        }
        
    }
}
 // 如果游戏还没开始用户未登记，进入登记页面
        include('mobile/index.php');
        die;