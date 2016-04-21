<?php
namespace Article\Controller;
use Home\Controller\SiteController;
/**
 * 栏目页面
 */

class ContentController extends SiteController {

	/**
     * 栏目页
     */
    public function index()
    {
		header("Content-Type:text/html; charset=utf-8"); 
		if(C("onlywx")==1 && strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') === false ){
			 $this->siteDisplay('jg_qzwxdk');
			 exit;
		}
        $contentId = I('get.content_id',0,'intval');
        $urlTitle = I('get.urltitle');
        if (empty($contentId)&&empty($urlTitle)) {
            $this->error404();
        }
		if($this->uinfo['id']){
			$this->check_is_bind($this->uinfo['id']);
		}
       	
		$fxuid = I('get.uid');
		$fxtime  =I('get.time');
		//20151212 新增 v8 版逻辑
		$hash = I('get.hash');	
		$fxapi2 = I('get.fxapi2');	

	if($fxapi2==1 && $this->uinfo)  $fxuid = $this->uinfo['id']; 
		if($fxapi2 && $fxuid && $fxtime && !$hash && !IS_AJAX){
		$time = time();	
		
			//多域名 by shanmao.me  2015 - 09 -03  分享前
		$domain='';
		$dm = C('moredomai');
		if($dm && C("iswxjsfx")==0){
		$dm = explode('
',$dm);
$dmnum = count($dm);
$randnum = rand(1,$dmnum);
$thisdm = trim($dm[$randnum-1]);
if(strstr($thisdm,'*')){
	$string =  new \Org\Util\String();
	$randstr = $string->randString(5,3);
	$thisdm =  str_replace('*',$randstr,$thisdm);
}
		if($thisdm)
		$domain = "http://".$thisdm;
				    
		   //多域名 by shanmao.me  2015 - 09 -03
		  } 
			
			
		$data = array();	
		$data['uid'] = $fxuid;
		$data['aid'] = $contentId;
		$refx = M("Content_f_log")->where($data)->find();
					
		if(!$refx){
			$ip = get_client_ip();	
			$data['ip']=$ip;		
			$data['time'] = $time;
			$data['ip2'] = ip2long($ip);
			$data['type'] ='all';			
			$data['md5code']=md5($fxuid.$contentId.$time.$data['ip2']);
			S($data['md5code'],$ip,3600);		
			//$res3 =M("Content_f_log")->add($data);		
			//if($res3) 
				redirect($domain.U("Article/Content/index",array('uid'=>$fxuid,'content_id'=>$contentId,'hash'=>$data['md5code'],'fxapi3'=>2,'time'=>$time,'gowxurl'=>C('gowxurl')?C('gowxurl'):999)));
			exit;
		}elseif($refx['md5code']){
			if($refx['status']==0){//分享前   'fxapi3'=>2   分享后   'fxapi3'=>1
				redirect($domain.U("Article/Content/index",array('uid'=>$fxuid,'content_id'=>$contentId,'hash'=>$refx['md5code'],'fxapi3'=>2,'time'=>$time,'gowxurl'=>C('gowxurl')?C('gowxurl'):999)));
				exit;
			}else{
				redirect($domain.U("Article/Content/index",array('uid'=>$fxuid,'content_id'=>$contentId,'hash'=>$refx['md5code'],'fxapi3'=>1,'time'=>$time,'gowxurl'=>C('gowxurl')?C('gowxurl'):999)));
			exit;	
			}		
							
		}
				
		}
			
		
		if($hash && $_GET['time']<time()-5 && !IS_AJAX){  //分享后
			//多域名 by shanmao.me  2015 - 12 -20	
			$dm = C('moredomaifxh');		
		$domain='';		
		if($dm){
		$dm = explode('
',$dm);
$dmnum = count($dm);
$randnum = rand(1,$dmnum);
$thisdm = trim($dm[$randnum-1]);
if(strstr($thisdm,'*')){
	$string =  new \Org\Util\String();
	$randstr = $string->randString(5,3);
	$thisdm =  str_replace('*',$randstr,$thisdm);
}
		if($thisdm)
		$domain = "http://".$thisdm;				    
		   //多域名 by shanmao.me  2015 - 09 -03
		  } 
		 $ip3 = S($hash);
		
		 $add =$refx2 =1;
		 if($ip3){		 		 	 
			$re3 = M()->query("SELECT count(*) as cnum FROM dux_content_f_log WHERE uid = ".$fxuid."  and FROM_UNIXTIME( time, '%Y%m%d' ) =".date("Ymd",time()));			
			$yinum = $re3[0]['cnum'];
			if(C('ererydayfx')<$yinum && C('ererydayfx')>0){
				$add = 0;
			}else{
				$refx2 = M("Content_f_log")->where("md5code='".$hash."'")->find();	
			}	
			}			
		  if($this->uinfo['id']!=$fxuid && !$refx2){	 
		  $data = array();	
		$data['uid'] = $fxuid;
		$data['aid'] = $contentId;	  	
			$data['ip']=$ip3;		
			$data['time'] = time();
			$data['ip2'] = ip2long($ip3);
			$data['type'] ='all';
			$data['md5code']=$hash;		
			$data['allview']=0;
			if($add==1)
			$res3 =M("Content_f_log")->add($data);
			S($hash,null);				
		  }
				
		redirect($domain.U("Article/Content/index",array('uid'=>$fxuid,'content_id'=>$contentId,'hash'=>$hash,'time'=>time(),'gowxurl'=>C('gowxurl')?C('gowxurl'):999)));			
			exit;  
	
			
		}
		
	
        $model = D('ContentArticle');
        //获取内容信息
        if(!empty($contentId)){
            $contentInfo=$model->getInfo($contentId);
          
        }else if(!empty($urlTitle)){
            $contentInfo=$model->getInfoUrl($urlTitle);
        }else{
            $this->error404();
        }
        $contentId = $contentInfo['content_id'];
        //信息判断
        if (!is_array($contentInfo)){
            $this->error404();
        }
        
        //A("Home/Public")->dowxlogin();
        
        //获取栏目信息
        $modelCategory = D('CategoryArticle');
        $categoryInfo=$modelCategory->getInfo($contentInfo['class_id']);
        if (!is_array($categoryInfo)){
            $this->error404();
        }
        if($categoryInfo['app']<>MODULE_NAME){
            $this->error404();
        };
        //判断跳转
        if (!empty($contentInfo['url']))
        {
            ob_start();
            $this->show($contentInfo['url']);
            $link = ob_get_clean();
            header("HTTP/1.1 301 Moved Permanently");
            header("Location: ".$link."");
            exit;
        }
         //更新访问计数
        $viewsData=array();
        $viewsData['views'] = array('exp','views+1');
        $viewsData['content_id'] = $contentInfo['content_id'];
        D('DuxCms/Content')->editData($viewsData);
        //内容处理
        $contentInfo['content'] = html_out($contentInfo['content']); 
    
   
        $timestamp = A("Home/Api")->yqapi();//分享
       A("Home/Api")->countviews();//统计 和赠送 佣金      
		
        
        //MEDIA信息
        $media = $this->getMedia($contentInfo['title'],$contentInfo['keywords'],$contentInfo['description']);
        //模板赋值
if($categoryInfo['fieldset_id']>0){//扩展字段处理   2015-3-27 by shanmao.me
			$kztable  = D("DuxCms/Fieldset")->getInfo($categoryInfo['fieldset_id']);
			if($kztable['table']){
				$mod1 = D("DuxCms/FieldData");
				$mod1->setTable($kztable['table']);
				$kzinfo = $mod1->getInfo($contentId);
				if(is_array($kzinfo)) $contentInfo = array_merge($contentInfo,$kzinfo);
			}
			
		}

		//地区判断
		$tshtml ='';
       if($contentInfo['area']&&$this->uinfo){	
		  $area = explode(',',$contentInfo['area']);
		  $province = C('is_check_bind')==1? $this->uinfo['b_pro'] :$this->uinfo['province'];
		  $city =C('is_check_bind')==1? $this->uinfo['b_city'] :$this->uinfo['city'];
		  if(!in_array($province,$area)&&!in_array($city,$area)){
		  	  $tshtml ='<script> alert("您不在此文章分享地区内,分享无佣金"); </script>';
			  $this->assign('tshtml', $tshtml);
		  }
		} 





		$dm = C("moredomai");
	if(C("iswxjsfx")==1 && $dm){//js 安全域名  jnooo.cn			
		$dm = explode('
',$dm);
$dmnum = count($dm);
$randnum = rand(1,$dmnum);
$thisdm = trim($dm[$randnum-1]);
if(strstr($thisdm,'*')){
	$string =  new \Org\Util\String();
	$randstr = $string->randString(5,3);
	$thisdm =  str_replace('*',$randstr,$thisdm);
}
		if($thisdm)
		$this->assign('domain',$thisdm);			    
		   //多域名 by shanmao.me  2015 - 09 -03
		  
		}
	

		
		
		$this->assign('contentInfo', $contentInfo);
        $this->assign('categoryInfo', $categoryInfo);
        $this->assign('parentCategoryInfo', $parentCategoryInfo);
        $this->assign('topCategoryInfo', $topCategoryInfo);
        $this->assign('crumb', $crumb);
        $this->assign('count', $count);      
        $this->assign('page', $page);
        $this->assign('isweixin', $this->is_weixin()?1:0);
        $this->assign('media', $media);
       // $this->assign('prevInfo', $prevInfo);
       // $this->assign('nextInfo', $nextInfo);
       
        if($contentInfo['wxurl']&&$contentInfo['user_id']&&!strstr($contentInfo['wxurl'],'mp.weixin.qq.com')){
        	$this->siteDisplay('user_content');
        	exit;
        }
        if($contentInfo['tpl']){
            $this->siteDisplay($contentInfo['tpl']);
        }else{
            $this->siteDisplay($categoryInfo['content_tpl']);
        }
    }
}