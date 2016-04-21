<?php
namespace Admin\Controller;
use Admin\Controller\AdminController;
/**
 * 积分余额管理
 */
class AdController extends AdminController
{

	
    /**
     * 当前模块参数
     */
    public function _infoModule()
    {
        $data = array('info' => array('name' => '广告管理',
                'description' => '管理网站广告植入',
                ),
            'menu' => array(
                array('name' => '广告列表',
                    'url' => U('Admin/Ad/index'),
                    'icon' => 'list',
                    ),
            		array('name' => '点击记录',
            				'url' => U('Admin/Ad/djlist'),
            				'icon' => 'list',
            		)

                //$contentMenu
                )
            );
		/*	
        $modelList = getAllService('ContentModel', '');
        $contentMenu = array();
        if (!empty($modelList))
        {
            $i = 0;
            foreach ($modelList as $key => $value)
            {
                $i++;
                $data['menu'][$i]['name'] = '添加' . $value['name'] . '分类';
                $data['menu'][$i]['url'] = U($key . '/AdminBxcat/add');
                $data['menu'][$i]['icon'] = 'plus';
            }
        }
		*/
        return $data;
    }
    /**
     * 列表
     */
    public function index()
    {
	
	
		$keyword = I('request.keyword','','trim');
		$classId =  I('request.class_id','','intval');
		$breadCrumb = array('广告列表' => U());
        $this->assign('breadCrumb', $breadCrumb);
        //$this->assign('list', D('User')->loadData());
		
		$pageMaps = array();
        $pageMaps['keyword'] = $keyword;

		 $where = array();
		if(!empty($keyword)){
            $where['_string'] = '(B.user_login like "%'.$keyword.'%") OR (A.uid = "'.$keyword.'")';
        }
        
        if(!empty($classId)){
        	$where['A.class_id'] = $classId;
        }
        

        $pageMaps['class_id'] = $classId;
    
		
        $count = D('AdRelease')->countList($where);
		
        $limit = $this->getPageLimit($count,20);
		
        $list = D('AdRelease')->loadList($where,$limit);
       
       // $status =array(0=>'待审核',1=>'已上架',2=>'已下架');
        $categoryList = A('Home/Site')->get_class();
        foreach ($list as $k=>$v){
        	$list[$k]['class_name'] = $categoryList[$v['class_id']]['name'];
        //	$list[$k]['status'] =$status[$v['status']];
        }
        $this->assign('categoryList',$categoryList);
	    $this->assign('pageMaps',$pageMaps);
		$this->assign('page',$this->getPageShow($pageMaps));
		
		$this->assign('list',$list);
		
		
		
		//print_r($list);
        $this->adminDisplay();
    }
    
    
    /**
     * 列表
     */
    public function djlist()
    {
    	$keyword = I('request.keyword','','trim');
    	 
    	$breadCrumb = array('点击记录' => U('djlist'));
    	$this->assign('breadCrumb', $breadCrumb);
    	//$this->assign('list', D('User')->loadData());
    	 
    	$pageMaps = array();
    	$pageMaps['keyword'] = $keyword;
    	 
    	$where = array();
    	if(!empty($keyword)){
    		$where['_string'] = '(B.user_login like "%'.$keyword.'%") OR (A.uid = "'.$keyword.'")';
    	}
    	 
 
    	$count = D('AdRelease')->dj_countList($where);
    	 
    	$limit = $this->getPageLimit($count,20);
    	//dump($limit);
    	 
    	$list = D('AdRelease')->dj_loadList($where,$limit);
    	
    	
    	$this->assign('list',$list);
    	$this->assign('pageMaps',$pageMaps);
    	$this->assign('page',$this->getPageShow($pageMaps));
    	$this->adminDisplay('djlist');
    }
    
    
    
    
	 /**
     * 增加
     */
    public function add(){
        if(!IS_POST){
            $breadCrumb = array('列表'=>U('index'),'添加'=>U());
            $this->assign('breadCrumb',$breadCrumb);
            $this->assign('name','添加');
            $this->adminDisplay('info');
        }else{
        	  
            if(D('AccountLog')->saveData('add')){
                $this->success('添加成功！');
            }else{
                $msg = D('AccountLog')->getError();
                if(empty($msg)){
                    $this->error('添加失败');
                }else{
                    $this->error($msg);
                }
            }
        }
    }
    
    //上下架
    public function ad_up(){
    	$Id = I('get.id',0,'intval');
    	$status = I('get.status',0,'intval');
		if(empty($Id)||empty($status)){
			$this->error('参数不能为空！');
		}
		if(M('Ad_release')->where('id = '.$Id)->save(array('status'=>$status))){
			A("Home/Site")->curl_get_contents("http://".$_SERVER['HTTP_HOST'].U("Home/Index/index"));
			$this->success('操作成功！');
		}else{
			$this->error('操作失败！');
		}
    }
    
    

    public function del(){
    	$contentId = I('post.data',0,'intval');
    	if(empty($contentId)){
    		$this->error('参数不能为空！');
    	}
    	if(D('AdRelease')->delData($contentId)){
    		$this->success('删除成功！');
    	}else{
    		$this->error('删除失败！');
    	}
    }
    
    
    
   
	
}

