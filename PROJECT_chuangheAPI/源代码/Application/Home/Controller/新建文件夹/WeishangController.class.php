<?php
namespace Home\Controller;
use Home\Controller\SiteController;
/**
*  @author shanmao
 * http://shanmao.me
 * 20151019
 * 厦门景诺网络科技有限公司
 */


class WeishangController extends SiteController {
	
	
	public function __construct() {
		parent::__construct ();
		header ( "Content-Type: text/html; charset=UTF-8" );
		if (! $this->uinfo) {
		if($this->is_weixin()){
				A('Public')->wxlogin();exit;
			}	
		if(!$this->is_weixin()){
			redirect ( U ( 'Home/Public/login' ,array('u'=>$_GET['u'])) );
		}
		}else{
		//	if(strstr($this->uinfo['user_nicename'],'sm') && $this->uinfo['id']>0){
				$this->uinfo = D("Users")->find($this->uinfo['id']);
			//}
		}
		$this->check_is_bind($this->uinfo['id']);
		// parent::__construct();
	}
	
	
	
	public function index(){
		$uid = $this->uinfo['id'];
	
	//	$this->uinfo = D("Users")->find($uid);
	//	$this->setUserinfo('wbfee',$this->uinfo['wbfee']);
		
	
	$data['rwnum'] = M("Content")->where("user_id=".$uid)->count(); 
	$data['fxnum'] =$this->uinfo['wsfxnum'];
	$data['renum'] = $this->uinfo['wsrenum'];
	
	
	
	$this->assign('data',$data);
	$this->assign('info',$this->uinfo);		
	$this->assign('act','weishang');		
	$this->siteDisplay ( 'new_weishang' );
		
	}

		public function index2(){
		$uid = $this->uinfo['id'];
	
	//	$this->uinfo = D("Users")->find($uid);
	//	$this->setUserinfo('wbfee',$this->uinfo['wbfee']);
		
	
	$data['rwnum'] = M("Content")->where("user_id=".$uid)->count(); 
	$data['fxnum'] =$this->uinfo['wsfxnum'];
	$data['renum'] = $this->uinfo['wsrenum'];
	
	
	
	$this->assign('data',$data);
	$this->assign('info',$this->uinfo);		
	$this->assign('act','weishang');		
	$this->siteDisplay ( 'weishangcenter' );
		
	}

	public function chongzhi(){
		$isweixin = $this->is_weixin()?1:0;
		if(C('alipay_config_partner') == "" || C('alipay_config_seller_id') == "" || C('alipay_config_key') == ""){
			$isweixin = 1;
		}
		$w['uid'] =$this->uinfo['id'];
		$w['gowxurl'] =999;
		$openid = M('Wx_openid')->where($w)->getField('openid');
		
		if(!$openid&&$this->is_weixin()){
			$url = 'http://'.C('site_url').U('Home/Public/wxlogin',array('state'=>C('gowxurl').'|chongzhi'));
			redirect($url);
		}
		
		
		$this->assign('isweixin', $isweixin);
		//dump(S("logfee"));
			//dump("http://".$_SERVER['HTTP_HOST'].str_replace('index.php','',$_SERVER['SCRIPT_NAME'])."notify.php");
		$this->siteDisplay ( 'chongzhi' );
	}
	
