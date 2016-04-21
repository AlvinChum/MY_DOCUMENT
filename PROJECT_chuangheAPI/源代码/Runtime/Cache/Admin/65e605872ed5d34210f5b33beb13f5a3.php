<?php if (!defined('THINK_PATH')) exit();?><h3>用户列表</h3>

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
                    <!--<select name="class_id" id="class_id" class="form-element">
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
          </select>-->
         <select name="type" id="type"  class="form-element "><option value="0" <?php if(0 == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >==类型==</option><option value="jifen" <?php if(jifen == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >积分</option><option value="money" <?php if(money == $pageMaps['type']){ ?> selected="selected"  <?php } ?> >余额</option></select>
           <select name="order_by" id="order_by"  class="form-element "><option value="asc" <?php if(asc == $pageMaps['order_by']){ ?> selected="selected"  <?php } ?> >升</option><option value="desc" <?php if(desc == $pageMaps['order_by']){ ?> selected="selected"  <?php } ?> >降</option></select>     
     <select name="subscribe" id="subscribe"  class="form-element "><option value="0" <?php if(0 == $pageMaps['subscribe']){ ?> selected="selected"  <?php } ?> >==请选择==</option><option value="2" <?php if(2 == $pageMaps['subscribe']){ ?> selected="selected"  <?php } ?> >未关注</option><option value="1" <?php if(1 == $pageMaps['subscribe']){ ?> selected="selected"  <?php } ?> >已关注</option></select>
  	<select name="status" id="status"  class="form-element "><option value="0" <?php if(0 == $pageMaps['status']){ ?> selected="selected"  <?php } ?> >==状态==</option><option value="1" <?php if(1 == $pageMaps['status']){ ?> selected="selected"  <?php } ?> >正常</option><option value="2" <?php if(2 == $pageMaps['status']){ ?> selected="selected"  <?php } ?> >未验证</option><option value="3" <?php if(3 == $pageMaps['status']){ ?> selected="selected"  <?php } ?> >禁止</option></select>
                    <button class="u-btn u-btn-primary" type="submit">筛选</button>
                </form>
            </div></div>
  <div class="m-table-mobile"><table id="table" class="m-table "><thead><tr><th width="30">选择</th><th width="30">编号</th><th>子用户查看</th><th>性别</th><th>昵称</th><th>头像</th><th>积分</th><th>余额</th><th>微币余额</th><th>地区</th><th>微信</th><th>手机</th><th>最后登陆</th><th>注册时间</th><th>状态</th><th>会员等级</th><th width="130">操作</th></tr></thead><tbody><?php if(is_array($list)): foreach($list as $key=>$vo): ?><tr>
        <td>
        	<input type="checkbox" name="id[]" value="<?php echo ($vo["id"]); ?>" />
        </td>
        <td><?php echo ($vo["id"]); ?></td>
       <!-- <td><a href="javascript:;" ><?php echo ($vo["user_login"]); ?></a></td>-->
        <td><a href="<?php echo U('',array('pid'=>$vo['id']));?>" >子用户查看(<?php echo ($vo["fscount"]); ?>)</a></td>
		<td><a href="javascript:;" > 
		<?php if($vo['sex'] == 1): ?>男
		<?php elseif($vo['sex'] == 2): ?>
		女
		<?php elseif($vo['sex'] == 3): ?>
		
		其他<?php endif; ?>
		</a></td>
        <td><a href="javascript:;" ><?php echo ($vo["user_nicename"]); ?></a></td>
        <td>
        <?php if($vo['avatar']): ?><img src="<?php echo ($vo["avatar"]); ?>" width="40">
		<?php else: endif; ?>
          <!--<?php if($vo['status']): ?><span class="u-badge u-badge-success">发布</span>
            <?php else: ?>
            <span class="u-badge u-badge-danger">草稿</span><?php endif; ?>-->
        </td>
		<td><?php echo ($vo["jifen"]); ?></td>
		<td><?php echo ($vo["money"]); ?></td>
		<td><?php echo ($vo["wbfee"]); ?></td>
		<td><?php echo ($vo["country"]); echo ($vo["province"]); echo ($vo["city"]); ?></td>
		
		<td><?php echo ($vo["weixin"]); ?></td>
		<td><?php echo ($vo["user_tel"]); ?></td>
		 <td><?php echo (date("Y-m-d H:i:s",$vo["last_login_time"])); ?></td>
		  <td><?php echo (date("Y-m-d H:i:s",$vo["create_time"])); ?></td>
        <td>
		
          <?php if($vo['user_status'] == 1): ?><span class="u-badge u-badge-success">正常</span>
            <?php elseif($vo['user_status'] == 2): ?>
			  <span class="u-badge u-badge-danger">未验证</span>
			<?php else: ?>
            <span class="u-badge u-badge-danger">禁止登陆</span><?php endif; ?>
        </td>
        <td><?php echo ($user_rank[$vo['user_rank']]['rank_name']); ?></td>
        <td>
        <a class="u-btn u-btn-primary  u-btn-small" href="<?php echo U('edit',array('id'=>$vo['id']));?>">修改</a>
        <a class="u-btn u-btn-danger  u-btn-small del" href="javascript:;" data="<?php echo ($vo["id"]); ?>">删除</a></td>
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