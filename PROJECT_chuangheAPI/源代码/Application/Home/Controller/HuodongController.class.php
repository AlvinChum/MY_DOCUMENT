<?php

namespace Home\Controller;

use Home\Controller\SiteController;

/** * @author shanmao
 * 
 * http://shanmao.me
 */
class HuodongController extends SiteController {
	
	public function __construct() {
		parent::__construct ();
		

		
		
		if (! $this->uinfo&&U()!=U('fxhb')) {
			//A('Public')->dowxlogin();
			cookie('gourl',U('User/index'),86400);
			//if(!$this->is_weixin()){
			redirect ( U ( 'Home/Public/login' ,array('u'=>$_GET['u'])) );
	//	}
		exit;
		}else{
			if(strstr($this->uinfo['user_nicename'],'sm') && $this->uinfo['id']>0){
				$this->uinfo = D("Users")->find($this->uinfo['id']);
			}
		}
		
		$this->check_is_bind($this->uinfo['id']);
		// parent::__construct();
	}
	

	
	public function yaoyiyao(){
		$media = $this->getMedia ( '摇一摇', '', '', '摇一摇', 'ismenu' );
		$this->assign ( 'media', $media );
		//dump($this->uinfo);		
		$this->assign ( 'myinfo', $this->uinfo );
		$this->siteDisplay ( 'yaoyiyao' );
	}
	
	public function rand(){
		//if($this->uinfo['subscribe']==0) return ;
		$rejifen=M("Users")->where("id=".$this->uinfo['id'])->getField('jifen');
		if($rejifen<=0) $this->error('您的积分不够了！<a href="'.U('Home/User/yaoqing').'" style="color:#FFCC66">去分享获得积分</a>','',1);
		A("Site")->changejifen((-1)*C('yaojf'),$type='4',$desc='摇一摇消耗积分',$this->uinfo['id'],$note=0);
		
		$rand = A("Weixin")->choujiang();	
		if($rand>0){
			$body = "您参与摇一摇获得金额".$rand."，邀请朋友一起来吧！";
			if($rand==1){
				$wxid = D('Home/Users')->getWxOpenid($this->uinfo['id'],$this->uinfo['weixin']);
				$re = A('Api')->sendhb($wxid,1,C('site_title'),$body,5); // 关注送红包	
				if($this->uinfo['parent_id']>0)
				A("Site")->changejifen(C('yaopjifen'),4,'您的粉丝【'.$this->uinfo['user_nicename'].'】在摇一摇活动中获得金钱，好运气当然要分享！',$this->uinfo['parent_id'],1);
				if($re===true){
					$this->success('恭喜获得红包'.$rand."，已发送至您的微信，积分剩余".$rejifen,'',1);
				}else{
					$this->success('恭喜获得金钱'.$rand."，已存入您的余额，您可以提现。积分剩余".$rejifen,'',1);
				}
			}else{
				$re = A("Site")->changemoney($rand,$type='4',$body,$this->uinfo['id'],$note=1);
				if($this->uinfo['parent_id']>0)
				A("Site")->changejifen(C('yaopjifen'),4,'您的粉丝【'.$this->uinfo['user_nicename'].'】在摇一摇活动中获得金钱，好运气当然要分享！',$this->uinfo['parent_id'],1);
				$this->success('恭喜获得金钱'.$rand."，已存入您的余额，您可以提现。积分剩余".$rejifen,'',1);
			}
			
		}else{
			$this->error('谢谢参与，再接再厉，积分剩余'.$rejifen,'',1);
		}
		
	}
	
