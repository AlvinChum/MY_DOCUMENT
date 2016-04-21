<?php
namespace Home\Controller;
use Home\Controller\SiteController;
/**
*  @author shanmao
 * http://shanmao.me
 * 20151019
 * 厦门景诺网络科技有限公司
 */


class OrderController extends SiteController {
	
	
	public function __construct() {
		parent::__construct ();
		header ( "Content-Type: text/html; charset=UTF-8" );
		if (! $this->uinfo) {
			if($this->is_weixin()){
				A('Public')->wxlogin();
			}
		//A('Public')->dowxlogin();
		if(!$this->is_weixin()){
			redirect ( U ( 'Home/Public/login' ,array('u'=>$_GET['u'])) );
		}
		}else{
		//	if(strstr($this->uinfo['user_nicename'],'sm') && $this->uinfo['id']>0){
				$this->uinfo = D("Users")->find($this->uinfo['id']);
			//}
		}
		
		// parent::__construct();
	}
	
	
	
	public function index(){
		
	$this->assign('act','order');		
	$this->siteDisplay ( 'orderCenter' );
		
	}

	
	//发布任务
	public function add(){
		//$wbfee = M('Users')->where('id='.$this->uinfo['id'])->getField('wbfee');
		if($this->uinfo['wbfee']<C('min_money')) $this->error('您的微币必须大于'.C('min_money').'微币可发布任务,请先充值！',U('Home/Weishang/chongzhi'));
		if (! IS_POST) {
			$fieldid  = $this ->getfield_id('w_order');		
			$this->assign('categoryList',D('Article/CategoryArticle')->loadList("B.fieldset_id=".$fieldid));
			$re = M('Field')->where('fieldset_id='.$fieldid.' and field="field"')->find();
			if($re){
			  $config  = explode(',', $re['config']);
			  $default = explode(',', $re['default']);
			  $this->assign('config',$config);
			  $this->assign('default',$default);
			}
			$this->siteDisplay ( 'addorder' );
		} else {
		    if(!$this->uinfo['id']) $this->error('未登录！');
		    $_POST['content'] = $_POST['content']?$_POST['content']:"无内容";
		   if(trim($_POST['wxurl'])) $re = A("Home/Weixin")->autowxcj($_POST['wxurl']);
		    if(is_array($re)){
		       $_POST['title'] =$_POST['title']?trim($_POST['title']):$re['title'];
		       $_POST['content'] =$re['body'];
		    }	
			$_POST['btitle'] =$_POST['btitle']?trim($_POST['btitle']):"微意向";	    
		    $_POST['views'] = rand(888, 8888) ;
		    $_POST['time'] = date('y-m-d H:i:s',time()) ;
		    $_POST['user_id'] = $this->uinfo['id'];

		    if(C('set_task')) $_POST['status'] = 0;

		    if(floatval($_POST['Fieldset_ys_fee']) > $this->uinfo['wbfee']) $this->error('您的微币余额不足:'.floatval($_POST['Fieldset_ys_fee']).'，请先充值！','',5);
		    if(floatval($_POST['Fieldset_yx_fee']) > floatval($_POST['Fieldset_ys_fee'])) $this->error('您的总预算必须大于您的单价！','',5);
			//$_POST['status'] = 0;
			if(D('Article/ContentArticle')->saveData('add')){
			   
				$this->success('任务添加成功！',U('orderlist'));
			}else{
				$msg = D('Article/ContentArticle')->getError();
				if(empty($msg)){
					
					$this->error('任务添加失败');
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
			$this->success('删除成功！');
		}else{
			$this->error('删除失败！');
		}
	}
	
	
	/**
	 * 删除
	 */
	public function del_cart(){
		$contentId = I('get.data_id',0,'intval');
		if(empty($contentId)){
			$this->error('参数不能为空！');
		}
		if(M('Ext_w_order_list')->delete($contentId)){
			$this->success('删除成功！');
		}else{
			$this->error('删除失败！');
		}
	}
	
	
	//任务列表
	public function orderlist(){
		
		$fieldset = $this ->getfield_id('w_order');
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
		
		$this->siteDisplay ( 'orderlist' );
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
	    $re =  $this->set_content_status($id,$status);
	   //  $re =  M('Content')->where('content_id='.$id)->save(array('actionstatus'=>$status));
	    if($re){
	    	$this->success('操作成功！');
	    }
	}
	
	//表单列表
	public function cartlist(){
		$where['fb_uid'] = $this->uinfo['id'];
		$aid = I('get.aid',0,'intval');
		$where['aid'] = $aid?$aid:$this->error('参数错误');
		$User = M('Ext_w_order_list'); // 实例化User对象
		$count      = $User->where($where)->count();// 查询满足要求的总记录数
		$Page       = new \Think\Page($count,20);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show       = $Page->show();// 分页显示输出// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $User->where($where)->order('addtime desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		
		if($list){
			foreach ($list as $k=>$v){
				$list[$k]['info'] = D('DuxCms/FieldData')->unser($v['info']);
			}
		}
		
		$this->assign("list",$list);
		$this->assign("page",$show);	
		$this->siteDisplay ( 'cartlist' );
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
		 	$re = M("Content")->table("__CONTENT__ as A")->join('__EXT_W_ORDER__ AS B ON A.content_id = B.data_id')->field('A.*,B.*')->where(" A.content_id ='$content_id'")->find();
		 	$where['table'] ='w_order';
		 	$fieldid = M('Fieldset')->where($where)->getField('fieldset_id');
		 	$this->assign('categoryList',D('Article/CategoryArticle')->loadList("B.fieldset_id=".$fieldid));
		 	
		 	$res = M('Field')->where('fieldset_id='.$fieldid.' and field="field"')->find();
		 	if($res){
		 		$config  = explode(',', $res['config']);
		 		$re['field'] =explode(',', $re['field']);
		 		$this->assign('config',$config);
		 		
		 	}
		 
		 	$this->assign("time",time());
		 	$this->assign("info",$re);
		 	$this->siteDisplay ( 'editorder' );
	     }else{
	     	$_POST['time'] = date('y-m-d H:i:s',time()) ;
	     	if(floatval($_POST['Fieldset_ys_fee']) > $this->uinfo['wbfee']) $this->error('您的微币余额不足:'.floatval($_POST['Fieldset_ys_fee']).'，请先充值！','',5);
	     	if(floatval($_POST['Fieldset_yx_fee']) > floatval($_POST['Fieldset_ys_fee'])) $this->error('您的总预算必须大于您的单价！','',5);
	     	if(D('Article/ContentArticle')->saveData('edit')){
	     		$this->success('修改成功！',U('orderlist'));
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
	
  public function trimall($str)//删除空格
	{
		$qian=array(" ","　","\t","\n","\r");$hou=array("","","","","");
		return str_replace($qian,$hou,$str);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
?>