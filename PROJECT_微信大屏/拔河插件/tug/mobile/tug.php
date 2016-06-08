<!DOCTYPE html>
<html>
<head>
<title><?=$bhconf['title']?></title>
<meta charset="utf-8">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<meta name="format-detection" content="telephone=no"/>
<link href="./style/css/tug_show.css" rel="stylesheet" type="text/css" />
<link href="./style/transition.min.css" rel="stylesheet" type="text/css" />
<link href="./style/css/tug_mobile.css" rel="stylesheet" type="text/css" />


<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<script src="./style/transition.min.js"></script>

<script>


//剩余时间
var starttime=500000;
//开始倒计时


// 定义摇动的幅度
var SHAKE_THRESHOLD = <?=$bhconf['threshold']?>;
// 摇动的次数/时间(秒)
var SHAKE_TIMES = 200;
// 定义摇动的时间间隔
var SHAKE_SPACE = 100;
// 计数器
var count = 0;
// 上一次提交的计数器
var last_count = -1 ;
// 定义一个变量保存上次更新的时间
var last_update = 0;

var x;
var y;
var z;
var last_x;
var last_y;
var last_z;
var loadtime=0;
//倒计时方法
function TimerStart(sec,TextID)
{
    var endTime = new Date().getTime() + sec + 100;
    function interval()
    {
      var n=(endTime-new Date().getTime())/1000;
		
        if (n<1) {
			n=0;
			return;
		}
        if(TextID && TextID!=""){document.getElementById(TextID).innerHTML = parseInt(n)+'秒后开始！';}		
        setTimeout(interval, 100);
    }
	interval();
}

//倒计时开始摇
function readyshake(){
	if (window.DeviceMotionEvent) {
　　　　// 移动浏览器支持运动传感事件
　　　　window.addEventListener('devicemotion', deviceMotionHandler, false);
　　　　$("#yaoyiyaoyes").show();
		$("#nostart").hide();
		$("#Percentage").show();
　　} else{
　　　　// 移动浏览器不支持运动传感事件
　　　　$("#yaoyiyaono").show();
　　} 

}
//初始化方法
function init(){
	if (window.DeviceMotionEvent) {
　　　　// 移动浏览器支持运动传感事件
　　　　window.addEventListener('devicemotion', deviceMotionHandler, false);
　　　　$("#yaoyiyaoyes").show();
		$("#nostart").hide();
		$("#Percentage").show();
　　} else{
　　　　// 移动浏览器不支持运动传感事件
　　　　$("#yaoyiyaono").show();
　　} 	
　　
}

//震动监听
function deviceMotionHandler(eventData) {
	
　　// 获取含重力的加速度
　　var acceleration = eventData.accelerationIncludingGravity; 
// 获取当前时间
　　var curTime = new Date().getTime(); 
　　var diffTime = curTime -last_update;
　　// 固定时间段{$yyy['shaketype']}

　　if (diffTime > SHAKE_SPACE) {
　　　　last_update = curTime; 

　　　　x = acceleration.x; 
　　　　y = acceleration.y; 
　　　　z = acceleration.z; 
　　　　<?php if($bhconf['shaketype']=='1'){?>
　　　　var speed = Math.abs(x - last_x) / diffTime * 10000; 
　　　　<?php }else if($bhconf['shaketype']=='2'){ ?>
　　　　   var speed = Math.abs(y - last_y) / diffTime * 10000;
　　　　<?php }else{ ?>
　　　　    var speed = Math.abs(y + z - last_x - last_y - last_z) / diffTime * 10000;
　　　　<?php } ?>
		
　　　　//var speed = Math.abs(x + y + z - last_x - last_y - last_z) / diffTime * 10000; 
        
　　　　if (speed > SHAKE_THRESHOLD) { 
　　　　    $('.shake-pic').transition('shake');
　　　　　　// TODO:摇一摇之后所要进行的数据逻辑操作
　　　　　　
　　　　　　$("#yaoyiyaoyes").hide();
　　　　　　$("#yaoyiyaoresult").show();
　　　　　　
			count++;
			
			$("#yaoyiyaoresult").html("加油!第" + count + "次了！");
　　　　}
		
		last_x = x; 
		last_y = y; 
		last_z = z; 
	} 
} 

//2秒更新一次数据
function  updata(){
	if(last_count<count){
		$.post("getdata.php?type=Mobile&do=postjson", {ucount: count }, function(data){
		    if(data=='end'){
		        window.location.reload();
		    }
		});
		last_count=count;
	}
	setTimeout('updata()',3000);

}

