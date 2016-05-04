	var loading=function(){
	if($('#header .active').hasClass('jxz')){
			$('.content .success').hide();
	}else{
			$('.content .jxz').hide();
	}
	};
	loading();//加载必备
	window.only='';
	var removes=function(){
	if(window.only){
	window.only.remove();
	loading();
	}
	return;
	}
apiready = function(){
/*
	var index=function(parent,element){
		var parent=parent;
		var leng=parent.length;
		for(var i=0;i<leng;i++){
			if(parent.get(i)==element.get(0)){
			return i;
			}
		}
	}
	*/
	var toast=function(msg){api.toast({
    msg: msg?msg:'网络错误',
    duration: 2000,
    location: 'middle'
	});}
	Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
		//ajax请求
		var ajax=function(url,method,timeout,data,calllback){
	api.ajax({
	    url:url,
	    method:method?method:'post',
	    timeout:timeout?timeout:30,
	    returnAll:false,
	    dataType:'json',
	     data: {
        values:data
    }
    },function(ret,err){
    	//coding...
    	if(err.code==1){
    		toast('网络错误');
    	}
    });
    }
	//下拉刷新
	api.setRefreshHeaderInfo({
    visible: true,
    loadingImg: 'widget://image/refresh.png',
    bgColor: '#ccc',
    textColor: '#fff',
    textDown: '下拉刷新...',
    textUp: '松开刷新...',
    showTime: true,
    textTime:new Date().Format("yyyy-MM-dd hh:mm:ss"),
    showTime:true
}, function( ret, err ){
    //在这里从服务器加载数据，加载完成后调用api.refreshHeaderLoadDone()方法恢复组件到默认状态
    api.refreshHeaderLoadDone()

});

	var openXQ=function(type){
		api.openWin({
	        name: 'openframe1XQ',
	        url: '../html/frame1XQ.html',
	        pageParam:{type:type?type:null,
	        win:api.winName
	        },
	        reload:true
        });}
		$('#header .jxz').click(function(){
			if($(this).hasClass('active'))return;
			$('#header .active').removeClass('active');
			$(this).addClass('active');
			$('.content').find('.success').hide()
			$('.content .jxz').show();
		});
		$('#header .success').click(function(){
		if($(this).hasClass('active'))return;
			$('#header .active').removeClass('active');
			$(this).addClass('active');
			$('.content').find('.jxz').hide();
			$('.content .success').show();
		});
		$('.content ').click(function(event){
			if(event.target.tagName.toLowerCase()=='a'&&event.target.className.indexOf('cancel')>-1){
			$(event.target).parent().remove();
			}else if(event.target.className.indexOf('openOrder')>-1){
				var type=$(event.target).parent().hasClass('jxz')?'jxz':'success';
				window.only=null;
				window.only=$(event.target).parent();
				openXQ(type);
			}
		})
	};