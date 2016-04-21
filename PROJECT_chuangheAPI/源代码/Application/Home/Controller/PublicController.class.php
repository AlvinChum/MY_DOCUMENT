<?php

namespace Home\Controller;

use Home\Controller\SiteController;


/** * @author shanmao
 * 
 * http://shanmao.me
 */
class PublicController extends SiteController {
	
// 	//测试用的方法
// 	public  function  text(){
// 	   var_dump(S('log555555'));	
// 	   exit;
// 	} 
	
	
	public function index() {
		// MEDIA信息
		$media = $this->getMedia ( '会员登陆' );
		$this->assign ( 'media', $media );
		
		if($this->uinfo){
			$gourl = cookie('gourl');
				if(!$gourl) $gourl = U('Home/User/index');
				cookie('gourl',null);
				redirect($gourl);
		}
        if($this->is_weixin()){
        	$this->assign('iswx',1);
        }
		
		$this->siteDisplay ( 'login2' );
	}
	
	//找回密码
	public function getpwd(){
	
		$this->siteDisplay ( 'getpwd' );
	}
	
	
	//一键注册
	public function oreg(){
		if($this->uinfo){
			$gourl = cookie('gourl');
				if(!$gourl) $gourl = U('Home/User/index');
				cookie('gourl',null);
				redirect($gourl);
		}
		
		
		if(D('Users')->reg($user_login,$pwd)){
			$this->dologin ( $user_login, $pwd, '', 2 ,0);
		}
	}
	
	
	
	
protected function loginbyname($re,$jump=1){

				$username=$re['user_login'];
				$logincheck = md5 ( $username . $re ['user_pass'] . C ( 'PWD_SALA' ) ); // 用户名+ md5密码 +sala
				$cookie ['check'] = $logincheck;
				$cookie ['username'] = $username;
				cookie ( 'checklogin', json_encode ( $cookie ), 365*86400);
				S ( 'uinfo' . $logincheck, $re);			
				$this->after_login ( $username );
				$openid = $re['weixin'];				
				if($openid && $re['subscribe']!=1){				
				$data=S("reginfo".$openid);
				if($data){
					$unionid = $re['unionid'];
					if($unionid)
					M("Users")->where("unionid='{$unionid}'")->save($data);
					else
					M("Users")->where("weixin='{$openid}'")->save($data);
					if($data['subscribe']==1){//新关注更新 uinfo
						$this->setUserinfo('subscribe',1);
					}
				}				
				S("reginfo".$openid,null);
				}
				if($jump==0) return ;
				$gourl = cookie('gourl')?cookie('gourl'):$_SESSION['gourl'];
				/*S("log",$gourl);
				S("log1",$_COOKIE['gourl']);
				S("log2",$_SESSION['gourl']);*/
				if(!$gourl) $gourl = U('Home/User/index');
				cookie('gourl',null);
				unset($_SESSION['gourl']);	
				
						
				redirect($gourl);
}

	
	
public function dowxlogin(){
	return ;	
	}

	public function bind(){
		
		$media = $this->getMedia ( '绑定手机登录' );
		//$data= M('Users')->where("")->find();
		$this->assign ( 'media', $media );
		$this->assign('regdata',$data);
	$this->siteDisplay('bindreg');
	}
	

  public function reg_login(){
  	$user_login =  getSessionCookie('user_login', $v);
  	$pwd =  getSessionCookie('user_password', $v);
  	if($user_login&&$pwd){
  		emptySessionCookie('user_login');
  		emptySessionCookie('user_password'); 
  		$this->dologin ( $user_login, $pwd, '', 2 ,0);
  	}else{
  		$this->error('登陆超时',U('login'));
  	}
  	
  	  
  }
	
	
	
	
	public function login() {

	if($this->uinfo){
			redirect(U('Home/User/index'));
		}else{
			
			if(!isset($_GET['log'])&&$this->is_weixin()){
				$this->wxlogin();exit;
			}
			
		}
		
		
		//$this->dowxlogin();
		
		$this->index ();
	}
	
	
	public function reg() {
		
		//$this->dowxlogin();
		
		$media = $this->getMedia ( '会员注册' );
		$this->assign ( 'media', $media );
		$type = I ( 'get.type' );
		if($type){
			$this->assign ( 'type', $type );
		}
		$this->assign ( 'yquid', $_COOKIE['yq']);
		if($this->uinfo){
			redirect(U('Home/User/index'));
		}
		$this->assign ( 'is_tel_check', C('is_tel_check'));
		$this->siteDisplay ( 'reg2_content2' );
	}
	