	public function fx_hb(){//分享送红包/微信内
	if(C("iswxjsfx")==0)  exit('微信分享已关闭');
	
	if(!$this->is_weixin()){
		
		
		//return '';
		//exit("必须在微信内分享");
	}
		$data['uid'] = $this->uinfo['id'];
		$data['aid'] = I("post.aid");		
		$ip = get_client_ip();		
		if(!$data['uid']) exit('1');
		$type = I("post.type");		
		
		if(M("Content")->where("content_id=".$data['aid'])->getField("actionstatus")==1) exit("此文章任务已完成，不再计算佣金。");	
		
		if(C('ererydayfxbet')>0){
			$res =  M("Content_f_log")->field('time')->where('uid = '.$data['uid'])->order('time desc')->find();
			if($res['time']){
			$fx_time = $res['time']+C('ererydayfxbet');
				if($fx_time>time()) exit('请'.C('ererydayfxbet').'秒后再分享！');
			}	
		}
		
		$re = M("Content_f_log")->where($data)->find();
		$data['ip2'] = ip2long($ip);
		if(!$re){
		$data['ip']=$ip;		
		$data['time'] = I("post.times");
		if(!$data['time']) exit('1');
		if(!$data['aid']) exit('1');
		$data['type'] =$type;
		$data['md5code']=$_GET['hash'];		
		$data['allview']=0;
		$data['status']=1;
		$kzid = I("post.kzid");
		if($kzid>0){
			$kztable  = D("DuxCms/Fieldset")->getInfo($kzid);
			if($kztable['table']=='w_order') exit('1');
		}
		
		$re2 = M("Content_f_log")->add($data);
		if($re2){			
			$re3 = M()->query("SELECT count(*) as cnum FROM dux_content_f_log WHERE uid = ".$data['uid']."  and FROM_UNIXTIME( time, '%Y%m%d' ) =".date("Ymd",time()));			
			$yinum = $re3[0]['cnum'];
			$fxmoney=	C("fx_content_jq");	
			$fxmoenypid=	C("fx_content_jq_pid");
			$fxmoenypid_2 =C("fx_content_jq_pid_2");
			$fxmoenypid_3 =C("fx_content_jq_pid_3");		
			if(C('ererydayfx')>0){
				if(C('ererydayfx')<$yinum){					
			    $fxmoney = $fxmoenypid = $fxmoenypid_2 = $fxmoenypid_3 =0;
			    exit("您今日已分享超过".$yinum.",分享佣金减少为".$fxmoney."，建议明日再发！");
				}
				if($fxmoney<0.01) $fxmoney =0;
			}
			
			if(C("fx_content_hb")>=1){//分享 发红包
				//$openid = D("Users")->idreinfo($data['uid']);
				$body="分享文章送红包";
				$re = A('Api')->sendhb($this->uinfo['weixin'],C("fx_content_hb"),C('site_title'),$body,1);
			}
			
			if($fxmoney>0){//发佣金
			
					
			if($kzid>0){
			
			if($kztable['table']){
				$mod1 = D("DuxCms/FieldData");
				$mod1->setTable($kztable['table']);
				$kzinfo = $mod1->getInfo($data['aid']);			
				if(is_array($kzinfo)) {
					$kzinfo['fxyj']>0 ? $fxmoney = $kzinfo['fxyj']:'';
					$kzinfo['fxyj']< 0 ? $fxmoney = 0:'';
					$yinum = 0;
					if($kzinfo['area'] && $kzinfo['areayj']>0){//区域佣金
						 $url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=".$data['ip'];
        				$re = A("Home/site")->curl_get_contents($url);
        				$re2 = json_decode($re,true);			
        				//S("area2",$kzinfo);
        				if(strstr($kzinfo['area'],',')){
							$areaarr = explode(',',$kzinfo['area']);
							if(in_array($re2['city'],$areaarr) || in_array($re2['province'],$areaarr)|| in_array($this->uinfo['province'],$areaarr) || in_array($this->uinfo['city'],$areaarr)){
								$fxmoney = $kzinfo['areayj'];
							}
							
						}else{
							if($re2['city']==$kzinfo['area']  || $re2['province']==$kzinfo['area'] || $this->uinfo['province']==$kzinfo['area'] || $kzinfo['area']==$this->uinfo['city']){
							$fxmoney = $kzinfo['areayj'];
							}
						}
						if(C('is_check_bind')==1){
							$fxmoney = $this->qy_money($this->uinfo['id'],$kzinfo['area'],$kzinfo['areayj']);
						}
						
						
        				
					}
					
					
					if($kzinfo['actionyj']>0){//任务总金额
						//$zhichu = M("Account_log")->where("aid=".$data['aid'].' and money>0')->sum('money');
						$zhichu = M("Content")->where("content_id = ".$data['aid'])->getField('consume_money');
						if($zhichu && $zhichu>=$kzinfo['actionyj']){
							$this->set_content_status($data['aid'],1);
							//M("Content")->where("content_id=".$data['aid'])->setField("actionstatus",1);
						}
					}
					
					
				}
			}
			}

				$body="分享文章获得佣金，好友浏览后可再得佣金。";
				if($type=='one') $fxmoney=C('shareone')?C('shareone'):0; //分享给个人佣金
				$re = A("Site")->changemoney($fxmoney,'5',$body,$this->uinfo['id'],$note=1,$data['ip'],$data['aid']);
				//if($re) M("Content_f_log")->where('aid = '.$data['aid'].' and  uid = '.$this->uinfo['id'])->setField("status",1);
			}
			
		/*	if($fxmoenypid>0 && $this->uinfo['parent_id']>0 && $type=='all'&&$fxmoney>0){//上级分成
				
				$body="粉丝【".$this->uinfo['user_nicename']."】分享文章获得佣金。";
				$pidarr = M("Users")->find($this->uinfo['parent_id']);
				if($pidarr['last_login_ip']==$data['ip']) $fxmoenypid=0;
				$re = A("Site")->changemoney($fxmoenypid,'8',$body,$this->uinfo['parent_id'],$note=1,$data['ip'],$data['aid']);
			}*/
			
				if($type=='all' && $fxmoney>0){
				
				$fx_kk[]=$fxmoenypid;//1级
				$fx_kk[]=$fxmoenypid_2;//2级
				$fx_kk[]=$fxmoenypid_3;//3级
				$row['user_id']=$this->uinfo['id'];
				for($i=0;$i<count($fx_kk);$i++){
					if($fx_kk[$i]<=0) continue;
					$body="粉丝【".$this->uinfo['user_nicename']."】分享文章获得佣金。";
					$body =($i+1)."级".$body;
					$row =M('Users')->field('parent_id as user_id')->where("id=".$row['user_id'])->find();
					$re = A("Site")->changemoney($fx_kk[$i],'8',$body,$row['user_id'],$note=1,$data['ip'],$data['aid']);
				}
			}
			
			
			
			
			if($yinum>10) $msg2="分享数超过文章被浏览数".C('txbei').'倍，将自动封号处理';
			if(C('ererydayfx')<$yinum){
					exit("您今日已分享超过".$yinum.",分享佣金减少为".$fxmoney."，建议明日再发！".$msg2);
				}
			
			exit('1');
			
		
		}	
		}	
			exit('1');	
	}
	
	
	public function fxhb(){//分享红包
		$uid = $_GET['u'];
		$gowxurl = C('gowxurl')?C('gowxurl'):999;
		if(!$uid && !$this->uinfo['id']){
			if($this->is_weixin()){
				cookie('gourl',U('fxhb'),86400);
				A('Public')->wxlogin();
				exit;
			}else{
				cookie('gourl',U('User/index'),86400);
				redirect ( U ( 'Home/Public/login' ,array('u'=>$_GET['u'])) );
			}
		}
        
		if(! $this->uinfo&&$this->is_weixin()&&C('gzhtype')==2){
			$this->wxreg();
		}
		
		
		if(!$uid && $this->uinfo['id']>0){
			header("Location: ".U("Home/Huodong/fxhb",array('u'=>$this->uinfo['id'],'gowxurl'=>$gowxurl,'gzhtype'=>C('gzhtype'))));
			exit;
		}
        if($this->uinfo['id'] &&  $uid != $this->uinfo['id']){
        	header("Location: ".U("Home/Huodong/fxhb",array('u'=>$this->uinfo['id'],'gowxurl'=>$gowxurl,'gzhtype'=>C('gzhtype'))));
        	exit;
        }

		if($uid && !$this->uinfo['id']){
// 			if($this->is_weixin()) $iswx =1;
// 			//$gzhtype =I('get.gzhtype','0');
// 			if($iswx !=1){
// 				$imgpath ="Uploads/ewm".date('YmdH',time())."/";
// 				$filepath = ROOT_PATH.$imgpath;
// 				$user_pic = $filepath."tg_".$uid.".jpg";
// 				$ticketimg =$imgpath."tg_".$uid.".jpg";
// 				if(!file_exists($user_pic))
// 				{  
// 					require_once ROOT_PATH."WxpayAPI_php_v3/phpqrcode.php";
// 					$Qcode = new \QRcode();
// 					$url = "http://".$_SERVER['SERVER_NAME'].U ( 'Home/Public/login' ,array('u'=>$uid,'log'=>1));
// 					if(!is_dir($filepath)){
// 						mkdir($filepath);
// 					}
// 					$Qcode->png($url,$user_pic,QR_ECLEVEL_L,6,true);
					
// 				}

// 			}else{
// 				if($this->is_weixin()&&C('gzhtype')==2){
// 					$ticketimg = 'http://open.weixin.qq.com/qr/code/?username='.C('wxcode');
// 				}else{
// 					$user_ticket = A("Home/Api")->doticket(0,$uid);
// 					if($user_ticket){
// 						$ticketimg = 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket='.$user_ticket;
// 					}	
// 				}
// 			}
                  $iswx = 0;
                  if($this->is_weixin()) $iswx =1;
                  if(C('gzhtype')==2){
                  	if($iswx==1){
                  		$ticketimg = 'http://open.weixin.qq.com/qr/code/?username='.C('wxcode');
                  	}else{
                  		$imgpath ="Uploads/ewm".date('YmdH',time())."/";
                  						$filepath = ROOT_PATH.$imgpath;
                  						$user_pic = $filepath."tg_".$uid.".jpg";
                  						$ticketimg =$imgpath."tg_".$uid.".jpg";
                  						if(!file_exists($user_pic))
                  							{
                  								require_once ROOT_PATH."WxpayAPI_php_v3/phpqrcode.php";
                  								$Qcode = new \QRcode();
                  								$url = "http://".$_SERVER['SERVER_NAME'].U ( 'Home/Public/login' ,array('u'=>$uid,'log'=>1));
                  								if(!is_dir($filepath)){
                  									mkdir($filepath);
                  								}
                  								$Qcode->png($url,$user_pic,QR_ECLEVEL_L,6,true);
                  			
                  					}
                  	 }    
                  }else{
						$user_ticket = A("Home/Api")->doticket(0,$uid);
						if($user_ticket){
							$ticketimg = 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket='.$user_ticket;
						}
					}


			
				$username = M('Users')->field('user_nicename')->find($uid);
				if($username) $username = $username['user_nicename']?$username['user_nicename']:'赚客'.$uid;
		
				
				$this->assign('iswx',$iswx);
				$this->assign('username',$username);
				$this->assign('ticketimg',$ticketimg);
				$this->siteDisplay ('user_yqurl');
				exit;
		}
		
		
		if(!$uid) exit;
		$puinfo = D("Users")->find($uid);
		
		$this->assign('puinfo',$puinfo);
		$kk[] = '佣金好多，吓死宝宝了...';
		$kk[] = '要叫朋友一起来，这样真的好吗...';
		$kk[] = '求带我装逼带我飞..';
		$kk[] = '挖掘机哪家强 中国山东找蓝翔';
		$kk[] = '每天玩手机都能赚钱，也是醉了!';
		$kk[] = '只想安静地做个美男子';
		$kk[] = '“爱一个人就要大声说出来。” “出来!”。';
		$kk[] = '再不努力，老子的今天就是儿子的明天。';
		$ulist = D("Users")->where("historymoney>1")->order("rand()")->limit(10)->select();
		if(!$ulist) $ulist = D("Users")->where("money>0")->order("rand()")->limit(10)->select();
		foreach($ulist as $k=> $val){
			$k2=rand(0,7);
			$ulist[$k]['kk']=$kk[$k2]; 
		}
		$this->assign('ulist',$ulist );
		$this->assign('title',$puinfo['user_nicename']?$puinfo['user_nicename']:'来自UID'.$puinfo['id'].'的邀请' );
		$this->assign('sdesc',C('hbbody') );
		A("Api")->yqapi();
		
		$this->assign('act','mymoney' );
		$this->siteDisplay ('fxhb');
	}
	
