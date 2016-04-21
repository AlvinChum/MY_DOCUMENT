<?php
namespace DuxCms\Service;
/**
 * 标签接口
 */
class LabelService{
	/**
	 * 栏目列表
	 */
	public function categoryList($data){
        $where='';
        //上级栏目
        if(isset($data['parent_id'])){
            $where['parent_id'] = $data['parent_id'];
        }
        //指定栏目
        if(!empty($data['class_id'])){
            $where['class_id'] = array('in',$data['class_id']);
        }
        //其他条件
        if(!empty($data['where'])){
            $where['_string'] = $data['where'];
        }
        //排序
        if(!empty($data['order'])){
            $order=$data['order'];
        }else{
			 $order="sequence asc";
		}
        //其他属性
        $where['show'] = 1;
        $model = D('DuxCms/Category');
        return $model->loadData($where,$data['limit'],$order);
	}

    /**
     * 内容列表
     */
    public function contentList($data){
        $where=array();
        //指定栏目内容
        if(!empty($data['class_id'])){
            $where['A.class_id'] = array('in',$data['class_id']);
        }
        //指定栏目下子栏目内容
        if ($data['type']=='sub'&&!empty($data['class_id'])) {
            $classIds = D('DuxCms/Category')->getSubClassId($data['class_id']);
            $where['A.class_id'] = array('in',$classIds);
        }
        //是否带形象图
        if (isset($data['image'])) {
            if($data['image'] == true)
            {
                $where['A.image'] = array('neq','');
            }else{
                $where['A.image'] = '';
            }
        }
        //调用推荐位
        if(!empty($data['pos_id'])){
            $where['_string'] = 'find_in_set('.$data['pos_id'].',A.position) ';
        }
        //调用推荐位头条
        if(!empty($data['top_id'])){
        	  $positionId =A("Home/site")->find_positionId($data['top_id']);
        if($positionId)	$where['_string'] = 'find_in_set('.$positionId.',A.position) ';
        }
        
        //其他条件
        if (!empty($data['where'])) {
            $where['_string'] = $data['where'];
        }
        //调用数量
        if (empty($data['limit'])) {
            $data['limit'] = 10;
        }
        //内容排序
        if(empty($data['order'])){
            $data['order']='A.time DESC,A.content_id DESC';
        }
        //其他属性
        $where['A.status'] = 1;
        if(C('set_task_hide')==1) $where['A.actionstatus'] = 0;
        $model = D('DuxCms/Content');
        
        if($data['cached']){
        	$cachelist = S("list".$data['cached']);
        	if($cachelist)
			return $cachelist;
		}
        
        $list = D('DuxCms/Content')->loadList($where,$data['limit'],$data['order']);
        
              if(!empty($data['set'])){
              	/*
              	$cook = $_COOKIE ['checklogin'];
              	$ucookie = json_decode ( stripslashes ( $cook ), true );
              	$userinfo = S ( 'uinfo' . $ucookie ['check'] );            
              	if($userinfo['id']&&$list){
              	foreach($list as $k=>$v){
              		$aids[] = $v['content_id'];
              		$kk[$v['content_id']] = $k;
              	}
              	$aids = count($aids)>1?implode(',', $aids) :$aids[0];
              	if($aids){
              		$re = M('Content_f_log')->where('uid = '.$userinfo['id'].' AND aid in ('.$aids.')')->getField('aid',true);
              		if($re){
              			foreach ($re as $id){
              				unset($list[$kk[$id]]);
              			}
              		  } 
              		}
              	  }
              	  */	
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
        	}
        	
        }
        if($data['cached']){
        	S("list".$data['cached'],$list,300);
        }
        
