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
<link href="./style/css/tug_show.css" rel="stylesheet" type="text/css" />
<link href="./style/transition.min.css" rel="stylesheet" type="text/css" />
<link href="./style/css/tug_mobile.css" rel="stylesheet" type="text/css" />


<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>

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

#Percentage{
	width: 100%;
	height: 30px;
	margin-top: 6px;
	margin-bottom: 12px;
	float: left;
	border-radius: 5px;
	border: 1px solid #ed5470;
	display:none;
	clear:both;
}
#tage {
	height: 30px;
	background: #ed5470;
	border-radius: 5px;
	clear:both;
	text-align:right;
	color:#fff;
	-webkit-background-size: 30px 30px;
	-moz-background-size: 30px 30px;
	background-size: 30px 30px;
	background-image: -webkit-gradient(linear, left top, right bottom, color-stop(.25, rgba(255, 255, 255, .15)), color-stop(.25, transparent), color-stop(.5, transparent), color-stop(.5, rgba(255, 255, 255, .15)), color-stop(.75, rgba(255, 255, 255, .15)), color-stop(.75, transparent), to(transparent));
	background-image: -webkit-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: -moz-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: -ms-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: -o-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	-webkit-animation: animate-stripes 3s linear infinite;
	-moz-animation: animate-stripes 3s linear infinite;
}

/*---------------------------*/		
		
#stripes {
	-webkit-background-size: 30px 30px;
	-moz-background-size: 30px 30px;
	background-size: 30px 30px;
	background-image: -webkit-gradient(linear, left top, right bottom, color-stop(.25, rgba(255, 255, 255, .15)), color-stop(.25, transparent), color-stop(.5, transparent), color-stop(.5, rgba(255, 255, 255, .15)), color-stop(.75, rgba(255, 255, 255, .15)), color-stop(.75, transparent), to(transparent));
	background-image: -webkit-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: -moz-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: -ms-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: -o-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	background-image: linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
	-webkit-animation: animate-stripes 3s linear infinite;
	-moz-animation: animate-stripes 3s linear infinite;
}
 @-webkit-keyframes animate-stripes {
	0% {
		background-position: 0 0;
	}
	100% {
		background-position: 60px 0;
	}
}
 @-moz-keyframes animate-stripes {
	0% {
		background-position: 0 0;
	}
	100% {
		background-position: 60px 0;
	}
}
/*---------------------------*/	 

</style>
</head>
<body>

<div class="shake-main">
	<div class="wait-pic"></div>
	<div class="mobile-content">
	</div>
</div>
	
<div class="mobile-box img-rounded" style="
    color: #FFA3A3;
    border: 1px solid #FFA3A3;
">
	<div id="yaoyiyaoresult" style="font-size:20px;margin:10px;line-height:50px;display:none;"></div>
	<div id='nostart'><span id='lefttime'><?=$_GET['msg']?$_GET['msg']:'对不起，游戏已经开始<br>请等待下一轮游戏'?></span></div>
</div>

<div class="footer">
    <?=$bhconf['footer']?>
</div>



</body>
</html>