	/*
	 * 绑定方法
	 *
	 */
	public function dobind() {
		$u_data =array();
		$arr = I ( 'post.arr' );
		if (! trim ( $arr ['user_login'] ) || ! trim ( $arr ['user_pass'] )) {
			 $this->error ( '用户和密码不能为空' );
		}
		if(S($arr ['user_login'])!=I("post.vcode")) $this->error('手机验证码错误');
		if (! $this->isTel ( $arr ["user_login"] ))
			$this->error ( '请输入正确手机号！' );
		$arr ['parent_id'] = I("post.yaoqing");
		$arr ['user_tel'] = $arr["user_login"];
		$arr ['last_login_time'] = time ();
		$arr ['user_pass'] = md5 ( $arr ["user_login"] . $arr ["user_pass"] . C ( 'PWD_SALA' ) );
		$data = $this->get_address($arr["user_login"]);
		if($data){
			$arr ['b_pro'] = $data['b_pro'];
			$arr ['b_city'] = $data['b_city'];
			$arr ['b_fws'] = $data['b_fws'];
		}

		if($this->uinfo['id']){
			$udb = M ( 'Users' )->where ( "user_login='{$arr["user_login"]}'" )->find ();
			if($udb){

				$where['uid'] = $this->uinfo['id'];
				$re = M('User_bind')->where($where)->save(array('uid'=>$udb['id']));
				$res = M('Wx_openid')->where($where)->save(array('uid'=>$udb['id']));
				if($re){
					$this->uinfo['user_nicename']&&!$udb['user_nicename']?$s_arr['user_nicename']=$this->uinfo['user_nicename']:'';
					$this->uinfo['avatar']?$s_arr['avatar']=$this->uinfo['avatar']:'';
					$this->uinfo['weixin']?$s_arr['weixin']=$this->uinfo['weixin']:'';
					$this->uinfo['unionid']?$s_arr['unionid']=$this->uinfo['unionid']:'';
					$this->uinfo['user_qq']?$s_arr['user_qq']=$this->uinfo['user_qq']:'';
                    
					$this->uinfo['country']?$s_arr['country']=$this->uinfo['country']:'';
					$this->uinfo['province']?$s_arr['province']=$this->uinfo['province']:'';
					$this->uinfo['city']?$s_arr['city']=$this->uinfo['city']:'';
					$this->uinfo['subscribe_time']?$s_arr['subscribe_time']=$this->uinfo['subscribe_time']:'';
					$arr ['b_pro']?$s_arr['b_pro']=$arr ['b_pro']:''; 
					$arr ['b_city']?$s_arr['b_city']=$arr ['b_city']:'';
					$arr ['b_fws']?$s_arr['b_fws']=$arr ['b_fws']:'';
					$o_re = M('Users')->where('id = '.$udb['id'])->save($s_arr);
					if($o_re){
						M('Users')->where('id = '.$this->uinfo['id'])->delete();
						M('User_bind')->where('uid = '.$this->uinfo['id'])->delete();
						M('wx_openid')->where('uid = '.$this->uinfo['id'])->delete();
						
						if($old_money = floatval($this->uinfo['money'])){
							$this->changemoney($old_money,16,'绑定老用户',$udb['id']);
      				    }
      				    if($old_jifen = floatval($this->uinfo['jifen'])){
      				    	$this->changejifen($old_jifen,16,$desc='绑定老用户',$udb['id']);		
      				    }
      				    if(M('Users')->where('parent_id = '.$this->uinfo['id'])->count()){
      				    	M('Users')->where('parent_id = '.$this->uinfo['id'])->setField('parent_id',$udb['id']);
      				    }
      		
					}
					S("baind_old".$udb['id'],$udb['user_login']);
					$u_data = $udb;
				} 
			}else{
				$where['id'] = $this->uinfo['id'];
				$re = M('Users')->where($where)->save($arr);
				if($re){
					if($arr['parent_id']>0){//上级操作
						$this->parent_id_func($arr['parent_id'],'jifen');
						$this->parent_id_func($arr['parent_id'],'money',$this->uinfo['id']);
					}
					$u_data = M ( 'Users' )->where ( "id =".$this->uinfo['id'])->find ();
				}
			}
			if($u_data){
				setcookie('yq',0,time()-3600);
				$this->loginbyname($udb);
				exit;
			}
		}
			redirect(U('login'));

	}
	
	
	
	
	/*
	 * 注册方法
	 *
	 */
	public function doreg() {//目前只用于微信注册
		$arr = I ( 'post.arr' );
		$openid=I("post.openid");
		if (! trim ( $arr ['user_login'] ) || ! trim ( $arr ['user_pass'] )) {
			if(!$openid) $this->error ( '用户和密码不能为空' );
		}
		if(S($arr ['user_login'])!=I("post.vcode") || I("post.vcode") == "") $this->error('手机验证码错误');
		if (! $this->isEmail ( $arr ["user_email"] ))
			//$this->error ( '账号必须为邮箱！' );
		if (! $this->isTel ( $arr ["user_login"] ))
			$this->error ( '请输入正确手机号！' );
		//if (! $this->isCreditNo ( $arr ["user_code"] ))
			//$this->error ( '请输入正确身份证号！' );
		
			
		$arr ['last_login_ip'] = $arr ['regip'] = get_client_ip ();
		$arr ['parent_id'] = I("post.yaoqing");
		$arr ['create_time'] = time ();
		$arr ['user_tel'] = $arr["user_login"];
		$pwd = $arr ['user_pass'];
		$arr ['last_login_time'] = time ();
		$arr ['user_pass'] = md5 ( $arr ["user_login"] . $arr ["user_pass"] . C ( 'PWD_SALA' ) );
		
		if($openid){			
				
			$openid=I("post.openid");
			$data=S("reginfo".$openid);
			$data['user_login']=$arr["user_login"];
			$data['create_time']=$arr["create_time"];
			$data ['user_tel'] = $arr["user_login"];
			$data ['parent_id'] = $arr["parent_id"];
			$data ['user_pass'] = $arr ['user_pass'];	
			$sss=0;
			$olduser = S('old_user'.$openid);
			if($olduser){
				$udb = $olduser;
			}else{
				$udb = M ( 'Users' )->where ( "user_login='{$arr["user_login"]}'" )->find ();	
				$sss =1;
			}					
			if($udb){
				if($data['unionid'])
				$w2['unionid'] = $data['unionid'];
				else
				$w2['weixin'] = $openid;
				if($olduser){
					$w2 = array();
					$w2['weixin'] = $openid;
					S('old_user'.$openid,null);
				}
				if($sss==1){
					$w2 = array();
					$w2['id']=$udb['id'];
				}
				$reid = M("Users")->where($w2)->save ($data);
				S("baind_old".$udb['id'],$udb['user_login']);				
			}else{
				$reid = M("Users")->add ($data);
					if($reid){
					if($data['parent_id']>0){//上级操作
				$this->parent_id_func($data['parent_id'],'jifen');
			    $this->parent_id_func($data['parent_id'],'money',$reid);
			}
			}
			$udb = M("Users")->find($reid);
			}	
				
					
			setcookie('yq',0,time()-3600);
			S("reginfo".$openid,null,60);			
			$this->loginbyname($udb);			
			exit;
		}
		
		
		
		//$arr ['user_status'] = 1; 
		//$res = M ( 'users' )->add ( $arr );
		if ($res) {
			S("reginfo".$openid,null,60);
			
			$this->dologin ( $arr ['user_login'], $pwd, '', 2 );
		} else {
			$this->error ( '注册失败！' );
		}
	}
	
