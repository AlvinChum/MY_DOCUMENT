<?php
namespace Home\Controller;
use Home\Controller\SiteController;


class Api2Controller extends SiteController {
	
		public function geturl(){
		if(strstr("http://",S("appurl"))){
			exit(S("appurl"));
		}			
		S("appurl",C("appurl"));
		exit(C("appurl"));
	}
	
	public function get_android_cid(){
		dump($_POST);
		S("testfdsf",$_POST);
	}
	
	public function get_ios_cid(){
		dump($_POST);
		S("testfdsfios",$_POST);
	}
	
	public function get_android_wx(){
		if($_GET['appid'])
		$data["wxappid"]=C('wx_appid');
		$data["wxappsecret"]=C('wx_secretid');
		$data["qqappid"]=C('qq_appid')?C('qq_appid'):'100424468';
		$data["qqappsecret"]=C("qq_secretid")?C("qq_secretid"):'c7394704798a158208a74ab60104f0ba';
		exit(json_encode($data));
		
		
	}
	
	public function log(){
		dump(S("testfdsf"));
		dump(S("testfdsfios"));
		
	}


	public function sendimg($file){ //上传到微信服务器。返回url
	return ;
		$filepath = getcwd().$file;
		$url = "https://api.weixin.qq.com/cgi-bin/media/uploadimg?access_token=".A("Home/Weixin")->accesstoken();
		$re = A("Home/Weixin")->uploadMedia($url,$filepath);
		$re2 = json_decode($re,true);
		return $re2['url'];
		//dump();
	}
	
	public function sendAndroidUnicast() {
		require_once(ROOT_PATH . 'umeng_php_sdk/notification/android/AndroidBroadcast.php');
		require_once(ROOT_PATH . 'umeng_php_sdk/notification/android/AndroidFilecast.php');
		require_once(ROOT_PATH . 'umeng_php_sdk/notification/android/AndroidGroupcast.php');
		require_once(ROOT_PATH . 'umeng_php_sdk/notification/android/AndroidUnicast.php');
		require_once(ROOT_PATH . 'umeng_php_sdk/notification/android/AndroidCustomizedcast.php');
		try {
			$unicast = new \AndroidUnicast();
			$unicast->setAppMasterSecret("dpuvigi05kwmr6vvwfgl5gqaktwnku2d");
			$unicast->setPredefinedKeyValue("appkey",           "567e282c67e58e2495000474");
			$unicast->setPredefinedKeyValue("timestamp",        strval(time()));
			// Set your device tokens here
			$unicast->setPredefinedKeyValue("device_tokens",    "Ajjj1ooivNZU7bgl7LHa6_q_g9BQ_xA4wEAaFtMEtNYe"); //Ajjj1ooivNZU7bgl7LHa6_q_g9BQ_xA4wEAaFtMEtNYe
			$unicast->setPredefinedKeyValue("ticker",           "Android unicast ticker");
			$unicast->setPredefinedKeyValue("title",            "Android unicast title");
			$unicast->setPredefinedKeyValue("text",             "Android unicast text");
			$unicast->setPredefinedKeyValue("after_open",       "go_app");
			// Set 'production_mode' to 'false' if it's a test device. 
			// For how to register a test device, please see the developer doc.
			$unicast->setPredefinedKeyValue("production_mode", "true");
			// Set extra fields
			$unicast->setExtraField("test", "helloworld");
			//print("Sending unicast notification, please wait...\r\n");
			$unicast->send();
			//print("Sent SUCCESS\r\n");
		} catch (Exception $e) {
			print("Caught exception: " . $e->getMessage());
		}
	}
	
	public function sendAndroidGroupcast($para=array()){
		require_once(ROOT_PATH . 'umeng_php_sdk/notification/android/AndroidBroadcast.php');
		require_once(ROOT_PATH . 'umeng_php_sdk/notification/android/AndroidFilecast.php');
		require_once(ROOT_PATH . 'umeng_php_sdk/notification/android/AndroidGroupcast.php');
		require_once(ROOT_PATH . 'umeng_php_sdk/notification/android/AndroidUnicast.php');
		require_once(ROOT_PATH . 'umeng_php_sdk/notification/android/AndroidCustomizedcast.php');
		try {
			/* 
		 	 *  Construct the filter condition:
		 	 *  "where": 
		 	 *	{
    	 	 *		"and": 
    	 	 *		[
      	 	 *			{"tag":"test"},
      	 	 *			{"tag":"Test"}
    	 	 *		]
		 	 *	}
		 	 */
			$filter = 	array(
							"where" => 	array(
								    		"and" 	=>  array(
								    						array(
							     								"tag" => $para['tagname']
															)
								     		 			)
								   		)
					  	);
					  
			$groupcast = new \AndroidGroupcast();
			$groupcast->setAppMasterSecret("dpuvigi05kwmr6vvwfgl5gqaktwnku2d");
			$groupcast->setPredefinedKeyValue("appkey",           "567e282c67e58e2495000474");
			$groupcast->setPredefinedKeyValue("timestamp",        strval(time()));
			// Set the filter condition
			$groupcast->setPredefinedKeyValue("filter",           $filter);
			$groupcast->setPredefinedKeyValue("display_type",       "notification");	
			$groupcast->setPredefinedKeyValue("ticker",           "Android groupcast ticker");
			$groupcast->setPredefinedKeyValue("title",            $para['android_group_title']);
			$groupcast->setPredefinedKeyValue("text",             $para['android_group_text']);
			
			$groupcast->setPredefinedKeyValue("after_open",       "go_activity");
			$groupcast->setPredefinedKeyValue("activity",      "com.shanmao.MainActivity");	
			// Set 'production_mode' to 'false' if it's a test device. 
			// For how to register a test device, please see the developer doc.
			$groupcast->setPredefinedKeyValue("production_mode", "true");
			$groupcast->setExtraField("url",      $para['android_group_url']);
			//print("Sending groupcast notification, please wait...\r\n");
			return $groupcast->send();
			//print("Sent SUCCESS\r\n");
		} catch (Exception $e) {
			print("Caught exception: " . $e->getMessage());
		}
	}
	
	public function sendAndroidGroupcastByAdmin(){
		$para['tagname'] = I('post.android_tagname');
		$para['android_group_title'] = I('post.android_group_title');
		$para['android_group_text'] = I('post.android_group_text');
		$para['android_group_url'] = I('post.android_group_url');
		$re = $this->sendAndroidGroupcast($para);
		echo $re;
	}

}
?>