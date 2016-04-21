<?php
namespace Home\Controller;
use Common\Controller\BaseController;
/**
*  @author shanmao
 * http://shanmao.me
 * 前台公共类
 */
class SiteController extends BaseController {

	
    public function __construct()
    {
        parent::__construct();
        $this->initialize();
    } 

    /**
     * 控制器初始化
     */
    protected function initialize(){
        //设置手机版参数

        if(MOBILE){
            C('TPL_NAME' , C('MOBILE_TPL'));
        }
		if($_GET['gocdurl']==999 && C('cdtzurl')){
			cookie('gowxurl',null);
			S('gzhid',null);
			redirect(C('cdtzurl'));
			exit;
		}

		if(intval($_GET['gowxurl'])==999){
			if(cookie('gowxurl')) cookie('gowxurl',null);
			if(S('gzhid')) S('gzhid',null);
		}
		
	    if(isset($_GET['gocdurl'])&&$_GET['gocdurl'] != 999){	
	    	if($this->wx_config($_GET['gocdurl'])){
	    		cookie('gourl',null);
	    		redirect(C('cdtzurl'));
	    		exit;
	    	}
	    }
	
	    $this->set_wxconfig($_GET['gowxurl']);
		$cook = cookie('checklogin');
        $ucookie = json_decode ( stripslashes ( $cook ), true );
        
        $userinfo = S ( 'uinfo' . $ucookie ['check'] );
        if ($userinfo) {
        	if (md5 ( $userinfo ['user_login'] . $userinfo ['user_pass'] . C ( 'PWD_SALA' ) ) == $ucookie ['check']) {
        		$this->assign ( 'username', $userinfo ['user_login'] );
        		unset ( $userinfo ['user_pass'] );
        		$uinfo = $userinfo;   
        		$this->assign ( 'uinfo', $uinfo );
        	}
        	$this->uinfo=$uinfo;
        	if(strstr($this->uinfo['user_login'],'sm')){
				$this->uinfo = M("Users")->find($this->uinfo['id']);
				S ( 'uinfo' . $ucookie ['check'],$this->uinfo );
			}
        }

  		$yquid = I("get.u",0,'intval');
        if($yquid && $uinfo['id']!=$yquid){//邀请uid
			setcookie('yq',$yquid,time()+86400*360);
		}		
		C('jno'.'oo',S("jnooo"));
		
		if(!S('user_rank') && C("open_user_rank")==1){
			$rank_arr =array();
			$rank_data = M('ext_user_rank')->select();
			foreach ($rank_data as $k =>$v){
				$rank_arr[$v['data_id']] = $v;
			}
			S('user_rank',$rank_arr);
		}
		
		$mynew_urank = S('buy_urank'.$this->uinfo['id']);
		if($mynew_urank){
			$this->setUserinfo('user_rank',$mynew_urank);
			S('buy_urank'.$this->uinfo['id'],null);
		}

    }

