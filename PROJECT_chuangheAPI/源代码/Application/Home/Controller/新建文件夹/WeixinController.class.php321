<?php
namespace Home\Controller;
use Home\Controller\SiteController;

/**
 * function WEI XIN API
 * @author shanmao
 * http://shanmao.me
 *外部curl get post http://www.test.mengjiagames.com/default.php/Shanmao/curlfowai/checkcode/yanzi/
 *外部curl 参数： checkcode:yanzi必选; type:post,get; url: 来源网址; fromurl:伪造来路; fromip:伪造ip 不用了他自带;vars:post 数据;cookie:cookie;
 */
C('defmenuend','
回复0返回主菜单');
C('defmenu','请输入数字：
1 翻译集合
2 手机归属地查询
3 火车查询
4 身份证查询
5 厦门公交查询
6 区号查询
7 快递查询(beta)
10 联系客服/提交bug
11 关于山猫
20 抽奖游戏
微信作品：
1.摇一摇：http://t.cn/Rv7pXMC 
2.企业3G官网：http://t.cn/8sRJqyu 
3.微信商城可手机支付：http://t.cn/RvZoZWi 
4.微信平台：http://wx.shanmao.me/
5.随机文字：http://t.cn/RvwQfai

微信开发，微信商城，网站建设，软件定制开发, 破解开发，欢迎咨询，联系:18650144002');
C('defkefu','
回复客服开头并留下您的联系方式，客服会及时联系您。回复格式如：客服+意见、建议+联系方式');
C('defbug','
回复客服提交bug，回复格式如：客服+BUG信息');
C('kefuok','我们已经收到了您提交的客服信息，感谢!');
C('besturl','http://shanmaome.sinaapp.com');
C('adminemail','admin@shanmao.me');
C('gh_1ed7f7d83fad','山猫的博客');
C('gh_8c6e018b2a46','龙湖社区');
/*C('kuaidi','
1.EMS
2.顺丰快递
3.韵达快运');
C('kuaidiname',array('EMS','顺丰快递','韵达快运'));
C('kuaidicode',array('ems','shunfeng','yunda'));
*/
C('prev','
回复77返回上级菜单');





class WeixinController extends SiteController
{


	
	
public function  _initialize(){	


		
	header("Content-Type:text/html; charset=utf-8"); 		
	}


public function log(){
	//$media_id = A("Home/Api")->getewmmediaid('oFV_Ut-mQYP-tkOcDyVGGjG2Gpxc');
	
	dump($media_id);
	dump(S('xmllog'));
}		
	
public function index(){
	
	define("TOKEN", C("wxtoken")?C("wxtoken"):"shanmaowxin");//成为开发者token 	
	
	 $echoStr = $_GET["echostr"];
       if($this->checkSignature()){
       	if($echoStr){
        	echo $echoStr;
        	exit;
       	}else{
       		$this->getmsg();		
       	}
        }		
	}	
	
	
	
	
public function getmsg(){
	 $ss=0;
 		 if(C("other_url") && C("other_token") && C('mal'.'asen')!=2){	//add by shanmao.me
	$url = $this->get_other_url();
	$re = $this->curlpxml($url,$GLOBALS["HTTP_RAW_POST_DATA"]);	
	if(strstr($re,'xml')) { $ss=1; echo $re; }
	//S('log',$re);
	}			
		$xml=$this->msg();
		if(S($xml['FromUserName'].$xml['CreateTime'])==1)exit;	
		S($xml['FromUserName'].$xml['CreateTime'],1,1200);
			
		 $db =M('Wxtext');
 		$db->add($xml);
		 $openid = $xml['FromUserName'];
		 $gzhid = $xml['ToUserName'];
		 $this->set_wxconfig(0,$gzhid);
		 $eventkey = $xml['EventKey'];
		if($xml['MsgType']=='event'){
			$Event=$xml['Event'];
			switch($Event){
				case "subscribe":
				//echo $this->makeText(C('defmenu'));
				$re = A('Api')->saveinfo($openid,$gzhid);
				if($re['type']=='newreg'){//新关注	
					if(C('gzshbval')>0)			
					A('Api')->sendhb($openid,C('gzshbval'),C('site_title'),C('hbbody'),2); // 关注送红包	
					if(C('gzsxj')>0) A('Api')->sendzz($openid,C('gzsxj'),C('hbbody'),2);	//关注送现金			
					if(C('gzjfnum')>0){
						$desc='关注获得积分';
						 $res = A("Site")->changejifen(C('gzjfnum'),1,$desc,$re['id']);
						 if($res>0){
						 	$this->sendmb_jifen($openid,'您好，【'.$re["user_nicename"].'】欢迎关注'.C("site_title"),C('gzjfnum'),$res,$desc,$re["user_nicename"]);
						 	
						 }
						}
					
					if($eventkey&& $xml['Ticket']){//二维码关注
						$pid  = str_replace('qrscene_','',$eventkey);
						$pinfo = D("Users")->find($pid);
						$msg2 = "【".$re["user_nicename"]."】通过您分享的二维码关注了公众号,成为了您的粉丝。";
						$pweixin = D('Home/Users')->getWxOpenid($pid,$pinfo['weixin']);
						$this->makeTextbygm($msg2,$pweixin);						
						$re['parent_id']=$datas2['parent_id']=$pid;
						D("Users")->where("id=".$re['id'])->save($datas2);

// 						if(C('fjfnum')>0 && $re['parent_id']>0){//关注上级送积分,普通邀请已经送了一次，不再送了
// 						$desc="邀请好友关注获得积分";
// 						 //A("Site")->changejifen(C('fjfnum'),2,$desc,$re['parent_id'],1);
// 					}
					
						
					}

					$send =0;				
					
					
// 					$yqarea = C("yqarea");
// 					if(C("yqareaje")>0&&$yqarea){ // 单独设置的区域佣金
						
// 						$areajr = A("Home/Api")->areayjfun($yqarea,C("yqareaje"),'ip',$re['regip'],$re);						
// 						$desc="邀请好友关注获得金钱".$re['regip'];		        				
// 						if($areajr>0){
// 							$send=1;
// 							 A("Site")->changemoney($areajr,8,$desc,$re['parent_id'],1);
// 						}
				
// 					}
					
					
					
// 					if(C('fjinq')>0 && $re['parent_id']>0 && $send==0){//关注上级送金钱
// 						$desc="邀请好友关注获得金钱";
// 						// A("Site")->changemoney(C('fjinq'),8,$desc,$re['parent_id'],1);
// 					}
					
					
					if(C("gzsmoney")>0){//关注送金钱存入账户可提现
					$desc ='关注获得奖励';
						 A("Site")->changemoney(C('gzsmoney'),1,$desc,$re['id'],1);
					}	
					//新关注					
				}
				
				
				$msg = C("diygzhf")?C("diygzhf"):"转发文章可以获得佣金，发展粉丝可获得粉丝提成，佣金可立即提现。";	

				if($msg) $this->makeTextbygm(html_out($msg),$openid);
			
				if($openid!=C('adminopenid'))
					$this->makeTextbygm("有新朋友关注：【".$re['user_nicename']."】",C('adminopenid'));
				
				//if($ss==0 && $msg) echo $this->makeText(html_out($msg));
				break;
				case "unsubscribe":
				A("Api")->unsubscribe($openid);
				break;
				case "CLICK":
				
				if($eventkey=='jnooocn'){//二维码推广 20151112 by 山猫
					$msg ='正在生成您的推广二维码,请耐心等待...';
					if($msg) $this->makeTextbygm($msg,$openid);								
					$media_id = A("Home/Api")->getewmmediaid($openid);		
					if($media_id) $this->makeImgbygm($media_id,$openid);	
					
				}
				
				
				$msg = A("Api")->clickfun($eventkey,$openid);
				if($ss==1 && $msg) $this->makeTextbygm($msg,$openid);
				if($ss==0 && $msg) echo $this->makeText($msg);
				
				
				
				//echo $this->makeText($msg);				
				break;
				}
			
			//接收菜单消息后返回信息给用户
			/*
				$EventKey = $xml['EventKey'];
				if($EventKey=='V1001_NBA'){
					echo $this->makeText('你点击的是nba按钮~~~');					
				}
		if($EventKey=='V1001_CBA'){
					echo $this->makeText('你点击的是cba按钮~~~');					
				}
				*/
				//接收菜单消息后返回信息给用户
			} 
			  
		if($xml['MsgType']=='text'){//接收文本消息后返回信息给用户
		$xml['Content']=trim($xml['Content']); 
            
			switch ($xml['Content']){				
				case 20:
				echo $this->makeText($this->choujiang());	
				break;
				case 111:
				//echo $this->makeTextbygm('通知消息！',$o);
				break;
				case 888:
				$ressl = $this->posttoblog();
				echo $this->makeText(trim($ressl));
				break;
				default:
				
				break;	
				
			}
			
			
		}	
			
			
		
			exit;	
			
	
}

public function test(){

	
	
	
	
	exit;
	echo D("Users")->wreuval('oFV_Ut-mQYP-tkOcDyVGGjG2Gpxc');
	
	exit;
	//$this->makeTextbygm('通知消息','oFV_Ut-mQYP-tkOcDyVGGjG2Gpxc');
	$this->sendmbmsg('oFV_Ut-mQYP-tkOcDyVGGjG2Gpxc');
}



public function sendmb_yaoqing($openid){//发送通知模板消息
	$json = '  {
           "touser":"'.$openid.'",
           "template_id":"wpdVbD9v4FMvcWgzDCupXHR3f0UQohTDQDKYR7mJvoM",
           "url":"http://'.$_SERVER["HTTP_HOST"].U("Home/User/index").'",
           "topcolor":"#FF0000",
           "data":{
                   "first": {
                       "value":"您好，【JKLHLOO】已通过扫描您的专属二维码被推荐成为会员。",
                       "color":"#173177"
                   },
                   "keyword1":{
                       "value":"JKLHLOO",
                       "color":"#173177"
                   },
                   "keyword2": {
                       "value":"2014年7月21日 18:36",
                       "color":"#173177"
                   },                   
                   "remark":{
                       "value":"推荐关注积分已打入您的会员账户，感谢您的推荐。",
                       "color":"#173177"
                   }
           }
       }';
	   
	$url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=". $this->accesstoken();
	 $re =  $this->curlp($url,$json); 
	 return $re['errmsg'];
	 dump($re);
}


public function sendmb_money($openid,$title,$jifen,$jifeny,$desc,$uname){//金钱变动通知
if(!$openid) return false;
if(C('gzhtype')==2){
	//var_dump($this->makeTextbygm($uname.$title.$jifen."。余额：".$jifeny."。变动原因：".$desc,$openid));
	return  $this->makeTextbygm($uname.$title.$jifen."。余额：".$jifeny."。变动原因：".$desc,$openid);
}

$json = '{
           "touser":"'.$openid.'",
           "template_id":"'.C("moneymb").'",
           "url":"http://'.C('site_url').U("Home/User/mymoney").'",
           "topcolor":"#FF0000",
           "data":{
                   "first": {
                       "value":"'.$title.'",
                       "color":"#173177"
                   },
                   "date": {
                       "value":"'.date("Y-m-d H:i:s",time()).'",
                       "color":"#173177"
                   },
                   "adCharge": {
                       "value":"'.$jifen.'",
                       "color":"#FF0000"
                   },
                   "cashBalance": {
                       "value":"'.$jifeny.'",
                       "color":"#173177"
                   },
                   "remark": {
                       "value":"'.$desc.'",
                       "color":"#173177"
                   }
           }
       }';
	   
	$url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=". $this->accesstoken();
	 $re =  $this->curlp($url,$json); 
	 return $re['errmsg'];

}

public function sendmb_jifen($openid,$title,$jifen,$jifeny,$desc,$uname){//发送通知模板消息
if(!$openid) return false;
if(C('gzhtype')==2){
	return  $this->makeTextbygm($uname.$title.$jifen."。余额：".$jifeny."。变动原因：".$desc,$openid);
}

	$json = '{
           "touser":"'.$openid.'",
           "template_id":"'.C("jifenmb").'",
           "url":"http://'.$_SERVER["HTTP_HOST"].U("Home/User/jifenlist").'",
           "topcolor":"#FF0000",
           "data":{
                   "first": {
                       "value":"'.$title.'",
                       "color":"#173177"
                   },
                   "keyword1":{
                       "value":"'.$uname.'",
                       "color":"#173177"
                   },
                   "keyword2": {
                       "value":"'.date("Y-m-d H:i:s",time()).'",
                       "color":"#173177"
                   },
                   "keyword3": {
                       "value":"'.$jifen.'",
                       "color":"#FF0000"
                   },
                   "keyword4": {
                       "value":"'.$jifeny.'",
                       "color":"#173177"
                   },
                   "keyword5": {
                       "value":"'.$desc.'",
                       "color":"#173177"
                   },                   
                   "remark":{
                       "value":"感谢您的使用!",
                       "color":"#173177"
                   }
           }
       }';
	   
	$url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=". $this->accesstoken();
	 $re =  $this->curlp($url,$json); 
	// S("log1",$re);
	 return $re['errmsg'];
	 dump($re);
}

	
public function downmedia($mediaid=''){//下载多媒体文件
	if(!$mediaid){
		$mediaid = $_GET['mid'];
	}
	//dump($mediaid);
	$geturl = 'http://file.api.weixin.qq.com/cgi-bin/media/get?access_token='.$this->accesstoken().'&media_id='.$mediaid;
	echo $this->saveMedia($geturl);  //返回路径

}	
	
	
public function userlist($type='',$next=''){//获取关注着列表
	$geturl = 'https://api.weixin.qq.com/cgi-bin/user/get?access_token='.$this->accesstoken().'&next_openid='.$next;//超过 10000 分次获取   http://mp.weixin.qq.com/wiki/index.php?title=%E8%8E%B7%E5%8F%96%E5%85%B3%E6%B3%A8%E8%80%85%E5%88%97%E8%A1%A8
	if($type){
		return $this->curlg($geturl);
	}else{
		$re = $this->curlg($geturl);
	//dump();// string(148) "{"total":2,"count":2,"data":{"openid":["oDRRdt0bGysSF-1S985qgWv261GY","oDRRdtynG-WNHFa9BWdvRDGcBQNE"]},"next_openid":"oDRRdtynG-WNHFa9BWdvRDGcBQNE"}"
	//dump(json_decode($re,true));
	$userlist=json_decode($re,true);
	$data=$userlist['data']['openid'];
foreach ($data as $val){
	$data1['openid']=$val;
	$ll = M('Wxuser')->add($data1);
}
if($ll){
	echo 'success';	
}else{
	echo 'error';
	
}
	//M('Wxuser')->add($data);
	//echo M()->getLastsql();
	
	}
}

public function msg(){
	$data = $GLOBALS["HTTP_RAW_POST_DATA"];
	        if (!empty($data)) {//接收消息并处理
            $xml = (array)simplexml_load_string($data, 'SimpleXMLElement', LIBXML_NOCDATA);
            return $xml;
	  }
	
}


public function makeTextbygm($text,$touser) // 给用户发消息
 {
    	if(!$touser) return false;
    $msg = '{
    "touser":"'.$touser.'",
    "msgtype":"text",
    "text":
    {
         "content":"'.$text.'"//消息内容。
    }
}';
//dump($msg);
$posturl = 'https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token='.$this->accesstoken();
$re = $this->curlp($posturl,$msg);
$re = json_decode($re,true);
if($re["errcode"]==40001) S('mustnewtoken',40001);

return true;
    }

public function makeImgbygm($MEDIA_ID,$openid) // 给用户发消息 img  20151112
    {
		
	$data = '{"touser":"'.$openid.'","msgtype":"image","image":{"media_id":"'.$MEDIA_ID.'"}}';	
		
$posturl = 'https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token='.$this->accesstoken();

return $this->curlp($posturl,$data);
    }


 public function makeText($text='')
    {
    	$this->msg=$this->msg();
        $createtime = time();
        $funcflag = $this->setFlag ? 1 : 0;
        $textTpl = "<xml>
            <ToUserName><![CDATA[{$this->msg['FromUserName']}]]></ToUserName>
            <FromUserName><![CDATA[{$this->msg['ToUserName']}]]></FromUserName>
            <CreateTime>{$createtime}</CreateTime>
            <MsgType><![CDATA[text]]></MsgType>
            <Content><![CDATA[%s]]></Content>
            <FuncFlag>%s</FuncFlag>
            </xml>";
        return sprintf($textTpl,$text,$funcflag);
    }
	
    
public function makeNews($newsData=array())
    {
    	$this->msg=$this->msg();
        $createtime = time();
        $funcflag = $this->setFlag ? 1 : 0;
        $newTplHeader = "<xml>
            <ToUserName><![CDATA[{$this->msg['FromUserName']}]]></ToUserName>
            <FromUserName><![CDATA[{$this->msg['ToUserName']}]]></FromUserName>
            <CreateTime>{$createtime}</CreateTime>
            <MsgType><![CDATA[news]]></MsgType>
            <Content><![CDATA[%s]]></Content>
            <ArticleCount>%s</ArticleCount><Articles>";
        $newTplItem = "<item>
            <Title><![CDATA[%s]]></Title>
            <Description><![CDATA[%s]]></Description>
            <PicUrl><![CDATA[%s]]></PicUrl>
            <Url><![CDATA[%s]]></Url>
            </item>";
        $newTplFoot = "</Articles>
            <FuncFlag>%s</FuncFlag>
            </xml>";
        $content = '';
        $itemsCount = count($newsData['items']);
        $itemsCount = $itemsCount < 10 ? $itemsCount : 10;//微信公众平台图文回复的消息一次最多10条
        if ($itemsCount) {
            foreach ($newsData['items'] as $key => $item) {
                $content .= sprintf($newTplItem,$item['title'],$item['description'],$item['picUrl'],$item['url']);//微信的信息数据

            }
        }
        $header = sprintf($newTplHeader,$newsData['content'],$itemsCount);
        $footer = sprintf($newTplFoot,$funcflag);
        return $header . $content . $footer;
    } 

public function accesstoken(){	
	if(S("gettokenf")) { 
	$new =0;
	 }else{
		S("gettokenf",1,6000);
		 $new=1;
	}

	return A("Home/Api")->wxtoken($new);
	
	
	//这里必填，不然无法使用 每天只能调用2K次
	$appid = 'wx114961ca7dbcaf71';  //测试 wx114961ca7dbcaf71  蒸汽 wx6a5a09d5d709b3cb 
	$appsecret='edbff49da852cdb103a9fd5572827daf';// 测试 edbff49da852cdb103a9fd5572827daf 蒸汽 b0b2a2591d432b998a458273f72fc257
	$cache = cache(array('type'=>'file','expire'=>7200));
	$hctoken = $cache->get('wx_access_tokens'.$appid);
	if($hctoken){		
		//echo 1;
		//S('wx_access_tokens',null);
		//dump($_SESSION['wx_access_token']);
		
		return $hctoken;
			
	}
	$get_url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$appid.'&secret='.$appsecret;//这里定义公众平台的appid 和 secret
	//$get_url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx6a5a09d5d709b3cb&secret=b0b2a2591d432b998a458273f72fc257';//这里定义公众平台的appid 和 secret
	$get_return = file_get_contents($get_url);
	$get_return = (array)json_decode($get_return);
	//dump($get_return);
	if(!$get_return['access_token'])exit( 'access_token get flase' );
	//S('wx_access_tokens',$get_return['access_token'],7300);
	$cache->set('wx_access_tokens'.$appid,$get_return['access_token']);
	return $get_return['access_token'];	
	}




public function checkidcard($keyw){
	//身份证查询
				$rejson = $this->curlg("http://m.46644.com/tool/idcard/?act=query&idcard=".$keyw,'http://m.46644.com',$this->randip());
				$rearr = json_decode($rejson,true);
				if($rearr['error']!=1){
				if(strlen($keyw)==15) $keyw = A('Idcard')->idcard_15to18($keyw);
					if(A('Idcard')->checkbig18($keyw)){
					$is18='已成年';
					}else{
					$is18='未成年';
					}
					$shengxiao = A('Idcard')->get_shengxiao($keyw);
					$xinzuo = A('Idcard')->get_xingzuo($keyw);
					$endmsg = "发证地:".$rearr['address']."
性别：".$rearr['sex']."
生日：".$rearr['birth']."
成年：".$is18."
生肖：".$shengxiao."
星座(新历)：".$xinzuo;
exit($this->makeText($endmsg));
				}else{
				echo $this->makeText($rearr['msg']."
回复0返回主菜单");
				}
				
	
}
public function checkmobile($keyw=18650144002){
	//手机查询
				$rejson = $this->curlg("http://m.46644.com/tool/shouji/?act=query&shouji=".$keyw,'http://m.46644.com',$this->randip());
				$rearr = json_decode($rejson,true);
				if($rearr['error']!=1){
				echo $this->makeText($rearr['msg']."
回复0返回主菜单");
				}
				
	
}
    
public function checkquhao($keyw=0592){
	//区号查询
				$rejson = $this->curlg("http://m.46644.com/tool/areacode/?act=query&areacode=".$keyw,'http://m.46644.com',$this->randip());
				$rearr = json_decode($rejson,true);
				if($rearr['error']!=1){
                $endecho = str_replace('<br />','
',$rearr['msg']);
				echo $this->makeText($endecho."
回复0退出区号查询并返回主菜单");
				}
				
	
}



function choujiang(){
	
$yaolv = explode(',',C('yaolv'));
$yaojx = explode(',',C('yaojx'));

foreach ($yaolv as $k =>$v){
	$prize_arr[] =array('id'=>$k+1,'v'=>$v,'code'=>$yaojx[$k]);
}

/*
$prize_arr = array( 
    '0' => array('id'=>1,'prize'=>'谢谢参与','v'=>$yaolv[0],'img'=>'','code'=>$yaojx[0]),
    '1' => array('id'=>2,'prize'=>'0.1','v'=>$yaolv[1],'img'=>'lb_2.jpg','code'=>$yaojx[1]), 
    '2' => array('id'=>3,'prize'=>'0.3','v'=>$yaolv[2],'img'=>'lb_3.jpg','code'=>$yaojx[2]), 
    '3' => array('id'=>4,'prize'=>'0.5','v'=>$yaolv[3],'img'=>'lb_8.jpg','code'=>$yaojx[3]), 
    '4' => array('id'=>5,'prize'=>'1','v'=>$yaolv[4],'img'=>'lb_8.jpg','code'=>$yaojx[4]), 
);
*/
foreach ($prize_arr as $key => $val) { 
    $arr[$val['id']] = $val['v'];
} 
 
$rid = $this->get_rand($arr); 

$gailv = $prize_arr[$rid-1]['code'];
return $gailv;
} 





public function checktianqi($key='厦门'){

$data['city']=$key;
$data['submit']='submit';
$endip = $this->randip();
$data= http_build_query($data);
$re =$this->curlparr("http://search.weather.com.cn/wap/search.php",$data,$endip,'http://search.weather.com.cn','');//身份证测试   $url, $vars, $fromip=NULL,$fromurl=NULL,$cookie=NULL	 http://www.mengjiagames.com/Huodong/shanmao 这个测试url 返回 ip 浏览器信息  发送的 post值。
$result=explode('/',$result);
      $result=explode('.',$result['5']);
      $citynum = $result['0'];
    dump($result);
echo $citynum;	
exit;  
//$jsondata = json_decode($re,true);
return $jsondata['translateResult'][0][0]['tgt'];

return ;	
}




public function shanmaoblog($keyw){
$a = M();
			//$list = $a->table('wp_posts')->field('ID,post_title,post_status,post_content')->where("post_title like '%$keyw%'")->select();/*post_content*/
			$list = $a->query("select ID,post_title,post_status from wp_posts where post_title like '%".$keyw."%' order by rand()");//随机
			foreach($list as $key => $val){//去掉没发布的，为了加快上面的查询速度
					if($val['post_status']!='publish'){
						unset($list[$key]);
					}
				}		
			if($list){//查询到文章。
				$cache = cache(array('type'=>'file','expire'=>7400));
				$imglistca = $cache->get('imglistssfsda1');//$imglist 附件列表缓存
				if(!$imglistca){
					$listimg = $a->table('wp_posts')->field('post_parent,guid')->where("post_mime_type like 'image%'")->select();
					foreach($listimg as $key => $val){
						$imglist[$val['post_parent']]=$val['guid'];					
					}
					$cache->set('imglistssfsda1',$imglist);
					//echo 1;
				}else{
					$imglist=$imglistca;
				}	
				//$imglist 附件列表缓存完
					
					
				foreach($list as $key => $val){					
					$val['description']=substr($val['post_content'],0,255);
					$val['title']=$val['post_title'];
					$val['picUrl']=$imglist[$val['ID']]? $imglist[$val['ID']] : "http://shanmao.me/wp-content/themes/weisaysimple/images/random/tb".rand(1,20).'.jpg';
					$val['url']="http://m.shanmao.me/index.php?s=/Index/acticle/tid/".$val['ID'];
					//foreach($val as $key2 => $val2){
					$ss['items'][$key]=$val;
					//}
					}		
				echo $this->makeNews($ss);			
				}else{//您可以百度搜索： http://www.baidu.com/s?wd='.urlencode($keyw)
				echo $this->makeText('没有找到关于"'.$keyw.'"的信息。
回复0返回主菜单');	
				}
}



private function waibucurl($reurl,$refromurl){
    $url = 'http://www.test.mengjiagames.com/default.php/Shanmao/curlfowai?checkcode=yanzi&type=get&url='.urlencode($reurl).'&fromurl='.urlencode($refromurl);
    return $url;
    }
private function randip(){
	/*58.194.96.0   58.194.119.255
58.206.128.0   58.207.63.255
59.67.0.0   59.67.255.255
60.24.0.0   60.30.255.255
61.136.0.0   61.136.63.255
61.181.0.0   61.181.255.255
61.232.16.0   61.232.27.255
61.234.70.0   61.234.95.255
61.240.0.0   61.240.31.255*/	
$ip1= "58.194.".rand(96,119).".".rand(1,255);
$ip2= "61.234.".rand(70,95).".".rand(1,255);
$ip3= "202.164.".rand(0,15).".".rand(1,255);
$ip4= "221.238.".rand(0,127).".".rand(1,255);
$ip5="219.".rand(0,254).".".rand(0,238).".".rand(1,255);
$ipji=array($ip1,$ip2,$ip3,$ip4,$ip5); 
return $ipji[rand(0,count($ipji)-1)];
}

private function useragent($mobile=null){
	$ua1 = 'Mozilla/5.0 (Windows NT 5.1; rv:25.0) Gecko/20100101 Firefox/25.0';
	$ua2= 'Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1';
	$ua3 = 'Mozilla/5.0 (Windows NT 6.1; rv:25.0) Gecko/20100101 Firefox/25.0';
	$ua4 = 'Mozilla/5.0 (Windows NT 6.2; rv:25.0) Gecko/20100101 Firefox/25.0';
	$ua5 = 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1';
	$ua6 = 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1';
	$ua7 = 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2';
	$ua8 = 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET4.0C; .NET CLR 3.0.04506.30; InfoPath.2; .NET4.0E; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)';
	$ua9 = 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET4.0C; .NET CLR 3.0.04506.30; InfoPath.2; .NET4.0E; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)';
	$ua10 = 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET4.0C; .NET CLR 3.0.04506.30; InfoPath.2; .NET4.0E; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)';
	$ua11 = 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET4.0C; .NET CLR 3.0.04506.30; InfoPath.2; .NET4.0E; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)';
	$uaarr = array($ua1,$ua2,$ua3,$ua4,$ua5,$ua6,$ua7,$ua8,$ua9,$ua10,$ua11);
	if($mobile){
		return 'Mozilla/5.0 (Linux; Android 4.4.4; HM NOTE 1LTEW Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/33.0.0.0 Mobile Safari/537.36 MicroMessenger/6.0.2.56_r958800.520 NetType/3gnet';
		//Mozilla/5.0 (Linux; Android 4.4.4; HM NOTE 1LTEW Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/33.0.0.0 Mobile Safari/537.36 MicroMessenger/6.0.2.56_r958800.520 NetType/3gnet
		//Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Mobile/11B554a MicroMessenger/5.2
		}else{
	return $uaarr[rand(0,count($uaarr)-1)];
	}	
	}
	
private function checkSignature()
{
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];	
        		
	$token = TOKEN;
	$tmpArr = array($token, $timestamp, $nonce);
	sort($tmpArr, SORT_STRING);
	$tmpStr = implode( $tmpArr );
	$tmpStr = sha1( $tmpStr );
	
	if( $tmpStr == $signature ){
		return true;
	}else{
		return false;
	}
}	
function mysubstr($str, $start, $len) {//截取GBK字符
    $tmpstr = "";
    $strlen = $start + $len;
    for($i = 0; $i < $strlen; $i++) {
        if(ord(substr($str, $i, 1)) > 0xa0) {
            $tmpstr .= substr($str, $i, 2);
            $i++;
        } else
            $tmpstr .= substr($str, $i, 1);
    }
    return $tmpstr;
}



function get_rand($proArr) { 
    $result = ''; 
 
    //概率数组的总概率精度 
    $proSum = array_sum($proArr); 
// dump($proSum);
    //概率数组循环 
    foreach ($proArr as $key => $proCur) { 
        $randNum = mt_rand(1, $proSum); 
        if ($randNum <= $proCur) { 
            $result = $key; 
            break; 
        } else { 
            $proSum -= $proCur; 
        } 
    } 
    unset ($proArr); 
 
    return $result; 
} 


public function curlp($post_url,$xjson){//php post
	$ch = curl_init($post_url);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); //ssl证书不检验
	curl_setopt($ch, CURLOPT_USERAGENT,$this->useragent());
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
	curl_setopt($ch, CURLOPT_POSTFIELDS,$xjson);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array(
	'Content-Type: application/json',
	'Content-Length: ' . strlen($xjson))
	);
	$respose_data = curl_exec($ch);
	return $respose_data;
	}
	
