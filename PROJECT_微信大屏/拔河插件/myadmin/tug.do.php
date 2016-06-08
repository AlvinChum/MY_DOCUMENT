<?php 
include("db.php");
@header("Content-type: text/html; charset=utf-8");
session_start();
if(isset($_SESSION[realpath("..").'admin']) && $_SESSION[realpath("..").'admin'] == true){


} else {

$_SESSION[realpath("..").'admin'] = false;

echo "<script>window.location='login.php';</script>";
die;
}
if(isset($_GET['do'])){

	$do = $_GET['do'];

}else{

	die("invild action");

}
	call_user_func($do);

function conf(){
    $post=$_POST;
    include('updata.php');
    $uploadurl= array();
    foreach($_FILES as $k=>$v){
        if(!empty($v['type'])){
            $erweifile=updateimg($_FILES[$k],'tug-'.$k);
            if($k!='teamapic' && $k!='teambpic'){
                $uploadurl['ads'][]=$erweifile;
            }else{
                $uploadurl[$k]=$erweifile;
            }
        }
    }
    //字符化广告数组
    if(!empty($uploadurl['ads'])){
        $uploadurl['ads']=serialize($uploadurl['ads']);
    }
    
    $writearr=$uploadurl+$post;
    
    $bhconfc=new M('bh_config');
    $ret=$bhconfc->update('id=1',$writearr);
    if($ret){
        echo "<script>alert('恭喜!配置修改成功！');history.go(-1);</script>";
    }else{
        echo "<script>alert('配置出现问题，请返回重新操作！');history.go(-1);</script>";
    }
    
}
/**
 * 
 * 发奖函数
 * */
function zj_fj(){
    $cid=$_GET['cid'];

    $zjc=new M('zjlist');
    $zjuser=$zjc->find('id='.$cid);
    if($zjuser['status']){
        echo "<script>alert('该奖品已经发过，请勿重复操作！');history.go(-1);</script>";
        die;
    }
    $data['status']=1;
    $data['fjdatetime']=time();
    $return=$zjc->update('id='.$cid,$data);
    if($return){
        echo "<script>alert('奖品已发出！');history.go(-1);</script>";
    }else{
        echo "<script>alert('出现错误！');history.go(-1);</script>";
    }
    
            

}
function ready(){
    
//实例化一个memcache对象
if(!empty($_SERVER['HTTP_APPNAME'])){
    @$mem=memcache_init();
    if($mem){
        $mem->flush();
    }

}else if(class_exists("Memcache")){
    if(class_exists("Alibaba")){
        /**
         * 
         * 删除memcache里面的值
         * */
          @$mem=Alibaba::cache();
         include('../tug/db.mem.class.php');
         $bhuserc=new C('bh_user');
            
            for($i=1;$i<=2;$i++){
                $bhusers=$bhuserc->select('whoteam='.$i);
                // var_dump($bhusers);
                foreach($bhusers as $v){
                    $bhuserc->find('id='.$v['id']);
                    $mem->delete($bhuserc->memkey);
                }
            }
            $cont=array(
                'select count(id) as rt from weixin_bh_user where whoteam=1',
                'select count(id) as rt from weixin_bh_user where whoteam=2',
                'select * from weixin_bh_user where whoteam=1',
                'select * from weixin_bh_user where whoteam=2',
                'select * from weixin_bh_replay where id=1'
            );
            foreach($cont as $v){
                $key=md5($v);
                $mem->delete($key);
            }


    }else{
		@$mem=new Memcache;
		@$mem->connect('localhost','11211');
        if($mem){
            $mem->flush();
        }
    }
}
    $zjc=new M('zjlist');
    $zjc->delete("fromplug='tug'");
    mysql_query('TRUNCATE TABLE `weixin_bh_user`');
    mysql_query("UPDATE `weixin_bh_replay` SET `status` = '0', `starttime` = '0' WHERE `id` = '1'");
    
    echo "<script>alert('重置成功！');history.go(-1);</script>";

}

?>