	public function dopay(){
		$paytype = I("post.type");
		$payid = I("get.payid");
		if($payid){
			$recz = M("chongzhi_log")->where("id=".$payid)->find();
			$paytype = $recz['paytype'];
		}
		
		$w['uid'] =$this->uinfo['id'];
		$w['gowxurl'] =999;
		$openid = M('Wx_openid')->where($w)->getField('openid');
		
		if(!$openid&&$this->is_weixin()){
			$url = 'http://'.C('site_url').U('Home/Public/wxlogin',array('state'=>C('gowxurl').'|chongzhi'));
			redirect($url);
		}
		
		//$openid = $this->uinfo["weixin"];
		$index = I("post.money");
		$fee =$recz["ufee"]?$recz["ufee"]: number_format($index,2);

		if($fee<0.01) $this->error('充值金额不能少于0.01');

		$payfee = $fee;
		$ptfee =0;
		if(C('weisczfee')>0){
			$ptfee = $fee*C('weisczfee')/100;
			$payfee =number_format($fee+ $ptfee,2);
		}
		$datapay['openid']=$openid;
		$datapay['fee']=$payfee;
		$datapay['ufee']=$fee;
		$datapay['ptfee']=$ptfee;
		$out_trade_no = MCHID.date("YmdHis");
		$datapay['out_trade_no']=$out_trade_no;
		$datapay['time']=time();
		$datapay['uid']=$this->uinfo["id"];
		$datapay['paytype']=$paytype;
		if($paytype == 1){
			//wxpay
			require_once ROOT_PATH."WxpayAPI_php_v3/lib/WxPay.Api.php";
			require_once ROOT_PATH."WxpayAPI_php_v3/example/WxPay.JsApiPay.php";
			$tools = new \JsApiPay();
			$input = new \WxPayUnifiedOrder();
			$input->SetBody("系统充值");
			$input->SetAttach("系统充值");
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
			$this->assign("jspay",$jsApiParameters);	
			
			
		}
		if($paytype == 2){
			//zhifubao
			if(!$recz){
				$re = M("chongzhi_log")->add($datapay);
			}else{
				$re = M("chongzhi_log")->where("id=".$recz['id'])->save($datapay);
			}
			
			if(!$re) $this->error("数据写入/更新数据库失败");
			else{
				$re2 = M("chongzhi_log")->where("id=".$re)->find();
				$_POST['WIDout_trade_no'] = $re2['out_trade_no'];
				$_POST['WIDsubject'] = '平台充值';
				$_POST['WIDtotal_fee'] = $payfee;
				$html_text = A('Home/Api')->alipay();
				$this->assign("html_text",$html_text);
			}
			
			
		}
		$this->assign("paytype",$paytype);
		$this->assign("fee",$payfee);
		$this->siteDisplay ( 'dopay' );	
	}
	
	public function chongzhilist(){//充值明细
			$media = $this->getMedia ( '充值明细', '', '', '充值明细', 'ismenu' );
			$this->assign ( 'media', $media );
			$uinfo = $this->uinfo;
			$page = isset($_GET ['p']) ? intval($_GET ['p']) : 1;
			$pagesize =10;
			$User = M ( 'Chongzhi_log' );
			// 实例化User对象
			// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
			$list = $User->where ( 'uid='.$uinfo['id'] )->order ( 'id desc' )->page ( $page . ','.$pagesize )->select ();
	
			$this->assign ( 'list', $list ); 
			// 赋值数据集
			$count = $User->where ( 'uid='.$uinfo['id'] )->count();
			// 查询满足要求的总记录数
			$Page = new \Think\Page($count,$pagesize);
			// 实例化分页类 传入总记录数和每页显示的记录数
			$show = $Page->show();
			
			// 分页显示输出
			$this->assign('page',$show);// 赋值分页输出
			
			
		$this->siteDisplay ( 'chongzhilist' );
		
	}
	
	
	//发布任务
	public function task(){
		//$wbfee = M('Users')->where('id='.$this->uinfo['id'])->getField('wbfee');
		if($this->uinfo['wbfee']<C('min_money')) $this->error('您的微币必须大于'.C('min_money').'微币可发布任务,请先充值！',U('Home/Weishang/chongzhi'));
		if (! IS_POST) {
			$this->assign('categoryList',D('Article/CategoryArticle')->loadList("B.fieldset_id=7"));
			
			$this->assign("time",date('Y/m/d H:i',time()));
			$this->siteDisplay ( 'task' );
		}else {
		    if(!$this->uinfo['id']) $this->error('未登录！');
		    $_POST['content'] = $_POST['content']?$_POST['content']:"无内容";
		   if(trim($_POST['wxurl'])) $re = A("Home/Weixin")->autowxcj($_POST['wxurl']);
		    if(is_array($re)){
		       $_POST['title'] =$_POST['title']?trim($_POST['title']):$re['title'];
		       $_POST['content'] =$re['body'];
		    }		    
		    $_POST['views'] = rand(888, 8888) ;
		    $_POST['user_id'] = $this->uinfo['id'];
		    if(C('set_task')) $_POST['status'] = 0;
		    if($_POST['Fieldset_area']){
		    	$_POST['Fieldset_area'] = str_replace('，',',',$this->trimall($_POST['Fieldset_area']));
		    	$_POST['Fieldset_areayj']  =  $_POST['Fieldset_fxyj'];
		    	$_POST['Fieldset_fxyj'] = 0;
		    }
		    if(floatval($_POST['Fieldset_fxyj'])==0)  $_POST['Fieldset_fxyj'] =-1;
		    if(floatval($_POST['Fieldset_actionyj']) > $this->uinfo['wbfee']) $this->error('您的预算大于您的微币余额，请充值！');
			//$_POST['status'] = 0;
			if(D('Article/ContentArticle')->saveData('add')){
				$image = I("post.image");//"Uploads/attachment/e944358e2db2488fb7b327b5a4062676.jpeg"
				if($image){
					//处理图片
					$image = ROOT_PATH.$image;
					if(file_exists($image)){
						$img =  new \Think\Image();
						$img->open($image)->thumb(640, 120)->save($image);
					}
				}

				$this->success('文章添加成功！',U('Home/Weishang/tasklist'));
			}else{
				$msg = D('Article/ContentArticle')->getError();
				if(empty($msg)){
					
					$this->error('文章添加失败');
				}else{
					$this->error($msg);
				}
			}		
		}
	
	}
	
