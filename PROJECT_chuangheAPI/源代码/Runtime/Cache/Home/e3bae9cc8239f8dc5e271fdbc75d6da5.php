<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta charset="utf-8"> 
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <meta name="viewport" content="width=device-width,initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no, -ms-touch-action: none">
        <meta name="apple-mobile-web-app-capable" content="yes"> 
        <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
        <meta name="format-detection" content="telephone=no"> 
        <title><?php echo ($media["title"]); ?></title>	
        <link href="<?php echo ($css_path); ?>css/list.css" rel="stylesheet">

    </head> 
    <body> 
    
                <div id="bod">
	
			
                   <div  id="loading" style="display: none"><div class="loading-div"></div><img src="themes/shanmao_me_new/images/jiazai.gif"  class="loading-img"></div>

                    <div class="main-container"  id="mynav">
            
                    <div class="categories"> 
				  <?php $listList = service("DuxCms","Label","categoryList",array("app"=>"DuxCms","label"=>"categoryList","limit"=>"20","parent_id"=>"0","item"=>"list",)); if(is_array($listList)): foreach($listList as $list): ?><a href="<?php echo ($list["curl"]); ?>"  class="btn  <?php if($list['class_id']==$topCategoryInfo['class_id']): ?>btn-primary<?php endif; ?>  "><?php echo ($list["name"]); ?></a><?php endforeach; endif; ?>
                    <a href="<?php echo U('Home/User/index_user');?>" class="btn btn-primary">已分享</a>                                     
                    </div> 
                    <div class="categories_xiala">
					
					  <?php $listList = service("DuxCms","Label","categoryList",array("app"=>"DuxCms","label"=>"categoryList","limit"=>"20","parent_id"=>"19","item"=>"list",)); if(is_array($listList)): foreach($listList as $list): ?><a href="<?php echo ($list["curl"]); ?>"  class="btn  <?php if($list['class_id']==$topCategoryInfo['class_id']): ?>btn-primary<?php endif; ?>  "><?php echo ($list["name"]); ?></a><?php endforeach; endif; ?>   			
                    
                    </div>

                    </div>

                                    <div class="media container">	
									
									<div class="w_img_100" >
									<?php echo service("DuxCms","Label","fragment",array("app"=>"DuxCms","label"=>"fragment","mark"=>"list_ad1","class_id"=>"999",)); ?>
									</div>
	               
							<?php if(is_array($list1)): foreach($list1 as $key=>$vo): ?><div class="media_link"> 
	                            <a href='<?php echo U("Article/Content/index",array("content_id"=>$vo[content_id],"uid"=>$uinfo[id],"time"=>time(),"fxapi2"=>1));?>' target="_blank" style="display: block;"> 
	                                <div class="media-body " style=" float: right; padding: 15px 10px 0 0"> 
	                                    <h4 class="media-heading media-middle"><?php echo len($vo[title],10)?></h4> 
	                                     <?php if($vo['actionstatus'] == 0 && $vo['sj_money'] && C('sj_mod')): ?><span class="sjrw">赏</span><?php endif; ?>
	                                     <?php if(isset($vo['yx_fee'])): ?><span class="sjrw" style=" background: #35E2EA;">意</span><?php endif; ?>
	                                    <?php if($vo['actionstatus']==0): if(isset($vo['yx_fee'])): ?><span style=" font-size: 12px; display: ;">意向佣金：￥<?php if($vo['yx_fee']>0){ echo $vo['yx_fee'];}else{ echo C('fx_content_jq');}?> </span> 
	                                     <?php else: ?>
	                                     <span style=" font-size: 12px; display: ;">分享佣金：￥<?php if($vo['fxyj']>0){ echo $vo['fxyj'];}elseif($vo['fxyj']==-1){ echo "0.00"; }else{ echo C('fx_content_jq');}?> <?php if($vo['areayj']): ?>[<?php echo ($vo["area"]); ?>(￥<?php echo ($vo["areayj"]); ?>)]<?php endif; ?> 分享后浏览：￥<?php if($vo['r_money']>0) echo $vo['r_money']; else echo C('fxview'); ?>  </span><?php endif; ?>
	                                     <?php else: ?>
	                                     <img src="images/over.png" style="position: absolute; bottom: 0px; right: 0px;" ><?php endif; ?>
	                                    
	                                    
	                                </div> 
	                                <div class="media-right" style="float: left; padding:8px 0 0 10px"> 
	                                    <img width="64" height="64"  src="<?php if($vo['image']): echo ($vo["image"]); else: echo service("DuxCms","Label","fragment",array("app"=>"DuxCms","label"=>"fragment","mark"=>"ewmurl",)); endif; ?>">	            
	                                    
	                                        </div> 
	                                    </a> 
	                                </div><?php endforeach; endif; ?>
									
									
									  </div>
									
									
									
									<div  style="text-align:center;background:#fff; overflow: hidden;margin-bottom: 55px;"  class="w_img_100" >
									
									</div>
									
									
									
									
									                <div id="ad_item"></div>
               
            </div>
        </div>
        
       
       <!--#include file="new_footer.html"-->
		<script>
		
		$(function(){
			$(".categories .btn").click(function(){
				if($(this).text()=='更多'){
				$(".categories_xiala").toggle();
				 return false;
				 }
			})
			$(".pager .num,.pager .current,.pager .end").hide();
			
			var pattern = /^http:\/\/mmbiz/;
        var prefix = 'http://img01.store.sogou.com/net/a/04/link?appid=100520031&w=710&url=';
        $(".media img").each(function(){
            var src = $(this).attr('src');
            if(pattern.test(src)){
                var newsrc = prefix+src;
                $(this).attr('src',newsrc);
            }
        });
			
		})
		
		
		</script>   
        	
	<script type="text/javascript">  
								
    $(document).ready(function(){  
    	//判断是否登录
		$.get(
			"<?php echo U('Home/Index/ajaxCheckLogin');?>",
			function(data){
				
				if(data.status!=1){
					alert("请先登录！");
					window.location = "<?php echo U('Home/Public/Login');?>";
				}
				
			},
			'json'
		);
		
		
        var range = 50;             //距下边界长度/单位px  
        var elemt = 500;           //插入元素高度/单位px  
        var maxnum = 200;            //设置加载最多次数  
        var num = 2;  
        var totalheight = 0; 
        var body =''; 
        var fxyj = "<?php echo C('fx_content_jq'); ?>";
        var fxview = "<?php echo C('fxview'); ?>";
        var defimg = '<?php echo service("DuxCms","Label","fragment",array("app"=>"DuxCms","label"=>"fragment","mark"=>"ewmurl",)); ?>'; 
        var main = $(".media");                     //主体元素  
        $(window).scroll(function(){ 

            var srollPos = $(window).scrollTop();    //滚动条距顶部距离(页面超出窗口的高度)  
            
            //console.log("滚动条到顶部的垂直高度: "+$(document).scrollTop());  
            //console.log("页面的文档高度 ："+$(document).height());  
            //console.log('浏览器的高度：'+$(window).height());  
              
            totalheight = parseFloat($(window).height()) + parseFloat(srollPos);  
            if(($(document).height()-range) <= totalheight  && num != maxnum) { 
			$("#loading").show();
            $.getJSON("<?php echo U('index_user');?>",{p:num,ajax:1},function(data){
				$("#loading").hide();         	
            	$.each(data,function(index,val){
            	var	img1 =  val.image?val.image:defimg;
            	var fxyj1 = val.fxyj?val.fxyj:fxyj;
            	var fxview1 = val.r_money?val.r_money:fxview;
            	var areatxt  = val.area?'['+val.area+'(￥'+val.areayj+')]':'';
            	var exttxt = '';
				var sj_mod = '<?php echo C("sj_mod");?>'
            	if(val.actionstatus==0){
                  if(sj_mod > 0 && val.sj_money > 0){	
            			exttxt ='<span class="sjrw">赏</span>';
            		 }
                  if(val.yx_fee > 0){
                	  exttxt ='<span class="sjrw" style=" background: #35E2EA;">意</span>';
                	  exttxt += '<span style=" font-size: 12px; display: ;">意向佣金：￥'+val.yx_fee+'</span>'; 
                  }else{
                	  exttxt += '<span style=" font-size: 12px; display: ;">分享佣金：￥'+fxyj1+areatxt+'  分享后浏览：￥'+fxview1+'  </span>'; 
                  }
     				
            	}else{
            		exttxt='<img src="images/over.png" style="position: absolute; bottom: 0px; right: 0px;" >';
            	}
            	 body = '<div class="media_link"><a href="'+val.aurl+'" target="_blank" style="display: block;"><div class="media-body " style=" float: right; padding: 15px 10px 0 0"><h4 class="media-heading media-middle">'+val.title+'</h4>'+exttxt+'</div><div class="media-right" style="float: left; padding:8px 0 0 10px"><img width="64" height="64"  src="'+img1+'"></div></a></div>';
             main.append(body);  
            	});
            },'json');            
                num++;  
            }  
        });  
    });  
    </script>      
      <!-- 置顶漂浮 -->
        <script type="text/javascript" src="js/navfix.js"></script>
			<script type="text/javascript">

			$(document).ready(function(e) {
			 $('#mynav').navfix(0,999);    
			});

			</script>  
			 <!-- 置顶漂浮 --> 
</body></html>