<?php

namespace Home\Controller;

use Home\Controller\SiteController;
/**
*  @author shanmao
 * http://shanmao.me
 * 2015
 * 厦门景诺网络科技有限公司  jnooo.cn
 */
class UserController extends SiteController {
	public function __construct() {
		parent::__construct ();
		if (! $this->uinfo) {
		//A('Public')->dowxlogin();
		if($this->is_weixin()){

				A('Public')->wxlogin();
		}
		if(!$this->is_weixin()){
			redirect ( U ( 'Home/Public/login' ,array('u'=>$_GET['u'])) );
		}
		}else{
			if(strstr($this->uinfo['user_nicename'],'sm') && $this->uinfo['id']>0){
				$this->uinfo = D("Users")->find($this->uinfo['id']);
			}
		}
		$this->check_is_bind($this->uinfo['id']);

		// parent::__construct();
	}
	
	//已领任务
	public function index_user(){
		$where['A.status'] = 1;
		$where['B.status'] = 1;
		$where['B.uid'] = $this->uinfo['id'];
		if (C('set_task_hide')) $where['actionstatus'] = 0;
		$User = M('Content'); // 实例化User对象
		$count      = $User->table('__CONTENT__ AS A')->join('__CONTENT_F_LOG__ AS B ON A.content_id = B.aid')->where($where)->count();// 查询满足要求的总记录数
		$Page       = new \Think\Page($count,20);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show       = $Page->show();// 分页显示输出// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $User->table('__CONTENT__ AS A')->join('__CONTENT_F_LOG__ AS B ON A.content_id = B.aid')->field('A.*')->where($where)->order('A.actionstatus,A.sequence,A.content_id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		 
		foreach($list as $key=>$val){
			$categoryInfo=D('Article/CategoryArticle')->getInfo($val['class_id']);
			if($categoryInfo['show']==0) unset($list[$key]);
			if(!empty($list) && $categoryInfo['fieldset_id']>0){
				$kztable  = D("DuxCms/Fieldset")->getInfo($categoryInfo['fieldset_id']);
				if($kztable['table']){
					$mod1 = D("DuxCms/FieldData");
					$mod1->setTable($kztable['table']);
		
					$kzinfo = $mod1->getInfo($val['content_id']);
					if(is_array($kzinfo))
						$list[$key] = array_merge($val,$kzinfo);
				}
			}
			$list[$key]['aurl']=U("Article/Content/index",array("content_id"=>$val[content_id],"uid"=>$this->uinfo['id'],"time"=>time(),"fxapi2"=>1));
		}

		if(I("get.ajax")==1) $this->ajaxReturn($list);
		$this->assign('list1',$list);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出
		//dump($list);
		$media = $this->getMedia ( '已领任务', '', '', '已领任务', 'ismenu' );
		$this->assign ( 'media', $media );
		$this->assign('act','index3');
		$this->assign('css_path','themes/shanmao_me_new_app/');
		
		$this->siteDisplay('index_user');
		
		
		
	}
	
	
	
	
	
	public function yaoqing(){//邀请
		
		if($_GET['fx']==1 && $this->uinfo['subscribe']==0 && $this->uinfo['id']){
			//redirect(C('subscribeurl'));
			//exit;
		}
		
		A("Api")->yqapi();
		
		
		
		$media = $this->getMedia ( '邀请好友', '', '', '邀请好友', 'ismenu' );
		$this->assign ( 'media', $media );
		
		$uname = $this->uinfo['user_nicename'];
		if(strstr($uname,'sm')){
			$yqname = '';
		}else{
			$yqname= '我是'.$uname.",";
		}
		
		if(!$_GET['u']&& $this->uinfo['id']){
			redirect(U("Home/User/yaoqing",array("u"=>$this->uinfo['id'],"fx"=>1)));
			exit;
		}
		
		$this->assign("siteurl","http://".$_SERVER['HTTP_HOST']."/");
		$this->assign("uid",$this->uinfo['id']);
		$this->assign("yqname",$yqname);
		$this->assign("type",I('get.type'));
		$this->siteDisplay ( 'yaoqing' );
		
	}
	
