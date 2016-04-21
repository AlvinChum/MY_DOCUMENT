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
<meta name="keywords" content="<?php echo ($title); ?>">
<meta name="description" content="<?php echo ($title); ?>">


<title>来自<?php echo ($title); ?>的礼物</title>
<style>
body,html,a,img,div,form,select,input,ul,ol,ul,li,h1,h2,h3,h4,h5,h6,dd,dl,dt,p,label,em,span{margin:0;padding:0;-webkit-tap-highlight-color:rgba(0,0,0,0)}
body{font-size:14px;font-family:'Microsoft YaHei', sans-serif; color:#666}
a{color:#666;*color:#666;text-decoration:none}
a:hover{text-decoration:none;color:#ff4a00}
ol,ul,li{list-style:none}
em,i{font-style:normal}
img{border:none;vertical-align:middle;}
.fl { float:left}
.fr { float:right}
.cb { clear:both}
 body,html { height:100%}


 .cs {min-width:320px;margin:0 auto; max-width: 640px; overflow: hidden; }
.touxian {width: 18%;position: absolute;right: 41%;margin-left: -7%;bottom: 0px;border-radius: 50%;}
.wyzq { width: 200px;height: 44px;
    line-height: 44px; background: #bd2821; color: #fff; text-align: center;font-size: 18px; margin: auto; display:block; border-radius: 5px; -webkit-appearance: none;
border: none;outline: none; cursor: pointer;}
.wyzq:hover {color:#fff;}
.mt10 { margin-top: 15px }
.mt20 { margin-top: 20px }
.kankan { background: #ededed; line-height: 40px; font-size: 16px; color: #919191; padding: 0px 10px;}
 .inline_block{ display:block;}
.yig {margin: 0px 15px; border-bottom: #dedede solid 1px;max-height: 116px;overflow: hidden; }
.touxian_2 { width: 45px;border-radius: 50%;}
.piaofu_top {line-height: 30px; position: fixed; top: 0px; right: 0px;background: #fff;width: 100%; display: none; text-align: center;font-size: 18px;color: #fa3137;z-index: 99;}
  .new_yaoq {    width: 196px; margin: auto; display: block; text-align: center; line-height: 40px; border: #FF0000 solid 2px; border-radius: 4px; font-size: 18px; margin-top: 15px;} 
.new_yaoq span { color: red}
  </style>

<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
</head>

<body>

<!-- 黑洞 -->
  <div class="cs">
  <div class="piaofu_top" id="piaofu_top">
    <a class="fl" onclick="document.getElementById('piaofu_top').style.display='none'">&nbsp;<img src="images/webwxgetmsgimg.jpg" style="width: 30px;">&nbsp;</a>
    <a class="fr"><img src="images/webwxgetmsgimg1.jpg" style="width: 30px;">&nbsp;&nbsp;</a>
    点击右上角发给朋友收徒
  </div>
  <div style="position: relative;padding-bottom: 10px;">
     <img src="images/mmexport1438848598982.jpg" width="100%">
    <a href="<?php echo U('Home/Index/index3');?>" ><img src="<?php echo ((isset($puinfo["avatar"]) && ($puinfo["avatar"] !== ""))?($puinfo["avatar"]):'/Public/img/no_picture.gif'); ?>" class="touxian"></a>
    
  </div>
<!--  <p style="color:#333; line-height:30px;text-align: center;font-weight: bold; font-size:16px;"><?php echo ((isset($puinfo["user_nicename"]) && ($puinfo["user_nicename"] !== ""))?($puinfo["user_nicename"]):'来自赚客'); ?>的邀请</p>-->
  <span class="new_yaoq">邀请码：<span><?php echo ($uinfo["id"]); ?></span></span>
  <a href="/" class="wyzq mt10">我也要赚钱</a>
  <a class="wyzq mt20" onclick="document.getElementById('piaofu_top').style.display='block'" >我要收徒拿奖励</a>
  <div class="kankan mt20">
  	看看都有谁在玩...
  </div>
   
   <?php if(is_array($ulist)): foreach($ulist as $key=>$vo): ?><div class="yig" >
   	<div class="inline_block" style="width:60px;text-align: center; float:left;line-height: 104px;"><img src="<?php echo ($vo["avatar"]); ?>" class="touxian_2"></div>
   	<div class="inline_block" style="padding:45px 0px 0px 5px; color:#333; float:right;text-align: center;"><?php echo ($vo["historymoney"]); ?>元</div>
   	<div class="inline_block" style=" color:#666; font-size:16px;line-height: 20px;padding:22px 0px 20px 0px;">
   	<p style=" color:#000; font-size:16px"><?php echo ($vo["user_nicename"]); ?><br><span style="font-size:12px; color:#666"><?php echo (date("y-m-d H:i",$vo["last_login_time"])); ?></span></p>
    <p style=" color:#333; font-size:12px;"><?php echo ($vo["kk"]); ?></p>
   	</div>
   </div><?php endforeach; endif; ?>

  
  
  
  
  </div>
<br><br>


<script>
	
	
var links = '<?php echo U("Home/Huodong/fxhb",array("u"=>$uinfo[id]));?>';
var fullimgurl = '<?php echo ($uinfo["avatar"]); ?>';
var stitle = '来自<?php echo ($uinfo["user_nicename"]); ?>的礼物';
var fulllink = window.location.href;
//'http://'+window.location.host+links;	
var sdesc = '<?php echo ($sdesc); ?>';	

wx.config({
    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: '<?php echo ($appid); ?>', // 必填，公众号的唯一标识
    timestamp: '<?php echo ($timestamp); ?>', // 必填，生成签名的时间戳
    nonceStr: '<?php echo ($nonceStr); ?>', // 必填，生成签名的随机串
    signature: '<?php echo ($signature); ?>',// 必填，签名，见附录1
    jsApiList: ['onMenuShareTimeline','onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});
	
wx.ready(function(){
//alert(window.location.href)

wx.onMenuShareTimeline({
    title: stitle, // 分享标题
    link: fulllink, // 分享链接  window.location.href
    imgUrl:fullimgurl, // 分享图标
    success: function () { 
        // 用户确认分享后执行的回调函数
		//alert(1111);
		//fxfunc('all');
    },
    cancel: function () { 
        // 用户取消分享后执行的回调函数
		//alert("您取消了分享");
		//alert(window.location.href)
    }
});



wx.onMenuShareAppMessage({
    title: stitle, // 分享标题
    desc: sdesc, // 分享描述
    link: fulllink, // 分享链接  window.location.href
    imgUrl: fullimgurl, // 分享图标
    type: 'link', // 分享类型,music、video或link，不填默认为link
    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
    success: function () { 
        // 用户确认分享后执行的回调函数
		//fxfunc('one');
    },
    cancel: function () { 
	//alert(stitle);
	//alert(window.location.href)
	//alert("您取消了分享");
        // 用户取消分享后执行的回调函数
    }
});
    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
});
</script>


</body>
</html>