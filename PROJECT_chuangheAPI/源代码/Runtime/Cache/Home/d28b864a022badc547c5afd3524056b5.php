<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>个人中心</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="css/index.css" media="all">
    <style>
    .new-header {width: 100%; height: 75px; line-height: 75px; background: #e12634; position: relative; border-bottom: 1px solid #fff; }
    .new-header a {margin: 0 auto; height: 100%; }
    .new-gonggao {width: 100%; height: 35px; /*padding: 10px 0;*/ background: #e12634; position: relative; border-bottom: 1px solid #fff; }
    .new-goonggao a {margin: 0 auto; height: 100%; }
        @media screen and (max-width:640px) {
            .new-header {width: 100%; line-height: 40px; background: #e12634; height: 40px; }
            .new-header img {height: 100%; }
        }
    .STYLE1 {color: #FFFFFF;margin-right: 15px;}
    #scroll_begin,#scroll_end{display:inline}
    .qimo8{ overflow:hidden;width: 70%; margin: auto;}
    .qimo8 .qimo {/*width:99999999px;*/width:8000%; height:30px;}
    .qimo8 .qimo div{ float:left;}
    .qimo8 .qimo ul{float:left; height:34px; overflow:hidden; zoom:1; }
    .qimo8 .qimo ul li{float:left; line-height:35px; list-style:none;color: #fff;font-size: 16px;margin-right: 100px;}
    .qimo8 li a{margin-right:10px;color:#444444;}
    </style>
 
</head>
<body>
    <header> 
        <div class="new-header">
            <a href="<?php echo U('Home/Index/index3');?>" style="color: #fff; font-size:18px"><?php echo C('site_title'); ?></a>
        </div>
    </header>
    <div class="money" style="overflow:hidden;">
        <p><?php if($uinfo['user_rank'] > 0): ?>(VIP<?php echo ($uinfo["user_rank"]); ?>)<?php endif; ?>会员UID <big><?php echo ($uinfo["id"]); ?></big>的收益余额 </p>
        <div class="balance" style="width:40%; margin-left:10px; float:left; text-align:center;font-size:38px;"><?php echo ((isset($usinfo["money"]) && ($usinfo["money"] !== ""))?($usinfo["money"]):"0"); ?><span style="font-size:16px;">元</span></div>
        <div style="width:40%;float:right;text-align:right; margin-right:10px;"><img src="images/qiandao.png"  onclick="qiandao()"></div>
    </div>
    <div class="detailed">
        <div class="left">
            <p>
                个人累计收益（元）
            </p>
            <p>
                <?php echo ((isset($usinfo["historymoney"]) && ($usinfo["historymoney"] !== ""))?($usinfo["historymoney"]):"0"); ?>元
            </p>
            <p>
                <a href="<?php echo C('subscribeurl'); ?>">收藏平台</a> </p>
        </div>
        <div class="right">
            <p>
                邀请累计收益（元）
            </p>
            <p>
                <?php echo ((isset($usinfo["fansmoney"]) && ($usinfo["fansmoney"] !== ""))?($usinfo["fansmoney"]):"0"); ?>元
            </p>
            <p>
                <a id="out" href="<?php echo U('Home/Public/dologout');?>">注销</a>
            </p>
        </div>
    </div>
    
    <!--左右滚动 20151022 hd-->
   <div class="new-gonggao">  
   <div id="demo" class="qimo8">
  <div class="qimo">
    <div id="demo1">
      <ul>
        <li> <?php echo C('newsubscribeurl'); ?></li>
      </ul>
    </div>
    <div id="demo2"></div>
  </div>
</div>
</div>
<script type="text/javascript">
var demo = document.getElementById("demo");
var demo1 = document.getElementById("demo1");
var demo2 = document.getElementById("demo2");
demo2.innerHTML=document.getElementById("demo1").innerHTML;
function Marquee(){
if(demo.scrollLeft-demo2.offsetWidth>=0){
 demo.scrollLeft-=demo1.offsetWidth;
}
else{
 demo.scrollLeft++;
}
}
var myvar=setInterval(Marquee,30);

</script>
    <!--左右滚动-->

	
        
    <div style="height:5px;line-height:10px;"></div>
    <div class="common-wrapper">
        <ul class="menu-list">
            
			
			<li>
                <a href="/index.html">
                    <img src="images/2.gif">
                    <p>
                        开始赚钱
                    </p>
                </a>
            </li>
			
			<li>
                <!--<a href="javascript:;" onClick="tixianfun();">-->
				<a href="<?php echo U('Home/User/tixian');?>">
                    <img src="images/4.gif">
                    <p>
                        申请提现
                    </p>
                </a>
            </li>
        
            <li>
                <a href="<?php echo U('Home/Huodong/yaoyiyao');?>">
                    <img src="images/1.gif">
                    <p>
                       积分摇奖
                    </p>
                </a>
            </li>
            <li>
                <a href="<?php echo U('Home/User/profile');?>"> 
                    <img src="images/7.gif">
                    <p>
                        账户设置
                    </p>
                </a>
            </li>
            <li>
                <a href="<?php echo U('Home/User/yaoqinglist');?>">
                    <img src="images/myyq.png">
                    <p>
                        师徒信息
                    </p>
                </a>
            </li>
                <li>
                <a href="<?php echo U('Home/Huodong/fxhb');?>">
                    <img src="images/3.gif">
                    <p>
                        我要收徒
                    </p>
                </a>
            </li>
            <li>
                <a href="<?php echo U('Home/User/moneylist');?>">
                    <img src="images/5.gif">
                    <p>
                        收入明细
                    </p>
                </a>
            </li>
            <li>
			<?php if($is_noob): ?><a href="<?php echo U('Home/User/noob');?>">
                    <img src="images/6_2.gif">
                    <p>
                        新手教程
                    </p>
                </a>
			<?php else: ?>
				<a href="<?php echo U('Home/Form/lyb');?>">
                    <img src="images/6.gif">
                    <p>
                        问题反馈
                    </p>
                </a><?php endif; ?>
            </li>
        </ul>
    </div>
    <p><br> <br> <br><br><br><br><br></p>
	
	
 <!--#include file="new_footer.html"-->
<script>
function tixianfun(){
	var zfbtx = Number('<?php echo C("txqi"); ?>');
	var wxtx = Number('<?php echo C("wxtx");?>');
	var cantx = Number('<?php echo ((isset($usinfo["money"]) && ($usinfo["money"] !== ""))?($usinfo["money"]):"0"); ?>');
	if(wxtx > 0 ){
			$.post(
				"<?php echo U('Home/User/wxtixian');?>",
				{},
				function(data){
					alert(data.msg);
				},
				'json'
			);
		return false;	
	} 
	if(zfbtx<=0){
		alert("后台没有开启支付宝提现功能,请使用公众号菜单内的微信提现功能。");
	return false;
	}
	if(cantx<zfbtx){	
	alert("支付宝提现金额必须"+zfbtx+'元起！');
	return false;
	}
	alert('关注我们可快速提现');
	window.location.href='<?php echo U('Home/User/tixian');?>'
	
}
	function qiandao(){
		$.post("<?php echo U('Home/User/ajaxqiandao');?>",function(data){
			alert(data);
		})
	}
</script>
 
</body></html>