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
                    <select name="type" id="type"  class="form-element "><option value="0" <?php if(0 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >==类型==</option><option value="1" <?php if(1 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >关注</option><option value="2" <?php if(2 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >邀请</option><option value="3" <?php if(3 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >发送失败转余额</option><option value="4" <?php if(4 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >摇一摇变动</option><option value="5" <?php if(5 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >分享文章</option><option value="6" <?php if(6 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >签到</option><option value="7" <?php if(7 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >提现</option><option value="8" <?php if(8 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >粉丝变动</option><option value="10" <?php if(10 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >置顶</option><option value="11" <?php if(11 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >分享用户文章</option><option value="12" <?php if(12 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >浏览用户文章</option><option value="13" <?php if(13 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >文章赏金</option></select>
<input name="keyword" type="hidden" value="<?php echo ($pageMaps["keyword"]); ?>"/>
                    <button class="u-btn u-btn-primary" type="submit">筛选</button>
                </form>
            </div></div>
  <div class="m-table-mobile"><table id="table" class="m-table "><thead><tr><th width="30">选择</th><th>编号</th><th>uid</th><th width="100">用户名</th><th>变动积分</th><th>变动金钱</th><th>类型</th><th>描述</th><th>ip</th><th>文章id</th><th width="130">创建时间</th></tr></thead><tbody><?php if(is_array($list)): foreach($list as $key=>$vo): ?><tr>
        <td>
        	<input type="checkbox" name="id[]" value="<?php echo ($vo["id"]); ?>" />
        </td>
        <td><?php echo ($vo["id"]); ?></td>
        <td><?php echo ($vo["uid"]); ?></td>
        <td><?php echo ($vo["user_login"]); ?></td>
        <td><?php echo ($vo["jifen"]); ?></td>
        <td><?php echo ($vo["money"]); ?></a></td>
        <td><?php echo ($type[$vo['type']]); ?></a></td>
        <td><?php echo ($vo["desc"]); ?></a></td>
        <td><?php echo ($vo["ip"]); ?></a></td>
        <td><?php echo ($vo["aid"]); ?></a></td>
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