//电脑上测试用
function testshade(){
	$("#nostart").html(count)
	$("#yaoyiyaoresult").html("加油!第" + count + "个了！");
		count++;
		
		
}


$(document).ready(function(){
	getstartime()
	TimerStart(loadtime,'lefttime');
});
//尽可能屏弊按扭,避免误操作退出
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	WeixinJSBridge.call('hideOptionMenu');
	WeixinJSBridge.call('hideToolbar');
});
function getstartime(){
	 $.get("getdata.php?type=Mobile&do=startime",function(data){
		//alert("Data: " + data + "\nStatus: " + status);
		var stime= parseInt(data);
		if (stime<6){
			loadtime=stime*1000;
			if(count==0){
				setTimeout('updata()',loadtime);
				setTimeout('init()',loadtime);
			}else{
				init();
				updata();
			}
			return ;
		}else{
			setTimeout('getstartime()',5000);
		}
	});
	
	
}
getstartime();
</script>
<style>
@font-face {  font-weight:bold; font-style: normal;  }

/* Common Style */
*{margin:0;padding:0;}
input,select{font-size:12px;line-height:16px;}
h1,h2,h3,h4,h5,h6{font-size:100%;font-weight:normal;} q:before,q:after{content:'';}
.clear{clear:both;display:block;float:none;font-size:0;margin:0;padding:0;overflow:hidden;visibility:hidden;}
img{border:0;}
p{ line-height:20px;}
ul,li{list-style-type:none;}
a{color:#ccc; text-decoration:none;}
a:hover{color:#ccc;text-decoration:underline; }

.radius{-moz-border-radius: 3px; -webkit-border-radius: 3px; border-radius:5px;}
.red{ color:#990000}

#Percentage{
	width: 100%;
	height: 30px;
	margin-top: 6px;
	margin-bottom: 12px;
	float: left;
	border-radius: 5px;
	border: 1px solid #ed5470;
	display:none;
	clear:both;
}
#tage {
	height: 30px;
	background: #ed5470;
	border-radius: 5px;
	clear:both;
	text-align:right;
	color:#fff;
	-webkit-background-size: 30px 30px;
	-moz-background-size: 30px 30px;
	background-size: 30px 30px;
	background-image: -webkit-gradient(linear, left top, right bottom, color-stop(.25, rgba(255, 255, 255, .15)), color-stop(.25, transparent), color-stop(.5, transparent), color-stop(.5, rgba(255, 255, 255, .15)), color-stop(.75, rgba(255, 255, 255, .15)), color-stop(.75, transparent), to(transparent));
	background-image: -webkit-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: -moz-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: -ms-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: -o-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	-webkit-animation: animate-stripes 3s linear infinite;
	-moz-animation: animate-stripes 3s linear infinite;
}

/*---------------------------*/		
		
#stripes {
	-webkit-background-size: 30px 30px;
	-moz-background-size: 30px 30px;
	background-size: 30px 30px;
	background-image: -webkit-gradient(linear, left top, right bottom, color-stop(.25, rgba(255, 255, 255, .15)), color-stop(.25, transparent), color-stop(.5, transparent), color-stop(.5, rgba(255, 255, 255, .15)), color-stop(.75, rgba(255, 255, 255, .15)), color-stop(.75, transparent), to(transparent));
	background-image: -webkit-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: -moz-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: -ms-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: -o-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	-webkit-animation: animate-stripes 3s linear infinite;
	-moz-animation: animate-stripes 3s linear infinite;
}
 @-webkit-keyframes animate-stripes {
	0% {
		background-position: 0 0;
	}
	100% {
		background-position: 60px 0;
	}
}
 @-moz-keyframes animate-stripes {
	0% {
		background-position: 0 0;
	}
	100% {
		background-position: 60px 0;
	}
}
/*---------------------------*/	 

</style>
</head>
<body>

<div class="shake-main">
	<div class="shake-pic"></div>
	<div class="mobile-content">
	</div>
</div>
	
<div class="mobile-box img-rounded">
	<div id="yaoyiyaono" style="font-size:20px;margin:10px;line-height:35px;display:none;">您该换手机啦！！！</div>
	<div id="yaoyiyaoyes" style="font-size:20px;margin:10px;line-height:50px;display:none;">快与你的小伙伴摇摇摇。</div>
	<div id="yaoyiyaoresult" style="font-size:20px;margin:10px;line-height:50px;display:none;"></div>
	<div id='nostart'><span id='lefttime'>等待大屏开始</span></div>
</div>

<div class="footer">
    <?=$bhconf['footer']?>
</div>



</body>
</html>