	public function woyeyao(){		
		//$this->assign('getmoney',M("account_log")->where("uid=".$this->uinfo['id'])->sum("money"));
		$this->assign('getmoney',M("User")->where("uid=".$this->uinfo['id'])->getField("historymoney"));
		//$getzimoney = M("account_log")->where("uid=".$this->uinfo['id']." and type=8")->sum("money");
		$getzimoney = M("Users")->where("uid=".$this->uinfo['id'])->getField("fansmoney");
		$getzimoney = $getzimoney? $getzimoney:0;
		$this->assign('getzimoney',$getzimoney);
		$this->siteDisplay ('woyeyao');
	}
	
	
	//微信注册
	public  function wxreg(){
		
		if(C('gzhtype')==2){
			$APPID=C('Z_APPID');
			$SCRETID=C('Z_SCRETID');
		}else{
			$APPID=C('APPID');
			$SCRETID=C('SCRETID');
		}
	
		if (!isset($_GET['code']))
		{
	
			$backurl = $this->get_url();
	
			if(strstr($backurl,'gocdurl') && C('cdtzurl')) {
				$backurl =C('cdtzurl');
			}
	
			
			$url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$APPID."&redirect_uri=".urlencode($backurl)."&response_type=code&scope=snsapi_base&state=".$state."#wechat_redirect"; //  snsapi_us
			
			Header("Location: $url");
	
		}else
		{
	
			$code = $_GET['code'];
			$url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=".$APPID."&secret=".$SCRETID."&code=".$code."&grant_type=authorization_code";
	
			$re = $this->curl_get_contents($url);
	
			$rearr = json_decode($re,true);
			$openid = $rearr['openid'];
			$unionid = $rearr['unionid'];
	
			$asstoken = $rearr['access_token'];

			if(!$openid) {
				$gourl = $_SESSION['gourl'];
				if(!$gourl) $gourl = U('Home/User/index');
				redirect($gourl);
				exit;
			}
	       

			$udb = D("Home/Users")->returnuinfo($openid,$unionid);

			
			if(!is_array($udb)){//跳转到注册页
	
				$rearr2 = A("Home/Api")->getwxinfo($openid);

				if(!$rearr2['openid']) {
					$gourl = $_SESSION['gourl'];
					if(!$gourl) $gourl = U('Home/User/index');
					redirect($gourl);
					exit;
				}
				$reid = D("Users")->wxreg($openid,$rearr2);
				if($reid){
					$wxoid =$openid;
					$openid =$unionid?$unionid:$openid;
					M("User_bind")->add(array('uid'=>$reid,'openid'=>$openid,'code'=>'weixin'));
					if(C('gzhtype')!=2){
						M('Wx_openid')->add(array('uid'=>$reid,'openid'=>$wxoid,'gowxurl'=>C('gowxurl')?C('gowxurl'):999));
					}
					return true;
				}
	
			}
	
	
		}
		return true;
	}
	
	
	
}