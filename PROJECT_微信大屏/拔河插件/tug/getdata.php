<?php
if(isset($_GET['type'])){

	$do = $_GET['type'];
}else{
    
    
	die("invild action");

}
include('db.mem.class.php');
call_user_func($do);
function PC(){
    $op=$_GET['op'];
    if($op == 'chushihua'){
        // 初始化游戏状态
            $replyc=new C('bh_replay');
            $replyc->update('id=1',array('status' => 0));
    }
    if($op == 'get_user_cnt'){
        include('db.php');
        $renshuc=new M('bh_user');
        $a =$renshuc->find('whoteam=1','id','count');
        $b =$renshuc->find('whoteam=2','id','count');
            
        echo '{"team1_cnt":'.$a.',"team2_cnt":' . $b . '}';
    }
    
        if($op == 'tug_start_game') {
            $bhconfc=new C('bh_replay');
            if($bhconfc->update('id=1',array('status' => 1, 'starttime' => (time() + 5))))
            {
                echo '{"record_id":35}';
            }else{
                echo '{"error":"404"}';
            }
        }


        if ($op == 'tug_get_top') {
            $userc=new C('bh_user');
            $users1=$userc->select('whoteam=1');
            $users2=$userc->select('whoteam=2');
            usort($users1,"compare"); 
            usort($users2,"compare"); 
            
            $topinfo=array();
            $a=0;$b=0;
            include('../wall/biaoqing.php');
            foreach($users1 as $k=> $v){
                $a+=$v['count'];
                if($k<7){
                    $v['uname']=pack('H*',$v['uname']);
                    $v['uname']=emoji_unified_to_html(emoji_softbank_to_unified($v['uname']));
                    $topinfo['team1'][]=$v;
                }
                
            }
            foreach($users2 as $k=>$v){
                $b+=$v['count'];
                if($k<7){
                    $v['uname']=pack('H*',$v['uname']);
                    $v['uname']=emoji_unified_to_html(emoji_softbank_to_unified($v['uname']));
                    $topinfo['team2'][]=$v;
                }
            }

            $topinfo['result'] = $a > $b ? 1 : 2;
            $topinfo['info'] = $a . '--' . $b;
            die(json_encode(array('topinfo' => $topinfo)));
        }

        if ($op == 'over_tug') {
            
            include 'db.php';
            $userc=new C('bh_user');
            $users1=$userc->select('whoteam=1');
            $users2=$userc->select('whoteam=2');
            usort($users1,"compare"); 
            usort($users2,"compare"); 
            
            $topinfo=array();
            $topinfod=array();
            $a=0;$b=0;
            include('../wall/biaoqing.php');
            foreach($users1 as $k=> $v){
                $a+=$v['count'];
                if($k<7){
                    $topinfo['team1'][]=$v;
                    $v['uname']=pack('H*',$v['uname']);
                    $topinfod['team1'][]=$v;
                }
                
            }
            foreach($users2 as $k=>$v){
                $b+=$v['count'];
                if($k<7){
                    $topinfo['team2'][]=$v;
                    $v['uname']=pack('H*',$v['uname']);
                    $topinfod['team2'][]=$v;
                }
            }
            
            $team1_info = $topinfod['team1'];
            $team2_info = $topinfod['team2'];
            $topinfo['team3']=array_merge($topinfo['team1'],$topinfo['team2']);

            $prize_setting = array(array('rank_start' => 1, 'rank_end' => 1), array('rank_start' => 2, 'rank_end' => 3), array('rank_start' => 4, 'rank_end' => 6), array('rank_start' => 7, 'rank_end' => 12));
            if ($a > $b) {

                $result = 1;
                $top_info[] = array('uname' => $bhconf['teama'], 'pic' => $bhconf['teamapic']);
                $top_info[] = array('uname' => $bhconf['teamb'], 'pic' => $bhconf['teambpic']);
            } else if($a<$b){
                $top_info[] = array('uname' => $bhconf['teamb'], 'pic' => $bhconf['teambpic']);
                $top_info[] = array('uname' => $bhconf['teama'], 'pic' => $bhconf['teamapic']);
                $result = 2;
            }else{
                $top_info[] = array('uname' => $bhconf['teamb'], 'pic' => $bhconf['teambpic']);
                $top_info[] = array('uname' => $bhconf['teama'], 'pic' => $bhconf['teamapic']);
                $result = 3;
            }
            
            //操作已有用户,写入中奖数据库
            
            $zjc=new M('zjlist');
            /**
             * $bhconf['zjtype']
             * 1 ====> 获胜方记录
             * 2 ====> 全部记录
             * 
             * $bhconf['zjpersonnum']
             * 记录 $bhconf['zjtype']的 人数 1-7
             * */
            if($bhconf['zjtype']==1){
                $zjuserall=$topinfo['team'.$result];
            }else if($bhconf['zjtype']==2){
                $zjuserall=$topinfo['team3'];
            }
            if(!empty($zjuserall)){
                for($i=0;$i<$bhconf['zjpersonnum'];$i++){
                    if(empty($zjuserall[$i])){
                        break;
                    }
                    if($bhconf['zjpaichu']){
                        $userc->delete("id=".$zjuserall[$i]['id']);
                    }
                    $zjuser=array(
                        'wecha_id'=>$zjuserall[$i]['wecha_id'],
                        'fromplug'=>'tug',
                        'info'=>serialize($zjuserall[$i]),
                        'status'=>'0',
                        'zjdatetime'=>time(),
                        'fjdatetime'=>'0',
                        );
                    $zjc->add($zjuser);
                }
            }
            
            // 初始化游戏状态
            $replyc=new C('bh_replay');
            $replyc->update('id=1',array('status' => 0));
            
            
            die(json_encode(array('prize_setting' => $prize_setting, 'top_info' => $top_info, 'team1_info' => $team1_info, 'team2_info' => $team2_info, 'result' => $result, 'game_over' => 1)));
        }
}
function Mobile(){
    session_start();
    $openid=$_SESSION['openid'];
    $do=$_GET['do'];
    
    if (empty($openid)) {
        die('非法访问，请重新发送消息进入拔河！');
    }
    if($do=='postjson'){
        $from_user = $openid;
        $count = intval($_POST['ucount']);
        
        $bhuserc=new C('bh_user');
        $userinfo=$bhuserc->find("wecha_id='$openid'");
        $bhuser=$bhuserc->update("id=".$userinfo['id'],array("count"=>$count));

        $replyc=new C('bh_replay');
        $reply=$replyc->find('id=1');
        if(!$reply['status']){
            echo "end";
            die;
        }
        echo $count;
        die;
    }
    if($do=='startime'){
        $replyc=new C('bh_replay');
        $reply=$replyc->find('id=1');
        
        if ($reply['status'] == 1) {
            if ($reply['starttime'] > time()) {
                $reply['lefttime'] = $reply['starttime'] - time();
            } else {
                $reply['lefttime'] = 1;
            }
        } else {
            $reply['lefttime'] = 1000000;
        }
        
        echo $reply['lefttime'];
    }
}
        function compare($x,$y)
        { 
        	if($x['count'] == $y['count']) 
        		return 0; 
        	elseif($x['count'] > $y['count']) 
        		return -1; 
        	else 
        		return 1; 
        } 

