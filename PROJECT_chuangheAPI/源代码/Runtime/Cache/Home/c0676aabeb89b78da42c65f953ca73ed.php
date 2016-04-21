<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="telephone=no" name="format-detection" />
<title><?php echo ($media["title"]); ?></title>
<meta name="keywords" content="<?php echo ($media["keywords"]); ?>" />
<meta name="description" content="<?php echo ($media["description"]); ?>" />
<meta name="applicable-device" content="mobile">
<link href="css/common.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/jquery.glide.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
</head>
<body>

<div id="wrap">

  <div id="header">
    <div class="ytimg"><img src="images/2.png" class="img" /><img src="<?php echo service("DuxCms","Label","fragment",array("app"=>"DuxCms","label"=>"fragment","mark"=>"ewmurl",)); ?>" class="erweima" /></div>
  </div>
  
  <div id="mainer">
    
    <div class="ycode"><span>邀请码<br><?php if(!$uid) echo '登陆后生成邀请码'; echo ($uid); ?></span><img src="images/codebg.png" /></div>
    
    <div class="ynav">
      <ul id="yaoqa">
        <li><a href="<?php echo U('Home/Index/index2');?>">分享文章赚佣金</a></li>
        <li><a href="javascript:;" onClick="$('#mcover').show()">推荐好友关注</a></li>
        <div class="clear"></div>
      </ul>
    </div>

    <div class="yhelpt"><img src="images/helpt.png" /></div>
    
    <div class="ibtn1"><a href="<?php echo U('Home/Index/index');?>">回首页</a></div>
  
  </div>
  
   <!--#include file="footer.html"-->
  
  <div class="help_box">
    <div class="help_con">
    <p>关于分享赚佣金~</p>
    <p>1.邀请好友关注公众号，可获得积分和现金</p>
    <p>2.分享文章可赚取佣金，佣金可提现</p>
	 <p>3.提现根据规则立即到账或者审核到账</p>
    </div>
    <div class="yhelpc">[关闭]</div>
  </div>

</div>
<div id="mcover" onClick="$(this).hide()" style="display: none;"> <img src="images/guide.png"> </div>
  
<script>
var type = '<?php echo ($type); ?>';
if(type==1){
var stitle = '只要分享文章获得佣金';
var sdesc = '只要分享文章获得佣金。';
}else{
var stitle = '<?php echo ($yqname); ?>发现一个很不错的微信！';
var sdesc = '<?php echo C("site_subtitle"); ?>';
}
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
    link: 'http://'+window.location.host+'<?php echo U("Home/User/yaoqing",array("u"=>$uid,"fx"=>1));?>', // 分享链接  window.location.href
    imgUrl: 'http://'+window.location.host+'<?php echo service("DuxCms","Label","fragment",array("app"=>"DuxCms","label"=>"fragment","mark"=>"ewmurl",)); ?>', // 分享图标
    success: function () { 
        // 用户确认分享后执行的回调函数
		//alert(1111);
		//fxfunc();
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
    link:  'http://'+window.location.host+'<?php echo U("Home/User/yaoqing",array("u"=>$uid,"fx"=>1));?>', // 分享链接
    imgUrl: 'http://'+window.location.host+'<?php echo service("DuxCms","Label","fragment",array("app"=>"DuxCms","label"=>"fragment","mark"=>"ewmurl",)); ?>', // 分享图标
    type: 'link', // 分享类型,music、video或link，不填默认为link
    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
    success: function () { 
        // 用户确认分享后执行的回调函数
		//fxfunc();
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
  
function removeHTMLTag(str) {
            str = str.replace(/<\/?[^>]*>/g,''); //去除HTML tag
            str = str.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
            //str = str.replace(/\n[\s| | ]*\r/g,'\n'); //去除多余空行
            str=str.replace(/&nbsp;/ig,'');//去掉&nbsp;
            return str;
    }  
  
</script> 




<!--<script>
$("#yaoqa li a").click(function(){
	var aindex = $(this).index();
	$("#yqtype").val(aindex+1);
	alert("点击右上角分享给朋友");
})
</script>-->
</body>
</html>