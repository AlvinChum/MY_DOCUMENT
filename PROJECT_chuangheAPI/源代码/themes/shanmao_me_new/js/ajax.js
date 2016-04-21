String.prototype.Trim = function() { 
var m = this.match(/^\s*(\S+(\s+\S+)*)\s*$/); 
return (m == null) ? "" : m[1]; 
} 

String.prototype.isTel = function() 
{ 

	return (/1[34587]{1}\d{9}$/.test(this.Trim())); 
} 
var img = '<img src="themes/shanmao_me_new/images/app/jinshi_new.png"width="15" alt="">';

$(function(){
	var submit = true;
	//注册验证
	$('input[name="log"]').blur(function(){
		var parent =$(this).parent('div');
		var url ="index.php?s=/Home/Ajax/checklogin";
		var msg =parent.next('.hg30').find('p');
		 msg.html('');
		
		var tel =$(this).val();
		if(!tel.isTel()){
			 parent.addClass("red_border");
			 msg.html(img+'请填写正确的手机号');
			 return false;
		}

		$.post(url,{tel:tel},function(data){
		      if(data.status!=1){
		    	 var html =img + data.msg;
		    	  msg.html(html);
		    	  parent.addClass("red_border");
		    	  submit = false;
		      }else{
		    	  submit = true;
		    	  parent.removeClass('red_border'); 
		      }
		},'json')
	})
	$('.pwd').focus(function(){
		var yangjing3 =$('#yangjing3');
		var yangjing4 =$('#yangjing4');
		yangjing3.removeClass('red_border');
		yangjing4.removeClass('red_border');
		$('.msg').html('');
		 submit = true;
	})
	$('.pwd').blur(function(){
		var val = $(this).val();
		$('.pwd').val(val);
	})
   $('.m_pwd').blur(function(){
		var val = $(this).val();
		$('.m_pwd').val(val);
	})
	
	//登录验证
	$("#denglu").click(function(){
		 var s=document.getElementById('denglu');
		if(!submit){
			s.innerHTML='登录';s.style.background='#ff4400';
			return false;
		}
		
	    var msg =$('.msg');
	    var user_msg =$('.user_msg');
		msg.html('');user_msg.html('');
		var url ="index.php?s=/Home/Ajax/checkuser";
		var log = $("input[name='log']").val();
		var pwd = $("input[name='pwd']").val();
		
		var parent =$(this).parent('div');
		var yangjing3 =$('#yangjing3');
		var yangjing4 =$('#yangjing4');
		
		//var parent =$(this).parent('div');
	    var sub =$("#btn2f");
		$.post(url,{log:log,pwd:pwd},function(data){
			if(data.status!=1){
				submit =false;
				var html =img+data.msg;
				var o = data.status==-2?msg:user_msg;
				if(data.status==-2){
					yangjing3.addClass("red_border");
					yangjing4.addClass("red_border");
				}else{
					o.parent('div').prev('.wei_input').addClass("red_border");
				}
				o.html(html);
				 s.innerHTML='登录';s.style.background='#ff4400';
			}else{
				sub.submit();
			}
		
		},'json')

	})

})

var f_next = true;
$(function(){

//注册验证
	$('input[name="user_login"]').blur(function(){
		var parent =$(this).parent('div');
		var tel =$(this).val();
		var url ="index.php?s=/Home/Ajax/checktel";
		var msg =parent.next('.hg30').find('p');
		 msg.html('');
		if(!tel.isTel()){
			 parent.addClass("red_border");
			 msg.html(img+'请填写正确的手机号');
			 f_next = false;
			 return false;
		}

		$.post(url,{tel:tel},function(data){
		      if(data.status!=1){
		    	 var html =img+ data.msg;
		    	  msg.html(html);
		    	  parent.addClass("red_border");
		      }else{
		    	  parent.removeClass('red_border'); 
		      }
		},'json')
	})

})

