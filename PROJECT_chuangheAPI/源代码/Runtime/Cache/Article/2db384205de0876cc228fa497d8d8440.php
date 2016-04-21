<?php if (!defined('THINK_PATH')) exit();?><h3><?php echo ($name); ?>文章</h3>

        <form action="<?php echo U();?>" method="post" id="form" class="m-form ">
        <fieldset>
          <div class="g-main-body">
    <div class="g-main-content m-form-horizontal">
      
        <div class="m-panel ">
            <div class="panel-body">
            当前地区：<?php echo ($area["country"]); ?> - <?php echo ($area["province"]); ?> - <?php echo ($area["city"]); ?> <?php echo ($area["district"]); ?>
    	
    	 
        <div class="formitm">
            <label class="lab">采集网址</label>
            <div class="ipt">
                <input name="wxurl" type="text"  class="form-element u-width-large  " id="wxurl" value="<?php echo ($info["wxurl"]); ?>" maxlength="250"   >
           <input type="button" value="点击采集" id="caiji">
                <p class="help-block">输入(微信/今日头条)网址后可一键采集。</p>
            </div>
        </div>
    	
        
        <div class="formitm">
            <label class="lab">文章栏目</label>
            <div class="ipt">
                <select name="class_id" class="form-element" id="class_id">
            <option value="0">==请选择栏目==</option>
            <?php if(is_array($categoryList)): foreach($categoryList as $key=>$vo): ?><option value="<?php echo ($vo["class_id"]); ?>" 
              <?php if($info['class_id'] == $vo['class_id']): ?>selected="selected"<?php endif; ?>
              <?php if($vo['type'] == 0 || $vo['app'] != MODULE_NAME ): ?>style="background-color:#CCC" disabled="disabled"<?php endif; ?>
              ><?php echo ($vo["cname"]); ?>
              </option><?php endforeach; endif; ?>
          </select>
                <p class="help-block">当前文章的所属栏目</p>
            </div>
        </div>
        
        <div class="formitm">
            <label class="lab">文章标题</label>
            <div class="ipt">
                <input name="title" type="text"  class="form-element u-width-large  " id="title" value="<?php echo ($info["title"]); ?>" maxlength="250"  datatype="*" >
          <select name="font_color" class="form-element" id="font_color">
            <option value="0">==标题颜色==</option>
            <option style="color: White;background-color: red;" value="<?php echo ($vo["red"]); ?>">红色</option>
            <option style="color: White;background-color: blue;" value="<?php echo ($vo["blue"]); ?>">蓝色</option>
            <option style="color: White;background-color: green;" value="<?php echo ($vo["green"]); ?>">绿色</option>
            <option style="color: White;background-color: orange;" value="<?php echo ($vo["orange"]); ?>">橙色</option>
            <option style="color: Black;background-color: White;" value="<?php echo ($vo["White"]); ?>">白色</option>
            <option style="color: White;background-color: Black;" value="<?php echo ($vo["Black"]); ?>">黑色</option>
          </select>
          <label>
            <input name="font_bold" type="checkbox" id="font_bold" value="1">
            <span>加粗</span></label>
          <label>
            <input name="font_em" type="checkbox" id="font_em" value="1">
            <span>倾斜</span></label>
                <p class="help-block">文章标题请不要填写特殊字符</p>
            </div>
        </div>
        
        <div class="formitm">
            <label class="lab">文章推荐</label>
            <div class="ipt">
                <?php $positionArray = explode(',',$info['position']); ?>
         <?php if(is_array($positionList)): foreach($positionList as $key=>$vo): ?><label>
            <input name="position[]" type="checkbox" 
             <?php if(in_array($vo['position_id'],$positionArray)): ?>checked="checked"<?php endif; ?>
             value="<?php echo ($vo["position_id"]); ?>" />
            <span><?php echo ($vo["name"]); ?></span></label><?php endforeach; endif; ?>
                <p class="help-block">将文章推荐到指定调用位置</p>
            </div>
        </div>
        
        <div class="formitm">
            <label class="lab">文章内容</label>
            <div class="ipt">
                <textarea name="content" type="text"  class="form-element u-width-large u-editor" id="content" value="" rows="20"   ><?php echo (html_out($info["content"])); ?></textarea>
                <p class="help-block"></p>
            </div>
        </div>
        
        <div class="formitm">
            <label class="lab">内容功能</label>
            <div class="ipt">
                <label>
            <input name="get_image" id="get_image" type="checkbox" value="1" />
            <span>提取第
            <input name="get_image_num" type="number"  class="form-element u-width-mini  " id="get_image_num" value="1" maxlength="10"   >
            张图片作封面</span></label>
          <label>
            <input name="get_description" id="get_description" type="checkbox" value="1" />
            <span>提取文章描述</span></label>
                <p class="help-block"></p>
            </div>
        </div>
        <div id="expand"></div>
        
        <div class="formitm">
            <label class="lab">文章描述</label>
            <div class="ipt">
                <textarea name="description" type="text"  class="form-element u-width-large " id="description" value="" rows="3"   ><?php echo ($info["description"]); ?></textarea>
                <p class="help-block">不填写描述信息系统将会自动获取</p>
            </div>
        </div>
        
        <div class="formitm">
            <label class="lab">关键词/TAG</label>
            <div class="ipt">
                <div class="input-group">
            <input name="keywords" type="text"  class="form-element u-width-large  " id="keywords" value="<?php echo ($info["keywords"]); ?>" maxlength="250"   >
            <select name="taglink" id="taglink"  class="form-element "><option value="0" <?php if(0 == $info['taglink']){ ?> selected="selected"  <?php } ?> >不链接TAG</option><option value="1" <?php if(1 == $info['taglink']){ ?> selected="selected"  <?php } ?> >链接TAG</option></select>
            <a class="u-btn u-btn-primary" href="javascript:;" id="getKeyword" >提取</a> </div>
                <p class="help-block">选择链接TAG后将会为内容的关键词链接TAG列表</p>
            </div>
        </div>
        
        <div class="formitm">
            <label class="lab">文章状态</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="status" id="status0" value="1"   <?php if(!isset($info['status'])){ $info['status']= "1"; } if(1 == $info['status']){ ?> checked="checked" <?php } ?> > <span>发布</span>
                    </label> <label>
                      <input type="radio" name="status" id="status1" value="0"   <?php if(!isset($info['status'])){ $info['status']= "1"; } if(0 == $info['status']){ ?> checked="checked" <?php } ?> > <span>草稿</span>
                    </label>   <br>
          
           <label>
                      <input type="radio" name="actionstatus" id="actionstatus0" value="1"   <?php  if(1 == $info['actionstatus']){ ?> checked="checked" <?php } ?> > <span>任务已完成</span>
                    </label> <label>
                      <input type="radio" name="actionstatus" id="actionstatus1" value="0"   <?php  if(0 == $info['actionstatus']){ ?> checked="checked" <?php } ?> > <span>任务进行中</span>
                    </label> 
                <p class="help-block"></p>
            </div>
        </div>
        
        <div class="formitm form-submit">
        <div class="ipt">
            <div class="tip" id="tips"></div>
            <button class="u-btn u-btn-success u-btn-large" type="submit" id="btn-submit">保存</button>
            <button class="u-btn u-btn-large" type="reset">重置</button>
        </div>
        </div>
            </div> </div>
    </div>
  </div>
  <div class="g-main-sidebar">
    
        <div class="m-panel "><div class="panel-header"> <span class="icon"><i class="u-icon-plus"></i></span> 形象图 </div>
            <div class="panel-body">
            <div class="u-thumbnail">
        <?php if(empty($info['image'])): ?><img id="content_image" src="/Public/admin/images/placeholder.jpg" width="270" alt="">
        <?php else: ?>
        <img id="content_image" src="<?php echo ($info["image"]); ?>" width="270" alt=""><?php endif; ?>
        </div>
        <input name="image" type="text"  class="form-element u-width-medium  " id="image" value="<?php echo ($info["image"]); ?>" maxlength="250"   >
        <a class="u-btn u-btn-primary" data="image" href="javascript:;" id="upload">上传</a>
            </div> </div>
    
        <div class="m-panel "><div class="panel-header"> <span class="icon"><i class="u-icon-plus"></i></span> 发布属性 </div>
            <div class="panel-body">
            
        <div class="formitm">
            <label class="lab">发布时间</label>
            <div class="ipt">
                <?php if(empty($info['time'])): ?><input name="time" type="text"  class="form-element u-width-large u-time " id="time" value="<?php echo date('Y/m/d H:i');?>" maxlength="250"  datatype="*" >
          <?php else: ?>
          <input name="time" type="text"  class="form-element u-width-large u-time " id="time" value="<?php echo (date('Y/m/d H:i',$info["time"])); ?>" maxlength="250"  datatype="*" ><?php endif; ?>
                <p class="help-block">请按照格式填写发布时间</p>
            </div>
        </div>
      
        <div class="formitm">
            <label class="lab">来源</label>
            <div class="ipt">
                <input name="copyfrom" type="text"  class="form-element u-width-large  " id="copyfrom" value="<?php echo ((isset($info["copyfrom"]) && ($info["copyfrom"] !== ""))?($info["copyfrom"]):'本站'); ?>" maxlength="200"   >
                <p class="help-block">当然内容来源</p>
            </div>
        </div>
      
        <div class="formitm">
            <label class="lab">访问量</label>
            <div class="ipt">
                <input name="views" type="number"  class="form-element u-width-large  " id="views" value="<?php echo ((isset($info["views"]) && ($info["views"] !== ""))?($info["views"]):'0'); ?>" maxlength="10"   >
                <p class="help-block">文章点击次数</p>
            </div>
        </div>
      
        <div class="formitm">
            <label class="lab">顺序</label>
            <div class="ipt">
                <input name="sequence" type="number"  class="form-element u-width-large  " id="sequence" value="<?php echo ((isset($info["sequence"]) && ($info["sequence"] !== ""))?($info["sequence"]):'0'); ?>" maxlength="10"   >
                <p class="help-block">开启自定义排序有效</p>
            </div>
        </div>
            </div> </div>
    
        <div class="m-panel "><div class="panel-header"> <span class="icon"><i class="u-icon-plus"></i></span> 高级属性 </div>
            <div class="panel-body">
            
        <div class="formitm">
            <label class="lab">内容URL</label>
            <div class="ipt">
                <input name="urltitle" type="text"  class="form-element u-width-large  " id="urltitle" value="<?php echo ($info["urltitle"]); ?>" maxlength="250"   >
                <p class="help-block">设置URL规则后会生效</p>
            </div>
        </div>
      
        <div class="formitm">
            <label class="lab">跳转到</label>
            <div class="ipt">
                <input name="url" type="text"  class="form-element u-width-large  " id="url" value="<?php echo ($info["url"]); ?>" maxlength="250"   >
                <p class="help-block">设置后访问内容会跳转</p>
            </div>
        </div>
      
        <div class="formitm">
            <label class="lab">内容模板</label>
            <div class="ipt">
                <input name="tpl" type="text"  class="form-element u-width-small  " id="tpl" value="<?php echo ($info["tpl"]); ?>" maxlength="250"   >
        
        <select class="form-element dux-assign u-width-small" target="#tpl" id="" >
            <option value =" ">请选择</option>
            <?php if(is_array($tplList)): foreach($tplList as $key=>$vo): ?><option value="<?php echo ($vo["name"]); ?>"><?php echo ($vo["file"]); ?></option><?php endforeach; endif; ?>
        </select>
                <p class="help-block">不设置将使用列表设置模板</p>
            </div>
        </div>
            </div> </div>
  </div>
  </admin:row>
   <input name="user_id" type="hidden"  class="form-element u-width-large  " id="user_id" value="<?php echo ($info["user_id"]); ?>"    >
  <input name="content_id" type="hidden"  class="form-element u-width-large  " id="content_id" value="<?php echo ($info["content_id"]); ?>"    >
        </fieldset>
        </form>
