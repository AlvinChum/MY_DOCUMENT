<?php
namespace Home\Service;
/**
 * 标签接口
 */
class LabelService{
	/**
	 * 微意向
	 */
	public function w_orderList($data){
		
		$list=array();
		if(!empty($data['class_id'])&&!empty($data['content_id'])&&!empty($data['tabname'])){
			$fieldset = A('Home/Site')->getfield_id($data['tabname']);
			if($fieldset){
				
				$fieldset_id = M('category_article')->where('class_id = '.$data['class_id'])->getField('fieldset_id');
				if($fieldset_id == $fieldset){
					
					$where['fieldset_id'] =$fieldset_id;
					$where['field'] ='field';
					$config = M('field')->where($where)->getField('config');
					
					$field =  M('Ext_'.$data['tabname'])->where('data_id = '.$data['content_id'])->getField('field');

					if($config&&$field){
						
						$config = explode(',', $config);
						$field  = explode(',', $field);	
						foreach ($field as $v){
							 $list[] = $config[$v-1];
						}
						$list= array(0=>$list);
					}
				}
			}
         }

        return $list;
	}
	


}