function next(){
	
	var pwd = $('input[name="password"]').val();
	var m_pwd = $('input[name="m_password"]').val();
	
	var tel =$('input[name="user_login"]').val();
	var k_msg_3 =$('.k_msg');
    var msg_3 = $('.p_msg');
    
    var k_msg_2 =$('input[name="password"]').parent('div');
    var msg_2 = $('.p_msg_2');
    
    var k_msg_1 =$('input[name="user_login"]').parent('div');
    var msg_1 = k_msg_1.next('.hg30').find('p');
    var url ="index.php?s=/Home/Ajax/next";
    
    if(tel==null||tel==''){
	    k_msg_1.addClass("red_border");
		 msg_1.html(img+'请输入手机号');
		 return false;	 
	}
   if(pwd==null||pwd==''){
	    k_msg_2.addClass("red_border");
		 msg_2.html(img+'密码不能为空');
		 return false;	 
	}
   if(m_pwd==null||m_pwd==''){
	    k_msg_3.addClass("red_border");
		 msg_3.html(img+'确认密码不能为空');
		 return false;	 
	}   
	if(pwd != m_pwd){
		k_msg_3.addClass("red_border");
		 msg_3.html(img+'两次密码输入不一致');
		 return false;
	}
	
	//if(f_next){
		var yzm = $('.fasong span');
		var obj =$('#huoqu');
		$.post(url,{tel:tel,pwd:pwd,m_pwd:m_pwd},function(data){
		      if(data.status!=1){
		    	 var html =img+ data.msg;
		    	 switch(data.status)
		    	 {
					case -1:
					var o = msg_1;
					var k_o =k_msg_1;
					  break;
					case -2:
						var o = msg_2;
						var k_o =k_msg_2;
					  break;
					case -3:
						var o = msg_3;
						var k_o =k_msg_3;
					  break;
					}
		    	  o.html(html);
		    	  k_o.addClass("red_border");
		      }else{
		    	  yzm.html(tel);
		    	  obj.attr('disabled',"disabled");
  				  start_sms_button(obj);
		    	  document.getElementById('zczh2').style.display='block';
		    	  document.getElementById('zczh1').style.display='none'  
		      }
		},'json')
		
	//}	
}
var uid = 0;
function reg(){
	var yzm = $('.yzm_msg');
	 var url ="index.php?s=/Home/Ajax/reg";
	var code = $('input[name="code"]').val();
	$.post(url,{code:code},function(data){
	    if(data.status!=1){
	    	var html =img+ data.msg;
	    	yzm.html(html);
	    }else{
	    	uid = data.msg
	    	document.getElementById('zczh3').style.display='block';
	    	document.getElementById('zczh2').style.display='none'
	    }
		
	},'json')
}

function yqm(){
	var msg = $('.yqm_msg');
	var yqm = $('input[name="yqm"]').val();
	 var url ="index.php?s=/Home/Ajax/yqm";
	 $.post(url,{yqm:yqm,uid:uid},function(data){
		    if(data.status!=1){
		    	var html =img+ data.msg;
		    	msg.html(html);
		    }else{
		    	document.getElementById('zczh4').style.display='block';
		    	document.getElementById('zczh3').style.display='none';
		    }
			
		},'json')

}


function start_sms_button(obj){
    var count = 1 ;
    var sum = 90;
    var i = setInterval(function(){
      if(count > sum){
        obj.attr('disabled',false);
        obj.val('发送验证码');
        clearInterval(i);
      }else{
        obj.val('剩余'+parseInt(sum - count)+'秒');
      }
      count++;
    },1000);
  }


$(function(){
	   $('#huoqu').click(function(){
		    var g_msg = $('.g_msg_1').html();
		    var obj =$(this);
		    var tel_msg =$('#tel_msg');
			var url ="index.php?s=/Home/Ajax/getvcode";
			var tel =$('#tel').val();
			if(tel==''||tel==null){
				
				alert('请输入手机号码！');
				return false;
			}
			if(g_msg){
				return false;
			}
			$.post(url,{mob:tel},function(data){
				
             if(data.status == 1){
             	obj.attr('disabled',"disabled");
 				start_sms_button(obj);
             }else{
            	 var html =img+ data.msg;
            	 tel_msg.html(html);
             }
             
			},'json');
		});  
})

function getpwd_next(){
	var tel =$('input[name="log"]').val();
	var code = $('input[name="code"]').val();
	var url ="index.php?s=/Home/Ajax/getpwd";
	var g_msg_1 =$('.g_msg_1');
	var g_msg_2 =$('.g_msg_2');
	
	 $.post(url,{tel:tel,code:code},function(data){
		    if(data.status!=1){
		    	var html =img+ data.msg;
		    	var o =data.status==-1?g_msg_1:g_msg_2;
		    	o.html(html);
		    }else{
		    	document.getElementById('zhmm2').style.display='block';
		    	document.getElementById('zhmm1').style.display='none';
		    }
			
		},'json')
	
	
}


function res_pwd(){
	var pwd =$('input[name="password"]').val();
	var m_pwd =$('input[name="m_password"]').val();
	var url ="index.php?s=/Home/Ajax/reg_pwd";
	var msg_1 =$('.z_msg_1');
	var msg_2 =$('.z_msg_2');
	
	msg_1.html(''); msg_2.html('');
	if(pwd==null||pwd==''){
		 msg_1.html(img+'密码不能为空');
		 return false;	 
	}
	 if(m_pwd==null||m_pwd==''){
			 msg_2.html(img+'确认密码不能为空');
			 return false;	 
		} 
	 if(pwd != m_pwd){
			 msg_2.html(img+'两次密码输入不一致');
			 return false;
		}
	 $.post(url,{pwd:pwd,m_pwd:m_pwd},function(data){
		 if(data.status!=1){
		    	var html =img+ data.msg;
		    	var o =data.status==-1?msg_1:msg_2;
		    	o.html(html);
		    }else{
		    	document.getElementById('zhmm3').style.display='block';
		    	document.getElementById('zhmm2').style.display='none';
		    }
		 
	 },'json')
	
}



