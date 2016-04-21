<?php
namespace Home\Model;
use Think\Model;

class UsersModel extends Model {
	

	public function wreuval($openid,$field='id'){
	
		$uid = M('Wx_openid')->where("openid='{$openid}'")->getField('uid');
		if($uid){
			return $this->where("id='{$uid}'")->getField($field);
		}
		
		return $this->where("weixin='{$openid}'")->getField($field);
	}
	
	public function idreinfo($id,$field='weixin'){//id��ȡ info
	$re = $this->find($id);
	return $re[$field];
	} 

	public function qd(){
		
	}
	
	public function myfens($uid){
		return $this->where("parent_id='{$uid}'")->count();
	}
	
	public function checkuser($log="",$pwd=""){
	
		$user = $this->checktel($log);
		if($user){
			$userlog = getSessionCookie('usererror');
			if($userlog==-1){
				$this->error="您输入错误密码太多，一个小时候将无法登入";
				return -2;
			}
			if(md5 ( $log . $pwd . C ( 'PWD_SALA' ) ) != $user ['user_pass']){
				$userlog = isset($userlog)?$userlog-1:4;
				setSessionCookie('usererror', $userlog,3600);
				if($userlog==-1) $this->error="您输入错误密码太多，一个小时候将无法登入";
				else
					$this->error='密码错误，还有'.$userlog.'次机会,您可以<a href="'.U('Home/Public/getpwd').'" class="zhmm">找回密码</a>';
				return -2;
			}
			return 1;
		}else
			$this->error="该用户不存在";
		return -1;
	}
	
	//手机号码是否已经存在
	public function checktel($tel){
		$where['user_login'] =$tel;
		$user = $this->where($where)->field('user_pass')->find();
		return $user;
	}
	//注册
	public function reg($log="",$pwd=""){
		$arr ['user_login'] = $log;
		$arr ['last_login_ip'] = $arr ['regip'] = get_client_ip ();
		$arr ['create_time'] = time ();
		$arr ['user_tel'] = $log;
		$arr ['last_login_time'] = time ();
		$arr ['user_pass'] = md5 ( $log . $pwd . C ( 'PWD_SALA' ) );
		$data = A('Home/Site')->get_address($log);
		if($data){
			$arr ['b_pro'] = $data['b_pro'];
			$arr ['b_city'] = $data['b_city'];
			$arr ['b_fws'] = $data['b_fws'];
		}
	
		$res = M ( 'users' )->add ( $arr );
		if($res) return $res;
		return false;
	}
	
	//微信注册
	public function wxreg($openid,$rearr2){
		if(!$openid||!$rearr2) return false;
		$data['user_login']=$data['weixin']=$data['user_pass']=$openid;
		$data['avatar']=$rearr2["headimgurl"]?$rearr2["headimgurl"]:0;
		$data['user_nicename']=$rearr2["nickname"]?$rearr2["nickname"]:'sm'.date('ymdHis',time()).rand(1111,9999);
		$data['unionid']=$rearr2['unionid']?$rearr2['unionid']:0;
		$data['subscribe']=$rearr2['subscribe'];
		$data['country']=$rearr2['country'];
		$data['province']=$rearr2['province'];
		$data['city']=$rearr2['city'];
		$data['subscribe_time']=$rearr2['subscribe_time'];
		$data['sex']=$rearr2['sex'];
		$data['create_time']=time();
		$data['regip']= get_client_ip ();
		$_COOKIE["yq"]?$data['parent_id']=$_COOKIE["yq"]:'';
		$data ['user_pass'] = md5 ( $data ["user_login"] . $data ["user_pass"] . C ( 'PWD_SALA' ) );

		return $this->add($data);
		
	}
	