function curlparr($url, $vars, $fromip=NULL,$fromurl=NULL,$cookie=NULL)
{
$ch = curl_init($url);
curl_setopt($ch, CURLOPT_USERAGENT,$this->useragent());
if($fromip) curl_setopt($ch, CURLOPT_HTTPHEADER, array('X-FORWARDED-FOR:'.$fromip, 'CLIENT-IP:'.$fromip));  //构造IP
if($fromurl) curl_setopt($ch, CURLOPT_REFERER,$fromurl);   //构造来路
curl_setopt($ch, CURLOPT_HEADER,0);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
if($vars){
curl_setopt($ch, CURLOPT_POSTFIELDS, $vars);
}
if($cookie){
curl_setopt($ch, CURLOPT_COOKIE, $cookie);
}
$rst = curl_exec($ch);
if (curl_errno($ch)) {
echo curl_error($ch);
//error_log(curl_error($ch));
}
curl_close($ch);
 
return $rst;
}
/**
* 
* @param undefined $url
* @param undefined $fromurl
* @param undefined $fromip
* @param undefined $uagent  手机/微信
* @param undefined $timeout
* @param undefined $host
* 
*/
function curlg($url,$fromurl=NULL,$fromip=NULL,$uagent=NULL,$timeout=1,$host=NULL){//php 模拟get
	ob_start();
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); //ssl证书不检验
	if($fromip) curl_setopt($ch, CURLOPT_HTTPHEADER, array('X-FORWARDED-FOR:'.$fromip, 'CLIENT-IP:'.$fromip));  //构造IP
	if($fromurl) curl_setopt($ch, CURLOPT_REFERER,$fromurl);   //构造来路
    //curl_setopt($ch, CURLOPT_ENCODING ,gzip);
	curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_USERAGENT,$uagent ? $this->useragent(1) :$this->useragent());
	curl_setopt($ch, CURLOPT_RETURNTRANSFER,1); 
	curl_setopt($ch, CURLOPT_CONNECTTIMEOUT,$timeout);
	$file_msg = curl_exec($ch);
	curl_close($ch);
	//dump($ch);
	if($file_msg===false) return file_get_contents($url);
	return $file_msg;
}

