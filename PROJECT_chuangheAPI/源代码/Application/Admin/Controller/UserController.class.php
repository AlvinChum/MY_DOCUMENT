<?php
namespace Admin\Controller;
use Admin\Controller\AdminController;
/**
 * 栏目管理
 */
class UserController extends AdminController
{
    /**
     * 当前模块参数
     */
    public function _infoModule()
    {
        $data = array('info' => array('name' => '用户管理',
                'description' => '管理网站所有用户信息',
                ),
            'menu' => array(
                array('name' => '用户列表',
                    'url' => U('Admin/User/index'),
                    'icon' => 'list',
                    ),
					array('name' => '添加用户',
                    'url' => U('Admin/User/add'),
                    'icon' => 'plus',
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
		
		 $keyword = I('request.keyword','');
		 $status = I('request.status',0,'intval');
		 $subscribe=I('request.subscribe',0,'intval');
		 $type = I('request.type','','trim');
		 $order_by = I('request.order_by','asc','trim');
        $breadCrumb = array('用户列表' => U());
        $this->assign('breadCrumb', $breadCrumb);
        //$this->assign('list', D('User')->loadData());
        
		 $pageMaps = array();
        $pageMaps['keyword'] = $keyword;
        $pageMaps['status'] = $status;
        $pageMaps['subscribe'] = $subscribe;
        $pageMaps['type'] = $type;
        $pageMaps['order_by'] = $order_by;
		 $where = array();
		if(!empty($keyword)){
			 $where['_string'] = '(user_login like "%'.$keyword.'%") OR (id = "'.$keyword.'")';
        }
        $pid =I('get.pid');
        $pageMaps['pid'] = $pid;
        if(!empty($pid)){
        	 $where['parent_id'] = $pid;
        }

		if(!empty($status)){
            switch ($status) {
                case '1':
                    $where['user_status'] = 1;
                    break;
                case '2':
                    $where['user_status'] = 2;
                    break;
				case '3':
                    $where['user_status'] = 0;
                    break;
            }
        }
       
         if(!empty($subscribe)){
         	
         	switch ($subscribe) {
                case '1':
                    $where['subscribe'] = 1;
                    break;
                case '2':
                    $where['subscribe'] = 0;
                    break;				
            }         	
   
        }
        
        if($type){
        	$order =$type.' '.$order_by;
        }
      
        
       // $pageMaps['class_id'] = $classId;
       // $pageMaps['position_id'] = $positionId;
        //查询数据
		
        $count = D('Users')->countList($where);
        $limit = $this->getPageLimit($count,20);
		
	   $order = $order? $order: 'id desc';
       $list = D('Users')->loadList($where,$limit,$order);
	    $this->assign('pageMaps',$pageMaps);
	   foreach($list as $key=>$val){
	   $list[$key]['fscount']=	D("Users")->getfensicount($val['id']);
	   }
	   
		//dump($list);
		$this->assign('page',$this->getPageShow($pageMaps));
		$this->assign('list',$list);
		$this->assign('user_rank',S('user_rank'));
        $this->adminDisplay();
    }
	 /**
     * 增加
     */
    public function add(){
        if(!IS_POST){
            $breadCrumb = array('用户列表'=>U('index'),'用户添加'=>U());
            $this->assign('breadCrumb',$breadCrumb);
            $this->assign('name','添加');
            $this->adminDisplay('info');
        }else{
			$_POST['user_email'] = '';
            if(D('Users')->saveData('add')){
                $this->success('用户添加成功！');
            }else{
                $msg = D('Users')->getError();
                if(empty($msg)){
                    $this->error('用户添加失败');
                }else{
                    $this->error($msg);
                }
            }
        }
    }
    
    /**
     * 修改
     */
    public function edit(){
    	if(!IS_POST){
    		$breadCrumb = array('用户列表' => U('index'),'修改用户'=>U());
    		$this->assign('breadCrumb', $breadCrumb);
    		$userId = I('get.id','','intval');
    	    if(empty($userId)) $this->error('参数不能为空！');
    	    //获取记录
    		$info = M ( 'Users' )->where ( "id=$userId" )->find ();
    		if(!$info) $this->error('无数据！');
    		$this->assign('user_rank',S('user_rank'));
    		$this->assign('info',$info);
    		$this->assign('name','修改');
    		$this->adminDisplay('info');
    	}else{
    		if(D('Users')->saveData('edit')){
    			$this->success('修改成功！');
    		}else{
    			$msg = D('Users')->getError();
    			if(empty($msg)){
    				$this->error('修改失败');
    			}else{
    				$this->error($msg);
    			}
    		}
    	}
    }

	
	public function del(){
		$contentId = I('post.data',0,'intval');
        if(empty($contentId)){
            $this->error('参数不能为空！');
        }
        $user_data = D('Users')->field('user_login,user_pass')->where('id = '.$contentId)->find();
        if(D('Users')->delData($contentId)){
        	$logincheck = md5 ( $user_data['user_login'] . $user_data ['user_pass'] . C ( 'PWD_SALA' ) );
        	S ( 'uinfo' . $logincheck, NULL );
        	M('User_bind')->where('uid = '.$contentId)->delete();
        	M('Wx_openid')->where('uid = '.$contentId)->delete();
			$this->delInfoByUid($contentId);
            $this->success('用户删除成功！');
        }else{
            $this->error('用户删除失败！');
        }
	}
	
	/**
	* 根据用户id删除数据
	* @author nineTea
	* @param undefined $uid
	* 20160111
	*/
	public function delInfoByUid($uid){
		$tables = array('Account_log','Ad','Ad_log','Ad_release','Chongzhi_log',
						'Content_f_log','Ext_guestbook','Ext_jubao','Ext_tixian','Ext_w_order_list',
						'moeny_log','other_login','prove','sj_log','user_bind',
						'user_ticket','weishang_log','wx_openid');
		foreach($tables as $table){
			M($table)->where(array('uid'=>$uid))->delete();
		}
		M('Content')->where(array('user_id'=>$uid))->delete();
	}	
	
	protected function sendhb($openid='o1vOjjlUZML2Kqxwj1snkSTPKvpw',$title='奖励',$body='试听奖励红包',$fee=1,$type=''){//发红包 http://shanmao.me
	$hb = new \Org\Util\Hongbao();		
			$arr['openid']=$openid;
        	$arr['hbname']=$title;
        	$arr['body']=$body;
        	$arr['fee']=$fee;        	
        	if($type=='lb'){
				$arr['num']=I("post.num");
				//dump($arr);
				$re = $hb->liebianhongbao($arr);	
			}else{
			$re = $hb->sendhongbaoto($arr);	
			}
			if($re['result_code']=='SUCCESS')
			$this->log_money1($openid,$fee,$body,-1);			
			return $re['return_msg'];
}
  
  
  public function sendhbs(){// http://shanmao.me
  		$openid = I("post.openid");
  		$title = I("post.hbtitle");
  		$body = I("post.hbbody");
  		$fee = I("post.fee");
  		$type = I("post.type");
  		
  		exit($this->sendhb($openid,$title,$body,$fee,$type));
  }
  
  public function sendzz(){
  	$Transfers = new \Org\Util\Transfers();	
	$re = $Transfers->dozz(I("post.openid"),I("post.fee"),I("post.desc"));
	if($re['result_code']=='SUCCESS'){ // 正确返回
	$this->log_money1(I("post.openid"),I("post.fee"),I("post.desc"),-1);
	 	exit("转账成功！");
	}else{//返回错误信息	 
	exit($re['return_msg']);
	} 
	
	
	
  }
  
  public function sendaccount(){
  	$mtype =I('post.mtype','','intval');
  	$moeny =I('post.moeny');
  	$uid = I('post.uid','','intval');
  	$type = I('post.type','','intval');
  	
  	if($mtype == 1){
  	   $jifen =	 A("Home/Site")->changejifen($moeny,$type,I("post.desc"),$uid);
  	   if($jifen){
  	   	exit("操作成功！");
  	   }
  	}
  	if($mtype == 2){
  		$jifen =  A("Home/Site")->changemoney($moeny,$type,I("post.desc"),$uid);
  		if($jifen){
  			exit("操作成功！");
  		}
  	}
  	if($mtype == 3){
  		$jifen =  A("Home/Site")->changewbmoney($moeny,$type,I("post.desc"),$uid);
  		if($jifen){
  			exit("操作成功！");
  		}
  	}
  	
  	
  	
  	exit('操作失败');
  }
  
  
  
  
   public function log_money1($openid=0,$fee=0,$desc=0,$type=0){//记录现金记录  	
$data['time']=time();
  	$data['weixin']=$openid;
  	$data['uid']=M("Users")->where("weixin='{$openid}'")->getField('id');
  	$data['fee']=$fee;
  	$data['body']=$desc;
  	$data['type']=$type;
  	M("moeny_log")->add($data);
  }
	
}