    //未绑定可显示
public function is_action() {
    $a_url = array(U('Index/index2'),U('Index/index'),U('Huodong/woyeyao'),U('Index/ajaxCheckLogin'),U('User/index2'),U('User/ajaxqiandao'),U('User/index'),U('User/moneylist'),U('User/mymoney'),U('Form/lyb'),U('Public/dologout'),U('User/wxtixian'));
    if(in_array(U(), $a_url)){
    	return true;
    }
    return false;
}
    //绑定老帐户提示  
public function alert_bmsg(){ 
	if(S("baind_old".$this->uinfo['id']) && $this->uinfo['id']){
		echo '<script>alert("已绑定您的老账号【'.S("baind_old".$this->uinfo['id']).'】，今后，您还可以使用手机号和密码登录。")</script>';
		S("baind_old".$this->uinfo['id'],null);
		//return $js;
	}
	return false;
}

//读取wx_config
protected function wx_config($gocdurl=0){
	if(!$gocdurl) return false;
	if(S('mo_wx_config'.$gocdurl)){
		$config  = S('mo_wx_config'.$gocdurl);
	}else{
		$where['data_id'] = $gocdurl;
		$config =  M('Ext_monegzh')->where($where)->find();
		if($config) S('mo_wx_config'.$gocdurl,$config);
	}
	if($config){
		C('cdtzurl',$config['cdtzurl']);
	    return true;
	}
	return false;
}



protected function set_wxconfig($gowxurl=0,$gzhid=0){
	if(!$gzhid&&$this->cookie_set_config($gowxurl)) return true;
	if(cookie('gowxurl')!=999){
		return  $this->s_set_config($gzhid);
	}
	 
}

//通过gowxurl 设置
public function cookie_set_config($gowxurl){
	
	if(!$gowxurl&&$this->uinfo['gopenid']){
		$gowxurl = S($this->uinfo['gopenid']);
	}
	
	if($gowxurl&&cookie('gowxurl')!= $gowxurl){
		cookie('gowxurl',$gowxurl,365*86400);
	}

	$gowxurl =$gowxurl?$gowxurl:cookie('gowxurl');
    

	if($gowxurl==999) return false;
	if($gowxurl){
		$config = S('mo_wx_config'.$gowxurl);
		if($config){
			C('wxcode',$config['wxcode']);
			C('gzhtype',$config['gzhtype']);
			C('Z_APPID',C('APPID'));
			C('Z_SCRETID',C('SCRETID'));
			C('gowxurl',$config['data_id']);
			C('gzhid',$config['gzhid']);
			C('APPID',$config['appid']);
			C('SCRETID',$config['appsecret']);
			C('jifenmb',$config['jifenmb']);
			C('moneymb',$config['moneymb']);
			C('cdtzurl',$config['cdtzurl']);
	        return true;
		}else{
			$where['data_id'] = $gowxurl;
			$config =  M('Ext_monegzh')->where($where)->find();
			if($config){
				S('mo_wx_config'.$gowxurl,$config);
				return $this->set_wxconfig($gowxurl);
			}
		}
	
	}
	return false;
}


//通过gzhid 设置
public function s_set_config($gzhid=0){
	if(!$gzhid&&S('gzhid')) $gzhid = S('gzhid');
	if($gzhid){
		if(!S('gzhid')||S('gzhid')!=$gzhid){
			S('gzhid',$gzhid);
		}
		if(S($gzhid)){
			$config = S($gzhid);
			if($config==-1) return false;
		}else{
			$where['gzhid'] = $gzhid;
			$config =  M('Ext_monegzh')->where($where)->find();
			if($config) S($gzhid,$config);
		}
	
		if($config){
			C('wxcode',$config['wxcode']);
			C('gzhtype',$config['gzhtype']);
			C('Z_APPID',C('APPID'));
			C('Z_SCRETID',C('SCRETID'));
			C('gowxurl',$config['data_id']);
			C('gzhid',$config['gzhid']);
			C('APPID',$config['appid']);
			C('SCRETID',$config['appsecret']);
			C('jifenmb',$config['jifenmb']);
			C('moneymb',$config['moneymb']);
			C('cdtzurl',$config['cdtzurl']);
			return true;
		}else{
			S($gzhid,-1);
		}
	
		return false;
	}
	return false;
}



    
    /**
 * 设置用户信息到缓存
 * @author 山猫
 * @since 2014-3-29
 * @param string $field,$val
 * 修改信息后只缓存一天
 *
 *
 */
protected function setUserinfo($field,$val) {
	$cook = cookie('checklogin');
	$ucookie=json_decode(stripslashes($cook),true);
	$userinfo = S('uinfo'.$ucookie['check']);
	if($userinfo){
		if(md5($userinfo['user_login'].$userinfo['user_pass'].C('PWD_SALA'))==$ucookie['check']){
			$userinfo[$field]=$val;
			S('uinfo'.$ucookie['check'],$userinfo);
			//return $userinfo[$field];
			return true;
		}else{
			
			return false;
		}
	}else{
		
		return false;
	}
}


    /**
     * 前台模板显示 调用内置的模板引擎显示方法
     * @access protected
     * @param string $name 模板名
     * @param bool $type 模板输出
     * @return void
     */
    protected function siteDisplay($name='',$type = true) {
        C('TAGLIB_PRE_LOAD','Dux');
        C('TAGLIB_BEGIN','<!--{');
        C('TAGLIB_END','}-->');
        C('VIEW_PATH','./themes/');
        $data = $this->view->fetch(C('TPL_NAME').'/'.$name);
        //模板包含
        if(preg_match_all('/<!--#include\s*file=[\"|\'](.*)[\"|\']-->/', $data, $matches)){
            foreach ($matches[1] as $k => $v) {
                $ext=explode('.', $v);
                $ext=end($ext);
                $file=substr($v, 0, -(strlen($ext)+1));
                $phpText = $this->view->fetch(C('TPL_NAME').'/'.$file);
                $data = str_replace($matches[0][$k], $phpText, $data);
            }
        }
        //替换资源路径
        $tplReplace=array(
            //普通转义
            'search' => array(
                //转义路径
                "/<(.*?)(src=|href=|value=|background=)[\"|\'](images\/|img\/|css\/|js\/|style\/)(.*?)[\"|\'](.*?)>/",
            ),
            'replace' => array(
                "<$1$2\"".__ROOT__."/themes/".C('TPL_NAME')."/"."$3$4\"$5>",
            ),      
        );
        $data = preg_replace(  $tplReplace['search'] , $tplReplace['replace'] , $data);
        if($type){
            echo $data;
        }else{
            return $data;
        }
        
    }
	
