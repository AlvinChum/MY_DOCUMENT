<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<!-- saved from url=(0036)http://www.weifenzhuan.com/Home/Help -->
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title><?php echo ($media["title"]); ?></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=0,minimal-ui">
    <meta name="imagemode" content="force">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
   <link href="css/noob.css" rel="stylesheet">
  
    <script src="js/jquery-1.8.0.min.js"></script>

</head>
<body style="">


    <div class="page-index clear">
        <div class="header">
    <div class="left">
        
        <span><?php echo C("site_title");?> <br><i><?php echo C("site_url");?></i></span>
    </div>
</div>
        

<div class="page-viewport">
    <div class="page-content">
        <div class="notice">
            <p>建议您通过摇一摇、附近的人等渠道多加好友并且邀请好友注册，这样收益逐天增多！</p>
        </div>
    </div>
</div>
<div class="t2">
<?php if(is_array($lists)): $i = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="item">
		<div class="head">
            <span class="tit"><?php echo ($vo["title"]); ?></span>
        </div>
		<div class="body hide">
			<?php echo ($vo["content"]); ?>
		</div>
	</div><?php endforeach; endif; else: echo "" ;endif; ?>  
</div>
<div class="pagenav"><?php echo ($page); ?></div>
    </div>
    <div class="bottom_line"></div>


    
    <script>
        $('.item .head').click(function () {
            if ($(this).hasClass('active')) {
                $(this).removeClass('active');
                $(this).parent().find('.body').addClass('hide');
            } else {
                $(this).addClass('active');
                $(this).parent().find('.body').removeClass('hide');
            }
        });
    </script>

 <!--#include file="new_footer.html"-->
</body></html>