//上传多媒体文件
    function uploadMedia($url,$file){
        $file = realpath($file); //要上传的文件
        $fields['media'] = '@'.$file;
        $ch = curl_init($url) ;
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS,$fields);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $result = curl_exec($ch) ;
        if (curl_errno($ch)) {
         return curl_error($ch);
        }
        curl_close($ch);
        return $result;
    }
//下载多媒体文件
    function saveMedia($url){
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_HEADER, 0);    
        curl_setopt($ch, CURLOPT_NOBODY, 0);    //对body进行输出。
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $package = curl_exec($ch);
        $httpinfo = curl_getinfo($ch);
       
        curl_close($ch);
        $media = array_merge(array('mediaBody' => $package), $httpinfo);
        
        //求出文件格式
        preg_match('/\w\/(\w+)/i', $media["content_type"], $extmatches);
        $fileExt = $extmatches[1];
        $filename = time().rand(100,999).".{$fileExt}";
        $dirname = "./wxmedia/";
        if(!file_exists($dirname)){
            mkdir($dirname,0777,true);
        }
        file_put_contents($dirname.$filename,$media['mediaBody']);
        return $dirname.$filename;
    }
    
function array_sort($arr,$keys,$type='asc'){ //二维数组排序
	$keysvalue = $new_array = array();
	foreach ($arr as $k=>$v){
		$keysvalue[$k] = $v[$keys];
	}
	if($type == 'asc'){
		asort($keysvalue);
	}else{
		arsort($keysvalue);
	}
	reset($keysvalue);
	foreach ($keysvalue as $k=>$v){
		$new_array[$k] = $arr[$k];
	}
	return $new_array; 
} 


	

