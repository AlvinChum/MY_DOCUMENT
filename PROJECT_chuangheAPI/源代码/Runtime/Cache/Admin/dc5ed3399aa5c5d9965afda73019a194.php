<?php if (!defined('THINK_PATH')) exit();?><h3>用户组权限</h3>

        <div class="m-panel ">
            <div class="panel-body">
            
        <form action="<?php echo U();?>" method="post" id="form" class="m-form ">
        <fieldset>
          <div class="g-grid">
          
        <div class="g-col-2-1  ">
          <legend>操作权限</legend>
      <?php if(is_array($AdminPurvew)): foreach($AdminPurvew as $key=>$app): if(is_array($app)): foreach($app as $listMode=>$list): ?><div class="formitm">
            <label class="lab"><?php echo ($list["name"]); ?></label>
            <div class="ipt">
                <label class="radio-inline"> <input name="base_purview[]" class="AdminPurvew" type="checkbox" 
              
          
              <?php if(in_array($key.'_'.$listMode,(array)$AdminPurvewArray)): ?>checked<?php endif; ?>
              value="<?php echo ($key); ?>_<?php echo ($listMode); ?>">
              模块 </label>
            <?php if(is_array($list['auth'])): foreach($list['auth'] as $action=>$vo): ?><label class="radio-inline"> <input name="base_purview[]" class="AdminPurvew" type="checkbox" 
                
            
                <?php if(in_array($key.'_'.$listMode.'_'.$action,(array)$AdminPurvewArray)): ?>checked<?php endif; ?>
                value="<?php echo ($key); ?>_<?php echo ($listMode); ?>_<?php echo ($action); ?>">
                <?php echo ($vo); ?> </label><?php endforeach; endif; ?>
                <p class="help-block"> </p>
            </div>
        </div><?php endforeach; endif; endforeach; endif; ?>
        </div>
    
    
        <div class="g-col-2-1  ">
          <legend>菜单权限</legend>
      <?php if(is_array($AdminMenu)): foreach($AdminMenu as $topLabel=>$top): ?><div class="formitm">
            <label class="lab"><?php echo ($top["name"]); ?></label>
            <div class="ipt">
                <?php if(is_array($top['menu'])): foreach($top['menu'] as $parentLabel=>$parent): ?><label class="radio-inline"> <input name="menu_purview[]" class="AdminMenu" type="checkbox" 
                
          
              <?php if(in_array($top['name'].'_'.$parent['name'],(array)$AdminMenuArray) ): ?>checked<?php endif; ?>
              value="<?php echo ($top["name"]); ?>_<?php echo ($parent["name"]); ?>">
              <?php echo ($parent["name"]); ?> </label><?php endforeach; endif; ?>
                <p class="help-block"> </p>
            </div>
        </div><?php endforeach; endif; ?>
        </div>
          </div>
        
  
        <div class="formitm form-submit">
        <div class="ipt">
            <div class="tip" id="tips"></div>
            <button class="u-btn u-btn-success u-btn-large" type="submit" id="btn-submit">保存</button>
            <button class="u-btn u-btn-large" type="reset">重置</button>
        </div>
        </div>
  <input name="group_id" type="hidden"  class="form-element u-width-large  " id="group_id" value="<?php echo ($info["group_id"]); ?>"    >
        </fieldset>
        </form>
            </div> </div>
<script>
Do.ready('base',function() {
	$('#form').duxForm();
});


</script>