	public function yaoqinglist(){//邀请
		$media = $this->getMedia ( '我的邀请列表', '', '', '我的邀请列表', 'ismenu' );
		$this->assign ( 'media', $media );
			$uinfo = $this->uinfo;
			$page = isset($_GET ['p']) ? intval($_GET ['p']) : 1;
			$pagesize =10;
			// $re = M ( 'Users' )->where ( "user_login='{$arr["user_login"]}'" )->find ();
			$User = M ( 'Users' );
			// 实例化User对象
			// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
			$list = $User->where ( 'parent_id='.$uinfo['id'] )->order ( 'create_time desc' )->page ( $page . ','.$pagesize )->select ();
	
			$this->assign ( 'list', $list ); 
			// 赋值数据集
			$count = $User->where ( 'parent_id='.$uinfo['id'] )->count();
			// 查询满足要求的总记录数
			$Page = new \Think\Page($count,$pagesize);
			// 实例化分页类 传入总记录数和每页显示的记录数
			$show = $Page->show();
			
			// 分页显示输出
			$this->assign('page',$show);// 赋值分页输出
			
			
		$this->siteDisplay ( 'yaoqinglist' );
		
	}
	
	public function index() {
		
		//import("Home.Util.Hongbao");	
		
			
		
		//echo $this->sendhb();
		$this->index2();
		exit;
		$uinfo = $this->uinfo;
		$media = $this->getMedia ( '用户中心', '', '', '用户中心', 'ismenu' );
		$this->assign ( 'usinfo', M("Users")->find($this->uinfo['id']) );
		$this->assign ( 'media', $media );
		$this->siteDisplay ( 'user' );
	}
	
	/**
	 * 个人资料
	 * 
	 * @author chen
	 * @since 2015-3-23
	 */
	public function profile() {
		header ( "Content-Type: text/html; charset=UTF-8" );
		$media = $this->getMedia ( '个人资料', '', '', '用户中心', 'ispro' );
		if ($this->uinfo) {
			$uinfo = $this->uinfo;
			
			/*
			if ($uinfo ["user_proid"]) {
				
				$uprovince = M ( 'area' )->where ( "areaid={$uinfo["user_proid"]}" )->find ();
				$ucity = M ( 'area' )->where ( "areaid={$uinfo["user_cityid"]}" )->find ();
				
				$this->assign ( 'uprovince', $uprovince );
				$this->assign ( 'ucity', $ucity );
			}
			$province = M ( 'area' )->where ( "rootid=0" )->select ();
			$this->assign ( 'media', $media );
			$this->assign ( 'province', $province );
			*/
			$this->assign ( 'media', $media );
			$this->siteDisplay ( 'profile' );
		}
	}
	
	public function editprofile(){
		if($_POST){
			$data['user_nicename']=I("post.user_nicename");
			$pass = I("post.pass");
			if($pass){
				//$this->error("修改密码功能开发中");
				$uinfo = $this->uinfo;
				if ($uinfo) {
					$username = $uinfo ['user_login'];
					$re = M ( 'users' )->where ( "user_login='$username'" )->find ();
					$data ['user_pass'] = md5 ( $re ["user_login"] . $pass . C ( 'PWD_SALA' ) );
				}

			}
			//$data['user_tel']=I("post.user_tel");
			//if(M("Users")->where("user_tel=".$data['user_tel'])->find()) $this->error("您输入的手机号已存在！");
			//if(!$this->isTel($data['user_tel'])) $this->error("请填写正确手机号！");
			$id = $this->uinfo['id'];
			$tel_address = $this->get_address($data['user_tel']);
			if($tel_address){
				$data ['b_pro'] = $tel_address['b_pro'];
				$data ['b_city'] = $tel_address['b_city'];
				$data ['b_fws'] = $tel_address['b_fws'];
			}
			
			$re = M('Users')->where("id = ".$id)->save($data);
			
			
			if($re){
				$this->setUserinfo('user_nicename',$data['user_nicename']);
				$this->setUserinfo('b_pro',$data['b_pro']);
				$this->setUserinfo('b_city',$data['b_city']);
				//$this->setUserinfo('user_tel',$data['user_tel']);
				$this->success("修改成功！",U("Home/User/index"));
			}else{
				$this->error("修改失败");
			}
		}
	}
	
	
	
	
	/**
	 * 密码修改
	 * 
	 * @author chen
	 * @since 2015-3-23
	 */
	public function password() {
		if (! IS_POST) {
			$uinfo = $this->uinfo;
			$media = $this->getMedia ( '密码修改', '', '', '用户中心', 'ispwd' );
			$this->assign ( 'media', $media );
			$this->siteDisplay ( 'password' );
		} else {
			$arr = I ( 'post.arr' );
			$data = array ();
			$opwd = trim ( $arr ["opwd"] );
			$npwd = trim ( $arr ["npwd"] );
			$npwd2 = trim ( $arr ["npwd2"] );
			if (empty ( $opwd ) || empty ( $npwd ) || empty ( $npwd2 ))
				$this->error ( "请输入密码!" );
			if ($arr ["npwd"] != $arr ["npwd2"])
				$this->error ( "新密码输入不一致!" );
			$uinfo = $this->uinfo;
			if ($uinfo) {
				$username = $uinfo ['user_login'];
				$re = M ( 'users' )->where ( "user_login='$username'" )->find ();
				if ($re ['user_pass'] != md5 ( $username . $arr ["opwd"] . C ( 'PWD_SALA' ) ))
					$this->error ( "密码错误!" );
				$data ['user_pass'] = md5 ( $re ["user_login"] . $arr ["npwd"] . C ( 'PWD_SALA' ) );
				M ( "User" )->where ( "id=" . $re ["id"] )->save ( $data );
				$this->success ( "修改成功" );
			}
		}
	}
	
	
	
	
	
