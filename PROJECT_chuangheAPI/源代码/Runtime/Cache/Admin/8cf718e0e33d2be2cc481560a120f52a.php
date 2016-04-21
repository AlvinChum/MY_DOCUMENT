<?php if (!defined('THINK_PATH')) exit();?><div class="g-grid">
  <div class="g-col-4-1">
    <div class="m-panel s-panel-info">
      <div class="panel-header">
        <div class="f-cb">
          <div class="f-fl"><i class="u-icon-th-list u-font-5x"></i></div>
          <div class="f-fr f-tar">
            <h3><?php echo D('DuxCms/Category')->countList(); ?></h3>
            <p>栏目总数</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="g-col-4-1">
    <div class="m-panel s-panel-danger">
      <div class="panel-header">
        <div class="f-cb">
          <div class="f-fl"> <i class="u-icon-file-text u-font-5x"></i> </div>
          <div class="f-fr f-tar">
            <h3><?php echo D('DuxCms/Content')->countList(); ?></h3>
            <p>内容总数</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="g-col-4-1">
    <div class="m-panel s-panel-success">
      <div class="panel-header">
        <div class="f-cb">
          <div class="f-fl"> <i class="u-icon-tags u-font-5x"></i> </div>
          <div class="f-fr f-tar">
            <h3><?php echo D('DuxCms/Tags')->countList(); ?></h3>
            <p>TAG总数</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="g-col-4-1 g-col-last">
    <div class="m-panel s-panel-warning">
      <div class="panel-header">
        <div class="f-cb">
          <div class="f-fl"> <i class="u-icon-comments u-font-5x"></i> </div>
          <div class="f-fr f-tar">
            <h3><?php echo D('DuxCms/Fragment')->countList(); ?></h3>
            <p>碎片总数</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="g-grid">
 <div class="g-col-2-1">
    <div class="m-panel">
      <div class="panel-header"> <i class="u-icon-bar-chart-o"></i> 程序信息 </div>
      <div class="m-table-mobile">
        <table class="m-table">
          <tbody>
            <tr>
              <td>站点名称</td>
              <td><?php echo C('SITE_TITLE');?></td>
            </tr>
            <tr>
              <td>网站域名：</td>
              <td><a href="http://<?php echo ($_SERVER["SERVER_NAME"]); ?>" target="_blank">http://<?php echo ($_SERVER["SERVER_NAME"]); ?></a></td>
            </tr>
            <tr>
              <td>程序版本</td>
              <td><?php echo DUX_VER;?> (<?php echo ($curv); ?>)</td>
            </tr>
            <tr>
              <td>开发者信息</td>
              <td><a href="http://shanmao.me" target="_blank">开发者博客</a> <a href="http://jnooo.cn" target="_blank">软件官网</a> 微信公众号：shanmaome</td>
            </tr>
			 
            <tr>
              <td>PHP版本</td>
              <td><?php echo phpversion();?></td>
            </tr>
            <tr>
              <td>数据驱动</td>
              <td><?php echo C('DB_TYPE');?></td>
            </tr>
            <tr>
              <td>附件上传目录：</td>
              <td><?php echo APP_PATH;?>upload</td>
            </tr>
           
           
          </tbody>
        </table>
      </div>
    </div>
  </div>
  
  <div class="g-col-2-1  g-col-last">
    <div class="m-panel">
      <div class="panel-header"> <i class="u-icon-bar-chart-o"></i> 自动升级 (当前版本：<?php echo ($curv); ?>。最后升级时间：<?php echo (date("y-m-d H:i:s",$enduptime)); ?>) <font color="red" ><?php echo ($upmsg); ?></font></div>
      <div class="m-table-mobile">
      
       
	   <div style="width:98%; height: 235px; padding: 10px; overflow: auto;" id="uptext">正在获取升级信息……</div>
	   
	  <button id="upclick"> <?php if(strstr(get_cfg_var("disable_functions"),'exec') && PHP_OS=='Linux') echo '您有被屏蔽函数exec无法自动升级！'; else echo '点击一键升级';?> </button>
       
      </div>
    </div>
  </div>
  
  
</div>




  <div class="g-col-2-1">
    <div class="m-panel">
      <div class="panel-header"> <i class="u-icon-bars"></i> 环境信息 </div>
      <div class="m-table-mobile">
        <table class="m-table">
          <tbody>
            <tr>
              <td>系统环境</td>
              <td><?php echo PHP_OS;?>/<?php echo $_SERVER['SERVER_SOFTWARE'] ; ?></td>
            </tr>
            <tr>
              <td>服务器地址:</td>
              <td><?php echo ($_SERVER["SERVER_ADDR"]); ?>:<?php echo ($_SERVER["SERVER_PORT"]); ?></td>
            </tr>
            <tr>
              <td>服务器时间</td>
              <td><?php echo date('Y-m-d H:i:s');?> <?php echo date_default_timezone_get();?></td>
            </tr>
            <tr>
              <td>脚本超时时间</td>
              <td><?php echo get_cfg_var("max_execution_time") ; ?> 秒</td>
            </tr>
            <tr>
              <td>上传大小</td>
              <td><?php echo get_cfg_var("upload_max_filesize")?get_cfg_var("upload_max_filesize"):"不允许上传文件" ; ?></td>
            </tr>
            <tr>
              <td>被屏蔽的函数:</td>
              <td><?php echo get_cfg_var("disable_functions")?get_cfg_var("disable_functions"):"无" ; ?></td>
            </tr>
            <tr>
              <td>URL路径：</td>
              <td>/</td>
            </tr>
          <td>物理路径：</td>
            <td><?php echo dirname(THINK_PATH);?></td>
          </tr>
            </tbody>
          
        </table>
      </div>
    </div>
  </div>


<script>
	$(function(){
		$.get("/index.php?s=/Admin/Jnooocn/checkup",function(data){
			//alert(data.act);
			if(data.status==1){				
				if(data.act){
					doact(data.act)
				}
			}else{
				$("#uptext").html(data.msg);
			}
		},'json');
		
		
		$("#upclick").click(function(){
			
			if($("#uptext").text()=='正在获取升级信息……'){
				alert("正在检测，请稍后点击……");
				return false;
			}
			if(!confirm("您确定您已经备份好了您的网站？由于没有备份引起的任何问题，我们不负任何责任！")){
				return false;
			}
			
			$.post("/index.php?s=/Admin/Jnooocn/doup",{doup:1},function(data){				
					if(data.status==1){										
				if(data.act){
					$("#uptext").html('');
					$("#uptext").prepend(data.msg+"<br>");
					doact(data.act);					
				}
			}else{
				$("#uptext").html(data.msg);
			}
			},'json')			
		})
		
	})
	
	function doact(act){		
		$.post("/index.php?s=/Admin/Jnooocn/doact",{act:act},function(data){
			if(data.status==1){	
			$("#uptext").prepend(data.msg+"<br>");			
				if(data.act){					
					doact(data.act);
				}else{
					if(act=='showinfo'){
						$("#uptext").html('');
						$.each(data.info,function(index,val){							
							$("#uptext").append(val.content+"<br>")
						});
					}
				}
			}else{				
				$("#uptext").html(data.msg);
				$("#uptext").prepend(data.info+"<br>");
			}
			
			//console.log(data)
			
		},'json')
	}
</script>