private function strCut($str, $start, $end){
$content = strstr( $str, $start );
$content = substr( $content, strlen( $start ), strpos( $content, $end ) - strlen( $start ));
return $content;
}



public function autojrtt($url='http://toutiao.com/a6192154831404368130/'){
	$re =$this->curlg($url);
	//return $re;
	if(!$re) return 'curl error';
	$title=$this->strCut($re,"<h1>","</h1>");
	$body=$this->strCut($re,'<div class="article-content">','<div id="pagelet-detailbar');
	
	$body = preg_replace( "@<script(.*?)</script>@is", "", $body ); 
	$body = preg_replace( "@<style(.*?)</style>@is", "", $body ); 
	$body = $this->rreplace($body);	
	$body = $this->repalceTA($body);
	if(strstr($body,'tt-videoid')) $body=$body.'<script src="http://s0.pstatp.com/tt_player/tt.player.js"></script>';
	$data['title']=$title;
	$data['body']=$body;
	//dump($body);
	
/*	echo html_out('
 <p><div class="tt-video-box" tt-videoid="4908056eae904f4c949fc57c459de22d" tt-poster="http://p1.pstatp.com/large/7774/3108398880">视频加载中...</div></p>
               ');*/
	//exit;
	
	return ($data);
	dump($body);
}

