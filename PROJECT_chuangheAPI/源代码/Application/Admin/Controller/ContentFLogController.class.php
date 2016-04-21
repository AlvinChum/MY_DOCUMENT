<?php
namespace Admin\Controller;
use Admin\Controller\AdminController;
/**
 * 用户分享文章管理
 */
class ContentFLogController extends AdminController
{

	
    /**
     * 当前模块参数
     */
    public function _infoModule()
    {
        $data = array('info' => array('name' => '用户分享文章管理',
                'description' => '用户分享文章记录信息',
                ),
            'menu' => array(
                array('name' => '用户分享列表',
                    'url' => U('Admin/ContentFLog/index'),
                    'icon' => 'list',
                    ),
				
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
		$type =I('request.type','','intval');
		
		$pageMaps = array();
        $pageMaps['keyword'] = $keyword;
		
		$where = array();
		if(!empty($keyword)){
            $where['_string'] = '(B.user_login like "%'.$keyword.'%") OR (A.uid = "'.$keyword.'") OR (A.aid = "'.$keyword.'")';
        }

		$count = D('ContentFLog')->countList($where);
		$limit = $this->getPageLimit($count,20);
		$list = D('ContentFLog')->loadList($where,$limit);
	
		$this->assign('pageMaps',$pageMaps);
		$this->assign('page',$this->getPageShow($pageMaps));
		$this->assign("list", $list);
		$this->adminDisplay();
    }  
	
}

