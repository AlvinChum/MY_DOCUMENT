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
<title><?php echo ($media["title"]); ?></title>
<link rel="stylesheet" type="text/css" href="css/app/css.css">
<script src="js/jquery-1.8.0.min.js"></script>
<script src="js/wx_dl_zc.js"></script>
</head>

<body>
  <div class="hd_main">
     <header class="dl_scd_header">
     	<a href="/" class="fl pl10"><img src="images/app/youjiantou_new.png" width="10" alt="">返回</a>
     	<a href="<?php echo U('Home/Public/reg');?>" class="fr pr10">注册</a>
     	登录
     	<div class="cb"></div>
     </header>
     <!-- /header -->
     
     <div class="wx_dl_scd ply20">
     	<div class="hg30"></div>
         <form action="index.php?s=/Home/Public/dologin/isvode/0" method="post" id="btn2f">
        <div class="wei_input ">
            <input type="test" class="wei_input_si fl" name="log"  placeholder="请输入您常用的手机号码">
        </div>

        <!--错误警告 -->
        <div class="hg30">
          <p class="user_msg"></p>
        </div>
       <!-- 密码域 -->
            <div class="wei_input " id="yangjing3">
            <input type="password" class="wei_input_si fl pwd" name="pwd" placeholder="确认新密码" id="zc_an1">
             <a class="fr yanjing" onclick="mima_1()"><img src="images/app/yanjing.png" height="27" width="50"></a>
            </div>
            <div class="wei_input mt30" id="yangjing4" style="display:none">
            <input type="text" class="wei_input_si fl pwd" placeholder="确认新密码" id="zc_ming2">
             <a class="fr yanjing" onclick="mima_2()"><img src="images/app/yanjing_2.png" height="27" width="50"></a>
            </div>
          <!--错误警告 -->
         <div class="hg30">
          <p class="msg"></p>
        </div>
        <!--错误警告 -->
        <!-- 登录按钮 -->
        <a class="wx_scd_dl_button mt20" onclick="genggai()" id="denglu" >登 录</a>
        <!-- 立即注册和忘记密码 -->
        <div class="wx_ljzc_wjmm mt10 cb"><a href="<?php echo U('Home/Public/reg');?>" class="fl">立即注册</a><a href="<?php echo U('getpwd');?>" class="fr">忘记密码？</a></div>
        </form>
     </div>
<br>
<div class="new_qita"><span>其他登录方式</span></div>
<?php if($iswx): ?><div class="new_denglujieko"><a href="/index.php?s=/Home/Public/wxlogin"><img src="images/dl_jiek2.png"></a></div><?php endif; ?>



  </div>


<script src="js/ajax.js"></script>
</body>
</html>