	/**
	 * 子会员管理
	 * 
	 * @author chen
	 * @since 2015-3-23
	 */
	public function personal() {
		if (! IS_POST) {
			$media = $this->getMedia ( '子会员管理', '', '', '用户中心', 'isper' );
			$uinfo = $this->uinfo;
			$page = isset($_GET ['p']) ? intval($_GET ['p']) : 1;
			$pagesize =2;
			// $re = M ( 'Users' )->where ( "user_login='{$arr["user_login"]}'" )->find ();
			$User = M ( 'Users' );
			// 实例化User对象
			// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
			$list = $User->where ( 'parent_id='.$uinfo['id'] )->order ( 'create_time' )->page ( $page . ','.$pagesize )->select ();
		
			$this->assign ( 'list', $list ); 
			// 赋值数据集
			$count = $User->where ( 'parent_id='.$uinfo['id'] )->count();
			// 查询满足要求的总记录数
			$Page = new \Think\Page($count,$pagesize);
			// 实例化分页类 传入总记录数和每页显示的记录数
			$show = $Page->show();
			// 分页显示输出
			$this->assign('page',$show);// 赋值分页输出
			$this->assign ( 'media', $media );

			$this->siteDisplay ( 'personal' );
		} else {
			$arr = I ( 'post.arr' );
			if (! trim ( $arr ['user_login'] ) || ! trim ( $arr ['user_pass'] ))
				$this->error ( '用户和密码不能为空' );
			if (! $this->isEmail ( $arr ["user_email"] ))
				$this->error ( '账号必须为邮箱！' );
			if (! $this->isTel ( $arr ["user_tel"] ))
				$this->error ( '请输入正确手机号！' );
			$re = M ( 'Users' )->where ( "user_login='{$arr["user_login"]}'" )->find ();
			if ($re) {
				$this->error ( '该账号已注册' );
			}
			$arr ['last_login_ip'] = get_client_ip ();
			$arr ['create_time'] = time ();
			$pwd = $arr ['user_pass'];
			// $arr ['last_login_time'] = time ();
			$arr ['user_pass'] = md5 ( $arr ["user_login"] . $arr ["user_pass"] . C ( 'PWD_SALA' ) );
			$arr ['user_status'] = 2; // 等待验证
			
			$res = M ( 'users' )->add ( $arr );
			if ($res) {
				$this->success ( "添加成功！" );
			}
		}
	}
	
	
	/**
	 * 子会员详情
	 *
	 * @author chen
	 * @since 2015-3-23
	 */
	public function detail() {
			$id = I ( 'get.id' );
			if(!$id) $this->error('无参');
			$media = $this->getMedia ( '子会员管理', '', '', '用户中心', 'isper' );
			$data = M ( 'Users' )->where ( "id=$id" )->find ();
			
			$this->assign ( 'media', $media );
			$this->assign ( 'data', $data );
			$this->siteDisplay ( 'detail' );

	}
	
	
	
	
	public function jifenlist(){
			$media = $this->getMedia ( '积分变动明细', '', '', '积分变动明细', 'ismenu' );
		$this->assign ( 'media', $media );
			$uinfo = $this->uinfo;
			$page = isset($_GET ['p']) ? intval($_GET ['p']) : 1;
			$pagesize =10;
			$User = M ( 'Account_log' );
			// 实例化User对象
			// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
			$list = $User->where ( 'uid='.$uinfo['id'].' and jifen<>0' )->order ( 'id desc' )->page ( $page . ','.$pagesize )->select ();
	
			$this->assign ( 'list', $list ); 
			// 赋值数据集
			$count = $User->where ( 'uid='.$uinfo['id'].' and jifen<>0' )->count();
			// 查询满足要求的总记录数
			$Page = new \Think\Page($count,$pagesize);
			// 实例化分页类 传入总记录数和每页显示的记录数
			$show = $Page->show();
			
			// 分页显示输出
			$this->assign('page',$show);// 赋值分页输出
			
			
		$this->siteDisplay ( 'jifenlist' );
		
	}
	
