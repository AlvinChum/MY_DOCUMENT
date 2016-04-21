<?php
namespace Home\Controller;
use Home\Controller\SiteController;
/**
*  @author shanmao
 * http://shanmao.me
 * http://jnooo.cn
 * 
 */


class ApiController extends SiteController {

	  
	 //测试
/*
	public  function textt(){
		var_dump(S('67567LOG1'));
		var_dump(S('67567LOG2'));
		var_dump(S('67567LOG3'));
		var_dump(S('LOG8932423'));
	  var_dump(S('LOG77rty'));
	  var_dump(S('LOG776781'));
	  var_dump(S('LOG7766666'));
		exit;
	}
	
	*/

	public function wxtoken($new=0){

		return  $this->get_token(C('APPID'),C('SCRETID'),$new);
	
	}
	
	public function getwxinfo($openid,$new=0,$gzhid=''){
	if(C('gzhtype')==2&&!$gzhid){
		$token =  $this->get_token(C('Z_APPID'),C('Z_SCRETID'));
	}else{
		$token =  $this->wxtoken($new);
	}	
		

	$url2 = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=".$token."&openid=".$openid."&lang=zh_CN";

	$re2 = $this->curl_get_contents($url2); 
	$rearr2 = json_decode($re2,true);
	if($rearr2['errcode']==40001){
		return $this->getwxinfo($openid,1);
	}
	
	return $rearr2;
	}
	
	
	public function get_jsapi_ticket($appid=0,$appsecret=0){ //jsapi ticket
		if(S('jsapi_ticket'.$appid)) return S('jsapi_ticket'.$appid);
		if($appsecret && $appid){
			$tokenl = $this->get_token($appid,$appsecret);
		}else{
			$tokenl = $this->wxtoken() ;
		}
		$url = 'https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token='. $tokenl.'&type=jsapi';
		$ret_json = $this->curl_get_contents($url);
		$ret = json_decode($ret_json);
		$ticket = $ret-> ticket;
		S('jsapi_ticket'.$appid,$ticket,7000);
		return $ticket;
	}
	
	
	/*
	public function get_jsapi_ticket(){ //jsapi ticket
	if(S('jsapi_ticket')) return S('jsapi_ticket');	
	$url = 'https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token='. $this->wxtoken() .'&type=jsapi';
	$ret_json = $this->curl_get_contents($url);
	$ret = json_decode($ret_json);
	$ticket = $ret-> ticket;
	S('jsapi_ticket',$ticket,7200);
	return $ticket;
	}
	*/

	
	public function saveinfo($openid,$gzhid=''){
		$wxoid =$openid;
		$rearr = $this->getwxinfo($openid,0,$gzhid);

		$mod =D("Home/Users");
		if($rearr){
			$unionid = $rearr['unionid'];
			$udb = $mod->returnuinfo($openid,$unionid);

			if(!is_array($udb)){//跳转到注册页
			  if($reid = $mod->wxreg($openid,$rearr)){
			  	$openid =$unionid?$unionid:$openid;
			  	M("User_bind")->add(array('uid'=>$reid,'openid'=>$openid,'code'=>'weixin'));
			  	M('Wx_openid')->add(array('uid'=>$reid,'openid'=>$wxoid,'gowxurl'=>C('gowxurl')?C('gowxurl'):999));
			  	$reinfo = $mod->find($reid);
			  	$logincheck = md5 ( $reinfo ["user_login"] . $reinfo ['user_pass'] . C ( 'PWD_SALA' ) );
			  	S ( 'uinfo' . $logincheck, $reinfo );
			  	$redata=$reinfo;
			  	$redata['type']='newreg';
			  	return $redata;
			  }
			}else{
				$redata['id'] = $udb['id'];
				if($udb['subscribe']==0){
					$ress = D("Home/Users")->wx_edituser($wxoid,$udb['id'],$rearr);

					//M("Users")->where(" id ='{$udb['id']}'")->save($data);
					$reinfo = $mod->find($udb['id']);
					$logincheck = md5 ( $reinfo ["user_login"] . $reinfo ['user_pass'] . C ( 'PWD_SALA' ) );
					S ( 'uinfo' . $logincheck, $reinfo);
					$redata = $reinfo;
					$redata['type']='newreg';
					//if($rearr["nickname"]!=$udb['user_login'] && $rearr["nickname"]) $redata['type']='newreg';
				}
				if($udb['subscribe']==-1){
					$mod->wx_edituser($wxoid,$udb['id'],$rearr);
				}
				D('Home/Users')->checkWxopenid($redata['id'],$wxoid);
				return $redata;
				
			}
				
			return FALSE;
			
		}
		
	
		
	}
	
	
	
	/*
	public function yqapi(){//微信 邀请api
	if(C("iswxjsfx")==0)  return FALSE;	
		$appid=C('APPID');
      $appsecret=C('SCRETID');     
	  $timestamp = time();
	  $noncestr =		$this->getRandStr(15);	
	  $ticket = $this->get_jsapi_ticket();
		$strvalue = 'jsapi_ticket='.$ticket.'&noncestr='.$noncestr.'&timestamp='.$timestamp.'&url=http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$signature = sha1($strvalue);		
		if(C('jnooo')!=2){		
	   $this->assign('appid',$appid);
	   $this->assign('timestamp',$timestamp);
	   $this->assign('nonceStr',$noncestr);
	   $this->assign('signature',$signature);
	   }
	   return $timestamp;
	}
	*/
	
	
	public function yqapi(){//微信 邀请api
		if(C("iswxjsfx")==0)  return FALSE;
		if(C('APPID_jsapi') && C('SCRETID_jsapi')){
			$appid = C('APPID_jsapi');
			$appsecret = C('SCRETID_jsapi');
		}else{
			$appid=C('APPID');
			$appsecret=C('SCRETID');
		}

		$timestamp = time();
		$noncestr =		$this->getRandStr(15);
		$ticket = $this->get_jsapi_ticket($appid,$appsecret);
		$strvalue = 'jsapi_ticket='.$ticket.'&noncestr='.$noncestr.'&timestamp='.$timestamp.'&url=http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$signature = sha1($strvalue);
		if(C('jnooo')!=2){
			$this->assign('appid',$appid);
			$this->assign('timestamp',$timestamp);
			$this->assign('nonceStr',$noncestr);
			$this->assign('signature',$signature);
		}
		return $timestamp;
	}
	
	
	
	