	/*
	 * 用户登录
	 * 自动登录
	 * @author 山猫
	 * 2014-03-28
	 */
	public function dologin($username = null, $pass = null, $isauto = null, $isvode = 1) {
		$username = $username ? $username : I ( 'post.log' );
		$password = $pass ? $pass : I ( 'post.pwd' );
		if ($isvode == 1) {
			$vcode = I ( 'vcode' );
			if (! $this->check_verify ( $vcode ))
				$this->error ( "验证码错误！" );
		}
		
		$re = M ( 'users' )->where ( "user_login='$username'" )->find ();
		if ($re) {
			if ($re ['user_pass'] == md5 ( $username . $password . C ( 'PWD_SALA' ) )) {
				$logincheck = md5 ( $username . $re ['user_pass'] . C ( 'PWD_SALA' ) ); // 用户名+ md5密码 +sala
				$cookie ['check'] = $logincheck;
				$cookie ['username'] = $username;
				
				cookie ( 'checklogin', json_encode ( $cookie ), 365*86400);
				S ( 'uinfo' . $logincheck, $re );
				$this->after_login ( $username );
				$gourl = cookie('gourl');
				if(!$gourl) $gourl = U('Home/User/index');
				cookie('gourl',null);
				redirect($gourl);
				// $this->success("登录成功！");
			} else {
				$this->error ( "账号或密码错误！" );
			}
		} else {
			$this->error ( "账号或密码错误！" );
		}
	}
	
