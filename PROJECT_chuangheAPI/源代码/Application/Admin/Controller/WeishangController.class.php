<?php
namespace Admin\Controller;
use Admin\Controller\AdminController;
/**
 * 积分余额管理
 */
class WeishangController extends AdminController
{

	
    /**
     * 当前模块参数
     */
    public function _infoModule()
    {
        $data = array('info' => array('name' => '积分余额管理',
                'description' => '管理网站积分余额信息',
                ),
            'menu' => array(
                array('name' => '积分余额列表',
                    'url' => U('Admin/Account/index'),
                    'icon' => 'list',
                    ),
            	array('name' => '充值列表',
            				'url' => U('Admin/Account/czlist'),
            				'icon' => 'list',
            	),
            	array('name' => '微商支出明细',
            				'url' => U('Admin/Weishang/index'),
            				'icon' => 'list',
            		),
				
                //$contentMenu
                )
            );
	
        return $data;
    }
    /**
     * 列表
     */
    public function index()
    {
	
	
		$keyword = I('request.keyword','','trim');
		$type =I('request.type','','intval');
		$from =I('request.from','','trim');
		$breadCrumb = array('积分余额列表' => U());
        $this->assign('breadCrumb', $breadCrumb);
        //$this->assign('list', D('User')->loadData());
		
		$pageMaps = array();
        $pageMaps['keyword'] = $keyword;
        $pageMaps['type'] = $type;
		 $where = array();
		if(!empty($keyword)){
            $where['_string'] = '(B.user_login like "%'.$keyword.'%") OR (A.uid = "'.$keyword.'")';
        }
        if(!empty($type)){
        	$where['A.type'] = $type;
        }
		if(!empty($from)){
			$where['_string'] = 'A.'.$from.' >0';
        	 
        }
        
       // $pageMaps['class_id'] = $classId;
       // $pageMaps['position_id'] = $positionId;
        //查询数据
		
        $count = D('WeishangLog')->countList($where);
		
        $limit = $this->getPageLimit($count,20);
		//dump($limit);
		
       $list = D('WeishangLog')->loadList($where,$limit);
	   $this->assign('pageMaps',$pageMaps);
	   
	   //1关注2邀请3发送失败转余额4摇一摇变动5分享文章6签到
	   $type =array(
	   		1=>'关注',
	   		2=>'邀请',
	   		3=>'发送失败转余额',
	   		4=>'摇一摇变动',
	   		5=>'分享文章',
	   		6=>'签到',
	   		7=>'提现',
	   		10=>'置顶',
	   		11=>'分享用户文章',
	   		12=>'浏览用户文章',
	   		13=>'文章赏金',
	   		14=>'广告植入',
	   		15=>'意向佣金'
	   );
	    $this->assign('type',$type);
		$this->assign('page',$this->getPageShow($pageMaps));
		
		$this->assign('list',$list);
		//print_r($list);
        $this->adminDisplay();
    }
	
    
    
   
	
}