	/**
	 * 删除
	 */
	public function del(){
		$contentId = I('get.data',0,'intval');
		if(empty($contentId)){
			$this->error('参数不能为空！');
		}
		if(D('Article/ContentArticle')->delData($contentId)){
			$this->success('文章删除成功！');
		}else{
			$this->error('文章删除失败！');
		}
	}
	
	
	//任务列表
	public function tasklist(){
		
		$fieldset = 7;
		$class_ids = M('Category_article') -> where('fieldset_id = '.$fieldset) ->getField('class_id',true);
		
		$class_ids = count($class_ids)>1?implode(',', $class_ids):$class_ids[0];
		
		$where =array();
		if($class_ids) $where['A.class_id'] = array('in',$class_ids);

		$where['A.user_id'] =$this->uinfo['id'];
		
		$count = D('Article/ContentArticle')->countList($where);
		$limit = $this->getPageLimit($count,5);
		$list = D('Article/ContentArticle')->loadList($where,$limit);
		$page = $this->getPageShow();
       
		$this->assign("index_money",C('index_money'));
		$this->assign("cat_money",C('cat_money'));
		$this->assign("list",$list);
		$this->assign("page",$page);
		
		$this->siteDisplay ( 'tasklist' );
	}
	
	public function task_save(){
		$status = isset($_GET['status'])?intval($_GET['status']): 0 ;
		$id = isset($_GET['content_id'])?intval($_GET['content_id']): 0 ;
	    $user_id =$this->uinfo;
	    if(!$user_id||!$id) $this->error('操作失败');
	    
	    if($status==0){
	    	//$wbfee = M('Users')->where('id='.$this->uinfo['id'])->getField('wbfee');
	    	if($this->uinfo['wbfee']<=0) $this->error('您的微币余额不足,请充值！',U('Home/Weishang/chongzhi'));
	    } 
	     $re =$this->set_content_status($id,$status);
	     //$re =  M('Content')->where('content_id='.$id)->save(array('actionstatus'=>$status));
	     
	    if($re){
	    	$this->success('操作成功！');
	    }
	}
	//支出明细
	public function zclist($type=''){	
		$media = $this->getMedia ( '支出明细', '', '', '支出明细', 'ismenu' );
		if(!$this->uinfo['id']) $this->error('未登录');
		$where['A.uid'] =$this->uinfo['id'];
		$where['A.type'] = array('in','10,11,12,13,14,15');
		
		$count = D('Admin/WeishangLog')->countList($where);
		
		$limit = $this->getPageLimit($count,10);
		//dump($limit);
		
		$list = D('Admin/WeishangLog')->loadList($where,$limit);
		
		$page = $this->getPageShow();
		$this->assign("media",$media);
		$this->assign("list",$list);
		$this->assign("page",$page);
		$this->siteDisplay ( 'zclist' );
	}
	
