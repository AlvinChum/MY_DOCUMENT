<?php if (!defined('THINK_PATH')) exit();?><h3><?php echo ($name); ?>用户</h3>

        <form action="<?php echo U();?>" method="post" id="form" class="m-form ">
        <fieldset>
          <div class="g-main-body">
    <div class="g-main-content m-form-horizontal">
      
        <div class="m-panel ">
            <div class="panel-body">
            
        <div class="formitm">
            <label class="lab">用户等级</label>
            <div class="ipt">
                <select name="user_rank" class="form-element">
      <option value="0" <?php if($info['user_rank'] == 0): ?>selected<?php endif; ?> >无等级</option>
      <?php if(is_array($user_rank)): foreach($user_rank as $key=>$vo): ?><option value="<?php echo ($vo["data_id"]); ?>" <?php if($info['user_rank'] == $vo['data_id']): ?>selected<?php endif; ?> ><?php echo ($vo["rank_name"]); ?></option><?php endforeach; endif; ?>
       
        </foreach>
      </select>
                <p class="help-block">请选择用户等级</p>
            </div>
        </div>
       
        <div class="formitm">
            <label class="lab">用户名/登录名</label>
            <div class="ipt">
                <?php if($info['user_login']): echo ($info['user_login']); ?>
       <input name="user_login" type="hidden"  class="form-element u-width-large  " id="user_login" value="<?php echo ($info["user_login"]); ?>" maxlength="20"   >
       <?php else: ?> 
        <input name="user_login" type="text"  class="form-element u-width-large  " id="user_login" value="<?php echo ($info["user_login"]); ?>" maxlength="20"  datatype="*" ><?php endif; ?>
                <p class="help-block">用户登录帐号</p>
            </div>
        </div>
       
        <div class="formitm">
            <label class="lab">密码</label>
            <div class="ipt">
                <input name="user_pass" type="password"  class="form-element u-width-large  " id="user_pass" value="" maxlength="250"   >
                <p class="help-block">用户密码</p>
            </div>
        </div>
       
        <div class="formitm">
            <label class="lab">重复密码</label>
            <div class="ipt">
                <input name="user_pass2" type="password"  class="form-element u-width-large  " id="user_pass2" value="" maxlength="250"   >
                <p class="help-block">重复密码</p>
            </div>
        </div>
         
        <div class="formitm">
            <label class="lab">昵称</label>
            <div class="ipt">
                <input name="user_nicename" type="text"  class="form-element u-width-large  " id="user_nicename" value="<?php echo ($info["user_nicename"]); ?>" maxlength="20"  datatype="*" >
                <p class="help-block">昵称</p>
            </div>
        </div>
        
        <div class="formitm">
            <label class="lab">推荐人</label>
            <div class="ipt">
                <input name="parent_id" type="text"  class="form-element u-width-large  " id="parent_id" value="<?php echo ($info["parent_id"]); ?>" maxlength="250"   >
                <p class="help-block">推荐人ID</p>
            </div>
        </div>
     
        <div class="formitm">
            <label class="lab">手机号码</label>
            <div class="ipt">
                <input name="user_tel" type="text"  class="form-element u-width-large  " id="user_tel" value="<?php echo ($info["user_tel"]); ?>" maxlength="50"  datatype="m" >
                <p class="help-block">手机号码</p>
            </div>
        </div>
    <!--      
        <div class="formitm">
            <label class="lab">邮箱</label>
            <div class="ipt">
                <input name="user_email" type="text"  class="form-element u-width-large  " id="user_email" value="<?php echo ($info["user_email"]); ?>" maxlength="250"  datatype="e" >
                <p class="help-block">邮箱</p>
            </div>
        </div>-->
      <!-- 
        <div class="formitm">
            <label class="lab">qq号码</label>
            <div class="ipt">
                <input name="user_qq" type="text"  class="form-element u-width-large  " id="user_qq" value="<?php echo ($info["user_qq"]); ?>" maxlength="250"  datatype="n" >
                <p class="help-block">qq号码</p>
            </div>
        </div>
	   -->
       
        <div class="formitm">
            <label class="lab">微信号</label>
            <div class="ipt">
                <input name="weixin" type="text"  class="form-element u-width-large  " id="weixin" value="<?php echo ($info["weixin"]); ?>" maxlength="250"   >
                <p class="help-block">微信号</p>
            </div>
        </div>
	   
	   
    
        <div class="formitm">
            <label class="lab">发微信红包</label>
            <div class="ipt">
                红包标题：<input type="text" placeholder="红包标题"  id="hbtitle" value="<?php echo C('site_title');?>" />
	 红包内容：<input type="text" placeholder="红包内容"  id="hbbody" value="<?php echo C('hbbody');?>" />
	  红包金额：<input type="text" placeholder="红包金额"  id="hbfee" value="1" />  （元）
	
	<input type="button" id="sendhb" value="点击发送"  onclick="sendhongbao(this)"/>
                <p class="help-block">发微信现金红包</p>
            </div>
        </div>
	   
	   
	    
        <div class="formitm">
            <label class="lab">发微信裂变红包</label>
            <div class="ipt">
                红包标题：<input type="text" placeholder="红包标题"  id="hbtitle1" value="<?php echo C('site_title');?>" />
	 红包内容：<input type="text" placeholder="红包内容"  id="hbbody1" value="<?php echo C('hbbody');?>" />
	  红包金额：<input type="text" placeholder="红包金额"  id="hbfee1" value="3" />  （3元起）
	红包人数：<input type="text" placeholder="红包人数"  id="hbnum1" value="3" />  （3人起）
	<input type="button" id="sendhb" value="点击发送"  onclick="sendhongbao(this,'lb')"/>
                <p class="help-block">发微信裂变红包</p>
            </div>
        </div>
	   
	   
	    
        <div class="formitm">
            <label class="lab">微信支付转账</label>
            <div class="ipt">
                转账内容：<input type="text" placeholder="转账内容"  id="hbbody2" value="<?php echo C('hbbody');?>" />
	  转账金额：<input type="text" placeholder="转账金额"  id="hbfee2" value="0.01" /> 
	<input type="button" id="sendhb" value="点击发送"  onclick="sendzz(this)"/>
                <p class="help-block">微信支付转账</p>
            </div>
        </div>
       
           
        <div class="formitm">
            <label class="lab">积分余额操作</label>
            <div class="ipt">
                金额类型：<select name='mtype' id="hdmtype3"><option value="1">积分</option><option value="2">金钱</option><option value="3">微币</option></select> 金额： <input type="text" placeholder="金额"  id="hbmoeny3" value="" />
	  变动类型：<select name="type" id="hdtype3" >
            <option value="1">关注</option>
            <option value="2">邀请</option>
            <option value="3">发送失败转余额</option>
            <option value="4">摇一摇变动</option>
            <option value="5">分享文章</option>
            <option value="6">签到</option> 
            <option value="7">提现</option> 
            <option value="8">作弊</option> 
              </select>
            <br/>  描述： <input type="text" placeholder="描述"  id="hbdesc3" value="" /> <input type="hidden"  id="hbuid3" value="<?php echo ($info["id"]); ?>" /> 
	<input type="button" id="sendhb" value="点击操作"  onclick="sendaccount(this)"/>
                <p class="help-block">积分余额操作</p>
            </div>
        </div>
	   
      <!--  
        <div class="formitm">
            <label class="lab">试听状态</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="st_status" id="st_status0" value="1"   <?php if(!isset($info['st_status'])){ $info['st_status']= "1"; } if(1 == $info['st_status']){ ?> checked="checked" <?php } ?> > <span>提交试听审核</span>
                    </label> <label>
                      <input type="radio" name="st_status" id="st_status1" value="0"   <?php if(!isset($info['st_status'])){ $info['st_status']= "1"; } if(0 == $info['st_status']){ ?> checked="checked" <?php } ?> > <span>无</span>
                    </label> <label>
                      <input type="radio" name="st_status" id="st_status2" value="2"   <?php if(!isset($info['st_status'])){ $info['st_status']= "1"; } if(2 == $info['st_status']){ ?> checked="checked" <?php } ?> > <span>审核通过</span>
                    </label> 
                <p class="help-block">试听状态</p>
            </div>
        </div>
      
        
         
        <div class="formitm">
            <label class="lab">占座报班</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="bb_status" id="bb_status0" value="1"   <?php if(!isset($info['bb_status'])){ $info['bb_status']= "1"; } if(1 == $info['bb_status']){ ?> checked="checked" <?php } ?> > <span>占座审核</span>
                    </label> <label>
                      <input type="radio" name="bb_status" id="bb_status1" value="0"   <?php if(!isset($info['bb_status'])){ $info['bb_status']= "1"; } if(0 == $info['bb_status']){ ?> checked="checked" <?php } ?> > <span>无</span>
                    </label> <label>
                      <input type="radio" name="bb_status" id="bb_status2" value="2"   <?php if(!isset($info['bb_status'])){ $info['bb_status']= "1"; } if(2 == $info['bb_status']){ ?> checked="checked" <?php } ?> > <span>已占座</span>
                    </label> <label>
                      <input type="radio" name="bb_status" id="bb_status3" value="3"   <?php if(!isset($info['bb_status'])){ $info['bb_status']= "1"; } if(3 == $info['bb_status']){ ?> checked="checked" <?php } ?> > <span>已报班</span>
                    </label> 
                <p class="help-block">占座报班状态</p>
            </div>
        </div>
      -->
       
       
       
        <div class="formitm">
            <label class="lab">用户状态</label>
            <div class="ipt">
                <label>
                      <input type="radio" name="user_status" id="user_status0" value="1"   <?php if(!isset($info['user_status'])){ $info['user_status']= "1"; } if(1 == $info['user_status']){ ?> checked="checked" <?php } ?> > <span>正常</span>
                    </label> <label>
                      <input type="radio" name="user_status" id="user_status1" value="0"   <?php if(!isset($info['user_status'])){ $info['user_status']= "1"; } if(0 == $info['user_status']){ ?> checked="checked" <?php } ?> > <span>禁用</span>
                    </label> <label>
                      <input type="radio" name="user_status" id="user_status2" value="2"   <?php if(!isset($info['user_status'])){ $info['user_status']= "1"; } if(2 == $info['user_status']){ ?> checked="checked" <?php } ?> > <span>未验证</span>
                    </label> 
                <p class="help-block">禁用后该用户将无法登录</p>
            </div>
        </div>
       
        
        <div class="formitm form-submit">
        <div class="ipt">
            <div class="tip" id="tips"></div>
            <button class="u-btn u-btn-success u-btn-large" type="submit" id="btn-submit">保存</button>
            <button class="u-btn u-btn-large" type="reset">重置</button>
        </div>
        </div>
            </div> </div>
    </div>
  </div>
  <input name="id" type="hidden"  class="form-element u-width-large  " id="id" value="<?php echo ($info["id"]); ?>"    >
        </fieldset>
        </form>
