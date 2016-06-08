<!DOCTYPE html>
<html>
<head>
<title><?=$bhconf['title']?></title>
<meta charset="utf-8">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<meta name="format-detection" content="telephone=no"/>

<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<link href="./style/css/tug_mobile.css" rel="stylesheet" type="text/css" />
<script>


//剩余时间
var starttime=500000;


</script>
<style>
@font-face {  font-weight:bold; font-style: normal;  }

/* Common Style */
*{margin:0;padding:0;}
input,select{font-size:12px;line-height:16px;}
h1,h2,h3,h4,h5,h6{font-size:100%;font-weight:normal;} q:before,q:after{content:'';}
.clear{clear:both;display:block;float:none;font-size:0;margin:0;padding:0;overflow:hidden;visibility:hidden;}
img{border:0;}
p{ line-height:20px;}
ul,li{list-style-type:none;}
a{color:#ccc; text-decoration:none;}
a:hover{color:#ccc;text-decoration:underline; }

.radius{-moz-border-radius: 3px; -webkit-border-radius: 3px; border-radius:5px;}
.red{ color:#990000}


</style>
</head>
<body>

<div class="shake-main">
	<div class="shake-headerpic"><?=$bhconf['title']?></div>
	
	
</div>

<div class=" img-rounded" style="margin:10px 5px;   overflow: hidden;height: 180px;">
	<div class="xb grouppic"><a href="mobile.php?wecha_id=<?=$openid?>&team=1"><img src="<?=$bhconf['teamapic']?>" style="width:100%" class="img-rounded"><br><h2><?=$bhconf['teama']?></h2></a></div>
	<div class="xb grouppic" ><a href="mobile.php?wecha_id=<?=$openid?>&team=2"><img src="<?=$bhconf['teambpic']?>" style="width:100%" class="img-rounded"><br><h2><?=$bhconf['teamb']?></h2></a></div>
</div>
		
<div class=" mobile-div img-rounded border">
	<div class="mobile-hd"><a >规则</a></div>
	<div class="mobile-content"><?=$bhconf['rule']?></div>
</div>

<div class=" mobile-div img-rounded border">
	<div class="mobile-hd"><a href="javascript:testshade();">赞助商</a></div>
	<div class="mobile-content">
	    <div class="ads">
	        <?php
	         foreach ($ads as $v){
	             echo '<img src="'.$v.'"/>';
	         }
	         ?>
	    </div>
	</div>
</div>
	
<div class="footer" style="position: relative">
  
</div>

</body>
</html>