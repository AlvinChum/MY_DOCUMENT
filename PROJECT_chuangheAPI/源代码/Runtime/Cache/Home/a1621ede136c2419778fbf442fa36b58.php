<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
    <head>
       <title><?php echo ($media["title"]); ?></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
        <link rel="stylesheet" href="css/fonts/font-awesome.min.css">
        <link rel="stylesheet" href="css/ui-box.css">
        <link rel="stylesheet" href="css/ui-base.css">
        <link rel="stylesheet" href="css/ui-color.css">
        <link rel="stylesheet" href="css/appcan.icon.css">
        <link rel="stylesheet" href="css/appcan.control.css">
		<link rel="stylesheet" href="css/yq3_content/css/main.css">
		<link href="css/common.css" rel="stylesheet" />
    </head>
    <body class="um-vp bc-bg" ontouchstart>
      
		
		  <div id="header" class="uh bc-text-head ub bc-head">
               <div class="nav-btn" id="nav-left">
                   <a href="<?php echo U('Home/User/index');?>"> <div class="fa fa-angle-left fa-2x"></div></a>
                </div>
                <h1 class="ut ub-f1 ulev-3 ut-s tx-c" tabindex="0"><?php echo ($media["title"]); ?></h1>
                <div class="nav-btn nav-bt" id="nav-right"></div>
            </div>
			
			
			  <div class="uinn">
            
			
			<?php if(is_array($list)): foreach($list as $key=>$v): ?><div class="ub ubb b-c2 uinn8">
                <div class="t-9b ulev-1" style="min-width:5em;">
				<span style="color:#333; line-height:30px;"><?php echo ($v["desc"]); ?></span><br/>
				 <?php echo (date("y-m-d H:i:s",$v["time"])); ?>
				
				
			
				 </div>
                <div class="ub-f1 ulev-1" style="    line-height: 45px;">		
			<span style="color:#fd6520;float: right; font-size:2.0rem"><?php if($v[money]!=0) echo $v[money]; if($v[jifen]!=0) echo $v[jifen];?></span>
					
                   
                </div>
            </div><?php endforeach; endif; ?>
								
				<div class="pages">				
				<?php echo ($page); ?>
				</div>
            <div style="clear: both"></div>
        </div>
			
		<div style="height:100px;"></div>
		  	 <!--#include file="new_footer.html"-->
    </body>
   
</html>