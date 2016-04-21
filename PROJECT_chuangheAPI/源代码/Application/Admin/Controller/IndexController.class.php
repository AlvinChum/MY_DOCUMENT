<?php
namespace Admin\Controller;
use Admin\Controller\AdminController;
/**
 * 后台首页
 */
class IndexController extends AdminController {

    /**
     * 当前模块参数
     */
	protected function _infoModule(){
		return array(
            'menu' => array(
            		array(
	                    'name' => '管理首页',
	                    'url' => U('Index/index'),
	                    'icon' => 'dashboard',
                    )
                ),
            'info' => array(
                    'name' => '管理首页',
                    'description' => '站点运行信息',
            		'icon' => 'home',
                )
            );
	}
	/**
     * 首页
     */
    public function index(){
    	
    	/*M()->query("ALTER TABLE  `dux_users` ADD  `b_pro` VARCHAR( 20 ) NOT NULL ,
ADD  `b_city` VARCHAR( 20 ) NOT NULL ,
ADD  `b_fws` VARCHAR( 20 ) NOT NULL");

echo M()->getDbError();

exit;
    	*/
    	
    	
     	if(S('assecp_flv')==1 || cookie('assecp_flv')==1){
			redirect(U("Admin/Jnooocn/index"));
    	exit;
		}else{
			if($_POST['submit']=='我同意'){
				S('assecp_flv',1,86400);
				cookie('assecp_flv',1,360*86400);
				redirect(U("Admin/Jnooocn/index"));
    	exit;
			}			
			 $this->display('falv');
			 exit;
		}
    	//设置目录导航
    	$breadCrumb = array('首页'=>U('Index/index'));
	
        $this->assign('breadCrumb',$breadCrumb);
        $this->adminDisplay();
    }
}

