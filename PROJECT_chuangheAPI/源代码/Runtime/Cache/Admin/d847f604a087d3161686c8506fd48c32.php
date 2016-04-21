<?php if (!defined('THINK_PATH')) exit();?><h3>微商中心设置</h3>

        <div class="m-panel ">
            <div class="panel-body">
            
        <form action="<?php echo U('site');?>" method="post" id="form" class="m-form m-form-horizontal">
        <fieldset>
          
        <div class="formitm">
            <label class="lab">开启微商中心</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="isweis" id="isweis0" value="1"   <?php  if(1 == $info['isweis']){ ?> checked="checked" <?php } ?> > <span>开启</span>
                    </label> <label>
                      <input type="radio" name="isweis" id="isweis1" value="0"   <?php  if(0 == $info['isweis']){ ?> checked="checked" <?php } ?> > <span>关闭</span>
                    </label> 
                <p class="help-block">是否开启微商中心(v8有效)</p>
            </div>
        </div>
 
    
        <div class="formitm">
            <label class="lab">意向分成</label>
            <div class="ipt">
                <input name="wyxfc" type="text"  class="form-element u-width-large  " id="wyxfc" value="<?php echo ($info["wyxfc"]); ?>" maxlength="250"   >%
                <p class="help-block">设置通过用户分享意向后,客户提交意向订单,分享者所获取的意向佣金分成(v8有效)</p>
            </div>
        </div>
  
   
        <div class="formitm">
            <label class="lab">开启赏金模块</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="sj_mod" id="sj_mod0" value="1"   <?php  if(1 == $info['sj_mod']){ ?> checked="checked" <?php } ?> > <span>开启</span>
                    </label> <label>
                      <input type="radio" name="sj_mod" id="sj_mod1" value="0"   <?php  if(0 == $info['sj_mod']){ ?> checked="checked" <?php } ?> > <span>关闭</span>
                    </label> 
                <p class="help-block">开启赏金模块(v8有效)</p>
            </div>
        </div>
    
    
        <div class="formitm">
            <label class="lab">领赏次数</label>
            <div class="ipt">
                <input name="sj_num" type="text"  class="form-element u-width-large  " id="sj_num" value="<?php echo ($info["sj_num"]); ?>" maxlength="250"   >
                <p class="help-block">一天内领取赏金次数(v8有效)</p>
            </div>
        </div>
    
    
        <div class="formitm">
            <label class="lab">赏金倒计时时间</label>
            <div class="ipt">
                <input name="sj_time" type="text"  class="form-element u-width-large  " id="sj_time" value="<?php echo ($info["sj_time"]); ?>" maxlength="250"   >
                <p class="help-block">赏金倒计时时间(v8有效)</p>
            </div>
        </div>
    
	
        <div class="formitm">
            <label class="lab">植入广告同ip点击无效时间</label>
            <div class="ipt">
                <input name="ad_click_time" type="text"  class="form-element u-width-large  " id="ad_click_time" value="<?php echo ($info["ad_click_time"]); ?>" maxlength="250"   >小时
                <p class="help-block">设置相同 ip,第二次点击广告,多长时间后再点击才有效(v8有效)</p>
            </div>
        </div>
	
	
	 
        <div class="formitm">
            <label class="lab">任务结束隐藏开关</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="set_task_hide" id="set_task_hide0" value="1"   <?php  if(1 == $info['set_task_hide']){ ?> checked="checked" <?php } ?> > <span>开启</span>
                    </label> <label>
                      <input type="radio" name="set_task_hide" id="set_task_hide1" value="0"   <?php  if(0 == $info['set_task_hide']){ ?> checked="checked" <?php } ?> > <span>关闭</span>
                    </label> 
                <p class="help-block">任务结束隐藏任务开关(v8有效)</p>
            </div>
        </div> 
 
   
        <div class="formitm">
            <label class="lab">任务审核开关</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="set_task" id="set_task0" value="1"   <?php  if(1 == $info['set_task']){ ?> checked="checked" <?php } ?> > <span>开启</span>
                    </label> <label>
                      <input type="radio" name="set_task" id="set_task1" value="0"   <?php  if(0 == $info['set_task']){ ?> checked="checked" <?php } ?> > <span>关闭</span>
                    </label> 
                <p class="help-block">开启后，前台发布任务必须审核才展示(v8有效)</p>
            </div>
        </div> 
  
   
        <div class="formitm">
            <label class="lab">微币限额</label>
            <div class="ipt">
                <input name="min_money" type="text"  class="form-element u-width-large  " id="min_money" value="<?php echo ($info["min_money"]); ?>" maxlength="250"   >
                <p class="help-block">发布文章用户所需最低微币(v8有效)</p>
            </div>
        </div>
  
   
        <div class="formitm">
            <label class="lab">置顶时间</label>
            <div class="ipt">
                <input name="zd_time" type="text"  class="form-element u-width-large  " id="zd_time" value="<?php echo ($info["zd_time"]); ?>" maxlength="250"   >小时
                <p class="help-block">文章置顶之后多少小时,才可再次置顶(v8有效)</p>
            </div>
        </div>
    
    
        <div class="formitm">
            <label class="lab">分类置顶佣金</label>
            <div class="ipt">
                <input name="cat_money" type="text"  class="form-element u-width-large  " id="cat_money" value="<?php echo ($info["cat_money"]); ?>" maxlength="250"   >
                <p class="help-block">分类置顶所需佣金(v8有效)</p>
            </div>
        </div>
    
    
        <div class="formitm">
            <label class="lab">首页置顶佣金</label>
            <div class="ipt">
                <input name="index_money" type="text"  class="form-element u-width-large  " id="index_money" value="<?php echo ($info["index_money"]); ?>" maxlength="250"   >
                <p class="help-block">首页置顶所需佣金(v8有效)</p>
            </div>
        </div>

	 
        <div class="formitm">
            <label class="lab">平台充值收费</label>
            <div class="ipt">
                <input name="weisczfee" type="text"  class="form-element u-width-large  " id="weisczfee" value="<?php echo ($info["weisczfee"]); ?>" maxlength="250"   >
                <p class="help-block">充值金额百分比(v8有效)</p>
            </div>
        </div>



        <div class="formitm">
            <label class="lab">微商中心公告</label>
            <div class="ipt">
                <textarea name="wscentergg" type="text"  class="form-element u-width-large " id="wscentergg" value="" rows="5"   ><?php echo ($info["wscentergg"]); ?></textarea>
                <p class="help-block">滚动公告，可支持HTML标签。(v8有效)</p>
            </div>
        </div>
	
	
        <div class="formitm">
            <label class="lab">商务合作网址</label>
            <div class="ipt">
                <textarea name="wsswhz" type="text"  class="form-element u-width-large " id="wsswhz" value="" rows="5"   ><?php echo ($info["wsswhz"]); ?></textarea>
                <p class="help-block">商务合作网址(v8有效)</p>
            </div>
        </div>

	
	
        <div class="formitm">
            <label class="lab">微商新手指引</label>
            <div class="ipt">
                <textarea name="wsxszy" type="text"  class="form-element u-width-large " id="wsxszy" value="" rows="5"   ><?php echo ($info["wsxszy"]); ?></textarea>
                <p class="help-block">微商新手指引网址。(v8有效)</p>
            </div>
        </div>
    
    
    
    
    
        <div class="formitm form-submit">
        <div class="ipt">
            <div class="tip" id="tips"></div>
            <button class="u-btn u-btn-success u-btn-large" type="submit" id="btn-submit">保存</button>
            <button class="u-btn u-btn-large" type="reset">重置</button>
        </div>
        </div>
        </fieldset>
        </form>
            </div> </div>
<script>
Do.ready('base', function() {
	$('#form').duxForm();
});
</script>