<?php if (!defined('THINK_PATH')) exit();?><h3>站点信息</h3>

        <div class="m-panel ">
            <div class="panel-body">
            
        <form action="<?php echo U('site');?>" method="post" id="form" class="m-form m-form-horizontal">
        <fieldset>
          
        <div class="formitm">
            <label class="lab">站点标题</label>
            <div class="ipt">
                <input name="site_title" type="text"  class="form-element u-width-large  " id="site_title" value="<?php echo ($info["site_title"]); ?>" maxlength="250"  datatype="*" >
                <p class="help-block">网站标题栏处显示</p>
            </div>
        </div>
    
        <div class="formitm">
            <label class="lab">站点副标题</label>
            <div class="ipt">
                <input name="site_subtitle" type="text"  class="form-element u-width-large  " id="site_subtitle" value="<?php echo ($info["site_subtitle"]); ?>" maxlength="250"   >
                <p class="help-block">站点标题后面显示的副标题</p>
            </div>
        </div>
    
        <div class="formitm">
            <label class="lab">站点关键词</label>
            <div class="ipt">
                <input name="site_keywords" type="text"  class="form-element u-width-large  " id="site_keywords" value="<?php echo ($info["site_keywords"]); ?>" maxlength="250"   >
                <p class="help-block">搜索引擎所收录的关键词</p>
            </div>
        </div>
    
        <div class="formitm">
            <label class="lab">自定义关注回复。</label>
            <div class="ipt">
                <textarea name="diygzhf" type="text"  class="form-element u-width-large " id="diygzhf" value="" rows="5"   ><?php echo ($info["diygzhf"]); ?></textarea>
                <p class="help-block">自定义关注回复，链接不要用双引号，用单引号。</p>
            </div>
        </div>
	   
        <div class="formitm">
            <label class="lab">A.菜单域名</label>
            <div class="ipt">
                <input name="cdsite_url" type="text"  class="form-element u-width-large  " id="cdsite_url" value="<?php echo ($info["cdsite_url"]); ?>" maxlength="250"   >
                <p class="help-block">菜单域名，独立设置，可防止微信菜单生成需24小时的问题。菜单处填写：http://<?php echo ($info["cdsite_url"]); ?>/index.php?gocdurl=999 (论坛必看教程：http://bbs.jnooo.cn/thread-74-1-1.html)</p>
            </div>
        </div>		
    
        <div class="formitm">
            <label class="lab">B.站点域名</label>
            <div class="ipt">
                <input name="site_url" type="text"  class="form-element u-width-large  " id="site_url" value="<?php echo ($info["site_url"]); ?>" maxlength="250"   >
                <p class="help-block">当前网站的主域名，和微信授权域名同步</p>
            </div>
        </div>
	<?php $gurl = U('Home/Public/wxlogin',array('gowxurl'=>999));?>
	   
        <div class="formitm">
            <label class="lab">菜单跳转网址</label>
            <div class="ipt">
                <input name="cdtzurl" type="text"  class="form-element u-width-large  " id="cdtzurl" value="http://<?php echo ($info["site_url"]); echo ($gurl); ?>" maxlength="250"   >
                <p class="help-block">菜单点击则会跳转到这个网址,请确保你能正确打开这个网址。参考设置：http://<?php echo ($info["site_url"]); echo ($gurl); ?></p>
            </div>
        </div>
	
	 
        <div class="formitm">
            <label class="lab">公众号</label>
            <div class="ipt">
                <input name="gzhcode" type="text"  class="form-element u-width-large  " id="gzhcode" value="<?php echo ($info["gzhcode"]); ?>" maxlength="250"   >
                <p class="help-block">公众号英文如 shanmaome</p>
            </div>
        </div>
    
	 
        <div class="formitm">
            <label class="lab">管理员OPENID</label>
            <div class="ipt">
                <input name="adminopenid" type="text"  class="form-element u-width-large  " id="adminopenid" value="<?php echo ($info["adminopenid"]); ?>" maxlength="250"   >
                <p class="help-block">重要通知发送到管理员微信号！</p>
            </div>
        </div>
    
	
	
 
    

    
        <div class="formitm">
            <label class="lab">自定义token</label>
            <div class="ipt">
                <input name="wxtoken" type="text"  class="form-element u-width-large  " id="wxtoken" value="<?php echo ($info["wxtoken"]); ?>" maxlength="250"   >
                <p class="help-block">微信后台token接口，默认为 shanmaowxin 。备注：token网址为：http://<?php echo ($info["site_url"]); echo U('Home/Weixin/index');?></p>
            </div>
        </div>
    
    
    
	
        <div class="formitm">
            <label class="lab">APPID</label>
            <div class="ipt">
                <input name="APPID" type="text"  class="form-element u-width-large  " id="APPID" value="<?php echo ($info["APPID"]); ?>" maxlength="250"   >
                <p class="help-block">主微信APPID，一般有微信支付的服务号</p>
            </div>
        </div>
	
	
        <div class="formitm">
            <label class="lab">SCRETID</label>
            <div class="ipt">
                <input name="SCRETID" type="text"  class="form-element u-width-large  " id="SCRETID" value="<?php echo ($info["SCRETID"]); ?>" maxlength="250"   >
                <p class="help-block">微信AppSecret</p>
            </div>
        </div>
	
	
        <div class="formitm">
            <label class="lab">MCHID</label>
            <div class="ipt">
                <input name="MCHID" type="text"  class="form-element u-width-large  " id="MCHID" value="<?php echo ($info["MCHID"]); ?>" maxlength="250"   >
                <p class="help-block">微信商户id</p>
            </div>
        </div>
	
	
        <div class="formitm">
            <label class="lab">KEY</label>
            <div class="ipt">
                <input name="MCKEY" type="text"  class="form-element u-width-large  " id="MCKEY" value="<?php echo ($info["MCKEY"]); ?>" maxlength="250"   >
                <p class="help-block">微信商户key，微信支付设置教程：http://bbs.jnooo.cn/thread-43-1-2.html</p>
            </div>
        </div>
    

    
     
        <div class="formitm">
            <label class="lab">只在微信内打开</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="onlywx" id="onlywx0" value="1"   <?php  if(1 == $info['onlywx']){ ?> checked="checked" <?php } ?> > <span>是</span>
                    </label> <label>
                      <input type="radio" name="onlywx" id="onlywx1" value="0"   <?php  if(0 == $info['onlywx']){ ?> checked="checked" <?php } ?> > <span>否</span>
                    </label> 
                <p class="help-block">是否只允许前台网站只在微信内打开</p>
            </div>
        </div>
	
	 
        <div class="formitm">
            <label class="lab">积分通知</label>
            <div class="ipt">
                <input name="jifenmb" type="text"  class="form-element u-width-large  " id="jifenmb" value="<?php echo ($info["jifenmb"]); ?>" maxlength="250"   >
                <p class="help-block">积分通知模板id</p>
            </div>
        </div>
	
	
        <div class="formitm">
            <label class="lab">资金变动通知</label>
            <div class="ipt">
                <input name="moneymb" type="text"  class="form-element u-width-large  " id="moneymb" value="<?php echo ($info["moneymb"]); ?>" maxlength="250"   >
                <p class="help-block">资金变动通知模板id</p>
            </div>
        </div>
    
     
        <div class="formitm">
            <label class="lab">APPID_jsapi</label>
            <div class="ipt">
                <input name="APPID_jsapi" type="text"  class="form-element u-width-large  " id="APPID_jsapi" value="<?php echo ($info["APPID_jsapi"]); ?>" maxlength="250"   >
                <p class="help-block">当分享接口失效时。应急分享接口appid</p>
            </div>
        </div>
	
	
        <div class="formitm">
            <label class="lab">SCRETID_jsapi</label>
            <div class="ipt">
                <input name="SCRETID_jsapi" type="text"  class="form-element u-width-large  " id="SCRETID_jsapi" value="<?php echo ($info["SCRETID_jsapi"]); ?>" maxlength="250"   >
                <p class="help-block">当分享接口失效时。应急分享接口AppSecret</p>
            </div>
        </div>
    
    
    
        <div class="formitm">
            <label class="lab">短信账号</label>
            <div class="ipt">
                <input name="mobaccount" type="text"  class="form-element u-width-large  " id="mobaccount" value="<?php echo ($info["mobaccount"]); ?>" maxlength="250"   >
                <p class="help-block">短信账号（http://www.dxton.com/申请）</p>
            </div>
        </div>
    
    
        <div class="formitm">
            <label class="lab">短信密码</label>
            <div class="ipt">
                <input name="mobpass" type="text"  class="form-element u-width-large  " id="mobpass" value="<?php echo ($info["mobpass"]); ?>" maxlength="250"   >
                <p class="help-block">短信密码</p>
            </div>
        </div>
    
      
        <div class="formitm">
            <label class="lab">阿里大鱼短信appkey</label>
            <div class="ipt">
                <input name="dy_appkey" type="text"  class="form-element u-width-large  " id="dy_appkey" value="<?php echo ($info["dy_appkey"]); ?>" maxlength="250"   >
                <p class="help-block">短信接口appkey（申请教程:http://bbs.jnooo.cn/thread-63-1-1.html）</p>
            </div>
        </div>
    
    
        <div class="formitm">
            <label class="lab">阿里大鱼短信secretKey</label>
            <div class="ipt">
                <input name="dy_secretkey" type="text"  class="form-element u-width-large  " id="dy_secretkey" value="<?php echo ($info["dy_secretkey"]); ?>" maxlength="250"   >
                <p class="help-block">短信接口secretKey</p>
            </div>
        </div>
    
    
        <div class="formitm">
            <label class="lab">阿里大鱼短信模板ID</label>
            <div class="ipt">
                <input name="dy_mid" type="text"  class="form-element u-width-large  " id="dy_mid" value="<?php echo ($info["dy_mid"]); ?>" maxlength="250"   >
                <p class="help-block">阿里大鱼短信模板ID</p>
            </div>
        </div>
	
    
        <div class="formitm">
            <label class="lab">支付宝合作身份者id</label>
            <div class="ipt">
                <input name="alipay_config_partner" type="text"  class="form-element u-width-large  " id="alipay_config_partner" value="<?php echo ($info["alipay_config_partner"]); ?>" maxlength="250"   >
                <p class="help-block">合作身份者id，以2088开头的16位纯数字</p>
            </div>
        </div>
    
        <div class="formitm">
            <label class="lab">收款支付宝账号</label>
            <div class="ipt">
                <input name="alipay_config_seller_id" type="text"  class="form-element u-width-large  " id="alipay_config_seller_id" value="<?php echo ($info["alipay_config_seller_id"]); ?>" maxlength="250"   >
                <p class="help-block">收款支付宝账号，一般情况下收款账号就是签约账号</p>
            </div>
        </div>
    
        <div class="formitm">
            <label class="lab">支付宝查询安全校验码(key)</label>
            <div class="ipt">
                <input name="alipay_config_key" type="text"  class="form-element u-width-large  " id="alipay_config_key" value="<?php echo ($info["alipay_config_key"]); ?>" maxlength="250"   >
                <p class="help-block">查询安全校验码(key)</p>
            </div>
        </div>
    
	 
        <div class="formitm">
            <label class="lab">微信JS分享接口</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="iswxjsfx" id="iswxjsfx0" value="1"   <?php  if(1 == $info['iswxjsfx']){ ?> checked="checked" <?php } ?> > <span>是</span>
                    </label> <label>
                      <input type="radio" name="iswxjsfx" id="iswxjsfx1" value="0"   <?php  if(0 == $info['iswxjsfx']){ ?> checked="checked" <?php } ?> > <span>否</span>
                    </label> 
                <p class="help-block">确保您的js分享接口正常，是否启用微信js分享接口。开启则公众号js授权域名必须为上面域名B。下面多域名设置C,D按需求填写。(论坛必看教程：http://bbs.jnooo.cn/thread-74-1-1.html)</p>
            </div>
        </div>
	
	
    
        <div class="formitm">
            <label class="lab">C.多域名设置</label>
            <div class="ipt">
                <textarea name="moredomai" type="text"  class="form-element u-width-large " id="moredomai" value="" rows="5"   ><?php echo ($info["moredomai"]); ?></textarea>
                <p class="help-block">分享前域名，一个域名一行，泛域名用类似：*.shanmao.me(请确保你的域名没有被微信拦截)</p>
            </div>
        </div>
	
	  
        <div class="formitm">
            <label class="lab">D.多域名设置</label>
            <div class="ipt">
                <textarea name="moredomaifxh" type="text"  class="form-element u-width-large " id="moredomaifxh" value="" rows="5"   ><?php echo ($info["moredomaifxh"]); ?></textarea>
                <p class="help-block">分享后域名，一个域名一行，泛域名用类似：*.shanmao.me。最好上CDN</p>
            </div>
        </div>
	

       
        <div class="formitm">
            <label class="lab">站点统计</label>
            <div class="ipt">
                <textarea name="site_statistics" type="text"  class="form-element u-width-large " id="site_statistics" value="" rows="5"   ><?php echo ($info["site_statistics"]); ?></textarea>
                <p class="help-block">用于统计代码调用</p>
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