	//文章置顶操作
	public function zd_operation(){
		$pos_id = isset($_GET['pos_id'])?intval($_GET['pos_id']): 1 ;
		$content_id = isset($_GET['content_id'])?intval($_GET['content_id']): 0 ; 
		
		if(!$this->uinfo['id']||!$pos_id||!$content_id) $this->error('未登录');
		$zd_data = M('Content')->field('title,position,user_id,index_time,cat_time')->where("content_id='$content_id'")->find();
		
		if($zd_data['user_id']){
			
			$p_time = $pos_id==1?'index_time':'cat_time';
			$fee = $pos_id==1?C('index_money'):C('cat_money');
		   	if($index_pos=$this->duibi_time($pos_id,$p_time,$zd_data[$p_time])){
		   		
		   		$desc ="文章<".$zd_data['title'].">置顶成功";
		   	    $re = $this->changewbmoney((-1)*$fee,$type='10',$desc,$zd_data['user_id'],$content_id,1);
		   	    if($re){
		   	    	$data[$p_time] =time();
		   	    	if($zd_data['position']){
		   	    		$position = explode(',', $zd_data['position']);
		   	    		if(!in_array($index_pos, $position)){
		   	    			$position[]=$index_pos;
		   	    			$data['position'] = implode(',', $position);
		   	    		}
		   	    	}else{
		   	    		$data['position'] =$index_pos;
		   	    	}
		   	    	$res = M('Content')->where("content_id='$content_id'")->save($data);
		   	        if($res){
		   	        	$this->curl_get_contents("http://".$_SERVER['HTTP_HOST'].U("Home/Index/index"));
		   	        	$this->success('置顶成功！');
		   	        }
		   	        $this->error('操作失败！');
		   	    }
		   	    
		   	}
 
		}

		$this->error('操作失败！');
	}
	
	//修改任务
	public function update_task(){
		 if(!IS_POST){
		 	$content_id =I('get.content_id',0,'intval');
	     	if(!$content_id)  $this->error('此文章不存在！');
		 	$re = M("Content")->table("__CONTENT__ as A")->join('__EXT_GZH__ AS B ON A.content_id = B.data_id')->field('A.*,B.*')->where(" A.content_id ='$content_id'")->find();
		 	$this->assign('categoryList',D('Article/CategoryArticle')->loadList("B.fieldset_id=7"));
		 	$this->assign("time",time());
		 	$this->assign("info",$re);
		 	$this->siteDisplay ( 'edittask' );
	     }else{
	     	if($_POST['Fieldset_area']){
	     		$_POST['Fieldset_area'] = str_replace('，',',',$this->trimall($_POST['Fieldset_area']));
	     		$_POST['Fieldset_areayj']  =  $_POST['Fieldset_fxyj'];
	     		$_POST['Fieldset_fxyj'] = 0;
	     	}
	     	if(floatval($_POST['Fieldset_fxyj'])==0)  $_POST['Fieldset_fxyj'] =-1;
	     	if(floatval($_POST['Fieldset_actionyj']) > $this->uinfo['wbfee']) $this->error('您的预算大于您的微币余额，请充值！');
	     	if(D('Article/ContentArticle')->saveData('edit')){
	     		$this->success('修改成功！',U('tasklist'));
	     	}else{
	     		$msg = D('Article/ContentArticle')->getError();
	     		if(empty($msg)){
	     				
	     			$this->error('修改失败');
	     		}else{
	     			$this->error($msg);
	     		}
	     	}
	     }
	}
	
	
	
	public function duibi_time($pos_id,$p_time='index_time',$index_time=0){
		
		$c_zb_time =3600*C("zd_time") ;
		$index_pos = $this->find_positionId($pos_id);
		if($p_time){
		
			//$index_time	=  M('Content')->order($p_time.'desc')->getField($p_time);
			
			if(time()<$index_time+$c_zb_time){
				
				$desc	=  $this->format_date($index_time+$c_zb_time);
				$this->error($desc.'再操作');
			}
			
			return $index_pos;
		}
		
		return false;
	}
	
	
	public function zwb(){
		if(IS_POST){
			$money = I("post.money");
			if($money>$this->uinfo["money"]) $this->error("余额不足与兑换。");
			//$re = M("Users")->where("id=".$this->uinfo['id'])->setInc("money",(-1)*$money);
			$this->changemoney((-1)*$money,7,$desc='余额转微币,微币不可提现。',$this->uinfo['id'],1);
			  M("Users")->where("id=".$this->uinfo['id'])->setInc("wbfee",$money);
			//dump($_POST);
			$this->success("转换成功！",U("Home/Weishang/index"));
			exit;
		}
		$this->assign("money",$this->uinfo['money']);
		$this->siteDisplay ( 'moneyzhuanweibi' );
	}
	
  public	function trimall($str)//删除空格
	{
		$qian=array(" ","　","\t","\n","\r");$hou=array("","","","","");
		return str_replace($qian,$hou,$str);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
?>