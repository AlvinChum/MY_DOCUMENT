<?php if (!defined('THINK_PATH')) exit();?><h3>详情</h3>

        <form action="<?php echo U();?>" method="post" id="form" class="m-form ">
        <fieldset>
          <div class="g-main-body">
    <div class="g-main-content m-form-horizontal">
      
        <div class="m-panel ">
            <div class="panel-body">
            
        <div class="formitm">
            <label class="lab">uid</label>
            <div class="ipt">
                <input name="" type="text"  class="form-element u-width-large  " id="" value=" <?php echo ($info["uid"]); ?>" maxlength="20"  datatype="*" >
                <p class="help-block">用户uid</p>
            </div>
        </div>
       
        <div class="formitm">
            <label class="lab">金额</label>
            <div class="ipt">
                <input name="" type="text"  class="form-element u-width-large  " id="" value="<?php echo ($info["fee"]); ?>" maxlength="250"   >
                <p class="help-block">金额</p>
            </div>
        </div> 
       
        <div class="formitm">
            <label class="lab">类型</label>
            <div class="ipt">
                <input name="" type="text"  class="form-element u-width-large  " id="" value="<?php echo ($type[$info[type]]); ?>" maxlength="250"   >
                <p class="help-block">类型</p>
            </div>
        </div>  
       
       
        <div class="formitm">
            <label class="lab">描述</label>
            <div class="ipt">
                <textarea name="" type="text"  class="form-element u-width-large " id="" value="" rows="3"   ><?php echo ($info["body"]); ?></textarea>
                <p class="help-block">描述</p>
            </div>
        </div>
       
       
        <div class="formitm">
            <label class="lab">创建时间</label>
            <div class="ipt">
                <input name="" type="text"  class="form-element u-width-large  " id="" value="<?php echo (date("Y-m-d H:i:s",$info["time"])); ?>"    >
                <p class="help-block">创建时间</p>
            </div>
        </div>
          
       
        <div class="formitm">
            <label class="lab">状态</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="status" id="status0" value="1"   <?php if(!isset($info['status'])){ $info['status']= "1"; } if(1 == $info['status']){ ?> checked="checked" <?php } ?> > <span>成功</span>
                    </label> <label>
                      <input type="radio" name="status" id="status1" value="2"   <?php if(!isset($info['status'])){ $info['status']= "1"; } if(2 == $info['status']){ ?> checked="checked" <?php } ?> > <span>审核中</span>
                    </label> <label>
                      <input type="radio" name="status" id="status2" value="0"   <?php if(!isset($info['status'])){ $info['status']= "1"; } if(0 == $info['status']){ ?> checked="checked" <?php } ?> > <span>失败</span>
                    </label> 
                <p class="help-block">状态</p>
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
  <input name="id" type="hidden"  class="form-element u-width-large  " id="id" value="<?php echo ($info["id"]); ?>"    >
        </fieldset>
        </form>
<script>
    Do.ready('base', function () {
        //表单综合处理
        $('#form').duxFormPage();
        //上传缩略图
        $('#upload').duxFileUpload({
            type: 'jpg,png,gif,bmp',
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
    }); 
</script>