	public function moneylist(){
			$media = $this->getMedia ( '奖金变动明细', '', '', '奖金变动明细', 'ismenu' );
		$this->assign ( 'media', $media );
			$uinfo = $this->uinfo;
			$page = isset($_GET ['p']) ? intval($_GET ['p']) : 1;
			$pagesize =10;
			$User = M ( 'Account_log' );
			// 实例化User对象
			// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
			$list = $User->where ( 'uid='.$uinfo['id'].' and money<>0 ' )->order ( 'id desc' )->page ( $page . ','.$pagesize )->select ();
	
			$this->assign ( 'list', $list ); 
			// 赋值数据集
			$count = $User->where ( 'uid='.$uinfo['id'].' and money<>0 ' )->count();
			// 查询满足要求的总记录数
			$Page = new \Think\Page($count,$pagesize);
			// 实例化分页类 传入总记录数和每页显示的记录数
			$show = $Page->show();
			
			// 分页显示输出
			$this->assign('page',$show);// 赋值分页输出
			
			
		$this->siteDisplay ( 'jifenlist' );
		
	}

	public function tixian(){
	    $w['uid'] =$this->uinfo['id'];
	    $w['gowxurl'] =999;
		$openid = M('Wx_openid')->where($w)->getField('openid');
		
		if(!$openid&&$this->is_weixin()){
			$url = 'http://'.C('site_url').U('Home/Public/wxlogin',array('state'=>C('gowxurl').'|tixian'));
			redirect($url);
		}
	
		$media = $this->getMedia ( '提现申请', '', '', '提现申请', 'ismenu' );
	
		if(C('wxtxxz')>0 && M("moeny_log")->where("uid=".$this->uinfo["id"]." and status=1")->find()){
			$wxtx = C('wxtxxz');
			
		} else {
			$wxtx = C('wxtx');
		}
		$this->assign('wxtx', $wxtx);
		$this->assign ( 'media', $media );
		$this->assign ( 'usinfo', M("Users")->find($this->uinfo['id']) );
		$this->siteDisplay ( 'tixian' );
	}
	
