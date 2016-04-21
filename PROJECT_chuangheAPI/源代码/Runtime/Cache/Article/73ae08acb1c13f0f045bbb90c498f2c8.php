<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<link rel="apple-touch-icon" href="<?php echo ($contentInfo["image"]); ?>" />
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<title><?php echo ($media["title"]); ?></title>
<meta name="keywords" content="<?php echo ($media["keywords"]); ?>" />
<meta name="description" content="<?php echo ($media["description"]); ?>" />
<link rel="stylesheet" type="text/css" href="css/content20151022.css">
 <script src="js/jquery-1.8.2.min.js"  type="text/javascript"></script>
 <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
 <style>
.das img,#js_content img{ width: 100%}
#js_content iframe{ width: 100%; height: 250px}
.show2{
display:none;
}
 </style>
</head>
  <div class="toubucs">
  <div class="piaofu_top" id="piaofu_top">
    <a class="toubu1" onclick="document.getElementById('piaofu_top').style.display='none'">&nbsp;<img src="https://mmbiz.qlogo.cn/mmbiz/mVENeDKSuXvtJCxY0OBp9zpEPMvpAdvr80AHRTUicW8nMBdwsJdP2bJwibppudI9PMJvZNg2wdJLPV5Ub4jrh8EA/0?wx_fmt=png" style="width: 30px;">&nbsp;</a>
    <a class="toubu2"><img src="https://mmbiz.qlogo.cn/mmbiz/mVENeDKSuXvtJCxY0OBp9zpEPMvpAdvrE6G5L0HUXrUC3OnicaLrpJeNquAiahRwTT6LkHWruxotrU3NoDWkjbiaQ/0?wx_fmt=png" style="width: 30px;">&nbsp;&nbsp;</a>
    点击右上角分享到朋友圈赚钱
  </div>
     <p>
	<br/>