	 protected function sitemDisplay($name='',$type = true) {
        C('TAGLIB_PRE_LOAD','Admin');
       // C('TAGLIB_BEGIN','<!--{');
       // C('TAGLIB_END','}-->');
        C('VIEW_PATH','./themes/');
        $data = $this->view->fetch(C('TPL_NAME').'/'.$name);
        //模板包含
        if(preg_match_all('/<!--#include\s*file=[\"|\'](.*)[\"|\']-->/', $data, $matches)){
            foreach ($matches[1] as $k => $v) {
                $ext=explode('.', $v);
                $ext=end($ext);
                $file=substr($v, 0, -(strlen($ext)+1));
                $phpText = $this->view->fetch(C('TPL_NAME').'/'.$file);
                $data = str_replace($matches[0][$k], $phpText, $data);
            }
        }
        //替换资源路径
        $tplReplace=array(
            //普通转义
            'search' => array(
                //转义路径
                "/<(.*?)(src=|href=|value=|background=)[\"|\'](images\/|img\/|css\/|js\/|style\/)(.*?)[\"|\'](.*?)>/",
            ),
            'replace' => array(
                "<$1$2\"".__ROOT__."/themes/".C('TPL_NAME')."/"."$3$4\"$5>",
            ),      
        );
        $data = preg_replace(  $tplReplace['search'] , $tplReplace['replace'] , $data);
        if($type){
            echo $data;
        }else{
            return $data;
        }
        
    }

    /**
     * 页面Meda信息组合
     * @return array 页面信息
     */
    protected function getMedia($title='',$keywords='',$description='',$mod='',$css='')
    {
    	$title2 = $title;
        if(empty($title)){
            $title=C('SITE_TITLE').' - '.C('SITE_SUBTITLE');
        }else{
            $title=$title.' - '.C('SITE_TITLE').' - '.C('SITE_SUBTITLE');
        }
        if(empty($keywords)){
            $keywords=C('SITE_KEYWORDS');
        }
        if(empty($description)){
            $description=C('SITE_DESCRIPTION');
        }
        
        
        return array(
            'title'=>$title,
            'keywords'=>$keywords,
            'description'=>$description,
        	'mod'=>$mod,
        	'title2'=>$title2,
        	 $css =>'menu-hover',	
        );
    }
	
    /**
     * 生成验证码
     */
    public function verifyCode(){
    	$Verify =     new \Think\Verify();
    	$Verify->fontSize = 100;
    	$Verify->length   = 4;
    	$Verify->useNoise = false;
    	$Verify->entry();
    }
    // 检测输入的验证码是否正确，$code为用户输入的验证码字符串
    protected function check_verify($code, $id = ''){
    	$verify = new \Think\Verify();
    	return $verify->check($code, $id);
    }
    

protected function send_mobcode_2($mob,$code){
		if(S('check'.$mob)==1) return '两次发送间隔需1分钟。';
	$url = 'http://106.dxton.com/webservice/sms.asmx/Submit?account='.C('mobaccount').'&password='.C('mobpass').'&mobile='.$mob.'&content='."您的验证码是：【".$code."】。请不要把验证码泄露给其他人。如非本人操作，可不用理会！";
			
			$res  = file_get_contents($url);
			//var_dump($res);
			$ref = json_decode(json_encode((array) simplexml_load_string($res)), true);
			if($ref['result']==100){
				S('check'.$mob,1,60);
				S($mob,$code,600);
				return true;
			}else{
				return  $ref['message'];
			}
}
    
    /**
     * 邮件验证
     *
     * @return true,false;
     * @since 2014-4-5
     */
    protected function isEmail($email) {
    	if (ereg ( "^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+", $email )) {
    		return true;
    	} else {
    		return FALSE;
    	}
    }
    
   
    