	public function wxtixian(){
		$money = I("post.money");
		$id = $this->uinfo['id'];
		$weixin = M('Users')->where('id='.$id)->getField('weixin');
		if(!$weixin){
			$this->ajaxReturn(array('msg'=>'您未关注公众号！请用支付宝提现'));
			exit;
		}
		$weixin = D('Home/Users')->getWxOpenid($id,$weixin);
		$z_weixin = D('Home/Users')->get_z_openid($id,$weixin);
	
		$msg = A("Api")->tixian($z_weixin, $money);
		if($msg) {
			A("Weixin")->makeTextbygm($msg,$weixin);
		}
		$this->ajaxReturn(array('msg'=>$msg));
	}
	
	
	public function mymoney(){//我的钱包2015 09 02
	$uid = $this->uinfo['id'];
	
	if($this->uinfo){
		$this->check_is_bind($this->uinfo['id']);
	}
		$myfensi = D("Users")->myfens($uid);
		$sjcachetime = C('sjcachetime');
		$sjcachetime = $sjcachetime?$sjcachetime:60;
		//$data['renwumoney'] = M("account_log")->cache(true,$sjcachetime)->where("type IN (4,5) and uid =".$uid)->sum('money');
		$data['renwumoney'] = M("Users")->where("id=".$uid)->getField('taskmoney');
		//$fenxmoney = M("account_log")->where("type=5 and uid=".$uid)->sum('money');
		//$data['renwumoney']=$jifenmoney+$fenxmoney;
		$data['money']=D("Users")->idreinfo($uid,'money');
		$data['fansnum']=$myfensi;
		//$data['fansmoney']=M("account_log")->where("type=8 and uid=".$uid)->sum('money');
		$data['fansmoney']=M("Users")->where("id=".$uid)->getField('fansmoney');
		$data['historymoney']=M("Users")->where("id=".$uid)->getField('historymoney');
		
		$this->assign('info',$data);
		$this->assign('act','mymoney');
		$this->assign('wxtx', C('wxtx'));
		$this->assign('zfbtx', C("txqi"));
		$this->siteDisplay ( 'mymoney' );
	}
	
	
	public function tixianlist(){
			$media = $this->getMedia ( '提现列表', '', '', '提现列表明细', 'ismenu' );
		$this->assign ( 'media', $media );
			$uinfo = $this->uinfo;
			$page = isset($_GET ['p']) ? intval($_GET ['p']) : 1;
			$pagesize =10;
			$User = M ( 'moeny_log' );
			// 实例化User对象
			// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
			$list = $User->where ( 'uid='.$uinfo['id'].' and type=4' )->order ( 'id desc' )->page ( $page . ','.$pagesize )->select ();
	
			$this->assign ( 'list', $list ); 
			// 赋值数据集
			$count = $User->where ( 'uid='.$uinfo['id'].' and type=4' )->count();
			// 查询满足要求的总记录数
			$Page = new \Think\Page($count,$pagesize);
			// 实例化分页类 传入总记录数和每页显示的记录数
			$show = $Page->show();
			
			// 分页显示输出
			$this->assign('page',$show);// 赋值分页输出
			
			
		$this->siteDisplay ( 'tixianlist' );
	}
	
	
	public function index2(){
		$uid = $this->uinfo['id'];
		if($this->uinfo){
			$this->check_is_bind($this->uinfo['id']);
		}
	
		$this->assign('act','index2');
		$this->assign('is_noob', C('is_noob'));
		$this->assign ( 'usinfo', M("Users")->find($this->uinfo['id']) );
		$this->siteDisplay ( 'user' );
	}
	
	public function ajaxqiandao(){
		echo A("Api")->qiandao('',$this->uinfo['id']);
	}
	
