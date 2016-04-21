<?php
namespace Home\Controller;
use Home\Controller\SiteController;
/**
*  @author shanmao
 * http://shanmao.me
 * 20151019
 * 厦门景诺网络科技有限公司
 */


class AdController extends SiteController {
	
	
	public function __construct() {
		parent::__construct ();
		header ( "Content-Type: text/html; charset=UTF-8" );
		if (! $this->uinfo) {
		A('Public')->dowxlogin();
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
		$uid = $this->uinfo['id'];

	$ad_data = M("Ad")->field('count(id) as ad_num,sum(click) as click_num,sum(zc_fee) as fee ')->where("uid=".$uid)->select(); 
 
	
	$release_data = M("Ad_release")->where("uid=".$uid)->count();
	
	$sj_release_data = M("Ad_release")->where("uid=".$uid." and status = 1")->count();
	
	$this->assign('ad_data',$ad_data[0]);
	$this->assign('release_data',$release_data);
	$this->assign('sj_release_data',$sj_release_data);
	$this->assign('info',$this->uinfo);		
	$this->assign('act','ad');		
	$this->siteDisplay ( 'adcenter' );
		
	}
	
	//添加广告
	public  function add(){
		if(!IS_POST){
			$media = $this->getMedia ( '添加广告', '', '', '添加广告', 'ismenu' );
			$this->assign('media',$media);
			$this->siteDisplay ( 'ad_add' );
		}else{
			$name =I('post.name','','trim');
			$link =I('post.link','','trim');
			$ad_img =I('post.image','','trim');
			if(!$name||!$link||!$ad_img) $this->error('请填写完整！');
			$data = array('ad_name'=>$name,'ad_link'=>$link,'ad_img'=>$ad_img);
			$data['uid'] = $this->uinfo['id'];
		    $data['add_time'] =time();
			$re  = M('Ad')->add($data);
			if($re){
				$this->success('添加成功！',U('ad_list'));
			}else
				$this->error('添加失败');
		}

	}
	
	//列表
	public function ad_list(){
		$media = $this->getMedia ( '广告列表', '', '', '广告列表', 'ismenu' );
		$Ad = M('Ad'); // 实例化User对象
		$count      = $Ad->where('uid = '.$this->uinfo['id'])->count();// 查询满足要求的总记录数
		$Page       = new \Think\Page($count,5);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show       = $Page->show();// 分页显示输出// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $Ad->where('uid = '.$this->uinfo['id'])->order('add_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		
		$this->assign('page',$show);
		$this->assign('list',$list);
		$this->assign('media',$media);
		$this->siteDisplay ( 'ad_list' );
	}
	
	
	/**
	 * 删除
	 */
	public function del(){
		$Id = I('get.id',0,'intval');
		if(empty($Id)){
			$this->error('参数不能为空！');
		}
		if(M('Ad')->where('id = '.$Id)->delete()){
			
			$this->success('删除成功！');
		}else{
			$this->error('删除失败！');
		}
	}
	
	/**
	 * 发布广告
	 */
	public  function fee_ad(){
		if(!IS_POST){
			$media = $this->getMedia ( '投放广告', '', '', '投放广告', 'ismenu' );
			$this->assign('media',$media);
			$this->assign('categoryList',$this->get_class());
			$this->assign('adList',M('Ad')->field('id,ad_name')->where("uid = ".$this->uinfo['id'])->select());
			$this->siteDisplay ( 'fee_ad' );
		}else{
			$class_id =I('post.class_id',0,'intval');
			$ad_id =I('post.ad_id',0,'intval');
			$dj_fee = I('post.dj_fee',0,'floatval');
			$ys_fee = I('post.ys_fee',0,'floatval');
			if(!$class_id||!$ad_id||!$dj_fee||!$ys_fee) $this->error('请填写完整！');
			if($ys_fee > $this->uinfo['wbfee']) $this->error('您的预算大于您的微币余额，请充值！');
			$ad_data = M('Ad')->field('ad_name,ad_img,ad_link')->where('id = '.$ad_id)->find();
			if(!$ad_data)  $this->error('投放失败');
			$data = array('class_id'=>$class_id,'ad_id'=>$ad_id,'ad_name'=>$ad_data['ad_name'],'ad_img'=>$ad_data['ad_img'],'ad_link'=>$ad_data['ad_link'],'dj_fee'=>$dj_fee,'ys_fee'=>$ys_fee);
			$data['uid'] = $this->uinfo['id'];
			$data['add_time'] =time();
			$re  = M('Ad_release')->add($data);
			if($re){
				$this->success('投放成功！',U('fee_ad_list'));
			}else
				$this->error('投放失败');
		}
	
	}
	
	/**
	 * 已发布广告
	 */
	public  function fee_ad_list(){
		$media = $this->getMedia ( '投放列表', '', '', '投放列表', 'ismenu' );
		$Ad = M('Ad_release'); // 实例化User对象
		$count      = $Ad->where('uid = '.$this->uinfo['id'])->count();// 查询满足要求的总记录数
		$Page       = new \Think\Page($count,5);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show       = $Page->show();// 分页显示输出// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $Ad->where('uid = '.$this->uinfo['id'])->order('add_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		$categoryList = $this->get_class();
		$status =array(0=>'待审核',1=>'已上架',2=>'已下架');
		foreach ($list as $k=>$v){
			$list[$k]['class_name'] = $categoryList[$v['class_id']]['name'];
			$list[$k]['status'] =$status[$v['status']];
		}
		$this->assign('page',$show);
		$this->assign('list',$list);
		$this->assign('media',$media);
		$this->siteDisplay ( 'fee_ad_list' );
	}
	
	
	//下架
	public function fee_save(){
		$Id = I('get.id',0,'intval');
		if(empty($Id)){
			$this->error('参数不能为空！');
		}
		if(M('Ad_release')->where('id = '.$Id)->save(array('status'=>2))){
			$this->success('下级成功！');
		}else{
			$this->error('下架失败！');
		}

	}
	
	
	
	
	/**
	 * 删除
	 */
	public function fee_del(){
		$Id = I('get.id',0,'intval');
		if(empty($Id)){
			$this->error('参数不能为空！');
		}
		if(M('Ad_release')->where('id = '.$Id)->delete()){
			$this->success('删除成功！');
		}else{
			$this->error('删除失败！');
		}
	}
	
	
	
	
	
	
	

}
?>