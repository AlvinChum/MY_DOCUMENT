<?php if (!defined('THINK_PATH')) exit();?><h3><?php echo ($name); ?>推荐位</h3>

        <div class="m-panel ">
            <div class="panel-body">
            
        <form action="<?php echo U();?>" method="post" id="form" class="m-form m-form-horizontal">
        <fieldset>
          
        <div class="formitm">
            <label class="lab">推荐位名称</label>
            <div class="ipt">
                <input name="name" type="text"  class="form-element u-width-large  " id="name" value="<?php echo ($info["name"]); ?>" maxlength="250"  datatype="*" >
                <p class="help-block">推荐位名称</p>
            </div>
        </div>
  
        <div class="formitm">
            <label class="lab">推荐位顺序</label>
            <div class="ipt">
                <input name="sequence" type="number"  class="form-element u-width-mini  " id="sequence" value="<?php echo ((isset($info["sequence"]) && ($info["sequence"] !== ""))?($info["sequence"]):'0'); ?>" maxlength="10"   >
                <p class="help-block">数字越小越靠前</p>
            </div>
        </div>
  
        <div class="formitm form-submit">
        <div class="ipt">
            <div class="tip" id="tips"></div>
            <button class="u-btn u-btn-success u-btn-large" type="submit" id="btn-submit">保存</button>
            <button class="u-btn u-btn-large" type="reset">重置</button>
        </div>
        </div>
  <input name="position_id" type="hidden"  class="form-element u-width-large  " id="position_id" value="<?php echo ($info["position_id"]); ?>"    >
        </fieldset>
        </form>
            </div> </div>
<script>
Do.ready('base',function() {
    $('#form').duxFormPage();
});
</script>