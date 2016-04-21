<?php if (!defined('THINK_PATH')) exit();?><h3><?php echo ($name); ?>字段 [<?php echo ($fieldsetInfo["name"]); ?>]</h3>

        <div class="m-panel ">
            <div class="panel-body">
            
        <form action="<?php echo U();?>" method="post" id="form" class="m-form m-form-horizontal">
        <fieldset>
          
        <div class="formitm">
            <label class="lab">名称</label>
            <div class="ipt">
                <input name="name" type="text"  class="form-element u-width-large  " id="name" value="<?php echo ($info["name"]); ?>" maxlength="200"  datatype="*" >
                <p class="help-block">当前字段集的描述</p>
            </div>
        </div>
    
        <div class="formitm">
            <label class="lab">字段名</label>
            <div class="ipt">
                <input name="field" type="text"  class="form-element u-width-large  " id="field" value="<?php echo ($info["field"]); ?>" maxlength="20"  datatype="/^(?!\d)\w+$/" errormsg="字段表只能为英文数字和下划线！">
                <p class="help-block">数据库中的表名</p>
            </div>
        </div>
    
        <div class="formitm">
            <label class="lab">字段类型</label>
            <div class="ipt">
                <select name="type" class="form-element">
        <?php if(is_array($typeField)): foreach($typeField as $key=>$vo): ?><option value="<?php echo ($key); ?>"
          <?php if($info['type']==$key): ?>selected="selected"<?php endif; ?>
          ><?php echo ($vo["name"]); ?> (<?php echo $propertyField[$vo['property']]['name']; ?>)
          </option><?php endforeach; endif; ?>
      </select>
                <p class="help-block"></p>
            </div>
        </div>
    
        <div class="formitm">
            <label class="lab">字段提示</label>
            <div class="ipt">
                <input name="tip" type="text"  class="form-element u-width-large  " id="tip" value="<?php echo ($info["tip"]); ?>"    >
                <p class="help-block">字段后面的提示信息</p>
            </div>
        </div>
    
        <div class="formitm">
            <label class="lab">字段后端验证</label>
            <div class="ipt">
                <select name="verify_type" class="form-element u-width-sall">
        <?php if(is_array($typeVerify)): foreach($typeVerify as $key=>$vo): ?><option value="<?php echo ($vo["data"]); ?>"
            <?php if($info['verify_type']==$vo['data']): ?>selected="selected"<?php endif; ?>
            ><?php echo ($vo["name"]); ?></option><?php endforeach; endif; ?>
      </select>
      <input name="verify_data" type="text"  class="form-element u-width-sall  " id="verify_data" value="<?php echo (base64_decode($info["verify_data"])); ?>"    >
      
        <select class="form-element dux-assign " target="#verify_data" id="" >
            <option value =" ">==内置规则==</option>
            <?php if(is_array($ruleVerify)): foreach($ruleVerify as $key=>$vo): ?><option value="<?php echo ($vo["data"]); ?>"><?php echo ($vo["name"]); ?></option><?php endforeach; endif; ?>
        </select>
                <p class="help-block">PHP处理时进行的验证，输入框为验证规则，不验证请留空</p>
            </div>
        </div>
    
        <div class="formitm">
            <label class="lab">字段js验证</label>
            <div class="ipt">
                <input name="verify_data_js" type="text"  class="form-element u-width-medium  " id="verify_data_js" value="<?php echo (base64_decode($info["verify_data_js"])); ?>"    >
      
        <select class="form-element dux-assign " target="#verify_data_js" id="" >
            <option value =" ">==内置规则==</option>
            <?php if(is_array($ruleVerifyJs)): foreach($ruleVerifyJs as $key=>$vo): ?><option value="<?php echo ($vo["data"]); ?>"><?php echo ($vo["name"]); ?></option><?php endforeach; endif; ?>
        </select>
                <p class="help-block">用于表单的JS验证规则，不验证请留空，请参考 validform.rjboy.cn</p>
            </div>
        </div>
    
    
        <div class="formitm">
            <label class="lab">验证条件</label>
            <div class="ipt">
                <select name="verify_condition" id="verify_condition"  class="form-element "><option value="1" <?php if(1 == $info['verify_condition']){ ?> selected="selected"  <?php } ?> >必须验证</option><option value="2" <?php if(2 == $info['verify_condition']){ ?> selected="selected"  <?php } ?> >不为空验证</option></select>
                <p class="help-block">指定的情况下进行验证</p>
            </div>
        </div>
    
    
        <div class="formitm">
            <label class="lab">验证失败提示</label>
            <div class="ipt">
                <input name="errormsg" type="text"  class="form-element u-width-large  " id="errormsg" value="<?php echo ($info["errormsg"]); ?>"    >
                <p class="help-block">验证失败后的提示信息，设置验证规则后请填写</p>
            </div>
        </div>
    
        <div class="formitm">
            <label class="lab">字段配置</label>
            <div class="ipt">
                <input name="config" type="text"  class="form-element u-width-large  " id="config" value="<?php echo ($info["config"]); ?>"    >
                <p class="help-block">如果为选择或下拉等类型时多个项目名用逗号分隔开</p>
            </div>
        </div>
    
        <div class="formitm">
            <label class="lab">默认值</label>
            <div class="ipt">
                <input name="default" type="text"  class="form-element u-width-large  " id="default" value="<?php echo ($info["default"]); ?>"    >
                <p class="help-block">默认的内容，如果为选择或下拉等类型时填写默认选择值，多个值用逗号分隔开</p>
            </div>
        </div>
    
        <div class="formitm">
            <label class="lab">字段顺序</label>
            <div class="ipt">
                <input name="sequence" type="text"  class="form-element u-width-mini  " id="sequence" value="<?php echo ((isset($info["sequence"]) && ($info["sequence"] !== ""))?($info["sequence"]):'0'); ?>" maxlength="20"  datatype="n" errormsg="只能输入数字">
                <p class="help-block">数字越小字段越靠前</p>
            </div>
        </div>
    
        <div class="formitm form-submit">
        <div class="ipt">
            <div class="tip" id="tips"></div>
            <button class="u-btn u-btn-success u-btn-large" type="submit" id="btn-submit">保存</button>
            <button class="u-btn u-btn-large" type="reset">重置</button>
        </div>
        </div>
    <input name="fieldset_id" type="hidden"  class="form-element u-width-large  " id="fieldset_id" value="<?php echo ($fieldsetInfo["fieldset_id"]); ?>"    >
    <input name="field_id" type="hidden"  class="form-element u-width-large  " id="field_id" value="<?php echo ($info["field_id"]); ?>"    >
        </fieldset>
        </form>
            </div> </div>
<script>
Do.ready('base',function() {
	$('#form').duxForm();
});
</script>