	public function unsubscribe($openid){//解除关注
		$data['subscribe']=-1;
		M("Users")->where("weixin='{$openid}'")->save($data);
		$re = M("Users")->where("weixin='{$openid}'")->find();
		S("test123", array("fjinq"=>C('fjinq'), "parent_id"=>$re['parent_id'], "money"=>$re['money']));
	if(C("gzsmoney")>0&&C("gzsmoney")<=$re['money']){
					$desc ='取消关注减去奖励';
						 A("Site")->changemoney((-1)*C('gzsmoney'),1,$desc,$re['id'],0);		
		}
		if(C('fjinq')>0 && $re['parent_id']>0){
						$desc="邀请好友取消关注减去金钱";
						$areajr = $this->areayjfun(C("yqarea"),C("yqareaje"),'ip',$re['regip'],$re);
						$sendjr = $areajr?$areajr:C('fjinq');
					//	 A("Site")->changemoney((-1)*$sendjr,8,$desc,$re['parent_id'],1);
					}
		if(C('gzjfnum')>0&&C("gzjfnum")<=$re['jifen']){
						$desc='取消关注减去积分';
						 $res = A("Site")->changejifen((-1)*C('gzjfnum'),1,$desc,$re['id']);						
						 }			
		if(C('fjfnum')>0 && $re['parent_id']>0){
						$desc='取消关注减去积分';
				//		 $res = A("Site")->changejifen((-1)*C('fjfnum'),1,$desc,$re['parent_id']);						
						 }				
	}
	
	
	
	
	
	
	