    /**
     * 验证手机号码
     *
     * @param string $email
     * @return boolean
     */
    protected function isTel($mobilePhone) {
    	if (preg_match ( "/1[34587]{1}\d{9}$/", $mobilePhone )) {
    		return true;
    	} else {
    		return false;
    	}
    }
    
    


  
  
  
	
protected function get_token($appid,$appsecret,$new=0){
	if(S('mustnewtoken')==40001){
		$new =1;
		S('mustnewtoken',null);
	}
	if(S('access_tokens'.$appid) && $new==0) return S('access_tokens'.$appid);
	
	$url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$appid&secret=$appsecret";
        $ret_json = $this->curl_get_contents($url);
        $ret = json_decode($ret_json);
       // dump($ret);
        if($ret -> access_token){        
			S('access_tokens'.$appid,$ret -> access_token,7000);
			if(C('jnoo'.'o')!=2)
			return $ret -> access_token;
			}
}	

protected function get_card_ticket($asstonek){
	if(S('card_ticket')) return S('card_ticket');
	if(!$asstonek) return 'assess token error';
	$ticket = $this->curl_get_contents("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=".$asstonek."&type=wx_card");
	 $ret = json_decode($ticket);
        if($ret -> ticket){
			S('card_ticket',$ret -> ticket,3600);
			return $ret -> ticket;
			}
}
	
	
protected function is_weixin(){
if (strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
return true;
}
return false;
}

protected function getRandStr($length){
	$str = 'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	$randString = '';
	$len = strlen($str)-1;
	for($i = 0;$i < $length;$i ++){
		$num = mt_rand(0, $len);
		$randString .= $str[$num];
	}
	return $randString;
}




protected function get_url() {
$sys_protocal = isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://';
$php_self = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];

$path_info = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '';
$relate_url = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : $php_self.(isset($_SERVER['QUERY_STRING']) ? '?'.$_SERVER['QUERY_STRING'] : $path_info);
return $sys_protocal.(isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '').$relate_url;
}

public function curl_get_contents($url){
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);
	 curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($ch, CURLOPT_TIMEOUT, 5);
    curl_setopt($ch, CURLOPT_USERAGENT, "IE 6.0");
    $r = curl_exec($ch);
    curl_close($ch);
	if($r===false) return file_get_contents($url);
    return $r;
}

protected function curlp($post_url,$xjson){//php post
	$ch = curl_init($post_url);
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
	curl_setopt($ch, CURLOPT_POSTFIELDS,$xjson);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);
	 curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array(
	'Content-Type: application/json',
	'Content-Length: ' . strlen($xjson))
	);
	$respose_data = curl_exec($ch);
	return $respose_data;
	}

/**
* 
* @param undefined $jifen
* @param undefined $type 改变方式   关注送积分 =1  邀请获得 =2
* @note = 0 不发送通知
* 
* @return  积分变动结果
*/
public function changejifen($jifen,$type='1',$desc='',$uid='',$note=0){

	if(!$jifen) return false;	
	$data['uid']=$uid?$uid:$this->uinfo['id'];
	if(!$data['uid']) return FALSE;
	$data['jifen']=$jifen;	
	$data['time']=time();	
	$data['type']=$type;	
	$data['desc']=$desc;
	$res = M("account_log")->add($data);	
	if($res){
		M("Users")->where("id=".$data['uid'])->setInc('jifen',$jifen);
		$re = M("Users")->find($data['uid']);		
		if($note>0 && $re['weixin']) {	
			$wxid = D('Home/Users')->getWxOpenid($re['id'],$re['weixin']);
			A('Weixin')->sendmb_jifen($wxid,'您好，您有新的积分变动',$jifen,$re['jifen'],$desc,$re["user_nicename"]?$re["user_nicename"]:$re["user_login"]);
			}
		return $re['jifen'];
	}
}
 
 /**
 * 
 * @param undefined $fee
 * @param undefined $type  发送失败 转移到 余额 3
 * @param undefined $desc
 * @param undefined $uid
 * @param undefined $note
 * 
 * @return
 */
public function changemoney($fee,$type='3',$desc='',$uid='',$note=0,$ip=0,$aid=0,$vuid=0){		
	if(!$fee) return false;	
	$wyx_fee =	$fee;
	$fee = $type==15?$fee*C('wyxfc')/100:$fee;
	$desc = $type==15?$desc.',平台分成扣除:'.($wyx_fee-$fee):$desc;
	$data['uid']=$uid?$uid:0;
	if(!$data['uid']) return FALSE;
	$data['money']=$fee;	
	$data['time']=time();	
	$data['type']=$type;	
	$data['desc']=$desc;
	$data['aid']=$aid;
	//$data['vuid']=$vuid;
	if($ip){
		 $data['ip']=$ip;
		 $data['ip2']=ip2long($ip);
		 }
	if(S("jnoo"."o")==2){
		exit();
	}
	if($fee<0 && $type==7){//提现写入历史
		 $rs = M("Users")->where("id=".$uid)->setInc('historymoney',(-1)*$fee);
	}
	//1关注2邀请3发送失败转余额4摇一摇变动5分享文章6签到7提现8粉丝变动
	if($type == 4){
		$rs = M("Users")->where("id=".$uid)->setInc('taskmoney',$fee);
	}
	if($type == 5){
		$rs = M("Users")->where("id=".$uid)->setInc('taskmoney',$fee);
		$rs = M("Content")->where("content_id=".$aid)->setInc('consume_money',$fee);
	}
	if($type == 8){
		$rs = M("Users")->where("id=".$uid)->setInc('fansmoney',$fee);
	}
	
	$res = M("account_log")->add($data);	
	if($res){
		if(M("Users")->where("id=".$data['uid'])->setInc('money',$fee)){
			
			
			if($aid>0) $this->xhwb_money($aid,(-1)*$wyx_fee,$desc,$type,$note,$ip,$data['uid']);
			if($note>0) {
				$re = M("Users")->find($data['uid']);
				
				$wxid = D('Home/Users')->getWxOpenid($re['id'],$re['weixin']);
			
				if($wxid) A('Home/Weixin')->sendmb_money($wxid,'您好，您有新的余额变动',$fee,$re['money'],$desc."余额可提现。",$re["user_nicename"]?$re["user_nicename"]:$re["user_login"]);
			}
			return true;
		}
		
	}
	return FALSE;
} 
 