<script>
    Do.ready('base', function () {
        //表单综合处理
        $('#form').duxFormPage();
        //上传缩略图
        $('#upload').duxFileUpload({
            type: 'jpg,png,gif,bmp',
            complete: function (data) {
                $('#content_image').attr('src', data.url);
            }
        });
        //提取关键词
        $('#getKeyword').click(function () {
            $.post('<?php echo U("DuxCms/ContentTools/getKerword");?>', {
                    title: $('#content').val(),
                    content: $('#description').val()
                },
                function (data) {
                    if (data.status) {
                        $('#keywords').val(data.info);
                    } else {
                        alert(data.info);
                    }
                }, 'json');
        });
		//动态获取扩展字段
		$('#class_id').change(function() {
			$('#expand').load('<?php echo U("DuxCms/AdminExpand/getField");?>',{class_id:$(this).val(),content_id:$('#content_id').val()},function(){
				$('#expand').duxFormPage({form:false});
			});
		});
		$('#class_id').change();
    }); 
	
    
    function sendaccount(thiss){
    	thiss.setAttribute("disabled", true);
    	var mtype = $("#hdmtype3").val();
    	var moeny = $('#hbmoeny3').val();
    	var type = $("#hdtype3").val();	
    	var desc = $("#hbdesc3").val();
    	var uid = $("#hbuid3").val();
    	$.post("<?php echo U('Admin/User/sendaccount');?>",{mtype:mtype,type:type,moeny:moeny,desc:desc,uid:uid},function(data){
    			alert(data);	
    			thiss.removeAttribute("disabled");		
    		})
    }
    
    
	function sendzz(thiss){
	thiss.setAttribute("disabled", true);
	var openid = $("#weixin").val();
	var fee = $("#hbfee2").val();	
	var desc = $("#hbbody2").val();
	$.post("<?php echo U('Admin/User/sendzz');?>",{openid:openid,fee:fee,desc:desc},function(data){
			alert(data);	
			thiss.removeAttribute("disabled");		
		})
	
	}
	
	function sendhongbao(thiss,type){
	thiss.setAttribute("disabled", true);
	if(type=='lb'){ 	
	var num=$("#hbnum").val();
	var openid = $("#weixin").val();
	var hbtitle = $("#hbtitle1").val();
	var hbbody = $("#hbbody1").val();
	var fee = $("#hbfee1").val();	
	}else{
	var openid = $("#weixin").val();
	var hbtitle = $("#hbtitle").val();
	var hbbody = $("#hbbody").val();
	var fee = $("#hbfee").val();
	}
		$.post("<?php echo U('Admin/User/sendhbs');?>",{openid:openid,hbtitle:hbtitle,hbbody:hbbody,fee:fee,type:type,num:num},function(data){
			alert(data);	
			thiss.removeAttribute("disabled");		
		})
		
	}
</script>