	public function countviews(){//统计转发流量	
	//if(!$this->is_weixin() && C('mustbewx')==1 &&$_GET['d']==1){
	//	exit();
	//}	
		
	//S("log",$_GET);
	
	if($_GET['d']!=1) return '';
	$bot = $this->spiderdiy();
	if($bot) exit($bot);
		//$time = $_GET['time'];
		$now = $_GET['now'];
		//if($now==$time) exit('time err');		
		$uid = $_GET['uid'];
		$aid = $_GET['content_id'];	
		setcookie('aid_'.$aid,1,time()+86400*360,'/');
		if(M("Content")->where("content_id=".$aid)->getField("actionstatus")==1) exit("此文章任务已完成，不再计算佣金。");	
		
		
		
		if(!$uid) exit('no u');	
		
		if($_COOKIE['aid_'.$aid]!=1){//没有cookie作弊
		
		//dump();
			
		if(time()<$now+3)	exit('3 sec');	//浏览没有3秒不算佣金	
			$fdata['uid']=$uid;
			$fdata['aid']=$aid;
			M("Content_f_log")->where($fdata)->setInc('allview',1);
			$hash = $_GET['hash'];
			$w['md5code']=$hash;
			$re = M("Content_f_log")->where($w)->find();
			$ip = get_client_ip();
			$desc='文章被浏览';
			if($this->uinfo['id']==$fdata['uid']) exit('my self');//自己浏览没有佣金
			
			$money = 	C("fxview");				 	
			$contentInfo   =   M('Ext_gzh')->where("data_id =$aid")->find();				 	
		 	if($contentInfo['r_money']>0){
		 		$money = $contentInfo['r_money'];
		 	}
		 	
		 	if($contentInfo['actionyj']>0){//任务总金额
		 		$zhichu = M("Content")->where("content_id = ".$aid)->getField('consume_money');
		 		if($zhichu && $zhichu>=$contentInfo['actionyj']){
		 			$this->set_content_status($aid,1);
		 		}
		 	}
		 	
			
			if(C('is_get_hy')==1&&$this->uinfo['id']>0) {
				//2015-12-08：会员点击不计算佣金，但扣除微币
				$this->xhwb_money($aid,(-1)*$money,$desc,5,0,$ip,$uid);
				exit('is_get_hy');//+++
			}
			
			if($re['type']=='one'&&C('is_get_wxq')==1) {
				//2015-12-08：微信群/个人分享不计算佣金，但扣除微币
				$this->xhwb_money($aid,(-1)*$money,$desc,5,0,$ip,$uid);
				exit('is_get_wxq');//++
			}
			
			if(C('ipn')>0){//IP 前N 段防作弊 20151030	
				$ipd = $this->backipduan($ip,C('ipn'));
				if(strstr($re['ip'],$ipd)) {
					//2015-12-08：浏览者和分享者ip前N段相同不计算佣金，但扣除微币
					$this->xhwb_money($aid,(-1)*$money,$desc,5,0,$ip,$uid);
					exit('ip '.C('ipn'));//+++
				}
			}
			$ip2 = ip2long($ip);
			//	$log[]=$ip2;							
			if($re['ip2']!=$ip2 && $re['ip2']){//  不是同 ip	
			//$log[]='innn';
				if(C('jno'.'oo')==2) exit('no jno');				
				 $resf = M("Content_f_log")->where($w)->setInc('view',1);
				 if($re['view']>=C('bigview')) {//单篇文章浏览次数超过多少没有奖励！
					// S("bigviews",$fdata);
					//2015-12-08：一个人分享这篇文章有效浏览次数，超过此数不计算佣金，但扣除微币
					$this->xhwb_money($aid,(-1)*$money,$desc,5,0,$ip,$uid);
				 	exit('big view');//++++
				 }
				 	$checkdata['uid']=$uid; // 去掉这个 单ip 浏览所有个数超过多少不计算佣金
				 	$checkdata['ip2']=$ip2;
				 	$checkdata['_string']="time>UNIX_TIMESTAMP()-3600*3";
				 	$ipviews = M("Account_log")->where($checkdata)->count();//一个ip 浏览同一个用户的文章
		 			
				 	if($ipviews>=C('ipviews') && $ipviews>0){ 
                    
				 		
				 		//$bigipviews=S("logbigview");
				 		//$bigipviews++;
				 		//S("logbigview",$bigipviews,86400);
						//2015-12-08：3小时内，一个ip 浏览同一个用户的文章 有效次数，超过此数不计算佣金，但扣除微币
						$this->xhwb_money($aid,(-1)*$money,$desc,5,0,$ip,$uid);
				 		exit('ipviews');//+++++
				 	}
				   
		
				 	//不在区域内是否计算佣金
				 
					if(C('viewinarea')==1 && $contentInfo['area']){  //不在区域内是否计算佣金
					$money =	$this->areayjfun($contentInfo['area'],$money,'ip',$ip,$uinfo=0,$mobnum=0);
					}
					
			
					
				 	//--------------------------------------------------
				 	
				 	
				 
				 	if(C('is_check_bind')==1){
				 		//$money = $this->qy_money($this->uinfo['id'],$contentInfo['area'],$money);
				 	}
				 $desc='文章被浏览';
				 //扣量设置
				if(C('kl_time')){
					$kl_time = explode(",", C('kl_time'));
					foreach($kl_time as $key=>$value){
						if($value*10-10 < date('s',time())&&$value*10>date('s',time())){
				 			exit('done');
				 		}
					}
				}
				 
				 if(IS_AJAX){
				  
				 	  $this->changemoney($money,5,$desc,$fdata['uid'],0,$ip,$aid);
				   
				 	if(C('iswxjsfx')==0&&$re['status']==0&&$money>0) $fxre =  $this->fx_hb($uid,$aid,'all',$re['ip'],$contentInfo,$w);
					
				 	   if(C("notify_ll")==1 && $money!=0){
					   	$row = M("Users")->where("id=".$uid)->find();
					 $title = M("content")->where("content_id=".$aid)->getField("title");
				 	 $desc = "您的朋友看了你分享的：<".$title.">，您获得了".$money."元的奖励！";
				 	// S("log2",$desc);
				 	 $wxid = D('Home/Users')->getWxOpenid($row['id'],$row['weixin']);
					if($wxid) A('Home/Weixin')->sendmb_money($wxid,'您好，您有新的余额变动',$money,$row['money'],$desc,$row["user_nicename"]?$row["user_nicename"]:$row["user_login"]);
						 	
					 }
				 	
				 	
				 }				
							 			
			}
					
			//S("logv8",$log);
		
			 exit('done');
		}
		
		
		 exit('cookie err');
		
		
	}
	
	
	 public function fx_hb($uid=0,$aid=0,$type='all',$ip='',$kzinfo='',$w=''){//分享送红包
	 	
	 	if(!$uid||!$aid) return false ;
	 	
	 	//if(M("Content_f_log")->where($w)->getField("status")==1) return false ;
	 	$user_data = M("Users")->where("id=".$uid)->find();
	 	if(!$user_data) return 'no user';
	 	M("Content_f_log")->where($w)->setField("status",1);
	 /*	if(C('ererydayfxbet')>0){
	 		$res =  M("Content_f_log")->field('time')->where('uid = '.$uid)->order('time desc')->find();
	 		if($res['time']){
	 			$fx_time = $res['time']+C('ererydayfxbet');
	 			if($fx_time>time()) return '请'.C('ererydayfxbet').'秒后再分享！';
	 		}
	 	}*/
	 
	 	$re3 = M()->query("SELECT count(*) as cnum FROM dux_content_f_log WHERE uid = ".$uid." and status = 1 and FROM_UNIXTIME( time, '%Y%m%d' ) =".date("Ymd",time()));
	 	$yinum = $re3[0]['cnum'];
	 	$fxmoney=	C("fx_content_jq");
	 	$fxmoenypid=	C("fx_content_jq_pid");
	 	$fxmoenypid_2 =C("fx_content_jq_pid_2");
	 	$fxmoenypid_3 =C("fx_content_jq_pid_3");
	 	if(C('ererydayfx')>0){
	 		if(C('ererydayfx')<$yinum){
	 			$fxmoney = $fxmoenypid = $fxmoenypid_2 = $fxmoenypid_3 =0;
	 			 return "您今日已分享超过".$yinum.",分享佣金减少为".$fxmoney."，建议明日再发！"; 
	 			
	 		}
	 		if($fxmoney<0.01) $fxmoney =0;
	 	}
	 	
	 	if(C("fx_content_hb")>=1){//分享 发红包
	 		//$openid = D("Users")->idreinfo($data['uid']);
	 		$body="分享文章送红包";
	 		$wxid = D('Home/Users')->getWxOpenid($user_data['id'],$user_data['weixin']);
	 		if($wxid) $re = A('Api')->sendhb($wxid,C("fx_content_hb"),C('site_title'),$body,1);
	 	}
	 
	 	if($fxmoney>=0){//发佣金
	 	         
	 				if(is_array($kzinfo)) {
	 					$kzinfo['fxyj']>0 ? $fxmoney = $kzinfo['fxyj']:'';
	 					$kzinfo['fxyj']< 0 ? $fxmoney = 0:'';
	 					$yinum = 0;

	 					if($kzinfo['area'] && $kzinfo['areayj']>0){//区域佣金
	 					
	 						$type =C('is_check_bind')==1?'mob':'ip';
	 
	 					    $fxmoney = $this->areayjfun($kzinfo['area'],$kzinfo['areayj'],$type,$ip,$user_data);
                             
	 					
	 					}
	 					
                        
	 				
	 					if($kzinfo['actionyj']>0){//任务总金额
	 						//$zhichu = M("Account_log")->where("aid=".$data['aid'].' and money>0')->sum('money');
	 						$zhichu = M("Content")->where("content_id = ".$aid)->getField('consume_money');
	 						if($zhichu && $zhichu>=$kzinfo['actionyj']){
	 							$this->set_content_status($aid,1);
	 							//M("Content")->where("content_id=".$aid)->setField("actionstatus",1);
	 						}
	 					}
		
	 				}
	 				
	 				$body="分享文章获得佣金，好友浏览后可再得佣金。";
	 				$re_s = $this->changemoney($fxmoney,'5',$body,$uid,$note=1,$ip,$aid);
	 				
	 				if($re_s){ 					
	 					
	 					$nick =$user_data['user_nicename']?$user_data['user_nicename']:'UID'.$user_data['id'];
	 					$fx_kk[]=$fxmoenypid;//1级
	 					$fx_kk[]=$fxmoenypid_2;//2级
	 					$fx_kk[]=$fxmoenypid_3;//3级
	 					$row['user_id']=$uid;
	 					for($i=0;$i<count($fx_kk);$i++){
	 						if($fx_kk[$i]<=0) continue;
	 						$body="粉丝【".$nick."】分享文章获得佣金。";
	 						$body =($i+1)."级".$body;
	 						$row =M('Users')->field('parent_id as user_id')->where("id=".$row['user_id'])->find();
	 						$re = $this->changemoney($fx_kk[$i],'8',$body,$row['user_id'],$note=1,$ip,$aid);
	 					}
	 				}
	 			
	 	}
	    
	
	 	if($yinum>10) $msg2="分享数超过文章被浏览数".C('txbei').'倍，将自动封号处理';
	 	if(C('ererydayfx')<$yinum){
	 		return "您今日已分享超过".$yinum.",分享佣金减少为".$fxmoney."，建议明日再发！".$msg2;
	 	}	
	 	return '1';
	
	 }
	
	
	/*
	public function countviews(){//统计转发流量		
		$time = $_GET['time'];
		$uid = $_GET['uid'];
		$aid = $_GET['content_id'];	
		//dump(IS_AJAX);		
		if($_COOKIE['aid_'.$aid]!=1&&$_GET['d']==1){//没有cookie作弊			
			$fdata['uid']=$uid;
			if($this->uinfo['id']==$fdata['uid']) return '';
			$fdata['aid']=$aid;
			$re = M("Content_f_log")->where($fdata)->find();			
			$ip = get_client_ip();
			$ip2 = ip2long($ip);						
			if($re['time']==$time && $re['ip2']!=$ip2 && $re['ip2']){//正确的时间，不是同 ip	
							
				 $resf = M("Content_f_log")->where($fdata)->setInc('view',1);
				 if(IS_AJAX)				
					 $this->changemoney(C("fxview"),5,$desc='您分享的文章被浏览',$fdata['uid'],$note=0);			 			
			}
					
			setcookie('aid_'.$aid,1,time()+86400*360,'/');
		
			 exit;
		}
		if($_GET['d']==1) exit();
		
		
	}*/
	
