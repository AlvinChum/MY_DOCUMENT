<?php
namespace Home\Controller;
use Home\Controller\SiteController;
/**
*  @author shanmao
 * http://shanmao.me
 * 
 */


class AjaxController extends SiteController {
	
	//检查用户
	Public function checkuser($log="",$pwd=""){
		if(!D('Users')->sms_limit()){
			$this->ajaxReturn(array('status'=>-1,'msg'=>'您输入用户错误次数太多请24小时之后再输入'));
		}
		if(empty($log)||empty($pwd)){
			$data =array('status'=>-1,'msg'=>'请填写账号或密码');
			$this->ajaxReturn($data);
		} 
		$status = D('Users')->checkuser($log,$pwd);
		if($status==1){
			$data =array('status'=>$status,'msg'=>'成功');
		}else{
			$data =array('status'=>$status,'msg'=>D('Users')->getError());
		}
		$this->ajaxReturn($data);
	}
	

	public function checklogin($tel=""){
		
		if(!D('Users')->sms_limit()){
			$this->ajaxReturn(array('status'=>-1,'msg'=>'您输入用户错误次数太多请24小时之后再输入'));
		}
		
		
		if(empty($tel)) $this->ajaxReturn(array('status'=>-1,'msg'=>'请填写手机号码'));
		if($this->isTel($tel)){
			if(D('Users')->checktel($tel)){
				$data =array('status'=>1,'msg'=>'');
			}else
				$data =array('status'=>-1,'msg'=>'该用户不存在');
		}else
			$data =array('status'=>-1,'msg'=>'请填写正确的手机号');
		 
		$this->ajaxReturn($data);
	}
	
	//检查手机是否可以注册
	public function checktel($tel=""){
		if(!D('Users')->sms_limit()){
			$this->ajaxReturn(array('status'=>-1,'msg'=>'您输入用户错误次数太多请24小时之后再输入'));
		}
       if(empty($tel)) $this->ajaxReturn(array('status'=>-1,'msg'=>'请填写手机号码'));
       if($this->isTel($tel)){
          if(D('Users')->checktel($tel)){
          	$data =array('status'=>-1,'msg'=>'该号码已经注册<a class="zhmm" href="'.U('Home/Public/login').'">马上登录</a>');
          }else
          	$data =array('status'=>1,'msg'=>'可以注册');
       }else 
       	$data =array('status'=>-1,'msg'=>'请填写正确的手机号');
       
       $this->ajaxReturn($data);
	}
	
	public function next($tel="",$pwd="",$m_pwd=""){
		if(empty($tel)) $this->ajaxReturn(array('status'=>-1,'msg'=>'请填写手机号码'));
		if(empty($pwd) || empty($m_pwd)) $this->ajaxReturn(array('status'=>-2,'msg'=>'密码不能为空'));
		if($pwd != $m_pwd) $this->ajaxReturn(array('status'=>-3,'msg'=>'两次密码输入不一致'));
		if(D('Users')->checktel($tel)){
			$data =array('status'=>-1,'msg'=>'该号码已经注册<a class="zhmm" href="'.U('Home/Public/login').'">马上登录</a>');
		}else if(C('is_tel_check')){
			$code = rand(1111,9999);
			$re = $this->send_mobcode($tel,$code);
			if($re===true){
				setSessionCookie('tel', $tel,3600);
				S('user_info'.$tel,array('log'=>$tel,'pwd'=>$pwd),3600);
				$data =array('status'=>1,'msg'=>'');
			}else{
				$data =array('status'=>-1,'msg'=>$re);
			}
		} else {
			setSessionCookie('tel', $tel,3600);
			S('user_info'.$tel,array('log'=>$tel,'pwd'=>$pwd),3600);
			$data =array('status'=>1,'msg'=>'');
		}
		$this->ajaxReturn($data);
		
	}
	
