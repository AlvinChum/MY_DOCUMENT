<?php if (!defined('THINK_PATH')) exit();?><h3><?php echo ($name); ?>碎片</h3>

        <div class="m-panel ">
            <div class="panel-body">
            
        <form action="<?php echo U();?>" method="post" id="form" class="m-form m-form-horizontal">
        <fieldset>
          
        <div class="formitm">
            <label class="lab">碎片名称</label>
            <div class="ipt">
                <input name="name" type="text"  class="form-element u-width-large  " id="name" value="<?php echo ($info["name"]); ?>" maxlength="250"  datatype="*" >
                <p class="help-block">碎片名称</p>
            </div>
        </div>
  
        <div class="formitm">
            <label class="lab">碎片标识</label>
            <div class="ipt">
                <input name="label" type="text"  class="form-element u-width-large  " id="label" value="<?php echo ($info["label"]); ?>" maxlength="250"  datatype="/^(?!\d)\w+$/" errormsg="碎片标识只能为英文数字和下划线！">
                <p class="help-block">用于碎片调用</p>
            </div>
        </div>
  
        <div class="formitm">
            <label class="lab">碎片内容</label>
            <div class="ipt">
                <textarea name="content" type="text"  class="form-element u-width-large u-editor" id="content" value="" rows="20"   ><?php echo (htmlspecialchars_decode($info["content"])); ?></textarea>
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
  <input name="fragment_id" type="hidden"  class="form-element u-width-large  " id="fragment_id" value="<?php echo ($info["fragment_id"]); ?>"    >
        </fieldset>
        </form>
            </div> </div>
<script>
Do.ready('base',function() {
    $('#form').duxFormPage();
});
</script>