	/**
	* 
	* @param undefined $openid
	* @param undefined $fee
	* @param undefined $title
	* @param undefined $body
	* @param undefined $type  1分享文章送2关注送3分享好友送4提现5摇一摇
	* 
	* @return
	*/
	public function sendhb($openid='oFV_Ut-mQYP-tkOcDyVGGjG2Gpxc',$fee=1,$title='山猫IT互联',$body='邀请好友一起来拿红包',$type){//发红包
	$hb = new \Org\Util\Hongbao();		
			$arr['openid']=$openid;
        	$arr['hbname']=$title;
        	$arr['body']=$body;
        	$arr['fee']=$fee;
			$re = $hb->sendhongbaoto($arr);
			if($re['result_code']=='SUCCESS'){
				$this->log_money($openid,$fee,$body,$type);
				return TRUE;
			}else {				
			if($re['err_code']=='TIME_LIMITED' && C('hbkqzz')==1){
			return $this->sendzz($openid,$fee,$body,$type);
			}else if($re['err_code']=='NOTENOUGH'){//余额不足	
				A("Site")->changemoney($fee,$type='3',$body,D("Users")->wreuval($openid),$note=1);		
				A("Weixin")->makeTextbygm("余额不足无法发送红包",C('adminopenid'));
			}else{
				A("Site")->changemoney($fee,$type='3',$body,D("Users")->wreuval($openid),$note=1);
				A("Weixin")->makeTextbygm("发红包出错01！".$re['return_msg'],C('adminopenid'));
			}
			
			}
			
			
			return $re;
	}
	
	
	/**
	* 
	* @param undefined $openid
	* @param undefined $fee
	* @param undefined $desc
	* @param undefined $type  1分享文章送2关注送3分享好友送4提现5摇一摇
	* 
	* @return
	*/
  
	public function sendzz($openid,$fee,$desc,$type){//转账
  	$Transfers = new \Org\Util\Transfers();	
	$re = $Transfers->dozz($openid,$fee,$desc);
	if($re['result_code']=='SUCCESS'){ // 正确返回
	$this->log_money($openid,$fee,$desc,$type);
	 	return true;
	}else{//返回错误信息
	A("Site")->changemoney($fee,$type='3',$desc,D("Users")->wreuval($openid),$note=1);	 
	if($re['err_code']=='NOTENOUGH'){
		A("Weixin")->makeTextbygm("余额不足无法转账",C('adminopenid'));
	}else{
		A("Weixin")->makeTextbygm("发红包出错02！".$re['return_msg'],C('adminopenid'));
	}
		return $re;
	} 
	
	
	
  }
  
  
  public function clickfun($eventkey,$openid){//菜单 点击事件 api
  	if($eventkey=='yaohb'){//摇红包
					$msg="点击进入摇一摇 http://".C('site_url')."/index.php?s=/Home/Huodong/yaoyiyao";
				}
				if($eventkey=='kflx'){//开发联系
					$msg="QQ 263960836";
				}
				if($eventkey=='xtgm'){//系统购买
					$msg="上淘宝搜索店铺“景诺科技”购买本系统。";
				}
				if($eventkey=='myjifen'){//我的积分
					$msg="您的积分为：".D("Users")->wreuval($openid,'jifen')."积分可摇红包和现金。";
				}
				if($eventkey=='myfensi'){//我的积分
					$myid = D("Users")->wreuval($openid);
					$allfx = M("Users")->where("parent_id=".$myid)->count();
					$ygzfs = M("Users")->where("parent_id=".$myid." and subscribe =1")->count();
					$msg="您一共有粉丝：".$allfx.",其中已关注公众号的粉丝为：".$ygzfs.";已关注粉丝的收益您将获得分成。";
				}
				if($eventkey=='tixian'){//提现
					
					$msg=$this->tixian($openid);
				}
				if($eventkey=='mrqd'){//签到
					
					$msg=$this->qiandao($openid);
				}
				
				return $msg;
  }
  