	//微信修改用户
	public function wx_edituser($openid,$uid,$rearr2){
		if(!$openid||!$rearr2) return false;
		$data['weixin']=$openid;
		$data['avatar']=$rearr2["headimgurl"]?$rearr2["headimgurl"]:0;
		$data['user_nicename']=$rearr2["nickname"]?$rearr2["nickname"]:'sm'.date('ymdHis',time()).rand(1111,9999);
		$data['unionid']=$rearr2['unionid']?$rearr2['unionid']:0;
		$data['subscribe']=$rearr2['subscribe'];
		$data['country']=$rearr2['country'];
		$data['province']=$rearr2['province'];
		$data['city']=$rearr2['city'];
		$data['subscribe_time']=$rearr2['subscribe_time'];
		$data['sex']=$rearr2['sex'];
		$data['regip']= get_client_ip ();
		$w['id'] = $uid;
		return $this->where($w)->save($data);
	}
	
	
	//第三方获取用户数据
	public function returnuinfo($openid=0,$unionid=0,$code='weixin'){
		if(!$openid) return false;
		$wxoid = $openid;
		if($unionid){
			$u_where['openid'] =$unionid;
			$uid = M('User_bind')->where($u_where)->getField('uid');
		}
		if(!$uid){
			$u_where['openid'] =$openid;
			$uid = M('User_bind')->where($u_where)->getField('uid');
		}		
		if($uid){
			$re = $this->where(" id= ".$uid)->find();
			
			if(!$re){
				M('User_bind')->where($u_where)->delete();
				M('Wx_openid')->where("openid ='".$openid."'")->delete();
			}
			if($re){
				//检查openid
				if(C('gzhtype')!=2){
					$this->checkWxopenid($re['id'],$wxoid);
				}
			}
			

			return $re; 
		}else{
			if($unionid){
				$where['unionid'] = $unionid;
				$re = $this->where($where)->find();
				if($re) $openid =$unionid;
			}
			if(!$re){
				$w['weixin'] = $openid;
				$re = $this->where($w)->find();
				if($re&&$unionid){
				   $res =$this->where($w)->setField('unionid',$unionid);	
				   if($res) $openid =$unionid;
				} 
			}			
		    if($re){
		      $res = M('User_bind')->add(array('uid'=>$re['id'],'openid'=>$openid,'code'=>$code));
		      if(C('gzhtype')!=2){
		      	M('Wx_openid')->add(array('uid'=>$re['id'],'openid'=>$wxoid,'gowxurl'=>C('gowxurl')?C('gowxurl'):999));
		      }
		      return $re;
		    }
		}

		return false;
	}
	
	
	//限制请求次数
	public function sms_limit(){
		$userlog = getSessionCookie('telerror');
		$userlog = isset($userlog)?$userlog-1:100;
		
		if($userlog==-1){
			return false;
		}
		setSessionCookie('telerror', $userlog,24*3600);
		return true;
	}
	
	//获取用户信息
	public function getUser($user_login){
		$where['user_login'] =$user_login;
		$user = $this->where($where)->find();
		return $user;
	}
	
	
	//获取微信openid
	public function getWxOpenid($uid,$openid){
		$gowxurl = C('gowxurl')?C('gowxurl'):999;

		$w['uid'] = $uid;
		$w['gowxurl'] = $gowxurl;
		$wxid = M('Wx_openid')->cache(true)->where($w)->getField('openid');
        if($wxid)
		return $wxid;
        else 
        return $openid;
		
	}
	
	//检查微信openid
	public function checkWxopenid($uid,$openid){
	  // $wxid = $this->getWxOpenid($uid,$openid);
		$gowxurl = C('gowxurl')?C('gowxurl'):999;

		$w['uid'] = $uid;
		$w['gowxurl'] = $gowxurl;
		$wxdata = M('Wx_openid')->field('openid')->where($w)->find();

		if(!$wxdata){
		   $re = M('Wx_openid')->add(array('uid'=>$uid,'openid'=>$openid,'gowxurl'=>$gowxurl));
		   if(!$re){
		   	M('Wx_openid')->where("openid = '".$openid."'")->delete();
		   	$re = M('Wx_openid')->add(array('uid'=>$uid,'openid'=>$openid,'gowxurl'=>$gowxurl));
		   } 
		   return true;
		}
		if($wxdata!=$openid){
			M('Wx_openid')->where($w)->setField('openid',$openid);
			return true;
		}
	
	}
	
	public function get_z_openid($uid,$openid){
		$w['uid'] = $uid;
		$w['gowxurl'] = 999;
		$wxid = M('Wx_openid')->cache(true)->where($w)->getField('openid');
		if($wxid)
			return $wxid;
		else
			return $openid;
	}
	
	
	
	
	
}

?>