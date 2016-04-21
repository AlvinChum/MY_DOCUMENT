<?php

// 定义应用目录
define('BIND_MODULE','Pay');
define('APP_PATH','./Application/');
define('APP_DEBUG',true);

// 定义运行时目录
define('RUNTIME_PATH','./Runtime/');

require './ThinkPHP/ThinkPHP.php';






/*
require_once "./WxpayAPI_php_v3/lib/WxPay.Api.php";
require_once './WxpayAPI_php_v3/lib/WxPay.Notify.php';
require_once './WxpayAPI_php_v3/example/log.php';

//初始化日志
$logHandler= new CLogFileHandler("./paylog/".date('Y-m-d').'.log');
$log = Log::Init($logHandler, 15);


Log::DEBUG("begin notify");
$notify = new PayNotifyCallBack();
$re = $notify->Handle(false);
Log::DEBUG($GLOBALS['HTTP_RAW_POST_DATA']);

*/



	$data = $GLOBALS["HTTP_RAW_POST_DATA"];
	
	//S("logfee",$data);
	/*$data = 'string(827) "<xml><appid><![CDATA[wx0a702703ef19cd2b]]></appid>
<attach><![CDATA[系统充值]]></attach>
<bank_type><![CDATA[CFT]]></bank_type>
<cash_fee><![CDATA[1]]></cash_fee>
<fee_type><![CDATA[CNY]]></fee_type>
<is_subscribe><![CDATA[Y]]></is_subscribe>
<mch_id><![CDATA[1251521901]]></mch_id>
<nonce_str><![CDATA[wnnuy9xzpepsue674okl48flsez47oap]]></nonce_str>
<openid><![CDATA[oFV_Ut-mQYP-tkOcDyVGGjG2Gpxc]]></openid>
<out_trade_no><![CDATA[125152190120151020171208]]></out_trade_no>
<result_code><![CDATA[SUCCESS]]></result_code>
<return_code><![CDATA[SUCCESS]]></return_code>
<sign><![CDATA[F4728AAE05C5ECF55824B4103F9509B8]]></sign>
<time_end><![CDATA[20151020171216]]></time_end>
<total_fee>1</total_fee>
<trade_type><![CDATA[JSAPI]]></trade_type>
<transaction_id><![CDATA[1007150314201510201267920991]]></transaction_id>
</xml>';*/
	
	//exit;
	
	$rexml = '<xml>
  <return_code><![CDATA[SUCCESS]]></return_code>
  <return_msg><![CDATA[OK]]></return_msg>
</xml>';
	
	        if (!empty($data)) {//接收消息并处理
            $xml = (array)simplexml_load_string($data, 'SimpleXMLElement', LIBXML_NOCDATA);
           $orderid = $xml['out_trade_no'];
           $fee = $xml['total_fee'];
           $openid1 = $xml['openid'];
           $nonce_str = $xml['nonce_str'];
           $transaction_id = $xml['transaction_id'];
           if($xml['result_code']=="SUCCESS"){
           		$w['out_trade_no']=$orderid;
           		$w['nonce_str']=$nonce_str;
           		//$w['openid']=$openid1;
		   		$re = M("chongzhi_log")->where($w)->find();
		   		$_SESSION['log']=$re;
		   		if($re){
					if($re['fee']==$fee/100){
						//$data=array();
						$data2['status']=1;
						//$data2['openid']=$openid1;
						$data2['transaction_id']=$transaction_id;
						$re2= M("chongzhi_log")->where("id=".$re['id'])->save($data2);						
						if($re2){
							if($re['user_rank']){
								$re3 = M("Users")->where("id=".$re['uid'])->save(array('user_rank'=>$re['user_rank']));
								if($re3){
									//购买会员成功
									//更新缓存
									//$site = new \Home\Controller\SiteController();
									//A('Home/Site')->setUserinfo('user_rank', $re['user_rank']);
									/*$re4 = M("Users")->where("id=".$re['uid'])->find();
									if($re4['parent_id']>0)	$user_rank =  M('Users')->where('id='.$re4['parent_id'])->getField('user_rank');
									if($user_rank){
										//如果上一级有会员等级，获得返利
										$rank_data = S('user_rank');
										$ryq_money = $rank_data[$user_rank]['p1_money'];
										$desc="邀请好友购买VIP获得返利";
										A("Home/Site")->changemoney($ryq_money,8,$desc,$re4['parent_id'],1);
									}*/
									//S("rank", array("user_rank"=>$re['user_rank']));
									//循环判断三层上级
									$nicename = M('users')->where('id='.$re['uid'])->getField('user_nicename');
									$row['uid']=$re['uid'];									
									for($i=1; $i<=3; $i++){	
										$row = M("Users")->field('parent_id as uid')->where("id=".$row['uid'])->find();									
										if($row['uid']>0)	{								
											//存在上级											
											$user_rank =  M('Users')->where('id='.$row['uid'])->getField('user_rank');
											if($user_rank && ($user_rank >= $re['user_rank'])){
												//上级有会员等级,且不低于当前用户等级
												$rank_data = S('user_rank');
												$ryq_money = $rank_data[$user_rank]['p'.$i.'_money'];
												$desc="您的".$i."级粉丝[".$nicename."],购买VIP".$re['user_rank']."获得返利";
												A("Home/Site")->changemoney($ryq_money,8,$desc,$row['uid'],1);
											}
											
										} else { break;}
									}
								//	A('Home/Site')->setUserinfo('user_rank', $re['user_rank']);
								S('buy_urank'.$re['uid'],$re['user_rank']);
								}
								
							}else{
								$data3['wbfee']=array('exp','wbfee+'.$re['ufee']);
								M("Users")->where("id=".$re['uid'])->save($data3);
							}
							exit($rexml);
						}
					}
				}
		   }
	  }




?>