</p>
<body>
<img src="<?php echo ((isset($contentInfo["image"]) && ($contentInfo["image"] !== ""))?($contentInfo["image"]):'/ico.png'); ?>" style="display: none">

  <div class="hd_main">
  <div class="hd_main_sub">
    <div class="rich_media_area_primary">
   <h2 class="rich_media_title"><?php echo html_out($contentInfo[title]) ?></h2>
        <div class="rich_media_meta_list"><em id="post-date" class="rich_media_meta rich_media_meta_text"><?php echo (format_time($contentInfo["time"],'Y-m-d')); ?></em> <a class="rich_media_meta rich_media_meta_link rich_media_meta_nickname" href="<?php echo C('subscribeurl'); ?>" ><?php echo C('site_title'); ?></a> <img src="images/content20151022images/fllow.gif" class="follow-image">关注 </div>
        <div class="ad_content_top"> </div>
        <p style="text-align:center; display: none"> [分享本文最高可得<span style="color:#ff0000;"><?php echo ((isset($contentInfo["actionyj"]) && ($contentInfo["actionyj"] !== ""))?($contentInfo["actionyj"]):"50"); ?></span>元，<a href="<?php echo C('subscribeurl'); ?>" target="_self">我要参与分享</a>] </p>
		
       <div style="text-align:center;margin-bottom: 5px;" class="show2 das"> 
	   	
			<?php echo service("DuxCms","Label","fragment",array("app"=>"DuxCms","label"=>"fragment","mark"=>"nrad4","class_id"=>"998",)); ?>
	  </div>
	   
	   
      <!--  <p style="text-align:center;"> <span style="line-height:1.5;">&nbsp;&nbsp;</span><a href="http://baodao-optical.cn/Home/User/order/cpid/135/waid/230/uid/445/qudao/136" target="_blank"><img src="images/content20151022images/c07b59381d2d7264.gif" width="300" height="45" alt="" title="" align=""></a> </p>-->
       
	   

        <div class="rich_media_content " id="js_content">
		
		<?php echo ($contentInfo["content"]); ?>
        </div>
         <a href="javascript:void(0);" class="view_all" id="view_all" style="display: none;">展开<br>
        全文</a>
        <script type="text/javascript">
                        $(function ()
                        {
                            //阅读全文
                            var content_height = $('#js_content').height();
                           var ydywkg = "<?php echo C('open_content_qwkg');?>";
                            if(content_height > 700 && ydywkg==1 )

                            {
                                $('.view_all').css('display','block');
                                $('#js_content').addClass('hide_content');
                                $('.view_all').click(function()
                                {
                                    $('#js_content').removeClass('hide_content');
                                    $('.view_all').css('display','none');
                                    $('.hide_box').css('display','none');
                                });
                            }
                            else
                            {
                                $('.hide_box').css('display','none');
                            }
                        });
                    </script>
       
		 <style type="text/css">
        .redborder{border-color:green;}
    </style>
     <style type="text/css">
     .new_input {     padding: 30px 10px 10px; margin-bottom: 30px;}
    
      .new_input p{     display: block; width: 60px; height: 30PX; line-height: 30px; color: #454242; text-align: center; border-left: #ff4400 solid 4px;}
       .new_input input{ border: #dfdfdf solid 1px; padding: 10px 1%; outline: none; width: 98%; font-size: 16px; color: #666; border-radius: 5px; margin-bottom: 10px; }
     .new_input .redborder { border: #fd6520 solid 1px;}
     .new_input #huoqu {width: 32%; float；left; border: none; background: #dfdfdf; float: left; border-radius: 0px 5px 5px 0px;height: 40px;}
     .new_input #tijiao {width: 100%; float；left; border: none; background: #ff4400; color: #fff;letter-spacing: 10px;}
     .new_input  textarea { width: 98%; height: 60px; min-height: 60px; max-height: 60px; border: #dfdfdf solid 1px; outline: none;border-radius: 5px; font-size: 16px; color: #999;margin-bottom: 10px; }
     </style>

 <?php $listList = service("Home","Label","w_orderList",array("app"=>"Home","label"=>"w_orderList","item"=>"list","class_id"=>$contentInfo['class_id'],"content_id"=>$contentInfo['content_id'],"tabname"=>"w_order",)); if(is_array($listList)): foreach($listList as $list): if($list): ?><form  action="<?php echo U('Home/Public/cart');?>" method="post" id="pform">
    <div class="new_input">
     <p>微意向</p>
       	<?php if(is_array($list)): foreach($list as $key=>$vo): if($vo == '手机验证' ): ?><div>
          <input type="text"  name="code" onfocus="javascript:this.className='redborder'" onblur="javascript:this.className=''" placeholder="请输入验证码" style="width:65%; float:left;border-radius: 5px 0px 0px 5px; " >
          <input type="button" value="验证码" onfocus="javascript:this.className='redborder'" onblur="javascript:this.className=''" placeholder="点击获取" id="huoqu">
          <input type="hidden" name="iscode" value="1" />
        </div>
         <?php elseif($vo == '手机号' ): ?>
         <input type="text" name="tel" id="tel" onfocus="javascript:this.className='redborder'" onblur="javascript:this.className=''" placeholder="<?php echo ($vo); ?>">
        <?php elseif($vo == '备注' ): ?>
       	<textarea name="field[<?php echo ($vo); ?>]" onfocus="javascript:this.className='redborder'" onblur="javascript:this.className=''" placeholder="<?php echo ($vo); ?>"></textarea>
       
       <?php else: ?>
       <input type="text" name="field[<?php echo ($vo); ?>]" onfocus="javascript:this.className='redborder'" onblur="javascript:this.className=''" placeholder="<?php echo ($vo); ?>"><?php endif; endforeach; endif; ?> 
       <input type="hidden" name="content_id" value="<?php echo ($contentInfo["content_id"]); ?>" />
       <input type="hidden" name="fx_uid" value="<?php echo $_GET['uid'];?>" />
       <input type="submit" onfocus="javascript:this.className='redborder'" onblur="javascript:this.className=''" value="提交" placeholder="提交" id="tijiao"> 

    </div>
    </form><?php endif; endforeach; endif; ?>

    
    
		
		<div class="show2">
	 <!-- 精彩推荐start -->
  <div style="wwidth: 92%; padding: 0% 0 0% 2%; margin: 5% 0 0% 0%; letter-spacing: 2px; font-size: 1.5rem; border-left: red solid 5px;">
   精彩推荐
  </div>
  <div style="width:100%;float: left;">
    <div style="width:92%;padding:2% 0%;float: left;">
       <ul>
	   <?php echo service("DuxCms","Label","fragment",array("app"=>"DuxCms","label"=>"fragment","mark"=>"nrad6",)); ?>
       <?php $listList = service("DuxCms","Label","contentList",array("app"=>"DuxCms","label"=>"contentList","limit"=>"5","item"=>"list","order"=>"rand()","cached"=>"nryjctj","pos_id"=>"2",)); if(is_array($listList)): foreach($listList as $list): ?><li class="article_tj" style="height: 85px;"><a href="<?php echo ($list["aurl"]); ?>" style="color: #666"><img src="<?php echo ((isset($list["image"]) && ($list["image"] !== ""))?($list["image"]):'Public/img/no_picture.gif'); ?>" width="30%" height="75" style="float: left; margin-right: 5px;">
                <span style="    line-height: 20px; height: 40px; display: block; overflow: hidden; margin-bottom: 10px; font-size: 16px;"><?php echo len($list[title],29)?></span>
                 <span style="font-size: 12px;">阅读：<?php echo rand(1111,99999)+$list[views];?> &nbsp;&nbsp;&nbsp;&nbsp;分享：<?php echo rand(1111,99999);?></span></a>
        
        
        </li><?php endforeach; endif; ?>
         
          
         
        
             </ul> 
    </div>  
  </div>  
  <!-- 精彩推荐end -->
	<div style="clear: both; ">	</div>
</div>

     <div style="text-align:center;" class="das show2">
			<?php echo service("DuxCms","Label","fragment",array("app"=>"DuxCms","label"=>"fragment","mark"=>"nrad3",)); ?>
		 
         
      <p style="text-align:center;" class="das show2"> <span style="line-height:1.5;">&nbsp;&nbsp;</span>
			<?php echo service("DuxCms","Label","fragment",array("app"=>"DuxCms","label"=>"fragment","mark"=>"nrad5",)); ?>
		
		 </p>
		 
		  <p style="text-align:center;" class="das show2"> <span style="line-height:1.5;">&nbsp;&nbsp;</span>
		<?php echo service("DuxCms","Label","fragment",array("app"=>"DuxCms","label"=>"fragment","mark"=>"ewmzw",)); ?>
		
		 </p>
</div>
          <div class="rich_media_tool" style="margin-bottom:0px;"><a class="media_tool_meta meta_primary" href="<?php if($contentInfo['yd_url']) echo $contentInfo['yd_url']; else echo C('subscribeurl'); ?>">阅读原文</a>
          <div id="js_read_area" class="media_tool_meta tips_global meta_primary">阅读 <span>
		  <?php if($contentInfo['views'] > 100000): ?>100000+
		  <?php else: ?>
		   100000+<?php endif; ?>	
		  </span></div>
          <span id="praise" class="media_tool_meta meta_primary tips_global meta_praise" data-action="<?php echo U('Home/Api/dzan');?>" data-attr="id=<?php echo ($contentInfo["content_id"]); ?>"><i class="icon_praise_gray "></i><span class="praise_num"><?php echo ($contentInfo["zan"]); ?></span></span> <a class="media_tool_meta tips_global meta_extra" href="<?php echo U('Home/Index/jubao');?>">举报</a> </div><br><br><br>
      </div>
      </div>
  </div>
  
<?php if($contentInfo['actionstatus']==0 && $contentInfo['sj_money'] && C('sj_mod')): ?><link rel="stylesheet" href="css/fonts/font-awesome.min.css">
<div class="shanjin">
	<div class="zuobian">
		<a onclick="erjiq ()"><i class="fa fa-bars"></i></a>
		<ul id="erji">
			<li><a href="<?php echo U('Home/Weishang/index');?>">微商发布</a></li>
			<li><a href="<?php echo U('Home/Index/index');?>">我要赚钱</a></li>
			<li><a href="<?php echo U('Home/User/index');?>">会员中心</a></li>
		</ul>
	</div>
	<div class="youbian"><a href="javascript:history.go(-1);"><i class="fa fa-mail-reply-all"></i></a></div>
	
	<div  class="zhongjian"><i id="cs">领取赏金（<span id="dd"><?php echo C('sj_time');?></span>）</i></div>

<?php else: ?>

	
	    
   <div  style="position: fixed; bottom: 0px; left:0px;width: 100%;" class="das show2">
		<?php echo service("DuxCms","Label","fragment",array("app"=>"DuxCms","label"=>"fragment","mark"=>"nrad2","class_id"=>"997","uid"=>$_GET['uid'],)); ?>
		</div><?php endif; ?>

</div>
<script type="text/javascript">
var s=1
	 function erjiq (){
	 	
	 if(s <= 1){
	  document.getElementById('erji').style.display='block'
	  s++
	 
	  }else{
      document.getElementById('erji').style.display='none'
      s--
return
	  }

 }
function run(){
    var s1 = document.getElementById("dd");
    if(s1==null){
    	return false;
    }
 
    if(s1.innerHTML == null){
        return false;
    }
    s1.innerHTML = s1.innerHTML * 1 - 1;
    if(s1.innerHTML == 0){
       document.getElementById("cs").innerHTML="<a id='cser' onclick='runer()'>点击领取赏金</a>";
       clearInterval(timer);   
     }
}
var timer = window.setInterval("run();", 1000);
function runer(){
	if($('#cser').attr('status')==-1){
		return false;
	}
	var url = "<?php echo U('Home/Public/ajax_get_sj');?>";
	var aid ='<?php echo ($contentInfo["content_id"]); ?>';
	$.post(url,{aid:aid},function(data){
        if(data.status==1){
        	document.getElementById("cser").innerHTML="我的赏金<span class='colorfff'>+<span><?php echo ($contentInfo["sj_money"]); ?></span>元</span>";
        }else if(data.status==-3){
        	window.location.href="<?php echo U('Home/Public/login');?>";
        }else{
        	document.getElementById("cser").innerHTML=data.msg;
        	$('#cser').attr('status','-1');
        }
	},'json');

}


</script>

 <div  style=" height: 60px; background: #fff" class="show2">
  </div>


<div style="background: #f3f3f3;color: #8c8c8c;padding-top: 1em;" class="show1 das"> 
   <div style="margin-bottom: 1em;position: relative;text-align: center;"> 
    <span style="display: block;position: absolute;top: .6em;border-top: 1px dashed #e1e1e1;width: 100%;height: 0;z-index: 0;"></span> 
    <span style="z-index: 2;padding: 0 5px;background: #f4f4f4;position: relative;">推广</span> 
   </div> 
   <div class="topimgad"> 
    <div id="tuiguangdiv" style="width:100%;">
     <p style="padding:  0 10px">
	
	<?php echo service("DuxCms","Label","fragment",array("app"=>"DuxCms","label"=>"fragment","mark"=>"nrad1",)); ?>
	
	 </p>    </div> 
   </div> 
  </div>
  
  

      
<script>
      
         $('#praise').click(function ()
            {
                var mybtn = $(this), myi = $(this).find('i'), mynum = $(this).find('.praise_num'), myn, myconfig = '';
                if(myi.hasClass('praised'))
                {
                    myi.removeClass('praised');
                    myn = parseInt(mynum.html()) - 1;
                    mynum.html(myn);
                    return;
                }
                else
                {
                    myi.addClass('praised');
                    myn = parseInt(mynum.html()) + 1;
                    mynum.html(myn);
                }
                $.post(
                        mybtn.attr("data-action"),
                        mybtn.attr("data-attr"),
                        function(data){
                        },
                        "json"
                );
            });
                    </script>
<script>
var aid ='<?php echo ($contentInfo["content_id"]); ?>';
var times = '<?php echo ($timestamp); ?>';
var suplink = '<?php echo ($contentInfo["fxurl"]); ?>';
var links = '<?php echo U("Article/Content/index",array("content_id"=>$contentInfo[content_id],"uid"=>$uinfo[id],"hash"=>$_GET["hash"],"time"=>time(),"gowxurl"=>C("gowxurl")?C("gowxurl"):999));?>';
var imgurl = '<?php echo ($contentInfo["image"]); ?>';
var stitle = '<?php echo ($contentInfo["title"]); ?>';
var sdesc = '<?php echo ($media["title"]); ?>';
var domain = '<?php echo ($domain); ?>';
var cdom8 = '_'+domain;
if(imgurl==''){
	imgurl = '<?php echo service("DuxCms","Label","fragment",array("app"=>"DuxCms","label"=>"fragment","mark"=>"ewmurl",)); ?>';	
}

if(domain){
	var fulllink = 'http://'+domain+links;
}else{
	var fulllink = 'http://'+window.location.host+links;
}
//console.log(fulllink);

if(suplink) fulllink = suplink;
 var imgsss = /^http:\/\//;
 if(!imgsss.test(imgurl)){
 	var fullimgurl = 'http://'+window.location.host+imgurl;
 }else{
 	var fullimgurl = imgurl;
 }
//console.log(fullimgurl);
wx.config({
    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: '<?php echo ($appid); ?>', // 必填，公众号的唯一标识
    timestamp: '<?php echo ($timestamp); ?>', // 必填，生成签名的时间戳
    nonceStr: '<?php echo ($nonceStr); ?>', // 必填，生成签名的随机串
    signature: '<?php echo ($signature); ?>',// 必填，签名，见附录1
    jsApiList: ['onMenuShareTimeline','onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});

wx.ready(function(){

wx.onMenuShareTimeline({
    title: stitle, // 分享标题
    link: fulllink, // 分享链接  window.location.href
    imgUrl:fullimgurl, // 分享图标
    success: function () { 
        // 用户确认分享后执行的回调函数
		//alert(1111);
		fxfunc('all');
    },
    cancel: function () { 
        // 用户取消分享后执行的回调函数
		//alert("您取消了分享");
		//alert(window.location.href)
    }
});



wx.onMenuShareAppMessage({
    title: stitle, // 分享标题
    desc: sdesc, // 分享描述
    link: fulllink, // 分享链接  window.location.href
    imgUrl: fullimgurl, // 分享图标
    type: 'link', // 分享类型,music、video或link，不填默认为link
    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
    success: function () { 
        // 用户确认分享后执行的回调函数
		fxfunc('one');
    },
    cancel: function () { 
	//alert(stitle);
	//alert(window.location.href)
	//alert("您取消了分享");
        // 用户取消分享后执行的回调函数
    }
});
    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
});
  
function removeHTMLTag(str) {
            str = str.replace(/<\/?[^>]*>/g,''); //去除HTML tag
            str = str.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
            //str = str.replace(/\n[\s| | ]*\r/g,'\n'); //去除多余空行
            str=str.replace(/&nbsp;/ig,'');//去掉&nbsp;
            return str;
    }  
    
    
function fxfunc(type){
	var wxfxjk = '<?php echo C("iswxjsfx");?>';
	if(wxfxjk=='0'){
		return false;	
	}	
	var kzid = '<?php echo ($categoryInfo["fieldset_id"]); ?>';
	$.post("<?php echo U('Home/Huodong/fx_hb',array('hash'=>$_GET['hash']));?>",{aid:aid,times:times,type:type,kzid:kzid},function(data){
		if(data!=1){
			alert(data);
			/*
			if(confirm(data)){
				window.location.href='<?php echo C('subscribeurl'); ?>';
			}*/
		}
	},'text')	
}

function get_click8(cdom){
	if(cdom=="_"+domain)
	$.get('<?php echo U("Article/Content/index",array("content_id"=>$contentInfo[content_id],"uid"=>$_GET[uid],"hash"=>$_GET["hash"],"d"=>1,"now"=>$timestamp));?>')
}





$(function(){
	$("#js_content p").attr("style",'');
	var set_view_t_d = '<?php echo C("set_view_time");?>';
	var set_view_time =(set_view_t_d?set_view_t_d:5)*1000;	
	var bdh = $(document).height();
	var bdbh = $("body").height();
	var dod = false;
	if(bdh==bdbh && bdh>0){
		setTimeout("get_click8('"+cdom8+"')",Number(set_view_time));
	}else{
	$(window).scroll(function(){		
		if(dod) return false;
		var scl = $("body").scrollTop();
		if(scl>bdh/4){
			dod = true;
			setTimeout("get_click8('"+cdom8+"')",Number(set_view_time));
			//console.log(scl);
		}		
	});
	}
	//setTimeout("get_click()",Number(set_view_time));
	
	var isweixin = '<?php echo ($isweixin); ?>';
	//if(isweixin!=1) window.history.replaceState(null, document.title,'http://'+window.location.host+links);
	
	   var pattern = /^http:\/\/mmbiz/;
        var prefix = 'http://img01.store.sogou.com/net/a/04/link?appid=100520031&w=710&url=';
        $("#js_content img").each(function(){
            var src = $(this).attr('src');
            if(pattern.test(src)){
                var newsrc = prefix+src;
                $(this).attr('src',newsrc);
            }
        });
   
	
	
	var fxapi  = '<?php echo C("set_ad")?>'=='1'? '1' :'<?php echo $_GET[fxapi3];?>';
	var fbuid = '<?php echo ($contentInfo["user_id"]); ?>';
	
	 setTimeout(function(){
		if(fxapi=='1' || fxapi=='') {
			$(".show1").hide();
			$(".show2").show();			
			}
	 },500);
	
		/*$('img').each(function(indexs){		
			var src = $(this).attr('src');
			 addBgImg(src,indexs);
		});*/
		//$('p').each(function(){var p = $(this);if(p.html() == '') p.remove();});  隐藏所有空 p
	
})  





function test11(){
	var fxuid = '<?php echo $_GET[uid];?>';
	if(fxuid) return false;
			$.get(
			"<?php echo U('Home/Index/ajaxCheckLogin');?>",
			function(data){				
				if(data.status!=1){
					if(confirm("您需要登录后分享才能计算佣金，现在登录？"))	{							
					window.location = data.url;
					}
				}
							
			},
			'json'
		);		
}


</script> 

 <div style="display: none">  <?php echo C('site_statistics'); ?>  </div>
  <script src="js/jquery.touchSlider.js"></script>  


	<script>
	   function registerUser(){
		   if($('.check').val()==""||$('.check').val()==null){
			   alert('请输入手机号！');
			   return false;
		   }
		   if($('.base_input').val()==""||$('.base_input').val()==null){
			   alert('请输入验证码！');
			   return false;
		   }
		   $('#regform').submit();
	   }
	   $(function(){
		   $('#huoqu').click(function(){
			    var obj =$(this);
			
				var url ="<?php echo U('Home/Public/getvcode');?>";
				var tel =$('#tel').val();
				if(tel==''||tel==null){
					
					alert('请输入手机号码！');
					return false;
				}
				
				$.post(url,{mob:tel},function(data){
					
	                if(data == 1){
	                	obj.attr('disabled',"disabled");
	    				start_sms_button(obj);
	                }else{
	                	alert(data);
	                }
	                
				},'json');
			});  
	   })

		function start_sms_button(obj){
		    var count = 1 ;
		    var sum = 90;
		    var i = setInterval(function(){
		      if(count > sum){
		        obj.attr('disabled',false);
		        obj.val('发送验证码');
		        clearInterval(i);
		      }else{
		        obj.val('剩余'+parseInt(sum - count)+'秒');
		      }
		      count++;
		    },1000);
		  }
	
	</script>
<?php echo ($tshtml); ?>

</body>
</html>