	//购买vip
	public function buy_vip(){
		$list = S('user_rank');
		$user_rank = $this->uinfo['user_rank'];
		if($list){
			//只显示比当前vip等级高的
			for($i=1; $i<=$user_rank; $i++){
				unset($list[$i]);
			}
			$this->assign('list',$list);
			$this->siteDisplay ( 'buy_vip' );
		}else
			$this->error('无会员等级或会员模块未开启',U('index'));
	}
	
	
	public function dopay(){
	
		$payid = I("get.payid");
		if($payid){
			$recz = M("chongzhi_log")->where("id=".$payid)->find();
		}
	
		$openid = $this->uinfo["weixin"];
		$fee =$recz["ufee"]?$recz["ufee"]: I("post.money");
		$payfee = $fee;
		$ptfee =0;
		require_once ROOT_PATH."WxpayAPI_php_v3/lib/WxPay.Api.php";
		require_once ROOT_PATH."WxpayAPI_php_v3/example/WxPay.JsApiPay.php";
		$tools = new \JsApiPay();
		$input = new \WxPayUnifiedOrder();
		$input->SetBody("系统充值");
		$input->SetAttach("系统充值");
		$out_trade_no = MCHID.date("YmdHis");
		$input->SetOut_trade_no($out_trade_no);
		$input->SetTotal_fee("".$payfee*100);
		$input->SetTime_start(date("YmdHis"));
		$input->SetTime_expire(date("YmdHis", time() + 3600));
		$input->SetGoods_tag("test");
		$input->SetNotify_url("http://".$_SERVER['HTTP_HOST'].str_replace('index.php','',$_SERVER['SCRIPT_NAME'])."notify.php");
		$input->SetTrade_type("JSAPI");
		$input->SetOpenid($openid);
		$order = \WxPayApi::unifiedOrder($input);
	
		$datapay['nonce_str']=$input->values['nonce_str'];
		$datapay['openid']=$openid;
		$datapay['fee']=$payfee;
		$datapay['ufee']=$fee;
		$datapay['ptfee']=$ptfee;
		$datapay['out_trade_no']=$out_trade_no;
		$datapay['time']=time();
		$datapay['uid']=$this->uinfo["id"];
		$datapay['user_rank']=I("post.user_rank");
	
		if(!$recz){
			$re = M("chongzhi_log")->add($datapay);
		}else{
			$re = M("chongzhi_log")->where("id=".$recz['id'])->save($datapay);
		}
	
		///echo M()->getLastSql();
		//exit;
		if(!$re) $this->error("数据写入/更新数据库失败");
	
		$jsApiParameters = $tools->GetJsApiParameters($order);
		//dump($jsApiParameters);
		$this->assign("fee",$payfee);
		$this->assign("jspay",$jsApiParameters);
		$this->siteDisplay ( 'vip_dopay' );
	}
	/**
	* 新手教程
	* @author nineTea
	* 20151216
	*/
	public function noob(){
		$media = $this->getMedia ( '新手教程', '', '', '用户中心', 'ispro' );
		//查找栏目为  新手教程
		$cid = M("Category")->where("name='新手教程'")->getField("class_id");
		//根据class_id查找文章
		$count = M('Content')->where("class_id='".$cid."'")->count();//查询满足条件的总记录数
		$Page = new \Think\Page($count, 5);//实例化分页类，传入总记录数
		$nowPage = I("get.p")?I("get.p"):1;
		
		$row = M("Content")->where("class_id='".$cid."'")->order("time desc")->page($nowPage.','.$Page->listRows)->select();
		$show = $Page->show();//分页显示输出
		
		$lists = $row;
		foreach($row as $key=>$value){
			//获取文章内容
			$re = M('Content_article')->where("content_id='".$value['content_id']."'")->find();
			$lists[$key]['content'] = html_out($re['content']);
		}
		
		$this->assign('media', $media);
		$this->assign('page', $show);
		$this->assign("lists", $lists);
		$this->siteDisplay("noob");
	}
	
	/**
	* 提现排行榜
	* @author nineTea
	* @param undefined $type 1周排行2月排行3总排行
	* 20151222
	*/
	public function txtop($type=1){
		//1周排行2月排行3总排行
		$now = time();
		$where = "";
		switch($type){
			case 1:
				$title = "本周排行";
				$where = " AND (YEAR(FROM_UNIXTIME(time,'%Y-%m-%d')) = YEAR(FROM_UNIXTIME(".$now.",'%Y-%m-%d'))) 
						AND (WEEKOFYEAR(FROM_UNIXTIME(time,'%Y-%m-%d')) = WEEKOFYEAR(FROM_UNIXTIME(".$now.",'%Y-%m-%d')))";
				break;
			case 2:
				$title = "本月排行";
				$where = " AND (MONTH(FROM_UNIXTIME(time,'%Y-%m-%d')) = MONTH(FROM_UNIXTIME(".$now.",'%Y-%m-%d')))";
				break;
			case 3:
				$title = "总排行";
		}
		$media = $this->getMedia("提现排行榜", '', '', '用户中心', 'ispro');
		//统计提现排行
		$lists = M()->cache(true,300)->query("SELECT u.id, user_nicename, sum(fee) AS top FROM dux_users u LEFT JOIN dux_moeny_log ml ON u.id=ml.uid WHERE ml.status=1 ".$where." GROUP BY u.id ORDER BY top DESC,u.id ASC LIMIT 0,10");

		//dump($lists);exit;
		$this->assign("title", $title);
		$this->assign("lists", $lists);
		$this->assign('media', $media);
		$this->siteDisplay("tixian_paihang");
	}
	
}