public function autowxcj($url='http://mp.weixin.qq.com/s?__biz=MzA4NjM4MzE2Nw==&mid=400368391&idx=1&sn=a6fb36cf33964c8ec4602c3e54a79f3e&3rd=MzA3MDU4NTYzMw==&scene=6#rd'){	
	if(C('jnooo')!=2){
		if(strstr($url,'toutiao.com')){
		return 	$this->autojrtt($url);
		exit;
		}
		$re =$this->curlg($url);
	if(!$re) return 'curl error';
	$title=$this->strCut($re,"<title>","</title>");
	$body=$this->strCut($re,'<div class="rich_media_content " id="js_content">','</div>');
	$body = preg_replace( "@<script(.*?)</script>@is", "", $body ); 
	$body = preg_replace( "@<style(.*?)</style>@is", "", $body ); 
	//$body = preg_replace( "@<style(.*?)</style>@is", "", $body ); 
	//$body = preg_replace("/data-src=\"(.*)\">/","src=\"$1\"",$body);
	$litimg = $this->strCut($re,'var msg_cdn_url = "','";');
	$body = $this->rreplace($body);	
	$body = $this->repalceTA($body);
	
	$data['title']=$title;
	$data['body']=$body;
	$data['litimg']= $litimg? 'http://img01.sogoucdn.com/net/a/04/link?appid=100520033&url='.$litimg :0;
	
	return ($data);
	}
}


