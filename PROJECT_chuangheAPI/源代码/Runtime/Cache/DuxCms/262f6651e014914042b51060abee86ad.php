<?php if (!defined('THINK_PATH')) exit();?><h3><?php echo ($name); echo ($formInfo["name"]); ?></h3>

        <div class="m-panel ">
            <div class="panel-body">
            
        <form action="<?php echo U();?>" method="post" id="form" class="m-form m-form-horizontal">
        <fieldset>
          <?php echo ($html); ?>
    
        <div class="formitm form-submit">
        <div class="ipt">
            <div class="tip" id="tips"></div>
            <button class="u-btn u-btn-success u-btn-large" type="submit" id="btn-submit">保存</button>
            <button class="u-btn u-btn-large" type="reset">重置</button>
        </div>
        </div>
    <input name="fieldset_id" type="hidden"  class="form-element u-width-large  " id="fieldset_id" value="<?php echo ($formInfo["fieldset_id"]); ?>"    >
    <input name="data_id" type="hidden"  class="form-element u-width-large  " id="data_id" value="<?php echo ($info["data_id"]); ?>"    >
        </fieldset>
        </form>
            </div> </div>
<script>
Do.ready('base',function() {
	$('#form').duxFormPage();
});
</script>