	/**
	 * 退出登陆
	 *
	 * @author 山猫
	 * @since 2014-3-29
	 */
	public function dologout() {
		$cook = cookie('checklogin');
		$ucookie = json_decode ( stripslashes ( $cook ), true );
		S ( 'uinfo' . $ucookie ['check'], null );
		cookie ( 'checklogin', null);
		cookie('gourl',null);
		//cookie('gowxurl',null);
		$this->success ( "退出成功！", U ( 'Home/Public/login',array('log'=>1)), 3 );
	}
	
	
	
	
public function yaoqing(){//邀请
		A("Api")->yqapi();
		
		
		
		$media = $this->getMedia ( '邀请好友', '', '', '邀请好友', 'ismenu' );
		$this->assign ( 'media', $media );
		
		if($this->uinfo['id']){
			redirect(U('Home/User/yaoqing',array('u'=>$this->uinfo['id'],'type'=>2)));
		}
		
		$this->assign("siteurl","http://".$_SERVER['HTTP_HOST']."/");
		$this->assign("uid",$this->uinfo['id']);
		$this->assign("type",I('get.type'));
		$this->siteDisplay ( 'yaoqing' );
		
	}

	public function getvcode(){
		$mob = I("post.mob");
		$code = rand(1111,9999);
		$re = $this->send_mobcode($mob,$code);
		if($re===true){
			exit('1');
		}else{
			exit($re);
		}
		exit('1');
	}
	
	/**
	 * 处理登陆后
	 *
	 * @since 2014-3-29
	 *       
	 */
	private function after_login($username) {
		$ip = get_client_ip ();
		$data ['last_login_time'] = time ();
		$data ['last_login_ip'] = $ip;
		M ( 'Users' )->where ( "user_login='$username'" )->save ( $data );
		setcookie('yq',0,time()-3600);
	}
	
	
	