public function repalceTA($str){//shanmao.me  20151022  采集相关   http://shanmao.me/webback/thinkphp/php-cai-ji-mo-shou-shi-jie-shu-ju
    preg_match_all('#src="(.*)"#isU', $str, $arr);
	//dump($arr);
    for($i=0,$j=count($arr[0]); $i<$j; $i++){
		if(strstr($arr[1][$i],'qpic.cn'))
      $str = str_replace($arr[0][$i],'src="http://img01.store.sogou.com/net/a/04/link?appid=100520031&w=640&url='.$arr[1][$i].'"',$str);
	  else{
	  	// $str = str_replace($arr[0][$i],$arr[0][$i].' style="width:100% !important;height:250px !important;"',$str);
	  	$str = str_replace('width=','width=auto ',$str);	  	
	  	$str = str_replace('preview','player',$str);	  	
	  }
    }
    return $str;
}

public function rreplace($str) 
{ 

$str = str_replace('data-src','src',$str);
$str = preg_replace('/style="[^\"]+\"/','',$str);
$str = preg_replace('/width="[^\"]+\"/','',$str);
$str = preg_replace('/height="[^\"]+\"/','',$str);
//$str = preg_replace('/width=/','width=auto&',$str);

return $str;
/*
preg_match_all("/<i(.*)(data-src=\"[^\"]+\")[^>]+>/isU", $str, $arr); 


dump($arr);


for($i=0,$j=count($arr[0]);$i<$j;$i++){ 
//$str = str_replace($arr[0][$i],"<i ".$arr[2][$i]." />",$str); 
//$str = preg_replace("/data-src=\"(.*)\">/","src=\"$1\"",$str);
} 
return $str;
 */
} 