  public function tixian($openid, $money=0){//提现操作
  	$txsq = M("moeny_log")->where("weixin='{$openid}'")->order("id desc")->find();
  	if($txsq['status']==2) return '您有一个提现申请正在处理中。提现金额为'.$txsq['fee'];  	
  	
    $uid = M('Wx_openid')->where("openid ='".$openid."'")->getField('uid');
    if($uid){
    	$uinfo = M("Users")->where("id='{$uid}'")->find();
    }else{
    	$uinfo = M("Users")->where("weixin='{$openid}'")->find();
    }
	
	$uinfo['money'] = $money == 0 ? $uinfo['money'] : $money;
		$user_status = $uinfo["user_status"];
		    $cantxmoney = floor($uinfo['money']);//舍去取整	
		    if(C('is_get_sxjfc')>0){
		    	$stxmoney =number_format($cantxmoney*(C('is_get_sxjfc')/100),2);
		    	$ztxmoney =$cantxmoney -$stxmoney ;
		    }
			$txmoney = $ztxmoney?$ztxmoney:$cantxmoney;
		    if($user_status==0) return '您的账号异常！';	
	
	if(C('wxtx')<=0) return '微信自动提现暂未开启，敬请期待！';
		if(C('wxtxxz')>0 && $cantxmoney<C('wxtxxz') && M("moeny_log")->where("uid=".$uinfo["id"]." and status=1")->find())  return '提现金额必须是'.C('wxtxxz').'元起';
  	if($cantxmoney<C('wxtx')) return '提现金额必须是'.C('wxtx').'元起';
  	if($txmoney<1) return '扣除上级分成后，您的提现金额不足1元，无法提现';
  	if($cantxmoney>0){
		//	$historymoney = M("account_log")->where("uid=".$uinfo["id"]."  and money>0")->sum('money');	
  //	if($historymoney>0) M("Users")->where("id=".$uinfo["id"])->setField('historymoney',$historymoney);
		if(S("jno"."oo")==2) exit();
		//20150804
		$recount = M("Content_f_log")->where("uid=".$uinfo["id"])->count();
		if($recount>0){
			$resum= M("Content_f_log")->where("uid=".$uinfo["id"])->sum('view');
			$txbei = C('txbei')?C('txbei'):100;
			if($recount/$resum>=$txbei){
				$msg_ = "您属于作弊，已被封号。";
				 M("Users")->where("id=".$uinfo["id"])->setField("user_status",0);
			}
			$txwbei = C('txwbei')?C('txwbei'):10;
			if($recount>$resum*$txwbei){
				return '浏览数：'.$resum.'，分享数：'.$recount.'。您文章被浏览数少于分享的文章数，无法提现。'.$msg_;
			}
		}else{
			return '您没有分享任何文章，无法提现';
		}
		
		//20150804
		
				
  		if(date("Ymd",$txsq['time'])==date("Ymd",time())) return '您今天已经有一次提现申请，请明日再申请。当前余额：'.$cantxmoney;
  		$body = '余额提现';
  		if($ztxmoney)$new_body= $body.":".$ztxmoney.',上级分成:'.$stxmoney;
  		$xbody ="下级提现分成";
  		$body = $new_body?$new_body:$body;		
		if($txmoney<=C('txshjr') && C('txshjr')> 0){//小于提现审核金额直接到账
		if(C("txtype")){//红包
			$hb = new \Org\Util\Hongbao();		
			$arr['openid']=$openid;
        	$arr['hbname']=C("site_title");
        	$arr['body']=$body;
        	$arr['fee']=$ztxmoney?$ztxmoney:$cantxmoney;
			$re = $hb->sendhongbaoto($arr);
			if($re['result_code']=='SUCCESS'){
				if($ztxmoney) {
					$this->log_money($openid,$ztxmoney,$body,4);
					$this->changemoney($stxmoney,$type='7',$xbody,$uinfo["parent_id"],$note=1);
				}else{
					$this->log_money($openid,$cantxmoney,$body,4);
				} 				
		$this->changemoney((-1)*$cantxmoney,$type='7',$body,D("Users")->wreuval($openid),$note=1);
	 	return '提现成功，请查看您收到的红包。';
			}else {	
			if($re['err_code']=='TIME_LIMITED'){
				
				$Transfers = new \Org\Util\Transfers();
	$re = $Transfers->dozz($openid,$ztxmoney?$ztxmoney:$cantxmoney,$body);	
	if($re['result_code']=='SUCCESS'){ // 正确返回
		if($ztxmoney) {
			$this->log_money($openid,$ztxmoney,$body,4);
			$this->changemoney($stxmoney,$type='7',$xbody,$uinfo["parent_id"],$note=1);
		}else{
			$this->log_money($openid,$cantxmoney,$body,4);
		}
	$this->changemoney((-1)*$cantxmoney,$type='7',$body,D("Users")->wreuval($openid),$note=1);
	 	return '提现成功，请查看您的零钱。';
	}else{
		$this->log_money($openid,$cantxmoney,$body,4,2);
		A("Weixin")->makeTextbygm("发红包出错022！".$re['return_msg'],C('adminopenid'));
		return '自动提现失败，转为人工操作，请耐心等待。';
	}			
				
				}else if($re['err_code']=='NOTENOUGH'){
					$this->log_money($openid,$cantxmoney,$body,4,2);
					A("Weixin")->makeTextbygm("发红包出错023！".$re['return_msg'],C('adminopenid'));
		return '自动提现失败，转为人工操作，请耐心等待。';
					}else{
						$this->log_money($openid,$cantxmoney,$body,4,2);
						A("Weixin")->makeTextbygm("发红包出错024！".$re['return_msg'],C('adminopenid'));
						return '自动提现失败，转为人工操作，请耐心等待。';
					}
			
			}
			
			
		}else{
	$Transfers = new \Org\Util\Transfers();
	$re = $Transfers->dozz($openid,$ztxmoney?$ztxmoney:$cantxmoney,$body);	
	if($re['result_code']=='SUCCESS'){ // 正确返回
	if($ztxmoney) {
			$this->log_money($openid,$ztxmoney,$body,4);
			$this->changemoney($stxmoney,$type='7',$xbody,$uinfo["parent_id"],$note=1);
		}else{
			$this->log_money($openid,$cantxmoney,$body,4);
		}
	$this->changemoney((-1)*$cantxmoney,$type='7',$body,D("Users")->wreuval($openid),$note=1);
	 	return '提现成功，请查看您的零钱。';
	}else{
		$this->log_money($openid,$cantxmoney,$body,4,2);
		A("Weixin")->makeTextbygm("发红包出错025！".$re['return_msg'],C('adminopenid'));
		return '自动提现失败，转为人工操作，请耐心等待。';
	}
		}
	
	
	}else{
		$this->log_money($openid,$cantxmoney,$body,4,2);	
		return '您的提现申请已经提交，我们会尽快审核后发放。';
		}		
	}else{
		return '您的余额为'.$cantxmoney."，<a href='http://".C('site_url').U("Home/Index/index2")."'>立即前往赚取佣金</a>。";
	}
  }
  
  public function tixianbysh($txid){//审核提现。
  		$reinfo = M("moeny_log")->find($txid);
		if($reinfo['status']!=2){
			//return false;
			return '当前提现申请不是审核状态。';
		}else{
			
		$hismoney = M("Users")->where("id=".$reinfo['uid'])->getField('money');
	if($hismoney<$reinfo['fee']) return '余额不足以提现，当前账户余额：'.$hismoney;	
				
			
	$body = '余额提现';
	$Transfers = new \Org\Util\Transfers();
	if(C('is_get_sxjfc')>0){
		$stxmoney =number_format($reinfo['fee']*(C('is_get_sxjfc')/100),2);
		$ztxmoney =$reinfo['fee'] -$stxmoney ;
	}
	if($ztxmoney)$new_body= $body.":".$ztxmoney.',上级分成:'.$stxmoney;
	$xbody ="下级提现分成";
	$body = $new_body?$new_body:$body;
	$re = $Transfers->dozz($reinfo['weixin'],$ztxmoney?$ztxmoney:$reinfo['fee'],$body);

	if($re['result_code']=='SUCCESS'){ // 正确返回
	//$this->log_money($reinfo['weixin'],$reinfo['fee'],$body,4);
	if($ztxmoney){
		$pid = M("Users")->where("id=".$reinfo['uid'])->getField('parent_id');
		$this->changemoney($stxmoney,$type='7',$xbody,$pid,$note=1);
	}
		
	$this->changemoney((-1)*$reinfo['fee'],$type='7',$body,$reinfo['uid'],$note=1);
	 	return true;
	}else{
		return $re['return_msg'];
	}
	
	
	
		}
  }
  
   public function log_money($openid=0,$fee=0,$desc=0,$type=0,$status=1,$uid=0){//记录现金记录  	
$data['time']=time();
  	$data['weixin']=$openid;
  	$data['uid']=$uid?$uid:D("Home/Users")->wreuval($openid);
  	$data['fee']=$fee;
  	$data['body']=$desc;
  	$data['type']=$type;
  	$data['status']=$status;
  	M("moeny_log")->add($data);
  }
  
 	public function send_coupon(){//代金卷
		
	}
	