<script>
    Do.ready('base', function () {
        //表单综合处理
        $('#form').duxFormPage();
        //上传缩略图
        $('#upload').duxFileUpload({
            type: 'jpg,png,gif,bmp',
            slt:'1',
            complete: function (data) {
                $('#content_image').attr('src', data.url);
            }
        });
        //提取关键词
        $('#getKeyword').click(function () {
            $.post('<?php echo U("DuxCms/ContentTools/getKerword");?>', {
                    title: $('#content').val(),
                    content: $('#description').val()
                },
                function (data) {
                    if (data.status) {
                        $('#keywords').val(data.info);
                    } else {
                        alert(data.info);
                    }
                }, 'json');
        });
		//动态获取扩展字段
		$('#class_id').change(function() {
			$('#expand').load('<?php echo U("DuxCms/AdminExpand/getField");?>',{class_id:$(this).val(),content_id:$('#content_id').val()},function(){
				$('#expand').duxFormPage({form:false});
			});
		});
		$('#class_id').change();
		
		
		
		
		$("#caiji").click(function(){
		var url = $("#wxurl").val();
		$.post('<?php echo U("Article/AdminContent/cjwx");?>',{url:url},function(data){
			//console.log(data);
			if(data.status==1){
				$("#title").val(data.info.title);
				KindEditor.html("#content",data.info.body);
				KindEditor.sync("#content");
				//$("#get_image").attr("checked","checked");
				if(data.info.litimg) {
					$("#image").val(data.info.litimg); 
					$("#content_image").attr('src',data.info.litimg);
					}
			}else{
				alert(data.info);
			}
		},'json');
		})
    }); 
    
    
    $(function(){
    console.log();	
    })
</script>