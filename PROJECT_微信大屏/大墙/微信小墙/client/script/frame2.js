apiready = function(){
	var prompt=function(title,msg,callback){
		api.alert({
	    title: title?title:'错误',
	    msg: msg?msg:'错误超时',
	    buttons: ['确定']
	},function( ret, err ){
	    if( ret ){
	    callback();
	    }
	});}
	var login=function(){
	    api.openWin({
	        name: 'login',
	        url: '../html/login.html',
	        reload:true
        });
        }
		/*打开不同的事件*/
		$('.setInfo').click(function(){
		/*
		if($('.login').hasClass('disable')){
		prompt('未登录','请先登录',login)
		return;}
		*/
		api.openWin({
	        name: 'setInfo',
	        url: '../html/setInfo.html',
	        reload:true
        });
        })
        $('.myAccount').click(function(){
        	/*
		if($('.login').hasClass('disable')){
		prompt('未登录','请先登录',login)
		return;}
		*/
        api.openWin({
	        name: 'myAccount',
	        url: '../html/frame2MyAccount.html',
	        reload:true
        });
        })
        $('.changePass').click(function(){
        	/*
		if($('.login').hasClass('disable')){
		prompt('未登录','请先登录',login)
		return;}
		*/
          api.openWin({
	        name: 'changePass',
	        url: '../html/changePass.html',
	        reload:true
        })
        })
        $('.aboutUs').click(function(){
          api.openWin({
	        name: 'aboutUs',
	        url: '../html/frame2AboutUs.html',
	        reload:true
        });
        });
        $('.suggest').click(function(){
          api.openWin({
	        name: 'suggest',
	        url: '../html/frame2Suggest.html',
	        reload:true
        });
        });
        $('.login').click(function(){
        if($(this).hasClass('disable')){login() return;}
        	prompt('退出登录','是否退出登录',function(){
        	});
        })
	};