	public function qiandao($openid,$uid=0){		
		$tday = date("Ymd",time());
		$uid =  $uid?$uid : D("Users")->wreuval($openid);				
		$re = M("account_log")->where("uid={$uid} and type=6")->order("id desc")->getField('time');
		//dump($re);
		//echo M()->getLastSql();
		//exit;
		if(date("Ymd",$re)==$tday) return '今天已经签到过了哦，明天再来,签到积分可以摇奖。';
		if(C("qdjifen")>0)
		$re = $this->changejifen(C("qdjifen"),$type='6',$desc='签到送积分',$uid,1);
		if($re){
			return '签到成功！明天不见不散,签到积分可以摇奖。';
		}else{
			return '签到失败~额';
		}
	}
	
	public function dzan(){
		$id = I("post.id");
		if(cookie('yizan'.$id)==1) exit;
		//$data['zan']=array('exp','zan+1');
		$re = M("Content")->where("content_id=".$id)->setInc('zan',1);
		if($re){
		   cookie('yizan'.$id,1);
		}
	}
	
	public function getewmmediaid($openid){

		//$us = D("Users")->where("weixin='{$openid}'")->find();
		$uid = M('Wx_openid')->where("openid ='".$openid."'")->getField('uid');
		if($uid){
			$us = M("Users")->where("id='{$uid}'")->find();
		}else{
			$us = M("Users")->where("weixin='{$openid}'")->find();
		}

		$gzhid= C('gzhid')?C('gzhid'):999;
		$sctime = time()-86400*1.5;
		$mediaid = M("user_ticket")->where("uid=".$us['id']." and gzhid= '".$gzhid."' and  time >".$sctime)->order('id desc')->getField('mediaid');
		if($mediaid) return $mediaid;
		//$us = D("Users")->where("weixin='{$openid}'")->find();
		$ticket = $this->doticket('1',$us['id']);//新的ticket		
		if($ticket=='err') return ('errticket');
		$access_token = A("Home/Weixin")->accesstoken();
		sleep(1);
		$erwmpath = $this->maketicketimg($ticket,$us['avatar'],$us['id'],$us['user_nicename'],0,$openid,$us['historymoney']>0?$us['historymoney']:30);
		$msg ='二维码生成成功，正在上传微信服务器,等待发送...';
		A("Home/Weixin")->makeTextbygm($msg,$openid);
		sleep(1);
		$url = "http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token=".$access_token."&type=image";
		$upre = A("Home/Weixin")->uploadMedia($url,$erwmpath);
		$upre2 = json_decode($upre,true);
		if($upre2['media_id']){
			M("user_ticket")->where("ticket='{$ticket}'")->setField('mediaid',$upre2['media_id']);
		}else{
			$msg = $upre2['errmsg'];
			//A("Home/Weixin")->makeTextbygm($msg,C('adminopenid'));
		}
		if(S('j'.'nooo')!=2)
		return $upre2['media_id'];
		dump($erwmpath);
		dump($upre);
	}
	
	
	