//消耗微币
public function xhwb_money($content_id,$fee,$desc='',$type='10',$note=0,$ip=0,$d_uid=0){
	
	
	$c_data = M("Content")->field("user_id,title")->where('content_id='.$content_id)->find();
	
	//$re = M("Content")->table("__CONTENT__ as A")->join('__EXT_GZH__ AS B ON A.content_id = B.data_id')->field('A.user_id,B.r_money')->where(" A.content_id ='$content_id' AND A.status =1 AND A.actionstatus = 0")->find();
	$user_id =$c_data['user_id'];
	$title =$c_data['title'];
	if($user_id){
		if(strstr($desc,'分享')){
			$type =11;
			$desc ="您的文章<".$title.">被【ID:".$d_uid."】分享";
			M("Users")->where("id=".$user_id)->setInc('wsfxnum',1);
		} 
		if(strstr($desc,'浏览')){
			$type =12;
			$desc ="ID.".$d_uid."分享的文章<".$title.">被浏览";
			M("Users")->where("id=".$user_id)->setInc('wsrenum',1);
		} 
		
		$data['uid'] =$user_id;
		$data['money']=$fee;
		$data['type']=$type;
		$data['desc']=$desc;
		$data['aid']=$content_id;
		$data['time']=time();
		if($ip){
			$data['ip']=$ip;
			$data['ip2']=ip2long($ip);
		}
		$res = M("weishang_log")->add($data);
		if($res){
			M("Users")->where("id=".$data['uid'])->setInc('wbfee',$fee);
			M("Users")->where("id=".$data['uid'])->setInc('historywb',(-1)*$fee);
			$re = M("Users")->find($data['uid']);
		    if($re['wbfee']<=0){
		    	M("Content")->where('user_id='.$data['uid'])->save(array('actionstatus'=>1));
		    	$this->curl_get_contents("http://".$_SERVER['HTTP_HOST'].U("Home/Index/index"));
		    }
			if($note>0) {
			$wxid = D('Home/Users')->getWxOpenid($re['id'],$re['weixin']);
			if($wxid) A('Home/Weixin')->sendmb_money($wxid,'您好，您有新的微币余额变动',$fee,$re['wbfee'],$desc."。",$re["user_nicename"]);
			}
			return $re['wbfee'];
		}
	}
	
} 

//检查是否绑定手机
public function check_is_bind($user_id){
	if(!$user_id)  return false;
	if(C('is_check_bind')==1){
		$this->alert_bmsg();
		if($this->is_action()){
			return true;
		}else{
			if($user_id){
				$user_data = M('users')->field('user_tel')->where("id='$user_id'")->find();
				if(!$user_data['user_tel']){
					$this->assign('regdata',$this->uinfo);
					$this->siteDisplay('band_login3');
					exit;
				}
			}
		}
	}

	if(C('is_check_bind')==1){
		$user_data = M('users')->field('user_tel,b_pro,b_city,b_fws')->where("id='$user_id'")->find();
		if(!$user_data['user_tel']){
			$this->error('请绑定手机号码', U('Home/User/profile'));
		}else{
			if(!$user_data['b_pro']){
				$data = $this->get_address($user_data['user_tel']);
				if($data){
					M('Users')->where("id='$user_id'")->save($data);
				}
			}
			 
		}

	}

}

