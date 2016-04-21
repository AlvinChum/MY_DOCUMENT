<?php if (!defined('THINK_PATH')) exit();?>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo ($media["title"]); ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <style>
    * { margin: 0; padding: 0; }
    body { background: #292D2E; }
    .hand { width: 190px; height: 300px; background: url(/Public/img/hand.png) no-repeat; position: absolute; top: 50px; left: 50%; margin-left: -95px; }
    .hand-animate { -webkit-animation: hand_move infinite 2s; }
    .result { background: #393B3C; border: #2C2C2C 1px solid; box-shadow: inset #4D4F50 0 0 0 1px; border-radius: 10px; color: #fff; padding: 10px; width: 300px; position: absolute; top: 300px; left: 50%; margin-left: -161px; opacity: 0;
        -webkit-transition: all 1s;
           -moz-transition: all 1s;
            -ms-transition: all 1s;
             -o-transition: all 1s;
                transition: all 1s; }
    .result .pic { width: 50px; height: 50px; float: left; background: #fff; }
    .result .con { overflow: hidden; zoom: 1; padding-left: 10px; line-height: 24px; }
    .result-show { opacity: 1; margin-top: 50px; }
    .loading { position: absolute; top: 240px; left: 50%; margin-left: -50px; width: 100px; height: 100px; background: url(/Public/img/spinner.png) no-repeat; background-size: 100px 100px; opacity: 0;
        -webkit-animation: loading infinite linear .5s;
           -moz-animation: loading infinite linear .5s;
            -ms-animation: loading infinite linear .5s;
             -o-animation: loading infinite linear .5s;
                animation: loading infinite linear .5s;
        -webkit-transition: all .5s;
           -moz-transition: all .5s;
            -ms-transition: all .5s;
             -o-transition: all .5s;
                transition: all .5s; }
    .loading-show { opacity: 1; }
    
    @-webkit-keyframes hand_move {
        0% {
            -webkit-transform: rotate(0);
               -moz-transform: rotate(0);
                -ms-transform: rotate(0);
                 -o-transform: rotate(0);
                    transform: rotate(0); }
        50% {
            -webkit-transform: rotate(15deg);
               -moz-transform: rotate(15deg);
                -ms-transform: rotate(15deg);
                 -o-transform: rotate(15deg);
                    transform: rotate(15deg); }
        100% {
            -webkit-transform: rotate(0);
               -moz-transform: rotate(0);
                -ms-transform: rotate(0);
                 -o-transform: rotate(0);
                    transform: rotate(0); }
    }
    @-webkit-keyframes loading {
        0% {
            -webkit-transform: rotate(0);
               -moz-transform: rotate(0);
                -ms-transform: rotate(0);
                 -o-transform: rotate(0);
                    transform: rotate(0); }
        100% {
            -webkit-transform: rotate(360deg);
               -moz-transform: rotate(360deg);
                -ms-transform: rotate(360deg);
                 -o-transform: rotate(360deg);
                    transform: rotate(360deg); }
    }
    </style>
</head>
<body>
    
    <div id="hand" class="hand hand-animate"></div>
    <div id="loading" class="loading"></div>
    <div id="result" class="result">
        <div class="pic"><img src="<?php echo ($myinfo["avatar"]); ?>" width="50" height="50"></div>
        <div class="con" id="con">摇晃结果<br/>功能还在测试中，稍后开放。</div>
    </div>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    
    <script>


    
	var issubscribe = '<?php echo ($myinfo["subscribe"]); ?>';
	if(issubscribe==0){
		//alert('您必须先关注我们才可以摇一摇');
		//window.location.href="<?php echo C('subscribeurl') ?>";
	}
    var SHAKE_THRESHOLD = 1500;//
    var last_update = 0;
    var x = y = z = last_x = last_y = last_z = 0;

    if (window.DeviceMotionEvent) {
        window.addEventListener('devicemotion', deviceMotionHandler, false);
    } else {
        alert('你的手机不支持摇一摇功能！该换啦。');
    }

    function deviceMotionHandler(eventData) {
        var acceleration = eventData.accelerationIncludingGravity;
        var curTime = new Date().getTime();

        if ((curTime - last_update) > 80) {
            var diffTime = curTime - last_update;
            last_update = curTime;
            x = acceleration.x;
            y = acceleration.y;
            z = acceleration.z;
            var speed = Math.abs(x + y + z - last_x - last_y - last_z) / diffTime * 10000;
            var status = document.getElementById("status");

            if (speed > SHAKE_THRESHOLD) {
				getrand();       
				
            }
            last_x = x;
            last_y = y;
            last_z = z;
        }
    }
	
	function getrand(){
		$.post("<?php echo U('Home/Huodong/rand');?>",function(data){			
			doResult();
			$("#con").html(data.info);
		},'json');
	}

    function doResult() {
        document.getElementById("result").className = "result";
        document.getElementById("loading").className = "loading loading-show";
        setTimeout(function(){
           // document.getElementById("hand").className = "hand";
            document.getElementById("result").className = "result result-show";
            document.getElementById("loading").className = "loading";
        }, 1000);
    }
    </script>

</body>
</html>