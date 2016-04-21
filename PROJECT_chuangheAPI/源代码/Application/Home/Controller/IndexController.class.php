<?php
namespace Home\Controller;
use Home\Controller\SiteController;
/**
 * 景诺网络科技有限公司
 * http://www.jnooo.cn
 */
class IndexController extends SiteController {

	/**
     * 主页
     */
	 
	 
	 
    public function index(){
    	$this->index2();
    	exit;
		
    }
    
    public function index2(){//文章首页
       
    	if(!IS_AJAX) cookie('gourl','index.html',86400);
    	if($this->uinfo){
    		$this->check_is_bind($this->uinfo['id']);
    	}else{
    		if($this->is_weixin() && !IS_AJAX){
    			A('Public')->wxlogin();
    			exit;
    		}
			/*
			redirect(U('Home/Public/login'));
			exit;*/
		}
	    header("Content-Type:text/html; charset=utf-8"); 
		if(C("onlywx")==1 && strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') === false ){
			 $this->siteDisplay('jg_qzwxdk');
			 exit;
		}
		
		
		
		
    //	A('Public')->dowxlogin();
    	$where['status'] = 1;
    	if (C('set_task_hide')) $where['actionstatus'] = 0;
    	$User = M('Content'); // 实例化User对象
    	$count      = $User->where($where)->count();// 查询满足要求的总记录数
    	$Page       = new \Think\Page($count,20);// 实例化分页类 传入总记录数和每页显示的记录数(25)
    	$show       = $Page->show();// 分页显示输出// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
    	$list = $User->where($where)->order('actionstatus,sequence,time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
    	
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
 
      	$positionId =$this->find_positionId(1);
      	$cid = $this->last_position_time($positionId,1);	
        if($positionId&&$cid){
      	foreach ($list as $k=> $v){
      		$position =array();
      		if($v['position']&&in_array($v['content_id'], $cid)){
      			$position =explode(',', $v['position']);
      			if($position&&in_array($positionId,$position)) unset($list[$k]);
      		}
      	}
      }
      
	if(S("baind_old".$this->uinfo['id']) && $this->uinfo['id']){
		 echo '<script>alert("已绑定您的老账号【'.S("baind_old".$this->uinfo['id']).'】，今后，您还可以使用手机号和密码登录。")</script>';
		 S("baind_old".$this->uinfo['id'],null);
		 }
		 
    	if(I("get.ajax")==1) $this->ajaxReturn($list);
    	$this->assign('list1',$list);// 赋值数据集
    	$this->assign('page',$show);// 赋值分页输出    	
    	//dump($list);
    	$media = $this->getMedia ( '推荐列表', '', '', '推荐列表', 'ismenu' );
		$this->assign ( 'media', $media );
		$this->assign('act','index3');
		$this->assign('css_path','themes/shanmao_me_new_app/');
		$this->siteBuildHtml('index.html', ROOT_PATH, C('TPL_NAME').'/index2');
		 $this->siteDisplay('index2');
	}
	
	   public function index3(){//文章首页
	   $this->index2();
    	exit;
	
	}
    
    
    public function log(){
    		header("Content-Type:text/html; charset=utf-8"); 
			var_dump(S("baind_oldoFV_Ut-mQYP-tkOcDyVGGjG2Gpxc"));
			
			exit;

		var_dump(S("log"));
		var_dump(S("log1"));
		var_dump(S("log2"));
	}
    
    
    //字符串中间打** 号
public function half_replace($str){
    $len = strlen($str)/2;
    return substr_replace($str,str_repeat('*',$len),floor(($len)/2),$len);
}


public function test(){
	exit;
	
}



public function jubao(){
	if(!IS_POST){
		$this->siteDisplay('jubao');
	}else{
		$data['type']=I("post.type");
		$data['jbdesc']=I("post.content");
		$data['jbname']=$this->uinfo['user_nicename'];
		$data['uid']=$this->uinfo['id'];
		$data['time']=time();
		M("ext_jubao")->add($data);
		$this->success('ok');
		//$this->ajaxReturn($_POST);
	}
	
}
	/**
	* 首页判断是否登录
	* @author nineTea
	* 20151217
	*/
	public function ajaxCheckLogin(){
		
			
		if($this->uinfo){
			if(C('is_check_bind')==1&&!$this->uinfo['user_tel']){
				$this->error("err",U('index'));
				exit;
			}
			if(S("baind_old".$this->uinfo['id']) && $this->uinfo['id']){
				$alert_js = '已绑定您的老账号【'.S("baind_old".$this->uinfo['id']).'】，今后，您还可以使用手机号和密码登录。';
				S("baind_old".$this->uinfo['id'],null);
			}
			$data['status'] =1;
			$alert_js?$data['alert_js'] = $alert_js:'';
			$this->ajaxReturn($data);
			exit;
		} else {
			$this->error("err",U('Home/Public/login'));
		}
	}
    
}