	//注册
	public function reg($tel="",$code=""){
		if(!D('Users')->sms_limit()){
			$this->ajaxReturn(array('status'=>-1,'msg'=>'您输入用户错误次数太多请24小时之后再输入'));
		}
		$tel = getSessionCookie('tel'); 
		$userinfo = S('user_info'.$tel);
		if(C('is_tel_check')){
			//开启手机验证时判断
			if(empty($code)) $this->ajaxReturn(array('status'=>-1,'msg'=>'请输入验证码'));  	
			if(empty($userinfo)) $this->ajaxReturn(array('status'=>-1,'msg'=>'注册超时请重新注册'));
			if($code!=S($userinfo['log'])) $this->ajaxReturn(array('status'=>-1,'msg'=>'请输入正确的验证码'));  
		}
		   
	   	if($uid =D('Users')->reg($userinfo['log'],$userinfo['pwd'])){
	   		setSessionCookie('user_login', $userinfo['log']);
	   		setSessionCookie('user_password', $userinfo['pwd']);
	   		$data =array('status'=>1,'msg'=>$uid);
	   		emptySessionCookie('tel');
	   		S('user_info'.$tel,null);
	   	}else{
	   		$data =array('status'=>-1,'msg'=>'注册失败');
	   	}
	   	$this->ajaxReturn($data);
		
	}
	
	public function yqm($yqm="",$uid=""){
		  if(empty($yqm)) $this->ajaxReturn(array('status'=>-1,'msg'=>'请输入邀请码'));  
		  $re = M('Users')->where('id='.$yqm)->count(); 
		  if($re){
		  	 $res = M('Users')->where('id='.$uid)->save(array('parent_id'=>$yqm));		  	 
		     if($res){	
		     
		     $this->parent_id_func($yqm,'jifen');
			 $this->parent_id_func($yqm,'money',$uid);

			setcookie('yq',0,time()-3600);
		     	 $data =array('status'=>1,'msg'=>'');
		     	 }
		     	 
		  }else{
		  	$this->ajaxReturn(array('status'=>-1,'msg'=>'邀请码不存在'));
		  }
		  $this->ajaxReturn($data);
	}
	
	
	public function getpwd($tel="",$code=""){
		if(!D('Users')->sms_limit()){
			$this->ajaxReturn(array('status'=>-1,'msg'=>'您输入用户错误次数太多请24小时之后再输入'));
		}
		if(empty($tel)) $this->ajaxReturn(array('status'=>-1,'msg'=>'请输入手机号'));
		if(empty($code)) $this->ajaxReturn(array('status'=>-2,'msg'=>'请输入验证码'));
		if($code!=S($tel)) $this->ajaxReturn(array('status'=>-2,'msg'=>'请输入正确的验证码'));
	    if($user =D('Users')->checktel($tel)){
	    	setSessionCookie('user_tel',$tel,24*3600);
	   	  $data =array('status'=>1,'msg'=>'');
	    }else{
	      $data =array('status'=>-1,'msg'=>'该用户不存在');
	    }
		
	    $this->ajaxReturn($data);
	
	}
	
	public function getvcode(){
		$mob = I("post.mob");
		$code = rand(1111,9999);
		$re = $this->send_mobcode($mob,$code);
		if($re===true){
			$data = array('status'=>1,'msg'=>'');
		}else{
			$data = array('status'=>-1,'msg'=>$re);
		}
		 $this->ajaxReturn($data);
	}
	
	public function reg_pwd($pwd="",$m_pwd=""){
		if(empty($pwd) || empty($m_pwd)) $this->ajaxReturn(array('status'=>-1,'msg'=>'密码不能为空'));
		if($pwd != $m_pwd) $this->ajaxReturn(array('status'=>-2,'msg'=>'两次密码输入不一致'));
		$tel = getSessionCookie('user_tel');
		if(empty($tel)) $this->ajaxReturn(array('status'=>-1,'msg'=>'重置密码超时请重新找回'));
		$user_pass =  md5 ( $tel . $pwd . C ( 'PWD_SALA' ) );
		$where['user_login'] = $tel;
		$re= M('Users')->where($where)->save(array('user_pass'=>$user_pass));
		if($re){
			emptySessionCookie('user_tel');
			$data =array('status'=>1,'msg'=>'');
		}else{
			$data =array('status'=>-1,'msg'=>'重置密码失败');
		}
		$this->ajaxReturn($data);
	}
	
	

}
?>