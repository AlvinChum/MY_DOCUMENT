<?php
namespace Admin\Model;
use Think\Model;
/**
 * 后台菜单
 */
class UsersModel extends Model {
	
	protected $_auto = array (
			array('user_login','htmlspecialchars',3,'function'),
			array('user_nicename','htmlspecialchars',3,'function'),
			array('user_email','htmlspecialchars',3,'function'),
			array('user_status','2'),			
	        array('user_pass','getpwd',3,'callback') ,
		    array('user_pass','',2,'ignore'),
	        array('create_time','time',1,'function'), 
	        );
	
	protected $_validate = array(   
			 // array('verify','require','验证码必须！'), //默认情况下用正则进行验证   
			array('user_login','','帐号名称已经存在！',1,'unique',1), // 在新增的时候验证name字段是否唯一   
			  //    array('value',array(1,2,3),'值的范围不正确！',2,'in'), // 当值不为空的时候判断是否在一个范围内  
			array('user_pass2','user_pass','确认密码不正确',0,'confirm'), // 验证确认密码是否和密码一致   
			array('user_pass','checkPwd','密码格式不正确',0,'function'), // 自定义函数验证密码格式  
			);
	 /**
     * 获取数量
     * @return int 数量
     */
    public function countList($where = array()){
        //$where['C.app'] = 'Admin';
        return $this->where($where)
                    ->order($order)
                    ->count();
    }
	
	public function loadList($where = array(),$limit=0,$order='id desc'){
		return $this->where($where)
                    ->order($order)
                    ->limit($limit)
					->select();
	}
	
	public function getfensicount($pid){
		return $this->where("parent_id=".$pid)->count();
	}
	
	/**
     * 更新信息
     * @param string $type 更新类型
     * @return bool 更新状态
     */
    public function saveData($type = 'add'){
        //事务总表处理
        $this->startTrans();
        
        //分表处理
        $data = $this->create();
		
        if(!$data){
            $this->rollback();
            return false;
        }
        if($type == 'add'){
			
            //$this->content_id = $contentId;
            $status = $this->add();
            if($status){
                $this->commit();
            }else{
                $this->rollback();
            }
            return $status;
        }
        if($type == 'edit'){ 
            $status = $this->where('id='.$data['id'])->save();
            if($status === false){
                $this->rollback();
                return false;
            }
            $this->commit();
            return true;
        }
        $this->rollback();
        return false;
    }
	
	
	
	 public function delData($contentId)
    {
        $this->startTrans();       
        $map = array();
        $map['id'] = $contentId;
        $status = $this->where($map)->delete();
        if($status){
            $this->commit();
        }else{
            $this->rollback();
        }
        return $status;
    }
   
    //密码加密
    public  function  getpwd(){
    	$pwd   =   I('post.user_pass');
    	$username = I('post.user_login');
    	if(!$pwd) return false;
    	$pwd   =   md5 ( $username . $pwd  . C ( 'PWD_SALA' ) );
    	return $pwd;
    }
   
    
	

}