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
                    <select name="class_id" id="class_id" class="form-element">
          	<option value="0">==栏目==</option>
            <?php if(is_array($categoryList)): foreach($categoryList as $key=>$vo): ?><option value="<?php echo ($vo["class_id"]); ?>"
                <?php if($pageMaps['class_id'] == $vo['class_id']): ?>selected="selected"<?php endif; ?>
                ><?php echo ($vo["cname"]); ?>
                </option><?php endforeach; endif; ?>
          </select>
 
<input name="keyword" type="hidden" value="<?php echo ($pageMaps["keyword"]); ?>"/>
                    <button class="u-btn u-btn-primary" type="submit">筛选</button>
                </form>
            </div></div>
  <div class="m-table-mobile"><table id="table" class="m-table "><thead><tr><th width="30">选择</th><th>编号</th><th>uid</th><th width="100">用户名</th><th>广告名</th><th>广告栏目</th><th width="100">广告图</th><th>单价</th><th>预算</th><th>点击量</th><th>无效点击量</th><th>状态</th><th width="130">创建时间</th><th>操作</th></tr></thead><tbody><?php if(is_array($list)): foreach($list as $key=>$vo): ?><tr>
        <td>
        	<input type="checkbox" name="id[]" value="<?php echo ($vo["id"]); ?>" />
        </td>
        <td><?php echo ($vo["id"]); ?></td>
        <td><?php echo ($vo["uid"]); ?></td>
        <td><?php echo ($vo["user_login"]); ?></td>
        <td><?php echo ($vo["ad_name"]); ?></td>
        <td><?php echo ($vo["class_name"]); ?></td>
        <td><img src="<?php echo ($vo["ad_img"]); ?>" width="150px"></td>
        <td><?php echo ($vo["dj_fee"]); ?></td>
        <td><?php echo ($vo["ys_fee"]); ?></td>
        <td><?php echo ($vo["click"]); ?></td>
        <td><?php echo ($vo["no_click"]); ?></td>
        <td><font color="red"><?php if($vo['status'] == 1): ?>已上架 <?php elseif($vo['status'] == 0): ?>待审核 <?php else: ?>已下架<?php endif; ?></font></td>
		<td><?php echo (date("Y-m-d H:i:s",$vo["add_time"])); ?></td>
         <td>
        <?php if($vo['status'] != 1): ?><a class="u-btn u-btn-primary  u-btn-small" href="<?php echo U('ad_up',array('id'=>$vo['id'],'status'=>1));?>">上架</a>
        <?php else: ?>
        <a class="u-btn u-btn-primary  u-btn-small" href="<?php echo U('ad_up',array('id'=>$vo['id'],'status'=>2));?>">下架</a><?php endif; ?>
        <a class="u-btn u-btn-danger  u-btn-small del" href="javascript:;" data="<?php echo ($vo["id"]); ?>">删除</a>
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
</script>