	public  function ajax_get_sj(){
		$aid = I('post.aid');
		
		if(!$this->uinfo['id']){
			//index.php?s=/Article/Content/index/content_id/
			$_SESSION['gourl']= 'http://'.$_SERVER['HTTP_HOST'].'/'.U('Article/Content/index',array('content_id'=>$aid));
	        cookie('gourl',$_SESSION['gourl'],86400);
			$data =array('status'=>-3,'msg'=>'未登录');
			
			$this->ajaxReturn($data);
			exit;
		}

		if(M("Content")->where("content_id=".$aid)->getField("actionstatus")==1){
			
			$data =array('status'=>-4,'msg'=>'此任务已结束');
				
			$this->ajaxReturn($data);
			exit;
		}
		
		$data =array('status'=>-2,'msg'=>'领取失败');
		
		
		
		$aisyj =  cookie('ajax_get_sj'.$aid);
		if($aisyj){
			$data =array('status'=>-1,'msg'=>'您已领取');
			$this->ajaxReturn($data);
			exit;
		}
		//$isyj =  cookie('count_ajax_get_sj');

		//if(!$isyj){
			$today =   strtotime("today");
			$yestoday =   strtotime(date('Y-m-d',strtotime('+1 day')));
			$where['uid'] =  $this->uinfo['id'];
			$where['aid'] =  $aid;
			
			$isyj =   M('Sj_log') -> where($where )-> count();
			if($isyj){
				$data =array('status'=>-1,'msg'=>'您已领取');
				$this->ajaxReturn($data);
				exit;
			}	
			unset($where['aid']);
			$where['_string'] =" time >'".$today."' and time <  '".$yestoday."'  ";
			$sj_num =   M('Sj_log') -> where($where)-> count();
			
			if($sj_num < C('sj_num')){
				
				$contentInfo = M('ext_gzh')->where('data_id = '.$aid)->find();
				$ip = get_client_ip();
				
					if(C('viewinarea')==1 && $contentInfo['area']){  //不在区域内是否计算佣金
					$contentInfo['sj_money'] =	A("Home/Api")->areayjfun($contentInfo['area'],$contentInfo['sj_money'],'ip',$ip,$uinfo=0,$mobnum=0);
					if($contentInfo['sj_money']==0){
							$data =array('status'=>-1,'msg'=>'您不在分享区域内');
				$this->ajaxReturn($data);
				exit;
					}
					}		
				
				$re =	$this->changemoney($contentInfo['sj_money'],$type='13',$desc='文章赏金',$this->uinfo['id'],1,$ip,$aid,$vuid=0);
			    if($re){
			    	M('Sj_log') ->add(array('aid'=>$aid,'uid'=>$this->uinfo['id'],'time'=>time()));
			    	$data =array('status'=>1,'msg'=>'成功');
// 			    	if( C('sj_num')==($sj_num+1)){
// 			    		cookie('count_ajax_get_sj','全部已领取',24*3600);
// 			    	} 
			    	cookie('ajax_get_sj'.$aid,$aid,365*24*3600);
			    }   
			}else{
				$data =array('status'=>-1,'msg'=>'您今天的赏金已全部领取');
			//}
			
		}
	
		$this->ajaxReturn($data);
	
	}

	//点击广告
	public function ad($id=''){
		if(!$id) $this->error('参数错误');
	    $re = M('Ad_release')->where('id ='.$id.' and status = 1')->find();
	    $ip =get_client_ip();
		if($re){
			if(C('ad_click_time') > 0){
				$ad_click =cookie('ad'.$re['ad_id']);
				if($ad_click){
					$ad_time =$ad_click+C('ad_click_time')*3600;
					  if($ad_time>time()){
					  	$this -> ad_click($re,$id,$ip,1);
					  }
				}
				$where['ip'] =$ip;
				$ad_time = M('Ad_log')->where($where)->order('time desc')->getField('time');
				if($ad_time){
					$ad_time =$ad_time+C('ad_click_time')*3600;
					if($ad_time>time()){
						$this -> ad_click($re,$id,$ip,1);
					}
				}
			}
		
		   $res = $this->changewbmoney((-1)*$re['dj_fee'],$type='14',$desc='广告点击',$re['uid'],$re['ad_id'],$note=0);
			if($res){
				$this ->ad_click($re,$id,$ip,2);
			}	  
		}
	}
	
	
	public function ad_click($re=array(),$id='',$ip="",$type=1){
				switch ($type)
			{
			case 1:
				$info['no_click'] = $re['no_click']+1;
			  break;
			case 2:
				$info['ys_fee'] = $re['ys_fee']-$re['dj_fee'];
				if($info['ys_fee']-$re['dj_fee']<0) $info['status'] = 2;
				M('Ad')->where('id = '.$re['ad_id'])->setInc('zc_fee',$re['dj_fee']);
				$uid =$this->uinfo['id']?$this->uinfo['id']:0;
				M('Ad_log')->add(array('uid'=>$uid,'money'=>$re['dj_fee'],'time'=>time(),'desc'=>'点击广告','ip'=>$ip,'ad_id'=>$re['ad_id'],'r_id'=>$re['id']));
			  break;
			}
		$info['click'] = $re['click']+1;
		M('Ad_release')->where('id = '.$id)->save($info);
		M('Ad')->where('id = '.$re['ad_id'])->setInc('click',1);
		cookie('ad'.$re['ad_id'],time(),24*3600);
		redirect($re['ad_link']);
		exit;
	}
	
