<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta name="keywords" content="关注公众号">
<meta name="description" content="描述">

<style>
body,html,a,img,div,form,select,input,ul,ol,ul,li,h1,h2,h3,h4,h5,h6,dd,dl,dt,p,label,em,span{margin:0;padding:0;-webkit-tap-highlight-color:rgba(0,0,0,0)}
body{font-size:12px;font-family:'Microsoft YaHei', sans-serif; color:#666}
a{color:#666;*color:#666;text-decoration:none}
a:hover{text-decoration:none;color:#ff4a00}
ol,ul,li{list-style:none}
em,i{font-style:normal}
img{border:none;vertical-align:middle;}
.fl { float:left}
.fr { float:right}
.cb { clear:both}
 
 body,html,.huanse { height:100%}
 .cs {min-width:320px;margin:0 auto; max-width: 640px; overflow: hidden; }

.huanse{background: #fcc803 ;min-height: 562px;}
.row {width: 100%;margin: 10px 0px;padding: 0px; text-align: center;}
.wyzq { width: 200px; padding: 8px 0px; background: #bd2821; color: #fff; text-align: center;font-size: 18px; margin: auto; display:block; border-radius: 25px; -webkit-appearance: none;
border: none;outline: none; cursor: pointer;}
.wyzq:hover {color:#fff;}
.bold p { font-weight: bold; line-height: 30px; font-size: 16px;}
.bold p span { color: #f62f34}
.pb50px { padding-bottom: 50px;}	
.piaofu_top {line-height: 30px; position: fixed; top: 0px; right: 0px;background: #fff;width: 100%; display: none; text-align: center;font-size: 18px;color: #fa3137;z-index: 99;}
.new_yaoq {width: 80%;
    display: block;
    text-align: center;
    line-height: 40px;
    border-radius: 30px;
    font-size: 18px;
    margin-top: 15px;
    color: white;
    margin: 15px auto;
    background: #ee0202;
}
.app_new { margin:30px;padding: 10px 0px; }
 </style>


<title>关注公众号</title>
</head>

<body class=" huanse">
  <div class="cs">
  <div class="piaofu_top" id="piaofu_top">
  	<a class="fl" onclick="document.getElementById('piaofu_top').style.display='none'">&nbsp;<img src="images/webwxgetmsgimg.jpg" style="width: 30px;">&nbsp;</a>
  	<a class="fr"><img src="images/webwxgetmsgimg1.jpg" style="width: 30px;">&nbsp;&nbsp;</a>
  	我要赚钱
  </div>

  <div class="app_new">
  
  <div style="font-size:18px;font-weight:bold;line-height:30px;color:#fa3137; text-align: center;margin-top: 10px;width:90%; margin: auto;">收到来自您的好友<br>【<?php echo ($username); ?>】的红包<br>￥<?php echo C('gzsmoney');?>元请尽快领取！</div>
  <div class="row"> 
   <img src="<?php echo ($ticketimg); ?>" width="180">
  </div>
  <div  class="row">
		<div style="font-size:14px;font-weight:bold;line-height:30px;color:#000; text-align: center;margin-top: 10px; margin: auto;">"微信扫描/长按上面图片，识别二维码"</div>
		<!-- div style="line-height:30px;"> 您也可以在微信中，搜索以下微信号关注即可 </div>
		<div style="font-size:28px;font-weight:bold;line-height:60px;color:#000000"><span style="border:1px dashed #000000;padding:5px 10px"><?php echo C('gzhcode')? C('gzhcode') : 'wanz1840' ?></span></div>
		<div style="line-height:30px;">长按虚线框，拷贝微信号</div-->
  </div>
</div>
  <div class="row"> 
  <?php if($iswx != 1): ?><a class="new_yaoq" onclick="window.location.href='<?php echo U("Home/Public/reg");?>'"  style="    bottom: 90px;">手机号注册</a><?php endif; ?>
 <a  class="new_yaoq" onclick="alert('尽请期待！');" >下载app</a>
  
<!--  <a class="wyzq" onclick="document.getElementById('piaofu_top').style.display='block'" >我要赚钱</a>-->
   </div>
  



 </div>

</body>
</html>