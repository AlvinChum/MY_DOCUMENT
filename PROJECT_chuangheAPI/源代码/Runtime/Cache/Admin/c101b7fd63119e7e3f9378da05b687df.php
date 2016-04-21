<?php if (!defined('THINK_PATH')) exit();?><h3>防作弊设置</h3>

        <div class="m-panel ">
            <div class="panel-body">
            
        <form action="<?php echo U('site');?>" method="post" id="form" class="m-form m-form-horizontal">
        <fieldset>
          
        <div class="formitm">
            <label class="lab">不在区域内浏览</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="viewinarea" id="viewinarea0" value="1"   <?php  if(1 == $info['viewinarea']){ ?> checked="checked" <?php } ?> > <span>开启</span>
                    </label> <label>
                      <input type="radio" name="viewinarea" id="viewinarea1" value="0"   <?php  if(0 == $info['viewinarea']){ ?> checked="checked" <?php } ?> > <span>关闭</span>
                    </label> 
                <p class="help-block">不在分享区域内的浏览不算佣金，关闭则不管什么区域浏览都计算佣金，防作弊规则不变</p>
            </div>
        </div>
  
  
        <div class="formitm">
            <label class="lab">扣量设置</label>
            <div class="ipt">
                <input name="kl_time" type="text"  class="form-element u-width-large  " id="kl_time" value="<?php echo ($info["kl_time"]); ?>" maxlength="250"   >
                <p class="help-block">设置扣量时间段,多个用逗号隔开，0表示关闭。例如设置2,则是每分钟的10-20秒内所有浏览不计算佣金</p>
            </div>
        </div>

 
    
        <div class="formitm">
            <label class="lab">广告显示设置</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="set_ad" id="set_ad0" value="1"   <?php  if(1 == $info['set_ad']){ ?> checked="checked" <?php } ?> > <span>开启</span>
                    </label> <label>
                      <input type="radio" name="set_ad" id="set_ad1" value="0"   <?php  if(0 == $info['set_ad']){ ?> checked="checked" <?php } ?> > <span>关闭</span>
                    </label> 
                <p class="help-block">开启则内容页总是展示广告 否则分享后才展示广告</p>
            </div>
        </div>

	 
        <div class="formitm">
            <label class="lab">浏览停留时间设置</label>
            <div class="ipt">
                <input name="set_view_time" type="text"  class="form-element u-width-large  " id="set_view_time" value="<?php echo ($info["set_view_time"]); ?>" maxlength="250"   >秒
                <p class="help-block">浏览内容页必须停留的时间,小于设置的时间则不发放佣金,最少3秒起</p>
            </div>
        </div>


    
        <div class="formitm">
            <label class="lab">会员点击不计算佣金</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="is_get_hy" id="is_get_hy0" value="1"   <?php  if(1 == $info['is_get_hy']){ ?> checked="checked" <?php } ?> > <span>开启</span>
                    </label> <label>
                      <input type="radio" name="is_get_hy" id="is_get_hy1" value="0"   <?php  if(0 == $info['is_get_hy']){ ?> checked="checked" <?php } ?> > <span>关闭</span>
                    </label> 
                <p class="help-block">会员点击不计算佣金</p>
            </div>
        </div>
    
     
        <div class="formitm">
            <label class="lab">微信群分享点击不计算佣金</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="is_get_wxq" id="is_get_wxq0" value="1"   <?php  if(1 == $info['is_get_wxq']){ ?> checked="checked" <?php } ?> > <span>开启</span>
                    </label> <label>
                      <input type="radio" name="is_get_wxq" id="is_get_wxq1" value="0"   <?php  if(0 == $info['is_get_wxq']){ ?> checked="checked" <?php } ?> > <span>关闭</span>
                    </label> 
                <p class="help-block">微信群分享点击不计算佣金v8开启js分享接口有效</p>
            </div>
        </div>
  
    
    
	  
        <div class="formitm">
            <label class="lab">每日分享</label>
            <div class="ipt">
                <input name="ererydayfx" type="text"  class="form-element u-width-large  " id="ererydayfx" value="<?php echo ($info["ererydayfx"]); ?>" maxlength="250"   >
                <p class="help-block">每日分享不得超过此设置值，超过则分享佣金为0</p>
            </div>
        </div>
    
     
        <div class="formitm">
            <label class="lab">分享间隔</label>
            <div class="ipt">
                <input name="ererydayfxbet" type="text"  class="form-element u-width-large  " id="ererydayfxbet" value="<?php echo ($info["ererydayfxbet"]); ?>" maxlength="250"   >(秒)
                <p class="help-block">分享和上一次分享间隔不超过以下设置的时间，则无佣金。浏览也无佣金。</p>
            </div>
        </div>
    
	
	 
        <div class="formitm">
            <label class="lab">分享给单人</label>
            <div class="ipt">
                <input name="shareone" type="text"  class="form-element u-width-large  " id="shareone" value="<?php echo ($info["shareone"]); ?>" maxlength="250"   >
                <p class="help-block">分享给单个好友佣金。这里区分分享到朋友圈。</p>
            </div>
        </div>
    
     
        <div class="formitm">
            <label class="lab">有效浏览次数</label>
            <div class="ipt">
                <input name="bigview" type="text"  class="form-element u-width-large  " id="bigview" value="<?php echo ($info["bigview"]); ?>" maxlength="250"   >
                <p class="help-block">一个人分享这篇文章有效浏览次数，超过此数不计佣金。</p>
            </div>
        </div>
    
     
        <div class="formitm">
            <label class="lab">IP浏览有效</label>
            <div class="ipt">
                <input name="ipviews" type="text"  class="form-element u-width-large  " id="ipviews" value="<?php echo ($info["ipviews"]); ?>" maxlength="250"   >
                <p class="help-block">3小时内，一个ip 浏览同一个用户的文章 有效次数，超过此数不计佣金。</p>
            </div>
        </div>
	
	 
        <div class="formitm">
            <label class="lab">IP高级防作弊</label>
            <div class="ipt">
                <input name="ipn" type="text"  class="form-element u-width-large  " id="ipn" value="<?php echo ($info["ipn"]); ?>" maxlength="250"   >
                <p class="help-block">浏览者和分享者ip前N段相同不计佣金（1-4）段。0为不限制。建议开启为3</p>
            </div>
        </div>
	
	
	
	 
        <div class="formitm">
            <label class="lab">提现限制1</label>
            <div class="ipt">
                <input name="txbei" type="text"  class="form-element u-width-large  " id="txbei" value="<?php echo ($info["txbei"]); ?>" maxlength="250"   >
                <p class="help-block">分享超过浏览以下倍数封号处理,不填默认100倍</p>
            </div>
        </div>
	
	 
        <div class="formitm">
            <label class="lab">提现限制2</label>
            <div class="ipt">
                <input name="txwbei" type="text"  class="form-element u-width-large  " id="txwbei" value="<?php echo ($info["txwbei"]); ?>" maxlength="250"   >
                <p class="help-block">分享数超过浏览以下设置倍数，无法提现。不填默认10倍</p>
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