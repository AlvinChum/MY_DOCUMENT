<?php if (!defined('THINK_PATH')) exit();?><h3>手机版设置</h3>

        <div class="m-panel ">
            <div class="panel-body">
            
        <form action="<?php echo U('tpl');?>" method="post" id="form" class="m-form m-form-horizontal">
        <fieldset>
          
        <div class="formitm">
            <label class="lab">开启手机版</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="mobile_status" id="mobile_status0" value="1"   <?php  if(1 == $info['mobile_status']){ ?> checked="checked" <?php } ?> > <span>开启</span>
                    </label> <label>
                      <input type="radio" name="mobile_status" id="mobile_status1" value="0"   <?php  if(0 == $info['mobile_status']){ ?> checked="checked" <?php } ?> > <span>关闭</span>
                    </label> 
                <p class="help-block">请根据需要开启</p>
            </div>
        </div>
    
        <div class="formitm">
            <label class="lab">手机模板</label>
            <div class="ipt">
                <div  class="input-group">
      <input name="mobile_tpl" type="text"  class="form-element u-width-small  " id="mobile_tpl" value="<?php echo ($info["mobile_tpl"]); ?>" maxlength="250"  datatype="*" >
      
        <select class="form-element dux-assign " target="#mobile_tpl" id="" >
            <option value =" ">请选择</option>
            <?php if(is_array($themesList)): foreach($themesList as $key=>$vo): ?><option value="<?php echo ($vo["name"]); ?>"><?php echo ($vo["file"]); ?></option><?php endforeach; endif; ?>
        </select>
    </div>
                <p class="help-block">手机版所使用的主题</p>
            </div>
        </div>
    
        <div class="formitm">
            <label class="lab">绑定域名</label>
            <div class="ipt">
                <div  class="input-group">
      <input name="mobile_domain" type="text"  class="form-element u-width-large  " id="mobile_domain" value="<?php echo ($info["mobile_domain"]); ?>" maxlength="250"   >
    </div>
                <p class="help-block">绑定域名后可通过域名访问手机版，如：m.baidu.com</p>
            </div>
        </div>
  
        <div class="formitm form-submit">
        <div class="ipt">
            <div class="tip" id="tips"></div>
            <button class="u-btn u-btn-success u-btn-large" type="submit" id="btn-submit">保存</button>
            <button class="u-btn u-btn-large" type="reset">重置</button>
        </div>
        </div>
        </fieldset>
        </form>
            </div> </div>
<script>
Do.ready('base', function() {
	$('#form').duxForm();
});
</script>