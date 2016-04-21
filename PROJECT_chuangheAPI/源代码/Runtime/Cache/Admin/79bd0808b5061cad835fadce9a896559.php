<?php if (!defined('THINK_PATH')) exit();?><h3>app设置</h3>

        <div class="m-panel ">
            <div class="panel-body">
            
        <form action="<?php echo U('site');?>" method="post" id="form" class="m-form m-form-horizontal">
        <fieldset>
          
        <div class="formitm">
            <label class="lab">APP网址</label>
            <div class="ipt">
                <input name="appurl" type="text"  class="form-element u-width-large  " id="appurl" value="<?php echo ($info["appurl"]); ?>" maxlength="250"   >
                <p class="help-block">自定义app打开的网址http://开头</p>
            </div>
        </div>
    
     
        <div class="formitm">
            <label class="lab">APP下载网址</label>
            <div class="ipt">
                <input name="appdownurl" type="text"  class="form-element u-width-large  " id="appdownurl" value="<?php echo ($info["appdownurl"]); ?>" maxlength="250"   >
                <p class="help-block">app下载网址http://开头</p>
            </div>
        </div>
    
     
        <div class="formitm">
            <label class="lab">QQ分享appid</label>
            <div class="ipt">
                <input name="qq_appid" type="text"  class="form-element u-width-large  " id="qq_appid" value="<?php echo ($info["qq_appid"]); ?>" maxlength="250"   >
                <p class="help-block">QQ分享appid</p>
            </div>
        </div>
    
     
        <div class="formitm">
            <label class="lab">QQ分享secretid</label>
            <div class="ipt">
                <input name="qq_secretid" type="text"  class="form-element u-width-large  " id="qq_secretid" value="<?php echo ($info["qq_secretid"]); ?>" maxlength="250"   >
                <p class="help-block">QQ分享appid</p>
            </div>
        </div>
    
     
        <div class="formitm">
            <label class="lab">微信分享appid</label>
            <div class="ipt">
                <input name="wx_appid" type="text"  class="form-element u-width-large  " id="wx_appid" value="<?php echo ($info["wx_appid"]); ?>" maxlength="250"   >
                <p class="help-block">微信分享appid申请教程http://bbs.jnooo.cn/thread-75-1-1.html</p>
            </div>
        </div>
    
     
        <div class="formitm">
            <label class="lab">微信分享secretid</label>
            <div class="ipt">
                <input name="wx_secretid" type="text"  class="form-element u-width-large  " id="wx_secretid" value="<?php echo ($info["wx_secretid"]); ?>" maxlength="250"   >
                <p class="help-block">微信分享appid</p>
            </div>
        </div>
	
	
        <div class="formitm">
            <label class="lab">安卓组播push_tag</label>
            <div class="ipt">
                <input name="android_tagname" type="text"  class="form-element u-width-large  " id="android_tagname" value="<?php echo ($info["android_tagname"]); ?>" maxlength="250"   >
                <p class="help-block">组播push_tag,不懂的找客服要</p>
            </div>
        </div>
	
    
        <div class="formitm">
            <label class="lab">安卓组播通知标题</label>
            <div class="ipt">
                <input name="android_group_title" type="text"  class="form-element u-width-large  " id="android_group_title" value="<?php echo ($info["android_group_title"]); ?>" maxlength="250"   >
                <p class="help-block">安卓组播通知标题(中文字符超过18个，后面的字符将不显示)</p>
            </div>
        </div>
	
    
        <div class="formitm">
            <label class="lab">安卓组播通知文字描述</label>
            <div class="ipt">
                <input name="android_group_text" type="text"  class="form-element u-width-large  " id="android_group_text" value="<?php echo ($info["android_group_text"]); ?>" maxlength="250"   >
                <p class="help-block">安卓组播通知文字描述(中文字符超过18个，后面的字符将不显示)</p>
            </div>
        </div>
	
    
        <div class="formitm">
            <label class="lab">安卓组播跳转url</label>
            <div class="ipt">
                <input name="android_group_url" type="text"  class="form-element u-width-large  " id="android_group_url" value="<?php echo ($info["android_group_url"]); ?>" maxlength="250"   >
	  <a href="javascript:check();">点击推送</a>
                <p class="help-block">通知栏点击后跳转的URL，要求以http或者https开头</p>
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
function check(){
	var android_tagname = $('#android_tagname').val();
	if(android_tagname == ""){
		alert('安卓组播push_tag不能为空');
		$('#android_tagname').focus();
		return false;
	}
	var android_group_title = $('#android_group_title').val();
	if(android_group_title == ""){
		alert('安卓组播通知标题不能为空');
		$('#android_group_title').focus();
		return false;
	}
	var android_group_text = $('#android_group_text').val();
	if(android_group_text == ""){
		alert('安卓组播通知文字描述不能为空');
		$('#android_group_text').focus();
		return false;
	}
	var android_group_url = $('#android_group_url').val();
	if(android_group_url == ""){
		alert('安卓组播跳转url不能为空');
		$('#android_group_url').focus();
		return false;
	}
	//window.location.href="";
	$.post(
		"<?php echo U('Home/Api2/sendAndroidGroupcastByAdmin');?>",
		{
			android_tagname:android_tagname,
			android_group_title:android_group_title,
			android_group_text:android_group_text,
			android_group_url:android_group_url
		},
		function(data){
			if(data.ret == "SUCCESS"){
				alert('推送成功!');
			} else {
				alert(data.ret);
			}
		},
		'json'
	);
}
</script>