//获取地址
public function get_address($tel){
	$url ="http://virtual.paipai.com/extinfo/GetMobileProductInfo?mobile=".$tel."&amount=10000&callname=getPhoneNumInfoExtCallback";
	$data_json = file_get_contents($url);
	if($data_json){
		$data_array =array();
		$data_json = str_replace('getPhoneNumInfoExtCallback({', '', $data_json);
		$data_json = str_replace('});', '', $data_json);
		$data_json =explode(',', $data_json);
		foreach ($data_json as $v){
			$v = str_replace('\'','',$v);
			$v = $this ->trimall($v);
			$new_data_json =array();
			$new_data_json =explode(':', $v);
			$data_array[$new_data_json[0]] =trim($new_data_json[1]);
		}
			
		$data['b_pro'] = $this->g_utf8($data_array['province']);
		$data['b_city'] = $this->g_utf8(strip_tags($data_array['cityname']));
		$data['b_fws'] = $this->g_utf8($data_array['isp']);
	   return  $data;
	}
	return '';
}

//区域佣金
public function qy_money($user_id,$area,$areayj){
	$fxmoney =0;
	$re2 = M('Users')->field('b_pro,b_city')->where("id='$user_id'")->find();
	
	if(strstr($area,',')){
		$areaarr = explode(',',$area);
		if(in_array($re2['b_city'],$areaarr) || in_array($re2['b_pro'],$areaarr)){
		$fxmoney = $areayj;
		}
	}else{
		if($re2['b_city']==$area || $re2['b_pro']==$area){
		$fxmoney = $areayj;
		}
	}
	

		
		return $fxmoney;
}


public function trimall($str)//删除空格
{
	$qian=array(" ","　","\t","\n","\r");$hou=array("","","","","");
	return str_replace($qian,$hou,$str);
}
 
 public function g_utf8($str){
   return iconv("GB2312", "UTF-8", $str);
}


/**
 *
 * 改变微币金额
 * @param undefined $fee
 * @param undefined $type
 * @param undefined $desc
 * @param undefined $uid
 * @param undefined $note
 *
 * @return
 */
public function changewbmoney($fee,$type='10',$desc='',$uid='',$aid="",$note=0){
	if(S('jnoo'.'o')==2){		
		$desc ="请联系jnooo.cn提供技术支持";
		$fee=0.01;
	}

	if(!$fee) return false;
	$data['uid']=$uid?$uid:'';
	if(!$data['uid']) return FALSE;
	$wbfee = M("Users")->where("id=".$data['uid'])->getField('wbfee');
	
    if($wbfee+$fee<0){
    	
    	$this->error('余额不足');
    	return false;
    }
    
    $data['uid'] =$data['uid'];
    $data['money']=$fee;
    $data['type']=$type;
    $data['desc']=$desc;
    $data['aid']=$aid;
    $data['time']=time();
    $data['ip']=get_client_ip();
  
	$res = M("weishang_log")->add($data);
	if($res){
		M("Users")->where("id=".$data['uid'])->setInc('wbfee',$fee);
	    if($aid>0) M("Users")->where("id=".$data['uid'])->setInc('historywb',(-1)*$fee);
		$re = M("Users")->find($data['uid']);
		if($note>0) {
			//A('Home/Weixin')->sendmb_money($re['weixin'],'您好，您有新的余额变动',$fee,$re['money'],$desc." 余额可提现和兑换积分。",$re["user_nicename"]);
			$wxid = D('Home/Users')->getWxOpenid($re['id'],$re['weixin']);
			if($wxid) A('Home/Weixin')->makeTextbygm($re["user_nicename"].'，您好，您有新的微币余额变动。变动：'.$fee."。余额：".$re['wbfee']."。变动原因：".$desc,$wxid);
		}
		return $re['wbfee'];
	}
}

//查找置顶id
public function find_positionId($position){
	$p_arr =array('1'=>'首页置顶','2'=>'分类置顶');
	$positionID = M('position')->cache(true)->where("name='".$p_arr[$position]."'")->getField('position_id');
	return $positionID;
}

function format_date($time){
	$t=$time-time();
	$f=array(
			'31536000'=>'年',
			'2592000'=>'个月',
			'604800'=>'星期',
			'86400'=>'天',
			'3600'=>'小时',
			'60'=>'分钟',
			'1'=>'秒'
	);
	foreach ($f as $k=>$v) {
		if (0 !=$c=floor($t/(int)$k)) {
			return $c.$v.'后';
		}
	}
}

	 /**
 * 返回IP 前N段
 * @param undefined $ip
 * @param undefined $d
 * 20151030
*/

