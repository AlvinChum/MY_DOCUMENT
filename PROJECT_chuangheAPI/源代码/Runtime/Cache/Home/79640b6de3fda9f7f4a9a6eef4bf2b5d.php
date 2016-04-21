<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
    <head>
      <title><?php echo ($media["title"]); ?></title>
        <meta charset="utf-8">
        <meta name="viewport" content=" width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
        <link rel="stylesheet" href="css/fonts/font-awesome.min.css">
        <link rel="stylesheet" href="css/ui-box.css">
        <link rel="stylesheet" href="css/ui-base.css">
        <link rel="stylesheet" href="css/ui-color.css">
        <link rel="stylesheet" href="css/appcan.icon.css">
        <link rel="stylesheet" href="css/appcan.control.css">
        <link rel="stylesheet" href="css/ucentr.html_content/css/main.css">
		<link href="css/common.css" rel="stylesheet" />
    </head>
    <body class="um-vp bc-bg" ontouchstart>
	
	<form  action="<?php echo U('Home/User/editprofile');?>" method="post" id="pform">
	
	  <div id="header" class="uh bc-text-head ub bc-head">
                <div class="nav-btn" id="nav-left">
                   <a href="<?php echo U('Home/User/index');?>"> <div class="fa fa-angle-left fa-2x"></div></a>
                </div>
                <h1 class="ut ub-f1 ulev-3 ut-s tx-c" tabindex="0">会员中心</h1>
                <div class="nav-btn nav-bt" id="nav-right"></div>
            </div>
	
	
	
        <div class="ub ub-ver uinn-a1">
            <div class="uba b-gra3 uc-a1 c-wh ub uinn-a7 ub-ac">
                <div class="ulev-app1 umw4">
                   昵称
                </div>
                <div class="ub ub-ac umh5 ub-f1">
                    <div class="uinput ub ub-f1">
                        <input placeholder="你的昵称" name="user_nicename" type="text" class="ub-f1"  value="<?php echo ($uinfo["user_nicename"]); ?>">
                    </div>
                </div>
            </div>
			
            <div class="uba b-gra3 uc-a1 c-wh ub uinn-a7 ub-ac umar-at1">
                <div class="ulev-app1 umw4">
                    手机
                </div>
                <div class="ub ub-ac umh5 ub-f1">
                    <div class="uinput ub ub-f1">
                       <?php echo ($uinfo["user_tel"]); ?>
                    </div>
                </div>
            </div>
            
            
             <div class="uba b-gra3 uc-a1 c-wh ub uinn-a7 ub-ac umar-at1">
                <div class="ulev-app1 umw4">
                    密码
                </div>
                <div class="ub ub-ac umh5 ub-f1">
                    <div class="uinput ub ub-f1">
                       <input placeholder="留空则不修改密码" name="pass" type="text" class="ub-f1"  value="">
                    </div>
                </div>
            </div>
            
            <div class="ub ub-ver">
                
                <div class="uinn-at1">
                    <div class="btn ub ub-ac bc-text-head ub-pc bc-btn"  id="submit">
                        提交修改
                    </div>
                </div>
            </div>
        </div>
		
		</form>
    </body>
    
       <!--#include file="new_footer.html"-->
   <script>
$("#submit").click(function(){
	$("#pform").submit();
})
</script>
</html>