public function posttoblog(){
	$burl = S('cacheprevdata');
	$re =$this->curlg($burl);
	if(!$re) return 'curl error';
	$title=$this->strCut($re,"<title>","</title>");
	$body=$this->strCut($re,'<div id="page-content">','<div class="rich_media_tool" id="js_toobar">');
	$body=$body.'<br><br><font style="color:red">本文从本博客微信公众号一键转载,微信号：（shanmaome）</font><br>原文链接：'.$burl.'</div>';
	$postd = array('title'=>$title,'body'=>htmlspecialchars($body));
	return $this->curlparr("http://m.shanmao.me/index.php?s=/Index/postin",$postd);
	exit;	
	$blogdb = M()->db(55,C("SHANMAOMEBLOG_CONN"));
	$datas['post_title']=$title;
	$datas['post_content']=$body;
	$datas['post_author']=1;
	$datas['post_status']='publish';
	$datas['comment_status']='open';
	$datas['post_parent']='0';
	$datas['post_type']='post';
	$datas['post_date']=date("Y-m-d H:i:s",time());
	$datas['post_date_gmt']=date("Y-m-d H:i:s",time());
	$datas['post_modified_gmt']=date("Y-m-d H:i:s",time());
	$rr = $blogdb->table("wp_posts")->add($datas);
	sleep(2);
	//S('log',M()->getLastSql());
	if($rr){
	$data2['post_name']=$rr;
	$data2['post_modified']=date("Y-m-d H:i:s",time());
	$data2['guid']='http://shanmao.me/?p='.$rr;
	$blogdb->table("wp_posts")->where("ID=".$rr)->save($data2);
	$data3['object_id']=$rr;
	$data3['term_taxonomy_id']=420;
	$res = $blogdb->table("wp_term_relationships")->add($data3);
	if($res) return 'success';
		}else{
			return 'error';
		}
	
}