        return $list;
    }

    /**
     * 碎片调用
     */
    public function fragment($data){
        $where=array();
        if(empty($data['mark'])){
            return ;
        }
        
        if(!empty($data['class_id'])){
        	$data_where['class_id'] = $data['class_id'];
            $data_where['status'] = 1;
          if(!empty($data['uid']))  $data_where['uid'] = $data['uid'];
            
          $re = M('Ad_release')->field('id,ad_img')->where($data_where)->order('add_time desc')->find();
          if(!$re){
          	unset($data_where['uid']);
          	$re = M('Ad_release')->field('id,ad_img')->where($data_where)->order('dj_fee desc,add_time desc')->find();
          } 
          if($re){
          	
         	$info ='<a href="'.U('Home/Public/ad',array('id'=>$re['id'])).'" target="_blank"><img src="'.$re['ad_img'].'" alt=""></a>';
         	return $info;
         }	
        	
       }

        $where['label'] = $data['mark'];
        $info = D('DuxCms/Fragment')->getWhereInfo($where);
     
        if(empty($info)){
            return ;
        }
        return html_out(htmlspecialchars_decode($info['content']));
    }

    /**
     * 表单token
     */
    public function formToken($data){
        $where=array();
        if(empty($data['table'])){
            return ;
        }
        $where = array();
        $where['table'] = $data['table'];
        $formInfo = D('DuxCms/FieldsetForm')->getWhereInfo($where);
        if(empty($formInfo)){
            return ;
        }
        return D('DuxCms/FieldsetForm')->setToken($data['table']);
    }

    /**
     * 内容链接调用
     */
    public function aurl($data){
        if(empty($data['content_id'])){
            return ;
        }
        $where=array();
        $where['content_id'] = $data['content_id'];
        $info = D('DuxCms/Content')->getWhereInfo($where);
        if(empty($info)){
            return ;
        }
        return D('DuxCms/Content')->getUrl($info);
    }

    /**
     * 栏目链接调用
     */
    public function curl($data){
        if(empty($data['class_id'])){
            return ;
        }
        $where=array();
        $where['class_id'] = $data['class_id'];
        $info = D('DuxCms/Category')->getWhereInfo($where);
        if(empty($info)){
            return ;
        }
        return D('DuxCms/Category')->getUrl($info);
    }

    /**
     * TAG列表调用
     */
    public function tagsList($data){

        $where = array();
        //解析TAG文字
        if(!empty($data['name'])){
            $name = explode(',', $data['name']);
            $whereName = array();
            foreach ($name as $value) {
                $whereName[] = array('eq', $value);
            }
            $where['name'] = array_merge($whereName, array('and'));
        }
        //数量
        if(empty($data['limit'])){
            $data['limit'] = 10;
        }
        //默认排序
        if(empty($data['order'])){
            $data['order'] = 'tag_id DESC';
        }
        return D('DuxCms/Tags')->loadList($where, $data['limit'], $data['order']);
    }

    /**
     * 表单列表调用
     */
    public function formList($data)
    {
        if(empty($data['table'])){
            return array();
        }
        //获取表单信息
        $where = array();
        $where['table'] = $data['table'];
        $formInfo = D('DuxCms/FieldsetForm')->getWhereInfo($where);
        if(empty($formInfo)){
            return array();
        }
        //设置模型
        $model = D('DuxCms/FieldData');
        $model->setTable($formInfo['table']);
        //获取条件
        $where = array();
        if(!empty($formInfo['list_where'])){
            $where['_string'] = $formInfo['list_where'];
        }
        if(!empty($data['where'])){
            $where['_string'] = $data['where'];
        }
        if(empty($data['order'])){
            $data['order'] = 'data_id DESC';
        }
        if(empty($data['limit'])){
            $data['limit'] = 10;
        }
        //查询内容
        $list = $model->loadList($where,$data['limit'],$data['order']);
        //字段列表
        $where = array();
        $where['A.fieldset_id'] = $formInfo['fieldset_id'];
        $fieldList = D('DuxCms/FieldForm')->loadList($where);
         //格式化表单内容为基本数据
        $data = array();

        if(!empty($list)){
            foreach ($list as $key => $value) {
                $data[$key]=$value;
                foreach ($fieldList as $v) {
                    $data[$key][$v['field']] = D('DuxCms/FieldData')->revertField($value[$v['field']],$v['type'],$v['config']);
                }                
            }
        }
        return $data;
    }
  
}
