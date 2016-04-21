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
<title>找回密码</title>
<link rel="stylesheet" type="text/css" href="css/app/css.css">
<script src="js/jquery-1.8.0.min.js"></script>
<script src="js/wx_dl_zc.js"></script>
</head>

<body>
  <div class="hd_main">
     <header class="dl_scd_header">
     	<a href="/" class="fl pl10"><img src="images/app/youjiantou_new.png" width="10" alt="">返回</a>
     	<a href="<?php echo U('login');?>" class="fr pr10">登录</a>
     	找回密码
     	<div class="cb"></div>
     </header>
     <!-- /header -->
     <div class="wx_dl_scd ply20">
<!-- 找回密码main -->
<!-- 找回密码第一步开始 -->
    <div id="zhmm1">
     	<div class="hg30"></div>
        <div class="wei_input ">
            <input type="text" class="wei_input_si fl" name="log" id="tel" placeholder="请输入您的手机号码">
       </div>
       
        <!--错误警告 -->
        <div class="hg30">
          <p class="g_msg_1"></p>
        </div>

        <!-- 获取 -->
            <div>
            <div class="wei_input_new  fl">
            <input type="text" class="wei_input_si fl" name="code" placeholder="请输入手机验证码">
            </div>
            <div class="fl" style="width:30%">
            <input  class="fr huoqu_scd" type="button" value="验证码"  placeholder="点击获取" id="huoqu">
           
            <!-- <a class="fr huoqu_scd" onclick="mima_1()" style="background:#e4e4e4; color: #333">重新发送(59)</a>
           -->
           <!-- <a class="fr huoqu_scd" onclick="mima_1()" style="background:#e4e4e4; color: #333">重新发送</a>
           --> </div>
           <div class="cb"></div>
           </div>
           <!-- 获取 -->
          <!--错误警告 -->
         <div class="hg30">
          <p class="g_msg_2" id="tel_msg"></p>
        </div>
        <!--错误警告 -->
        <!-- 登录按钮 -->
        <a class="wx_scd_dl_xiayibu mt20" onclick="getpwd_next()">下一步</a>
        
      </div> 
      <!-- 找回密码第一步结束-->
      <!-- 找回密码第二步开始-->
        <div id="zhmm2" style="display: none">
        <div class="hg30"></div>
         <!-- 密码域 -->
            <div class="wei_input " id="yangjing3">
            <input type="password" class="wei_input_si fl" name="password" placeholder="确认新密码" id="zc_an1">
             <!-- a class="fr yanjing" onclick="mima_1()"><img src="images/app/yanjing.png" height="27" width="50"></a-->
            </div>
            <div class="wei_input mt30" id="yangjing4" style="display:none">
            <input type="text" class="wei_input_si fl" placeholder="确认新密码" id="zc_ming2">
             <a class="fr yanjing" onclick="mima_2()"><img src="images/app/yanjing_2.png" height="27" width="50"></a>
            </div>
          <!--错误警告 -->
         <div class="hg30">
          <p class="z_msg_1"></p>
        </div>
        <!--错误警告 -->
         <!-- 密码域 -->
            <div class="wei_input " id="yangjing">
            <input type="password" class="wei_input_si fl" name="m_password" placeholder="确认新密码" id="zc_an">
             <!-- a class="fr yanjing" onclick="mima()"><img src="images/app/yanjing.png" height="27" width="50"></a-->
            </div>
            <div class="wei_input mt30" id="yangjing2" style="display:none">
            <input type="text" class="wei_input_si fl" placeholder="确认新密码" id="zc_ming">
             <a class="fr yanjing" onclick="mima0()"><img src="images/app/yanjing_2.png" height="27" width="50"></a>
            </div>
          <!--错误警告 -->
         <div class="hg30">
          <p class="z_msg_2"></p>
        </div>
        <!--错误警告 -->
      
       
    
        <!-- 登录按钮 -->
        <a class="wx_scd_dl_xiayibu mt20" onclick="res_pwd()">下一步</a>
      
      </div> 
        <!-- 找回密码第二步结束-->
        <!-- 找回密码成功开始-->
        <div id="zhmm3" style="display: none">
        <div class="hg30"></div>
        <!-- 
         <img src="images/app/xiugcg.png" alt="" style="width: 40%;margin: 25px auto;display: block;"> -->
         <p class="wenan_xiugcg">密码修改成功！</p>
    
        <!-- 登录按钮 -->
         <a class="wx_scd_dl_button mt20" href="<?php echo U('login');?>" id="denglu" >登 录</a>
      
      </div> 

        <!-- 找回密码成功结束-->
     </div>




     
  </div>

<script src="js/ajax.js"></script>
</body>
</html>