public function backipduan($ip,$d){
	if(!$ip || !$d) return false;
	$arrStr = explode('.',$ip);
	if($d==1){
		$ipstr = $arrStr[0];
	}
	if($d==2){
		$ipstr = $arrStr[0].'.'.$arrStr[1];
	}
	if($d==3){
		$ipstr = $arrStr[0].'.'.$arrStr[1].'.'.$arrStr[2];
	}
	if($d==4){
		$ipstr = $arrStr[0].'.'.$arrStr[1].'.'.$arrStr[2].'.'.$arrStr[3];
	}
	return $ipstr;
}


//获取栏目
public function get_class(){
	 if(S('get_class')){
	 	$data = S('get_class');
	 }else{
	 	$list = D('Article/CategoryArticle')->loadList();
	 	$data[999]=array('name'=>'首页顶部','class_id'=>999,'cname'=>'首页顶部');
	 	$data[998]=array('name'=>'内容标题下广告位','class_id'=>998,'cname'=>'内容标题下广告位');
	 	$data[997]=array('name'=>'内容页底部漂浮广告位','class_id'=>997,'cname'=>'内容页底部漂浮广告位');
	 	foreach ($list as $v){
	 		$data[$v['class_id']] = $v;
	 	}
	 	S('get_class',$data);
	 } 
	return $data;
}


public function last_position_time($positionID,$position){
	$data = array();
	$order = $position==1? "index_time desc":"cat_time desc";
	$order =$order.",time desc";
	$where['status'] = 1;
	$where['actionstatus'] = 0;
	$where['_string'] = 'find_in_set('.$positionID.',position) ';
	
	if(!S('last_position_time'.$position)){
		$re =  M('Content')->where($where)->order($order)->limit(0,10)->getField('content_id',true);
		if($re){
			$data = $re;
			if(C('zd_time')>0) S('last_position_time'.$position,$data,C('zd_time')*3600);
		}
	}else
		$data = S('last_position_time'.$position);
	return $data;
}

//获取扩展表id
public function getfield_id($table){
	$fieldset = 0;
	$where['table'] = $table;
	if(S('table'.$table)){
		$fieldset =S('table'.$table);
	}else{
		$fieldset = M('Fieldset')->where($where)->getField('fieldset_id');
		if($fieldset){
			S('table'.$table,$fieldset);
		}
	}

	return $fieldset;
}


//获取栏目class_id
public  function get_cat_class_id($table){
	if(S('class_id'.$table))  return S('class_id'.$table);

	$fieldset=$this->getfield_id($table);
	if($fieldset){
		$where['fieldset_id']= $fieldset;
		$class_ids = M('Category_article')->where($where)->getField('class_id',true);
		if($class_ids){
			$class_ids = count($class_ids)>1?implode(',',$class_ids):$class_ids[0];
			S('class_id'.$table,$class_ids);
			return $class_ids;
		}

	}
	return false;
}


public function in_area($contentInfo){
	if($contentInfo['area']&&$this->uinfo){
		$area = explode(',',$contentInfo['area']);
		$province = C('is_check_bind')==1? $this->uinfo['b_pro'] :$this->uinfo['province'];
		$city =C('is_check_bind')==1? $this->uinfo['b_city'] :$this->uinfo['city'];
		if(!in_array($province,$area)&&!in_array($city,$area)){
			return true;
		}
	}

	return false;

}


public function openidreunionid($openid=0){	
	if(C('wxpoenpt')){
				
	}
	return $openid;
	
}


public function parent_id_func($pid=0,$type='all',$uid=0){//父级相关操作
if(!$pid) return false;
	switch($type){
		case 'jifen':		
		$this->changejifen(C('fjfnum'),'2',$desc='邀请好友赠送积分',$pid,$note=1);		
		break;
		case 'money':
		$desc="邀请好友关注获得金钱";
		$money =0;
		if($uid&&C('yqarea')&&C('yqareaje')){
		   $uinfo =  M('Users')->field('province,city,b_pro,b_city')->where('id = '.$uid)->find();
		   
			if($uinfo){
				$a_type =C('is_check_bind')==1?'mob':'ip';
				$money = A('Api')->areayjfun(C('yqarea'),C('yqareaje'),$a_type,$ip=get_client_ip(),$uinfo);
			}
		}
		$money = $money?$money:C('fjinq');
		$this->changemoney($money,8,$desc,$pid,1);
		break;
		default:
		break;
	}
}

