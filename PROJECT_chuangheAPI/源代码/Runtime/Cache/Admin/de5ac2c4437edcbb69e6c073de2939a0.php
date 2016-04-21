<?php if (!defined('THINK_PATH')) exit();?><h3>运营设置</h3>

        <div class="m-panel ">
            <div class="panel-body">
            
        <form action="<?php echo U('site');?>" method="post" id="form" class="m-form m-form-horizontal">
        <fieldset>
          
        <div class="formitm">
            <label class="lab">开启会员模块</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="open_user_rank" id="open_user_rank0" value="1"   <?php  if(1 == $info['open_user_rank']){ ?> checked="checked" <?php } ?> > <span>开启</span>
                    </label> <label>
                      <input type="radio" name="open_user_rank" id="open_user_rank1" value="0"   <?php  if(0 == $info['open_user_rank']){ ?> checked="checked" <?php } ?> > <span>关闭</span>
                    </label> 
                <p class="help-block">设置会员模块(v8无效)</p>
            </div>
        </div> 

    
        <div class="formitm">
            <label class="lab">文章页展开全文</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="open_content_qwkg" id="open_content_qwkg0" value="1"   <?php  if(1 == $info['open_content_qwkg']){ ?> checked="checked" <?php } ?> > <span>开启</span>
                    </label> <label>
                      <input type="radio" name="open_content_qwkg" id="open_content_qwkg1" value="0"   <?php  if(0 == $info['open_content_qwkg']){ ?> checked="checked" <?php } ?> > <span>关闭</span>
                    </label> 
                <p class="help-block">文章页展开全文开关，开启则显示展示全文。(v8有效)</p>
            </div>
        </div> 
  
   
        <div class="formitm">
            <label class="lab">注册手机验证</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="is_tel_check" id="is_tel_check0" value="1"   <?php  if(1 == $info['is_tel_check']){ ?> checked="checked" <?php } ?> > <span>开启</span>
                    </label> <label>
                      <input type="radio" name="is_tel_check" id="is_tel_check1" value="0"   <?php  if(0 == $info['is_tel_check']){ ?> checked="checked" <?php } ?> > <span>关闭</span>
                    </label> 
                <p class="help-block">开启后，注册时需要手机短信验证</p>
            </div>
        </div> 
  
   
        <div class="formitm">
            <label class="lab">开启新手教程</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="is_noob" id="is_noob0" value="1"   <?php  if(1 == $info['is_noob']){ ?> checked="checked" <?php } ?> > <span>开启</span>
                    </label> <label>
                      <input type="radio" name="is_noob" id="is_noob1" value="0"   <?php  if(0 == $info['is_noob']){ ?> checked="checked" <?php } ?> > <span>关闭</span>
                    </label> 
                <p class="help-block">开启新手教程后，问题反馈将被替换成新手教程</p>
            </div>
        </div>
    <!-- 
        <div class="formitm">
            <label class="lab">下级提现成功上级是否分成</label>
            <div class="ipt">
                <input name="is_get_sxjfc" type="text"  class="form-element u-width-large  " id="is_get_sxjfc" value="<?php echo ($info["is_get_sxjfc"]); ?>" maxlength="250"   >
                <p class="help-block">0表示不分成,请填写0-100之前的数，如填5， 则下级提现时将5%分成给上级</p>
            </div>
        </div>-->
  
    
        <div class="formitm">
            <label class="lab">关注送红包</label>
            <div class="ipt">
                <input name="gzshbval" type="text"  class="form-element u-width-large  " id="gzshbval" value="<?php echo ($info["gzshbval"]); ?>" maxlength="250"   >
                <p class="help-block">关注赠送红包，金额自定义,红包不能在0点到8点之间发。0表示关闭。发送失败会存入到用户余额（微信内有效）(V8无效)</p>
            </div>
        </div>
	
	
        <div class="formitm">
            <label class="lab">关注送红包描述</label>
            <div class="ipt">
                <input name="hbbody" type="text"  class="form-element u-width-large  " id="hbbody" value="<?php echo ($info["hbbody"]); ?>" maxlength="250"   >
                <p class="help-block">随红包发送的描述文字(V8无效)</p>
            </div>
        </div>
	
	 
        <div class="formitm">
            <label class="lab">红包发送失败</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="hbkqzz" id="hbkqzz0" value="1"   <?php  if(1 == $info['hbkqzz']){ ?> checked="checked" <?php } ?> > <span>开启</span>
                    </label> <label>
                      <input type="radio" name="hbkqzz" id="hbkqzz1" value="0"   <?php  if(0 == $info['hbkqzz']){ ?> checked="checked" <?php } ?> > <span>关闭</span>
                    </label> 
                <p class="help-block">红包发送失败是否改为自动转账发送,用于0-8时之间。发送失败会存入到用户余额(V8无效)</p>
            </div>
        </div>
	
	
        <div class="formitm">
            <label class="lab">关注送现金</label>
            <div class="ipt">
                <input name="gzsxj" type="text"  class="form-element u-width-large  " id="gzsxj" value="<?php echo ($info["gzsxj"]); ?>" maxlength="250"   >
                <p class="help-block">关注送现金数量,0表示关闭(V8无效)</p>
            </div>
        </div>
    
    
        <div class="formitm">
            <label class="lab">关注送金钱</label>
            <div class="ipt">
                <input name="gzsmoney" type="text"  class="form-element u-width-large  " id="gzsmoney" value="<?php echo ($info["gzsmoney"]); ?>" maxlength="250"   >
                <p class="help-block">关注送金钱数量,0表示关闭，存入用户账户，可提现。(V8无效)</p>
            </div>
        </div>
	
	 
        <div class="formitm">
            <label class="lab">关注送积分</label>
            <div class="ipt">
                <input name="gzjfnum" type="text"  class="form-element u-width-large  " id="gzjfnum" value="<?php echo ($info["gzjfnum"]); ?>" maxlength="250"   >
                <p class="help-block">关注送积分数量,0表示关闭(V8无效)</p>
            </div>
        </div>
    
    
        <div class="formitm">
            <label class="lab">邀请送积分</label>
            <div class="ipt">
                <input name="fjfnum" type="text"  class="form-element u-width-large  " id="fjfnum" value="<?php echo ($info["fjfnum"]); ?>" maxlength="250"   >
                <p class="help-block">邀请关注后送积分,0表示关闭(V8有效)</p>
            </div>
        </div>
    
     
        <div class="formitm">
            <label class="lab">邀请送金钱</label>
            <div class="ipt">
                <input name="fjinq" type="text"  class="form-element u-width-large  " id="fjinq" value="<?php echo ($info["fjinq"]); ?>" maxlength="250"   >
                <p class="help-block">邀请关注后送金钱,0表示关闭，存入用户账户，可提现。(v8有效)</p>
            </div>
        </div>
    
      
        <div class="formitm">
            <label class="lab">邀请地区</label>
            <div class="ipt">
                <input name="yqarea" type="text"  class="form-element u-width-large  " id="yqarea" value="<?php echo ($info["yqarea"]); ?>" maxlength="250"   >
                <p class="help-block">邀请这个地区内的用户享受以下金额待遇,多个地区逗号隔开,可以是省份也可以是城市,0表示关闭。(V8无效)</p>
            </div>
        </div>
    
    
    
        <div class="formitm">
            <label class="lab">邀请地区金额</label>
            <div class="ipt">
                <input name="yqareaje" type="text"  class="form-element u-width-large  " id="yqareaje" value="<?php echo ($info["yqareaje"]); ?>" maxlength="250"   >
                <p class="help-block">邀请这个地区内的用户享受此金额待遇,0表示关闭。(V8无效)</p>
            </div>
        </div>
    
    
        <div class="formitm">
            <label class="lab">分享文章送红包</label>
            <div class="ipt">
                <input name="fx_content_hb" type="text"  class="form-element u-width-large  " id="fx_content_hb" value="<?php echo ($info["fx_content_hb"]); ?>" maxlength="250"   >
                <p class="help-block">分享文章送红包,最低1元,红包不能在0点到8点之间发。0表示关闭。(V8有效)</p>
            </div>
        </div>
    
     
        <div class="formitm">
            <label class="lab">分享文章佣金</label>
            <div class="ipt">
                <input name="fx_content_jq" type="text"  class="form-element u-width-large  " id="fx_content_jq" value="<?php echo ($info["fx_content_jq"]); ?>" maxlength="250"   >
                <p class="help-block">分享文章送金钱。存入用户账户，可提现。0表示关闭。(V8有效)</p>
            </div>
        </div>
    
    
	  
        <div class="formitm">
            <label class="lab">分享文章上一级佣金</label>
            <div class="ipt">
                <input name="fx_content_jq_pid" type="text"  class="form-element u-width-large  " id="fx_content_jq_pid" value="<?php echo ($info["fx_content_jq_pid"]); ?>" maxlength="250"   >
                <p class="help-block">分享文章上级送金钱。存入用户账户，可提现。0表示关闭。只朋友圈分享有效(V8有效)</p>
            </div>
        </div>
    
       
        <div class="formitm">
            <label class="lab">分享文章上二级佣金</label>
            <div class="ipt">
                <input name="fx_content_jq_pid_2" type="text"  class="form-element u-width-large  " id="fx_content_jq_pid_2" value="<?php echo ($info["fx_content_jq_pid_2"]); ?>" maxlength="250"   >
                <p class="help-block">分享文章上级送金钱。存入用户账户，可提现。0表示关闭。只朋友圈分享有效(V8有效)</p>
            </div>
        </div>
    
       
        <div class="formitm">
            <label class="lab">分享文章上三级佣金</label>
            <div class="ipt">
                <input name="fx_content_jq_pid_3" type="text"  class="form-element u-width-large  " id="fx_content_jq_pid_3" value="<?php echo ($info["fx_content_jq_pid_3"]); ?>" maxlength="250"   >
                <p class="help-block">分享文章上级送金钱。存入用户账户，可提现。0表示关闭。只朋友圈分享有效(V8有效)</p>
            </div>
        </div>
	
	
    
    
        <div class="formitm">
            <label class="lab">分享文章被浏览佣金</label>
            <div class="ipt">
                <input name="fxview" type="text"  class="form-element u-width-large  " id="fxview" value="<?php echo ($info["fxview"]); ?>" maxlength="250"   >
                <p class="help-block">分享文章被浏览送金钱。存入用户账户，可提现。0表示关闭。(V8有效)</p>
            </div>
        </div>
    
   
        <div class="formitm">
            <label class="lab">分享文章被浏览提醒</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="notify_ll" id="notify_ll0" value="1"   <?php  if(1 == $info['notify_ll']){ ?> checked="checked" <?php } ?> > <span>开启</span>
                    </label> <label>
                      <input type="radio" name="notify_ll" id="notify_ll1" value="0"   <?php  if(0 == $info['notify_ll']){ ?> checked="checked" <?php } ?> > <span>关闭</span>
                    </label> 
                <p class="help-block">分享的文章被浏览提醒开关。（微信用户有效）(V8无效)</p>
            </div>
        </div>

    
        <div class="formitm">
            <label class="lab">支付宝提现金额</label>
            <div class="ipt">
                <input name="txqi" type="text"  class="form-element u-width-large  " id="txqi" value="<?php echo ($info["txqi"]); ?>" maxlength="250"   >
                <p class="help-block">支付宝起提金额（元）(V8有效)</p>
            </div>
        </div>
    
     
        <div class="formitm">
            <label class="lab">自动提现金额</label>
            <div class="ipt">
                <input name="wxtx" type="text"  class="form-element u-width-large  " id="wxtx" value="<?php echo ($info["wxtx"]); ?>" maxlength="250"   >
                <p class="help-block">自动微信提现起提金额（元）。0为关闭微信提现(V8有效)</p>
            </div>
        </div>
	
	
	
        <div class="formitm">
            <label class="lab">自动提现限制</label>
            <div class="ipt">
                <input name="wxtxxz" type="text"  class="form-element u-width-large  " id="wxtxxz" value="<?php echo ($info["wxtxxz"]); ?>" maxlength="250"   >
                <p class="help-block">自动提现第二次以上必须是以下佣金方可提现。0为不限制。(V8有效)</p>
            </div>
        </div>
	
	
	
	 
        <div class="formitm">
            <label class="lab">微信提现审核值</label>
            <div class="ipt">
                <input name="txshjr" type="text"  class="form-element u-width-large  " id="txshjr" value="<?php echo ($info["txshjr"]); ?>" maxlength="250"   >
                <p class="help-block">微信自动提现佣金超过这个数，必须审核，人工发放。0为不限制(V8有效)</p>
            </div>
        </div>
	
	 
        <div class="formitm">
            <label class="lab">微信提现通道</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="txtype" id="txtype0" value="1"   <?php  if(1 == $info['txtype']){ ?> checked="checked" <?php } ?> > <span>红包</span>
                    </label> <label>
                      <input type="radio" name="txtype" id="txtype1" value="0"   <?php  if(0 == $info['txtype']){ ?> checked="checked" <?php } ?> > <span>企业支付</span>
                    </label> 
                <p class="help-block">红包发放12点到8点自动改为企业支付发放。(V8无效)</p>
            </div>
        </div>

    
        <div class="formitm">
            <label class="lab">摇一摇概率</label>
            <div class="ipt">
                <textarea name="yaolv" type="text"  class="form-element u-width-large " id="yaolv" value="" rows="5"   ><?php echo ($info["yaolv"]); ?></textarea>
                <p class="help-block">摇一摇概率设置，多个用逗号</p>
            </div>
        </div>
	
	 
        <div class="formitm">
            <label class="lab">摇一摇奖项</label>
            <div class="ipt">
                <textarea name="yaojx" type="text"  class="form-element u-width-large " id="yaojx" value="" rows="5"   ><?php echo ($info["yaojx"]); ?></textarea>
                <p class="help-block">奖项设置，多个用逗号，对应上面的概率设置</p>
            </div>
        </div>
    
     
	
        <div class="formitm">
            <label class="lab">摇一摇消耗</label>
            <div class="ipt">
                <input name="yaojf" type="text"  class="form-element u-width-large  " id="yaojf" value="<?php echo ($info["yaojf"]); ?>" maxlength="250"   >
                <p class="help-block">摇一摇消耗积分个数</p>
            </div>
        </div>
	
	
        <div class="formitm">
            <label class="lab">摇一摇中奖</label>
            <div class="ipt">
                <input name="yaopjifen" type="text"  class="form-element u-width-large  " id="yaopjifen" value="<?php echo ($info["yaopjifen"]); ?>" maxlength="250"   >
                <p class="help-block">摇一摇中奖后，上家获得积分数量</p>
            </div>
        </div>
 
	 
        <div class="formitm">
            <label class="lab">引导关注url</label>
            <div class="ipt">
                <textarea name="subscribeurl" type="text"  class="form-element u-width-large " id="subscribeurl" value="" rows="5"   ><?php echo ($info["subscribeurl"]); ?></textarea>
                <p class="help-block">引导关注URL(V8有效)</p>
            </div>
        </div>
    
     
        <div class="formitm">
            <label class="lab">公告</label>
            <div class="ipt">
                <textarea name="newsubscribeurl" type="text"  class="form-element u-width-large " id="newsubscribeurl" value="" rows="5"   ><?php echo ($info["newsubscribeurl"]); ?></textarea>
                <p class="help-block">用户中心滚动公告(V8有效)</p>
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