	//提交订单
	public function cart(){
		$code = I('post.code');$iscode = I('post.iscode');$aid = I('post.content_id');
		$fx_uid = I('post.fx_uid');$tel =I('post.tel','','trim');
		if($iscode){
			$mob = $tel;
			 if($code!=S($mob)){
			 	$this->error("请输入正确手机验证码！");
			 }
		}
		if(!$_POST['field']||!$aid||!$tel) $this->error("请填写完整！");
		if($_POST['field']){
			if($tel) $_POST['field']['手机号'] = $tel;
			$field = $_POST['field'];
			$field = serialize($field);
			$info['info'] =$field;
			$info['addtime'] =time();
			$info['uid'] = $this->uinfo['id'] ? $this->uinfo['id']:0;
			$fb_uid = M('Content')->where('content_id = '.$aid)->getField('user_id');
			$info['aid'] = $aid;
			$info['ip'] = get_client_ip();
			$info['fb_uid'] = $fb_uid?$fb_uid:0;
			$info['fx_uid'] = $fx_uid?$fx_uid:0;
			$re = M('Ext_w_order_list')->add($info);
			$ip = getSessionCookie('worder_'.$aid);
			if($ip){
				$where['aid'] = $aid;
				$where['ip'] = $info['ip'];
				$ip = M('Ext_w_order_list')->where($where)->count();
				setSessionCookie('worder_'.$aid,$info['ip'],24*3600);
			}
			if($re){
				
				if($fb_uid&&!$ip){
					
					$res = M('Ext_w_order')->where('data_id ='.$aid)->find();
				    if($res){
				    	$title = M('Content')->where('content_id = '.$aid)->getField('title');
				    	if($fx_uid) $rs =  $this->changemoney($res['yx_fee'],$type='15',$desc='意向<'.$title.'>佣金',$fx_uid,1,$ip=get_client_ip(),$aid,$fx_uid);
				    	if(!$fx_uid) $rs =  $this->changewbmoney((-1) * $res['yx_fee'],$type='15',$desc='扣除意向<'.$title.'>佣金',$fb_uid,$aid,1);
				    
				       if($rs){
				       	
				       	    M("Ext_w_order")->where("data_id=".$aid)->setInc('ys_fee',(-1)*$res['yx_fee']);
				       	    setSessionCookie('worder_'.$aid,$info['ip'],24*3600); 
				       }
				       $new_fee = $res['ys_fee']-$res['yx_fee'];
				       if($new_fee-$res['yx_fee']<=0){
				       //M('Content')->where('content_id = '.$aid)->save(array('actionstatus'=>1));
				       	$this->set_content_status($aid,1);
				       } 
				    }
				}
				
				 $this->success('提交成功！');
			}
		}
		$this->error('提交失败！');
	}
	
	
	public function wxlogin(){

		$state =isset($_GET['state'])?$_GET['state']:123;
			if($this->uinfo&&!isset($_GET['state'])){
				redirect(U('Home/User/index'));
				exit;
			}
			
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

$_SESSION['gourl']=U('Home/User/index');
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
			
			$udb2 = M("Users")->find($reid);
			if($udb2){
				if(C('gowxurl')){
					S($openid,C('gowxurl'));
					$udb2['gopenid'] = $wxoid;
				}
				cookie('gourl',U('User/index'),86400);
				
				$this->loginbyname($udb2);
			}
		}else{
			redirect(U('login'));
		}
		
}else{//登录
	
	
   if(C('gowxurl')){
		S($openid,C('gowxurl'));
		$udb['gopenid'] = $openid;
	}
	//检查openid
	if(C('gzhtype')!=2){
		D('Home/Users')->checkWxopenid($udb['id'],$openid);
	}

	$state = $_GET['state'];
	if($state !=123){
		$state_data  =  explode('|', $state);
		$w['data_id'] =$state_data[0];
		$domain = M('Ext_monegzh')->where($w)->getField('domain');
		if($state_data[1]=='tixian')
			$url = 'http://'.$domain.U('Home/User/tixian');
		elseif($state_data[1]=='chongzhi') 
		$url = 'http://'.$domain.U('Home/Weishang/chongzhi');
    
		redirect($url);
	}
	$this->loginbyname($udb);
 }

  }
	}
	

	

}