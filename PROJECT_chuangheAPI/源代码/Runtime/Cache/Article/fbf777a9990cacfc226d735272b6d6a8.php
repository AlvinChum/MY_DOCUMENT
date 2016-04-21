<?php if (!defined('THINK_PATH')) exit();?><h3>文章列表</h3>

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
                <?php if($vo['type'] == 0 || $vo['app'] != MODULE_NAME ): ?>style="background-color:#CCC" disabled="disabled"<?php endif; ?>
                ><?php echo ($vo["cname"]); ?>
                </option><?php endforeach; endif; ?>
          </select>
          <select name="position_id" id="position_id" class="form-element" >
          	<option value="0">==推荐位==</option>
            <?php if(is_array($positionList)): foreach($positionList as $key=>$vo): ?><option value="<?php echo ($vo["position_id"]); ?>"
                <?php if($pageMaps['position_id'] == $vo['position_id']): ?>selected="selected"<?php endif; ?>
                ><?php echo ($vo["name"]); ?>
                </option><?php endforeach; endif; ?>
          </select>
  	<select name="status" id="status"  class="form-element "><option value="0" <?php if(0 == $pageMaps['status']){ ?> selected="selected"  <?php } ?> >==状态==</option><option value="1" <?php if(1 == $pageMaps['status']){ ?> selected="selected"  <?php } ?> >发布</option><option value="2" <?php if(2 == $pageMaps['status']){ ?> selected="selected"  <?php } ?> >草稿</option></select>
  	<select name="actionstatus" id="actionstatus"  class="form-element "><option value="0" <?php if(0 == $pageMaps['actionstatus']){ ?> selected="selected"  <?php } ?> >==进行状态==</option><option value="1" <?php if(1 == $pageMaps['actionstatus']){ ?> selected="selected"  <?php } ?> >进行中</option><option value="2" <?php if(2 == $pageMaps['actionstatus']){ ?> selected="selected"  <?php } ?> >已结束</option></select>
                    <button class="u-btn u-btn-primary" type="submit">筛选</button>
                </form>
            </div></div>
  <div class="m-table-mobile"><table id="table" class="m-table "><thead><tr><th width="30">选择</th><th width="80">编号</th><th>标题</th><th>栏目</th><th width="100">状态</th><th width="170">更新时间</th><th>会员</th><th width="130">操作</th></tr></thead><tbody><?php if(is_array($list)): foreach($list as $key=>$vo): ?><tr>
        <td>
        	<input type="checkbox" name="id[]" value="<?php echo ($vo["content_id"]); ?>" />
        </td>
        <td><?php echo ($vo["content_id"]); ?></td>
        <td><a href="<?php echo ($vo["aurl"]); ?>" target="_blank"><?php echo ($vo["title"]); ?>(浏览：<?php echo ($vo["views"]); ?>，分享:<?php echo ($vo["fxnum"]); ?>，分享浏览：<?php echo ($vo["fxsum"]); ?>，总支出：<?php echo ($vo["consume_money"]); ?>)</a></td>
        <td><a href="<?php echo ($vo["curl"]); ?>" target="_blank"><?php echo ($vo["class_name"]); ?></a></td>
        <td>
          <?php if($vo['status']): ?><span class="u-badge u-badge-success">发布</span>
            <?php else: ?>
            <span class="u-badge u-badge-danger">草稿</span><?php endif; ?>
            <?php if($vo['actionstatus'] == 0): ?><span class="u-badge u-badge-success">进行中</span>
            <?php else: ?>
            <span class="u-badge u-badge-danger">已结束</span><?php endif; ?>
            
            
            
        </td>
        <td><?php echo (date("Y-m-d H:i:s",$vo["time"])); ?></td>
        <td><?php echo ((isset($vo["user_na"]) && ($vo["user_na"] !== ""))?($vo["user_na"]):"管理员"); ?></td>
        <td>
        <a class="u-btn u-btn-primary  u-btn-small" href="<?php echo U('edit',array('content_id'=>$vo['content_id']));?>">修改</a>
        <a class="u-btn u-btn-danger  u-btn-small del" href="javascript:;" data="<?php echo ($vo["content_id"]); ?>">删除</a></td>
      </tr><?php endforeach; endif; ?></tbody></table></div>
  <div class="m-table-bar">
            <div class="bar-action">
            <a class="u-btn u-btn-primary" href="javascript:;" id="selectAll">选择</a>
             <select name="selectAction" id="selectAction" class="form-element"><option value="1">发布</option><option value="2">草稿</option><option value="3">移动</option><option value="4">删除</option></select>  
            <a class="u-btn u-btn-success" href="javascript:;" id="selectSubmit">执行</a>
            </div>
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