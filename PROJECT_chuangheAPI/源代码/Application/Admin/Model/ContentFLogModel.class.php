<?php
namespace Admin\Model;
use Think\Model;
/**
 * 后台菜单
 */
class ContentFLogModel extends Model {
	
 	
	/*
	 protected $_auto = array (
 			array('bx_name','htmlspecialchars',3,'function'),
 			array('bx_type','htmlspecialchars',3,'function'),
 			array('description','htmlspecialchars',3,'function'),
	        array('create_time','time',1,'function'), 
 	        );
	 */

    /**
     * 获取数量
     * @return int 数量
     */
    public function countList($where = array()){
    	return $this->table("__CONTENT_F_LOG__ as A")
    	->join('__USERS__ as B ON A.uid = B.id')
    	->where($where)
    	->count();
    }
    
    
    /**
     * 获取列表
     * @return array 列表
     */
    public function loadList($where = array(), $limit = 0){
    	$data   = $this->table("__CONTENT_F_LOG__ as A")
    	->join('__USERS__ as B ON A.uid = B.id')
    	->field('A.*,B.user_login')
    	->where($where)
    	->limit($limit)
    	->order('A.id desc')
    	->select();
    	return $data;
    
    }

}