public function qunpostmsg(){//群发消息接口测试
$xjson ='{
   "touser":[
    "oFV_Ut-mQYP-tkOcDyVGGjG2Gpxc",
    "oFV_UtzEFV17p3H8hY9pndlsZbYA"
   ],
    "msgtype": "text",
    "text": { "content": "测试一下！！！"}
}';
$url = "https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token=".$this->accesstoken();
$re = $this->curlp($url,$xjson);
dump($re);
}


public function menu($xjson='',$appid='',$scretid=''){//生成菜单

/*
$xjson = '{ 
	 "button":[
		 {
			   "name":"主功能",
			   "sub_button":[
					{
					   "type":"view",
					   "name":"v8登录测试",
					   "url":"http://v8.jnooo.cc/v8/index.php?gocdurl=3"
					}
										
				]
		   },
		   {
			   "name":"用户中心",
			   "sub_button":[
			  		 {
					   "type":"click",
					   "name":"每日签到",
					   "key":"mrqd"
					},					
					{
					   "type":"click",
					   "name":"我的积分",
					   "key":"myjifen"
					},
					{
					   "type":"click",
					   "name":"我的粉丝",
					   "key":"myfensi"
					},
					{
					   "type":"click",
					   "name":"余额提现",
					   "key":"tixian"
					}					
				]
		   },
		   {
			   "name":"系统帮助",
			   "sub_button":[
					{
					   "type":"view",
					   "name":"技术博客",
					   "url":"http://m.shanmao.me"
					},
					{
					   "type":"click",
					   "name":"开发联系",
					   "key":"kflx"
					},
					{
					   "type":"click",
					   "name":"系统购买",
					   "key":"xtgm"
					},
					{
					   "type":"view",
					   "name":"赚钱教程",
					   "url":"http://m.shanmao.me"
					}
				]
		   }
	   ]
	}';
	*/
	//print_r($xjson);
	
	if($appid&&$scretid){
		$posturl = 'https://api.weixin.qq.com/cgi-bin/menu/create?access_token='.$this->get_token($appid, $scretid);
	}else{
		$posturl = 'https://api.weixin.qq.com/cgi-bin/menu/create?access_token='.$this->accesstoken();
	}
	
	
	$re = $this->curlp($posturl,$xjson);
	$re = json_decode($re,true);
	if($re['errcode']==40001) S("mustnewtoken",40001);
if($re["errmsg"]=="ok") $this->success('菜单提交成功，等待生效。'); else  $this->error($re["errmsg"]);
}	



    protected function get_other_url(){//add by shanmao.me 20150907
		$url = C("other_url").'&timestamp='.$_GET["timestamp"].'&nonce='.$_GET["nonce"].'&signature='.$this->makecheckSignature(C("other_token"));	
		return $url;
	}
    
    protected function makecheckSignature($token)
{//add by shanmao.me 20150907
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];	
        		
	//$token = TOKEN;
	$tmpArr = array($token, $timestamp, $nonce);
	sort($tmpArr, SORT_STRING);
	$tmpStr = implode( $tmpArr );
	$tmpStr = sha1( $tmpStr );
	return $tmpStr;
	if( $tmpStr == $signature ){
		return true;
	}else{
		return false;
	}
}


public function curlpxml($post_url,$xml){//php post
	$ch = curl_init($post_url);
	curl_setopt($ch, CURLOPT_USERAGENT,$this->useragent());
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
	curl_setopt($ch, CURLOPT_POSTFIELDS,$xml);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array(
	'Content-Type: text/xml'
	));
	$respose_data = curl_exec($ch);
	//curl_close($ch);
	return $respose_data;
	}	
	

}
?>