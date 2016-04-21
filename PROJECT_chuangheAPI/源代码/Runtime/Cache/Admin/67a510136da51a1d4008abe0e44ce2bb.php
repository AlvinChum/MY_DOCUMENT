<?php if (!defined('THINK_PATH')) exit();?><h3>列表</h3>

        <div class="m-panel ">
            <div class="panel-body">
            <div class="m-table-tool f-cb">
            <div class="tool-search f-cb">
                    <form action="<?php echo U();?>" method="post">
                        <input type="text" class="form-element" name="keyword" value="<?php echo ($pageMaps["keyword"]); ?>" />
                        <button class="u-btn u-btn-primary" type="submit">搜索</button>
                    </form></div>
            </div>
  <div class="m-table-mobile"><table id="table" class="m-table "><thead><tr><th width="30">选择</th><th>编号</th><th>aid</th><th>uid</th><th width="100">用户名</th><th>有效浏览次数</th><th>总浏览次数</th><th>ip</th><th>ip2</th><th>类型</th><th width="130">分享时间</th></tr></thead><tbody><?php if(is_array($list)): foreach($list as $key=>$vo): ?><tr>
        <td>
        	<input type="checkbox" name="id[]" value="<?php echo ($vo["id"]); ?>" />
        </td>
        <td><?php echo ($vo["id"]); ?></td>
		<td><?php echo ($vo["aid"]); ?></td>
        <td><?php echo ($vo["uid"]); ?></td>
        <td><?php echo ($vo["user_login"]); ?></td>
        <td><?php echo ($vo["view"]); ?></td>
        <td><?php echo ($vo["allview"]); ?></a></td>
        <td><?php echo ($vo["ip"]); ?></a></td>
        <td><?php echo ($vo["ip2"]); ?></a></td>
		 <td><?php echo ($vo["type"]); ?></a></td>
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