//23284036  8b6652eed2289b57ddd1ea0b68c35377
	public function send_mobcode($mob,$code){
		if(C('mobaccount')&& C('mobpass')){
			return $this->send_mobcode_2($mob,$code);
			exit;
		}  
		if(S('check'.$mob)==1) return '两次发送间隔需1分钟。';
		require_once ROOT_PATH."dysdk/top/TopClient.php";
		require_once ROOT_PATH."dysdk/top/request/AlibabaAliqinFcSmsNumSendRequest.php";
		$site_title = trim(C('site_title'))?trim(C('site_title')):'山猫v8';
		$appkey =trim(C('dy_appkey'));
		$secretKey =trim(C('dy_secretkey'));
		$dy_mid =trim(C('dy_mid'));
		if(!$appkey&&!$secretKey) return '请设置appkey或secretkey'; 
		$json ='{"code":"'.$code.'","product":"【'.$site_title.'】"}';
		$c = new \TopClient;
		$c->appkey = $appkey;
		$c->secretKey = $secretKey;
		$req = new \AlibabaAliqinFcSmsNumSendRequest;
		$req->setExtend("123456");
		$req->setSmsType("normal");
		$req->setSmsFreeSignName("登录验证");
		$req->setSmsParam($json);
		$req->setRecNum($mob);
		$req->setSmsTemplateCode($dy_mid);
		$resp = $c->execute($req);
		$resp = (array)$resp;
		$result = (array)$resp['result'];
		if($result['success']=='true'){
			S('check'.$mob,1,60);
			S($mob,$code,600);
			return true;
		}else{
			return  $resp['msg'];
		}
	}

	/**
	* 生成静态页面
	* @author nineTea
	* @param undefined $htmlfile
	* @param undefined $htmlpath
	* @param undefined $templateFile
	* 20151215
	*/
	public function siteBuildHtml($htmlfile='',$htmlpath='',$templateFile=''){
		C('TAGLIB_PRE_LOAD','Dux');
        C('TAGLIB_BEGIN','<!--{');
        C('TAGLIB_END','}-->');
		C('VIEW_PATH', './themes/');
		        
		$content    =   $this->fetch($templateFile);
		//模板包含
        if(preg_match_all('/<!--#include\s*file=[\"|\'](.*)[\"|\']-->/', $content, $matches)){
            foreach ($matches[1] as $k => $v) {
                $ext=explode('.', $v);
                $ext=end($ext);
                $file=substr($v, 0, -(strlen($ext)+1));
                $phpText = $this->view->fetch(C('TPL_NAME').'/'.$file);
                $content = str_replace($matches[0][$k], $phpText, $content);
            }
        }
        $htmlpath   =   !empty($htmlpath)?$htmlpath:HTML_PATH;
        $htmlfile   =   $htmlpath.$htmlfile.C('HTML_FILE_SUFFIX');
		$Storage = new \Think\Storage();
        $Storage::put($htmlfile,$content,'html');
        return $content;
	}

	
	//修改文章状态
	 public function set_content_status($aid=0,$status=1){
	 	if($aid){
	 		$re =  M('Content')->where('content_id='.$aid)->save(array('actionstatus'=>$status));
	 		if($re){
	 			$this->curl_get_contents("http://".$_SERVER['HTTP_HOST'].U("Home/Index/index"));
	 			return $re;
	 		}	
	 	}
	    return false;
	 } 
	 

	 public function spiderdiy(){
	 	$bot = false;
		$useragent=addslashes(strtolower($_SERVER['HTTP_USER_AGENT']));
		//dump($useragent );
		if(strpos($useragent,'googlebot')!==false){
			$bot = 'Google';
		}elseif(
		strpos($useragent,'mediapartners-google')!==false){
			$bot='Google Adsense';
		}elseif(strpos($useragent,'baiduspider')!==false){
			$bot='Baidu';
		}elseif(strpos($useragent,'sogou spider')!==false){
			$bot='sogou spider';
		}elseif(strpos($useragent,'sogou web')!==false){
			$bot='sogou web';
		}elseif(strpos($useragent,'sosospider')!==false){
			$bot='sosospider';
		}elseif(strpos($useragent,'360Spider')!==false){
			$bot='360Spider';
		}elseif(strpos($useragent,'yahoo')!==false){
			$bot='yahoo';
		}elseif(strpos($useragent,'msn')!==false){
			$bot='msn';
		}elseif(strpos($useragent,'msnbot')!==false){
			$bot='msnbot';
		}elseif(strpos($useragent,'sohu')!==false){
			$bot='sohu';
		}elseif(strpos($useragent,'yodaoBot')!==false){
			$bot='yodaoBot';
		}elseif(strpos($useragent,'twiceler')!==false){
			$bot='twiceler';
		}elseif(strpos($useragent,'ia_archiver')!==false){
			$bot='ia_archiver';
		}elseif(strpos($useragent,'iaarchiver')!==false){
			$bot='iaarchiver';
		}elseif(strpos($useragent,'slurp')!==false){
			$bot='slurp';
		}elseif(strpos($useragent,'bot')!==false){
			$bot='other bot';
		}	
		return $bot;
		}

	
}