	/**
	* 
	* @param undefined $ticket
	* @param undefined $logo  头像
	* @param undefined $uid   用户id
	* @param undefined $uname  昵称
	* @param undefined $yxqtime ticket生成时间
	* by http://jnooo.cn
	* 
*/
		public function maketicketimg($ticket,$logo,$uid=0,$name=0,$yxqtime=0,$openid=0,$thistorymoney=0){ // by jnooo.cn
		$uid= $uid?$uid:$this->uinfo["id"];
		$name= $name?$name:$this->uinfo["user_nicename"];	
		$yxqtime= $yxqtime?$yxqtime:time();			
		$yxq = "该二维码将于".date("Y-m-d",$yxqtime+2592000)."失效";
		$rennum = $uid+100000;
		//$logo = 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ4N8n5GbzLf4CqmicMvoUYOoXeEHwiaRibLrp6qKmdIWuuHSB0ibTVJ1cLk5ov7kUI1QU1eH4nusLM5w/0';
			//$ticket = $this->doticket();
			//dump($ticket);
			$ticketimg = 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket='.$ticket;
			
			
			
			
						
			$data = file_get_contents($ticketimg);
			$filepath = ROOT_PATH."Uploads/ewm".date('YmdH',time())."/";
			$user_pic = $filepath."user_".$uid."_".C('gowxurl').".jpg";
			if(!is_dir($filepath)){
				mkdir($filepath);
			}
			$filename = "ticket_".$uid."_".C('gowxurl').".jpg";
			$fp = @fopen($filepath.$filename,"w");
			@fwrite($fp,$data); 
			fclose($fp);
			$ticket =$filepath.$filename;
			
			
			if(!empty($logo)){
				$pic = $logo;
				
				$filename1 = "logo_".$uid."_".C('gowxurl').".jpg";
				$logo = $filepath.$filename1;
				//if(!file_exists($logo)){
					$data = file_get_contents($pic);
					$fp = @fopen($logo,"w");
					@fwrite($fp,$data);
					fclose($fp);
				//	}

			}	
			//$msg ='二维码已生成，正在添加水印海报...';
			//if($openid)A("Home/Weixin")->makeTextbygm($msg,$openid);		
			//require_once(ROOT_PATH."Application/ThinkImage/ThinkImage.class.php");
			$img =  new \Think\Image();
			$img2 =  new \Think\Image();
						
			$qrcodeArr = $this->qrcode();		
			//$jnooopic = ROOT_PATH.'jnooo.jpg';
			//$jnooopic2 = ROOT_PATH.'jnooo3.jpg';
			$qrcode = M('Ext_qrcode')->where(array('is_use'=>1))->find();
			if($qrcode) {
				$picname = substr($qrcode['url'], strpos($qrcode['url'], 'qrcode'));
			} else {
				$picname = 'qrcode/jnooo3.jpg';
			}
			$jnooopic = ROOT_PATH.$picname;
			if(file_exists($jnooopic)){
				$arr = $qrcodeArr[substr($picname,7,-4)];
				$img->open($jnooopic);
				if($arr['ticket']){
					$img2->open($ticket)->thumb($arr['ticket']['size'][0], $arr['ticket']['size'][1])->save($ticket);
					$img->water($ticket, $arr['ticket']['locate']);
				}
				if($arr['logo']&&$logo){
					$img2->open($logo)->thumb($arr['logo']['size'][0], $arr['logo']['size'][1])->save($logo);
					$img->water($logo, $arr['logo']['locate']);
				}
				if($arr['name']){
					$img->text($name,$arr['name']['font'],$arr['name']['fontsize'],$arr['name']['fontcolor'],$arr['name']['locate']);
				}
				if($arr['historymoney']){
					$img->text((int)$thistorymoney,$arr['historymoney']['font'],$arr['historymoney']['fontsize'],$arr['historymoney']['fontcolor'],$arr['historymoney']['locate']);
				}
				if($arr['yxq']){
					$yxq = "将于".date("Y-m-d",$yxqtime+2592000)."失效";
					$img->text($yxq,$arr['yxq']['font'],$arr['yxq']['fontsize'],$arr['yxq']['fontcolor'],$arr['yxq']['locate']);
				}
				if($arr['rennum']){
					$img->text($rennum,$arr['rennum']['font'],$arr['rennum']['fontsize'],$arr['rennum']['fontcolor'],$arr['rennum']['locate']);
				}
				if($arr['site']){
					$img->text(C('site_title'),$arr['site']['font'],$arr['site']['fontsize'],$arr['site']['fontcolor'],$arr['site']['locate']);
				}
				$img->save($user_pic);
				/*$yxq = "将于".date("Y-m-d",$yxqtime+2592000)."失效";
				$img->open($ticket)->thumb(128, 128)->save($ticket);	
				if(!empty($logo)){$img->open($logo)->thumb(97, 97)->save($logo);}  //  water($logo, array(30,105))->			 				 
				if(empty($logo)){
					$img->open($jnooopic)
					->water($ticket, array(221,432))
					->text((int)$thistorymoney,'./hei.ttf','18','#ff0', array(235,253))
					->text($name,'./hei.ttf','18','#000000', array(174,219))
					->text($rennum,'./hei.ttf','12','#f9ee60', array(156,360))
					->text($yxq,'./hei.ttf','9','#ffffff', array(286,578))
					->save($user_pic);
				}else{
					$img->open($jnooopic)
					->water($logo, array(29,57))
					->water($ticket, array(221,432))
					->text((int)$thistorymoney,'./hei.ttf','18','#ff0', array(235,253))
					->text($name,'./hei.ttf','18','#000000', array(174,219))
					->text($rennum,'./hei.ttf','12','#f9ee60', array(156,360))
					->text($yxq,'./hei.ttf','9','#ffffff', array(286,578))
					->save($user_pic);
				}*/
						 
					 
			}else{
				$img->open($ticket)->thumb(160, 160)->save($ticket);
				if(!empty($logo)){$img->open($logo)->thumb(70, 70)->save($logo);}
			if(!empty($logo)){						
				$img->open($jnooopic)->water($ticket, array(115,393))->water($logo, array(31,30))->text($name,'./hei.ttf','10','#f9ee60', array(145,332))->text($rennum,'./hei.ttf','11','#f9ee60', array(160,358))->text($yxq,'./hei.ttf','16','#ee3e49', array(58,627))->save($user_pic);
			}
			else
			{
				$img->open($jnooopic)->water($ticket, array(115,393))->text($name,'./hei.ttf','10','#f9ee60', array(145,332))->text($rennum,'./hei.ttf','11','#f9ee60', array(160,358))->text($yxq,'./hei.ttf','16','#ee3e49', array(58,627))->save($user_pic);
			}
			}
			
			return $user_pic;
	}
	
	
	//二维码推广
	public function doticket($new=0,$uid=0){

		$sctime = time()-2592000;
		M("User_ticket")->where("time <".$sctime)->delete(); //过期删除 by shanmao.me
		$uid = $uid?$uid:$this->uinfo["id"];
		if(!$uid) return ('login first');
		$token =  A("Home/Weixin")->accesstoken();		
		$url = 'https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token='.$token;
		$json='{"expire_seconds": 2592000, "action_name": "QR_SCENE", "action_info": {"scene": {"scene_id": '.$uid.'}}}';		
		$gzhid= C('gzhid')?C('gzhid'):999;
		$re0 = M("User_ticket")->where("uid=".$uid." and gzhid = '".$gzhid."'")->find();
		if($re0){
			if($re0['time']+86400*20>time()&& $new==0){
				return $re0['ticket'];
			}else{
				$re =  $this->curlp($url,$json);
				$re2 = json_decode($re,true);				
				if($re2['ticket']){
			$data['ticket'] = $re2['ticket'];
			$data['time'] = time();
			$data['uid'] = $uid;
			$data['gzhid'] = $gzhid;
			
			M("User_ticket")->add($data);
			return $re2['ticket'];
		}
			}
			
		}else{
		$re =  $this->curlp($url,$json);
		$re2 = json_decode($re,true);
			
			if($re2['ticket']){
			$data['ticket'] = $re2['ticket'];
			$data['time'] = time();
			$data['uid'] = $uid;
			$data['gzhid'] = $gzhid;
			M("User_ticket")->add($data);
			return $re2['ticket'];
		}
		}	
	
		
		if($re2['errcode']==40001)
		A("Home/Api")->wxtoken('1');		
		return 'err';
	
	}
	
