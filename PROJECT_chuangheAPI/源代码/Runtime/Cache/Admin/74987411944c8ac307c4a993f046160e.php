<?php if (!defined('THINK_PATH')) exit();?><h3>列表</h3>

        <div class="m-panel ">
            <div class="panel-body">
            <div class="m-table-tool f-cb">
            <div class="tool-search f-cb">
                    <form action="<?php echo U();?>" method="post">
                        <input type="text" class="form-element" name="keyword" value="<?php echo ($pageMaps["keyword"]); ?>" />
                        <button class="u-btn u-btn-primary" type="submit">搜索</button>
                    </form></div>
             
            <div class="tool-filter f-cb">
                <form action="<?php echo U();?>" method="post">
                    <input name="keyword" type="hidden" value="<?php echo ($pageMaps["keyword"]); ?>"/>
                    <button class="u-btn u-btn-primary" type="submit">筛选</button>
                </form>
            </div></div>
  <div class="m-table-mobile"><table id="table" class="m-table "><thead><tr><th width="30">选择</th><th>编号</th><th>uid</th><th width="100">用户名</th><th>充值金额</th><th>平台使用费</th><th>实充金额</th><th>状态</th><th width="130">创建时间</th></tr></thead><tbody><?php if(is_array($list)): foreach($list as $key=>$vo): ?><tr>
        <td>
        	<input type="checkbox" name="id[]" value="<?php echo ($vo["id"]); ?>" />
        </td>
        <td><?php echo ($vo["id"]); ?></td>
        <td><?php echo ($vo["uid"]); ?></td>
        <td><?php echo ($vo["user_login"]); ?></td>
        <td><?php echo ($vo["fee"]); ?></td>
        <td><?php echo ($vo["ptfee"]); ?></a></td>
        <td><?php echo ($vo["ufee"]); ?></a></td>
        <td><?php echo ($type[$vo['status']]); ?></a></td>
		<td><?php echo (date("Y-m-d H:i:s",$vo["time"])); ?></td>
       
      </tr><?php endforeach; endif; ?></tbody></table></div>
  <div class="m-table-bar">
            <div class="bar-pages">
              <div class="m-page">
                <?php echo ($page); ?>
              </div>
            </div>
            <div class="f-cb"></div>
        </div>
            </div> </div>
<script type="text/javascript" charset="utf-8">
	Do.ready('base',function() {
		//移动操作
		$('#selectAction').change(function() {
			var type = $(this).val();
			if(type == 3){
				$(this).after($('#class_id').clone());
			}else{
				$(this).nextAll('select').hide();
			}
		});
		//表格处理
		$('#table').duxTable({
			actionUrl : "<?php echo U('batchAction');?>",
			deleteUrl: "<?php echo U('del');?>",
			actionParameter : function(){
				return {'class_id' : $('#selectAction').next('#class_id').val()};
			}
		});
	});
</script>