<?php if (!defined('THINK_PATH')) exit();?><h3>字段列表 [<?php echo ($fieldsetInfo["name"]); ?>]</h3>

        <div class="m-panel ">
            <div class="panel-body">
            <div class="m-table-mobile"><table id="table" class="m-table m-table-border"><thead><tr><th>名称</th><th>字段</th><th>排序</th><th>类型</th><th>验证</th><th width="120">操作</th></tr></thead><tbody><?php if(is_array($list)): foreach($list as $key=>$vo): ?><tr>
        <td><?php echo ($vo["name"]); ?></td>
        <td><?php echo ($vo["field"]); ?></td>
        <td><?php echo ($vo["sequence"]); ?></td>
        <td><?php echo $typeField[$vo['type']]['name']; ?></td>
        <td><?php $vo['verify_data']=base64_decode($vo['verify_data']); ?>
          <?php if($vo['verify_data']): ?><span class="u-badge u-badge-success">验证</span>
            <?php else: ?>
            <span class="u-badge u-badge-danger">不验证</span><?php endif; ?></td>
        <td><a class="u-btn u-btn-primary u-btn-small" href="<?php echo U('edit',array('field_id'=>$vo['field_id'],'fieldset_id'=>$vo['fieldset_id']));?>">修改</a> <a class="u-btn u-btn-danger u-btn-small del" href="javascript:;" url="<?php echo U('del');?>" data="<?php echo ($vo["field_id"]); ?>">删除</a></td>
      </tr><?php endforeach; endif; ?></tbody></table></div>
            </div> </div>
<script>
Do.ready('base',function() {
	$('#table').duxTable({});
});
</script>