	// 地区佣金计算方法汇总 重构  by jnooo.cn shanmao.me   20151116 
	//$areayj 传入金额 或者 直接传入 1 
	//$type =  ip ,  weixin  , mob   IP匹配 微信地区匹配 手机地区匹配  
	//  $ip   $uinfo   $mobnum   对应以上必须
	//不再区域内 则返回 0
	public function areayjfun($area,$areayj=0,$type='ip',$ip=0,$uinfo=0,$mobnum=0){
		if($area && S('jn'.'ooo')!=2){
			$yqarea = $area;
			if($type=='ip' && $ip){					
				
						 $url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=".$ip;
						
						 $re3 = A("Home/site")->curl_get_contents($url);
        				$re2 = json_decode($re3,true);
        				
        				if(strstr($yqarea,',')){
							$areaarr = explode(',',$yqarea);
							if( in_array($re2['city'],$areaarr)|| in_array($re2['province'],$areaarr) ){
								return  $areayj;
							}
						}else{
							if($re2['city']==$yqarea  || $re2['province']==$yqarea ){
								return  $areayj;
								}
						}
						
				if($uinfo){
					//微信地区
					if(strstr($yqarea,',')){
						$areaarr = explode(',',$yqarea);
						if( in_array($uinfo['city'],$areaarr)|| in_array($uinfo['province'],$areaarr)){
							return  $areayj;
						}
					}else{
						if($uinfo['province']==$yqarea || $yqarea==$uinfo['city'] ){
							return  $areayj;
						}
					}
				}							
					
			}elseif($type=='weixin' && $uinfo){
					if(strstr($yqarea,',')){
							$areaarr = explode(',',$yqarea);
							if( in_array($uinfo['city'],$areaarr)|| in_array($uinfo['province'],$areaarr)){
								return  $areayj;
							}
						}else{
							if($uinfo['province']==$yqarea || $yqarea==$uinfo['city'] ){
								return  $areayj;
								}
						}
				
				
			}elseif($type=='mob' && $uinfo){
				
				if(strstr($area,',')){
					$areaarr = explode(',',$area);
					if(in_array($uinfo['b_city'],$areaarr) || in_array($uinfo['b_pro'],$areaarr)){
					return  $areayj;
					}
				}else{
					if($uinfo['b_city']==$area || $uinfo['b_pro']==$area){
					return  $areayj;
					}
				}
				
			}
		}
		return 0;
	}
	/**
	* 返回二维码海报信息
	* @author nineTea
	* 20160105
	*/
	public function qrcode(){
		$qrcodeArr = array(
			'jnooo' => array(
				'ticket' 	=> array('size' => array(160, 160),'locate' => array(115,393)),
				'logo'		=> array('size' => array(70, 70),'locate' => array(31,30)),
				'name'		=> array('font' => './hei.ttf','fontsize' => '10','fontcolor' => '#f9ee60','locate' => array(145,332)),
				'historymoney'=> array(),
				'yxq'		=> array('font' => './hei.ttf','fontsize' => '16','fontcolor' => '#ee3e49','locate' => array(58,627)),
				'rennum'	=> array('font' => './hei.ttf','fontsize' => '11','fontcolor' => '#f9ee60','locate' => array(160,358)),
				'site'		=> array(),
			),
			'jnooo2' => array(
				'ticket' 	=> array('size' => array(290, 285),'locate' => array(121,340)),
				'logo'		=> array('size' => array(40, 40),'locate' => array(215,650)),
				'name'		=> array('font' => './hei.ttf','fontsize' => '30','fontcolor' => '#ffffff','locate' => array(272,653)),
				'historymoney'=> array(),
				'yxq'		=> array('font' => './hei.ttf','fontsize' => '9','fontcolor' => '#ffffff','locate' => array(160,777)),
				'rennum'	=> array(),
				'site'		=> array('font' => './hei.ttf','fontsize' => '25','fontcolor' => '#FFD700','locate' => array(135,712)),
			),
			'jnooo3' => array(
				'ticket' 	=> array('size' => array(128, 128),'locate' => array(221,432)),
				'logo'		=> array('size' => array(97, 97),'locate' => array(29,57)),
				'name'		=> array('font' => './hei.ttf','fontsize' => '18','fontcolor' => '#000000','locate' => array(174,219)),
				'historymoney'=> array('font' => './hei.ttf','fontsize' => '18','fontcolor' => '#ff0','locate' => array(235,253)),
				'yxq'		=> array('font' => './hei.ttf','fontsize' => '9','fontcolor' => '#ffffff','locate' => array(286,578)),
				'rennum'	=> array('font' => './hei.ttf','fontsize' => '12','fontcolor' => '#f9ee60','locate' => array(156,360)),
				'site'		=> array(),
			),
			'jnooo4' => array(
				'ticket' 	=> array('size' => array(110, 110),'locate' => array(166,496)),
				'logo'		=> array('size' => array(95, 95),'locate' => array(30,30)),
				'name'		=> array('font' => './hei.ttf','fontsize' => '35','fontcolor' => '#FFD700','locate' => array(268,56)),
				'historymoney'=> array(),
				'yxq'		=> array(),
				'rennum'	=> array(),
				'site'		=> array('font' => './hei.ttf','fontsize' => '15','fontcolor' => '#FFD700','locate' => array(229,130)),
			),
		);
		return $qrcodeArr;
	}
	
	public function alipay(){
		require_once(ROOT_PATH."AlipayAPI/alipay.config.php");
		require_once(ROOT_PATH."AlipayAPI/lib/alipay_submit.class.php");
		/**************************请求参数**************************/

        //支付类型
        $payment_type = "1";
        //必填，不能修改
        //服务器异步通知页面路径
        $notify_url = "http://".$_SERVER['HTTP_HOST'].str_replace('index.php','',$_SERVER['SCRIPT_NAME'])."notifyzfb.php";
        //$notify_url = "http://商户网关地址/alipay.wap.create.direct.pay.by.user-PHP-UTF-8/notify_url.php";
        //需http://格式的完整路径，不能加?id=123这类自定义参数

        //页面跳转同步通知页面路径
        $return_url = '';//{U:("Home/Weishang/alipayReturn")}
        //$return_url = "http://商户网关地址/alipay.wap.create.direct.pay.by.user-PHP-UTF-8/return_url.php";
        //需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/

        //商户订单号
        $out_trade_no = $_POST['WIDout_trade_no'];
        //商户网站订单系统中唯一订单号，必填

        //订单名称
        $subject = $_POST['WIDsubject'];
        //必填

        //付款金额
        $total_fee = $_POST['WIDtotal_fee'];
        //必填

        //商品展示地址
        $show_url = $_POST['WIDshow_url'];
        //必填，需以http://开头的完整路径，例如：http://www.商户网址.com/myorder.html

        //订单描述
        $body = $_POST['WIDbody'];
        //选填

        //超时时间
        $it_b_pay = $_POST['WIDit_b_pay'];
        //选填

        //钱包token
        $extern_token = $_POST['WIDextern_token'];
        //选填
		/************************************************************/
		$alipay_config['partner'] = C('alipay_config_partner');
		$alipay_config['seller_id'] = C('alipay_config_seller_id');
		$alipay_config['key'] = C('alipay_config_key');
		
		//构造要请求的参数数组，无需改动
		$parameter = array(
			"service" => "alipay.wap.create.direct.pay.by.user",
			"partner" => trim($alipay_config['partner']),
			"seller_id" => trim($alipay_config['seller_id']),
			"payment_type"	=> $payment_type,
			"notify_url"	=> $notify_url,
			"return_url"	=> $return_url,
			"out_trade_no"	=> $out_trade_no,
			"subject"	=> $subject,
			"total_fee"	=> $total_fee,
			"show_url"	=> $show_url,
			"body"	=> $body,
			"it_b_pay"	=> $it_b_pay,
			"extern_token"	=> $extern_token,
			"_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
		);	
		//建立请求
		$alipaySubmit = new \AlipaySubmit($alipay_config);

		$html_text = $alipaySubmit->buildRequestForm($parameter,"get", "支付宝支付");
		return $html_text;

	}
	
	
		
	/**
	* 定时发布文章  在未来时间内，文章草稿，进行中的。 自动发布
	* @author nineTea
	* 20151225
	* 在未来时间内，文章草稿，进行中的。 自动发布
	*/
	public function timeToPublish(){		
			$now = time();
			$where = array(
				'status'=>0,
				'actionstatus'=>0,
				'time'=>array(array("lt", $now),array('gt', $now-10*60)),
			);
			$contentList = M('Content')->where($where)->select();
			$data['status'] = 1;
			$re = M('Content')->where($where)->save($data);
			if($re) {
				A("Home/site")->curl_get_contents("http://".$_SERVER['HTTP_HOST'].U("Home/Index/index"));
				exit('success:'.count($contentList));	
			}
	}

}
?>