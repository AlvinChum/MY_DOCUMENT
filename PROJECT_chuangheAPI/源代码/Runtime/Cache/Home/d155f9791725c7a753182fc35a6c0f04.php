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
<meta name="keywords" content="关健词">
<meta name="description" content="描述">
<title>提现</title>
</head>
<style type="text/css">
@charset "utf-8";
body,html,a,img,div,form,select,input,ul,ol,ul,li,h1,h2,h3,h4,h5,h6,dd,dl,dt,p,label,em,span{margin:0;padding:0;-webkit-tap-highlight-color:rgba(0,0,0,0)}
body{    font-family: "微软雅黑","microsoft yahei","华文细黑",Verdana,Arial,Helvetica,sans-serif; color:#666;-webkit-overflow-scrolling: touch}
a{color:#666;*color:#666;text-decoration:none;}
ol,ul,li{list-style:none}
em,i{font-style:normal}
img{border:none;vertical-align:middle;}
html{font-size:10px;}
body { font-size: 14px; font-size: 1.4rem; } 
h1   { font-size: 24px; font-size: 2.4rem; }
.fl { float:left}
.fr { float:right}
.cb:after {visibility: hidden;display: block;font-size: 0;content: " ";clear: both;height: 0;}
 body,html { min-height:100%;background:#f0f0f0}
 .hd_main {min-width:320px;margin:0 auto; max-width: 780px; background:#f0f0f0; min-height:100%; overflow: hidden; }

	 p { text-align: center;}
     .tixian { width:180px; margin: auto;    padding: 10px;}
     .tixian a { display: inline-block;padding: 5px;border:#f0f0f0 solid 2px; position: relative;}
     .tixian a.hot {border:#ff7b00 solid 2px; border-radius: 5px;}
     .tixian a:nth-child(1){ margin-right: 45px;}
     .tixian a img { width: 50px; border-radius: 5px;}
     .tixian a img:nth-child(2) { position: absolute; bottom: -2px;  right: -2px; width: 30px;    height: 30px; display: none}
     .tixian a.hot img:nth-child(2) { display: block;}
     input { width: 86%; margin: auto; height: 43px; border:#cbcbcb solid 1px; border-radius: 5px; outline: none; line-height: 45px; display: block; padding: 0px 2%; margin-top: 8px; font-family:  "微软雅黑";-webkit-appearance: none;}
     .tijiao {width: 90%;  background: #57a8f9; color: #fff; font-size: 18px; height: 45px; border:none;}
</style>

<body>
  <div class="hd_main">
    <p style="color:#000; font-size:22px;line-height:40px;">可用提现金额</p>
    <p style="color:#f39800; font-size:30px;line-height:50px;"><?php echo ($usinfo["money"]); ?></p>
    <p style="color:#6ea2b7; font-size:16px;line-height:30px;">最低提现金额<span style="color:red"  id="txmoney"><?php echo ($wxtx); ?></span>元</p>
    <div class="tixian">
    	<a  onclick="kaiguan('1')" id="d1"  class="hot" >
    	<img src="images/tx_wx.png" alt="微信">
    	<img src="images/tx_checked.png">
    	</a>
    	<a  onclick="kaiguan('2')" id="d2" >
    	<img src="images/tx_zfb.png" alt="支付宝">
        <img src="images/tx_checked.png">
    	</a>
    </div>
	<div class="hg304" id="d3">
		<p style="color:red; font-size:16px;line-higth:30px;">系统会自动发红包到您的微信，请注意查收</p>
		<input type="text" placeholder="请输入提现金额" id="wx_money">
		<input type="button" value="申请提现" class="tijiao" onclick="tixianfun('wx');">
	</div>
	<div class="hg304" id="d4" style="display:none">
	<form action="<?php echo U('DuxCms/Form/push');?>" method="post" AutoComplete="off"  id="btn2f">
		<p style="color:red; font-size:16px;line-higth:30px;">请正确填写支付宝账号,避免提现出现问题</p>
		<input type="text" placeholder="请输入支付宝账号" name="Fieldset_zfb">
		<input type="text" placeholder="请输入收款人姓名" name="Fieldset_zfbuname">
		<input type="text" placeholder="请输入提现金额" name="Fieldset_money" id="zfb_money">
		<input type="button" value="申请提现" class="tijiao" onclick="tixianfun('zfb');">
		<input name="table" type="hidden" value="tixian">
		<input name="Fieldset_uid" type="hidden" value="<?php echo ($usinfo["id"]); ?>">
		<!--<input name="Fieldset_money" type="hidden" value="<?php echo ($usinfo["money"]); ?>">-->
		<input name="Fieldset_mob" value="<?php echo ($usinfo["user_tel"]); ?>" type="hidden" >
		<input name="token" type="hidden" value=' <?php echo service("DuxCms","Label","formToken",array("app"=>"DuxCms","label"=>"formToken","table"=>"tixian",)); ?> '>
	</form>
	</div>
   

</div>
 <!--#include file="new_footer.html"-->
<script>
 function kaiguan(s)
 {
	document.getElementById('d2').className = document.getElementById('d2').className.replace('hot', '');
   	document.getElementById('d1').className = document.getElementById('d1').className.replace('hot', '');
 	if(s==1)
 	{
 		var zfbtx = Number('<?php echo ($wxtx); ?>');
 		document.getElementById('txmoney').innerHTML = zfbtx;
   		document.getElementById('d1').className='hot';
   		document.getElementById('d4').style.display="none";
   		document.getElementById('d3').style.display="block";
 	}else{
		var zfbtx = Number('<?php echo C("txqi"); ?>');
		if(zfbtx<=0){
			alert("后台没有开启支付宝提现功能,请使用微信提现功能。");
		}
		document.getElementById('txmoney').innerHTML = zfbtx;
   		document.getElementById('d2').className='hot';
   		document.getElementById('d3').style.display="none";
   		document.getElementById('d4').style.display="block";
 	}
 }	
function tixianfun(type){
	var cantx = Number('<?php echo ((isset($usinfo["money"]) && ($usinfo["money"] !== ""))?($usinfo["money"]):"0"); ?>');
	var txmoney = Number($("#txmoney").html());
	if(type == 'wx'){
		var wxtx = Number('<?php echo ($wxtx); ?>');
		var wx_money = Number($("#wx_money").val());
		if(wx_money >= txmoney){
			if(!(parseInt(wx_money) == wx_money)){
				alert("只能输入整数");
				return false;
			}
			if(wx_money > cantx){
				alert("您的余额不足");
				return false;
			}
			if(wxtx > 0 ){
				$.post(
					"<?php echo U('Home/User/wxtixian');?>",
					{money:wx_money},
					function(data){
						alert(data.msg);
					},
					'json'
				);
				return false;	
			}
		} else {
			alert("提现金额必须大于起提金额"+txmoney+"元");
			return false;
		}
		
	}
	if(type == 'zfb'){
		var zfbtx = Number('<?php echo C("txqi"); ?>');
		var zfb_money = Number($("#zfb_money").val());
		if(zfb_money >= txmoney){
			if(!(parseInt(zfb_money) == zfb_money)){
				alert("只能输入整数");
				return false;
			}
			if(zfb_money > cantx){
				alert("您的余额不足");
				return false;
			}
			$("#btn2f").submit();
		} else {
			alert("提现金额必须大于起提金额"+txmoney+"元");
			return false;
		}
		
	}
}
</script>


</body>
</html>