<?php if (!defined('THINK_PATH')) exit();?><h3><?php echo ($formInfo["name"]); ?>列表</h3>


        <div class="m-panel ">
            <div class="panel-body">
            <div class="m-table-tool f-cb">
            <div class="tool-search f-cb">
                    <form action="<?php echo ($url); ?>" method="post">
                        <input type="text" class="form-element" name="keyword" value="<?php echo ($keyword); ?>" />
                        <button class="u-btn u-btn-primary" type="submit">搜索</button>
                    </form></div>
            </div>
	<table id="table" class="m-table ">
    	<thead>
        <th width="50">编号</th>
        <?php if(is_array($tableTh)): foreach($tableTh as $key=>$vo): ?><th><?php echo ($vo); ?></th><?php endforeach; endif; ?>
        <?php if($formInfo['table'] == 'w_order_list'): ?><th>内容</th><?php endif; ?>
        <th width="120">操作</th>
        </thead>
        <tbody>
    <?php if(is_array($list)): foreach($list as $key=>$vo): ?><tr>
      	<td><?php echo ($vo["data_id"]); ?></td>
        <?php if(is_array($fieldList)): foreach($fieldList as $key=>$val): if($val['show']): ?><td><?php echo D('DuxCms/FieldData')->showListField($vo[$val['field']],$val['type'],$val['config']); ?></td><?php endif; endforeach; endif; ?>
        <?php if($formInfo['table'] == 'w_order_list'): ?><td><?php echo D('DuxCms/FieldData')->unser($vo['info']);?></td><?php endif; ?>
       
        
        <td>
         <?php if($formInfo['table'] == 'monegzh'): ?><a class="u-btn u-btn-primary u-btn-small new_44" href="<?php echo U('DuxCms/WxchMenu/index',array('do'=>$vo['data_id']));?>">生成菜单</a><?php endif; ?>
        <a class="u-btn u-btn-primary u-btn-small new_44" href="<?php echo U('edit',array('data_id'=>$vo['data_id'],'fieldset_id'=>$formInfo['fieldset_id']));?>">修改</a>
        <a class="u-btn u-btn-danger u-btn-small del new_44" href="javascript:;" url="<?php echo U('del',array('fieldset_id'=>$formInfo['fieldset_id']));?>" data="<?php echo ($vo["data_id"]); ?>">删除</a>
       
        </td>
      </tr><?php endforeach; endif; ?>
    </tbody>
    </table>
  <div class="m-table-bar">
            <div class="bar-pages">
              <div class="m-page">
                <?php echo ($page); ?>
              </div>
            </div>
            <div class="f-cb"></div>
        </div>
            </div> </div>
<script>
Do.ready('base',function() {
	$('#table').duxTable({});
});
</script>