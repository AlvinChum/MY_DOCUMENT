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
                    <select name="type" id="type"  class="form-element "><option value="0" <?php if(0 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >==类型==</option><option value="-1" <?php if(-1 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >后台操作</option><option value="1" <?php if(1 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >分享文章送</option><option value="2" <?php if(2 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >关注送</option><option value="3" <?php if(3 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >分享好友送</option><option value="4" <?php if(4 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >提现</option><option value="5" <?php if(5 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >摇一摇</option></select>
    <select name="status" id="status"  class="form-element "><option value="0" <?php if(0 == $pageMaps['status']){ ?> selected="selected"  <?php } ?> >=请选择=</option><option value="1" <?php if(1 == $pageMaps['status']){ ?> selected="selected"  <?php } ?> >成功</option><option value="2" <?php if(2 == $pageMaps['status']){ ?> selected="selected"  <?php } ?> >审核中</option></select>
                    <button class="u-btn u-btn-primary" type="submit">筛选</button>
                </form>
            </div></div>
  <div class="m-table-mobile"><table id="table" class="m-table "><thead><tr><th width="30">选择</th><th>编号</th><th width="100">用户名</th><th>金额</th><th>积分余额</th><th>现金余额</th><th>类型</th><th>描述</th><th>状态</th><th>创建时间</th><th width="150">操作</th></tr></thead><tbody><?php if(is_array($list)): foreach($list as $key=>$vo): ?><tr>
        <td>
        	<input type="checkbox" name="id[]" value="<?php echo ($vo["id"]); ?>" />
        </td>
        <td><?php echo ($vo["id"]); ?></td>
        <td><?php echo ($vo["user_login"]); ?></td>
        <td style="color: red"><?php echo ($vo["fee"]); ?></td>
        <td><?php echo ($vo["jifen"]); ?></td>
        <td class="u<?php echo ($vo["uid"]); ?>"><?php echo ($vo["money"]); ?>（<a href="javascript:clearmoney(<?php echo ($vo["uid"]); ?>);">直接清零</a>）</td>
        <td><?php echo ($type[$vo['type']]); ?></a></td>
        <td><?php echo ($vo["body"]); ?></a></td>
         <td id="status_<?php echo ($vo['id']); ?>">
		<?php if($vo['status'] == 0): ?><span style="color:red"><?php echo ($status[$vo['status']]); ?></span>
		<?php elseif($vo['status'] == 1): ?>
			<span style="color:green"><?php echo ($status[$vo['status']]); ?></span>
		<?php else: ?>
			<?php echo ($status[$vo['status']]); endif; ?>
		</td>
		<td><?php echo (date("Y-m-d H:i:s",$vo["time"])); ?></td>
        <td id="operate_<?php echo ($vo['id']); ?>">
        <?php if($vo['status'] == 2): ?><!--<a class="u-btn u-btn-primary  u-btn-small"   href="javascript:if(confirm('确定要通过吗？'))location.href='<?php echo U('tixian',array('id'=>$vo['id'],'status'=>1));?>';">通过</a>-->
		<a class="u-btn u-btn-primary  u-btn-small"   href="javascript:checkUser(<?php echo ($vo["uid"]); ?>,<?php echo ($vo["time"]); ?>,<?php echo ($vo["id"]); ?>);">通过</a>
        <a class="u-btn  u-btn-danger u-btn-small"   href="javascript:if(confirm('确定失败吗？'))location.href='<?php echo U('tixian',array('id'=>$vo['id'],'status'=>0));?>';">失败</a><?php endif; ?>
        <a class="u-btn u-btn-primary  u-btn-small" href="<?php echo U('edit',array('id'=>$vo['id']));?>">查看</a>
        </td>
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
	
function clearmoney(uid){
		$.post("/index.php?s=/Admin/Moeny/clearmoney",{uid:uid},function(data){
			if(data.status==1){
				$(".u"+uid).html('0');
			}
		},'json')
		}

	function checkUser(uid,time,id){
		$.post(
			"/index.php?s=/Admin/Moeny/checkUser",
			{uid:uid,time:time},
			function(data){
				var info = "";
				/*if(data.subscribe == 0){
					info += "当前未关注。";
				}*/
				if(data.allview - data.view > 500){
					info += "7天内无效浏览次数超过500。";
				}
				if(data.ttf > 50){
					info += "7天内夜间2到5点浏览次数超过50次。";
				}
				info += "确定要通过吗？";
				if(confirm(info)){
					$.get(
						"index.php?s=/Admin/Moeny/tixian/id/"+id+"/status/1.html",
						function(data){
							if(data.status){
								document.getElementById("status_"+id).innerHTML = "<span style='color:green;'>成功</span>";
								document.getElementById("operate_"+id).innerHTML = "<a class=\"u-btn u-btn-primary  u-btn-small\" href=\"<?php echo U('edit',array('id'=>"+id+"));?>\">查看</a>";
							} else {
								alert(data.info);
							}
						},
						'json'
					);
					
				}
			},
			'json'
		);
	}	
</script>