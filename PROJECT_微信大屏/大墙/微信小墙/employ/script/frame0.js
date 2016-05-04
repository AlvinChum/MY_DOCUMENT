	var removes=function(){
	if(window.only==0||window.only){
	$('.content div').eq(window.only).remove();
	}
	return;
	}
	apiready = function(){
	var toast=function(msg){api.toast({
    msg: msg?msg:'网络错误',
    duration: 2000,
    location: 'middle'
	});}
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
    api.refreshHeaderLoadDone();

});
		$('#header .control').click(function(){
		var $this=$(this);
		var $on=$this.find('span');
		if($on.hasClass('on')){
			$on.removeClass('on');
			$this.removeClass('active');
		}else{
		$this.addClass('active');
		$on.addClass('on');
		}
		});
	var index=function(parent,element){
		var parent=parent;
		var leng=parent.length;
		for(var i=0;i<leng;i++){
			if(parent.get(i)==element.get(0)){
			return i;
			}
		}
	}
	var openXQ=function(index){
		api.openWin({
	        name: 'openframe0XQ',
	        url: '../html/frame0XQ.html',
	        reload:true,
	        pageParam:{
	        win:api.winName
	        }
        });}
		$('.content').click(function(event){
		var element=event.target;
		var on=$('#header .control');
		if(element.className.indexOf('btn')>-1&&element.tagName.toLowerCase()=='a'){
			if(!on.hasClass('active')){toast('您还没开启上班，不能接单');return};
			$('.content div').eq(index($('.content div'),$(element).parent())).remove();
			removes();
		}else if(element.className.indexOf('openOrder')>-1){
			if(!on.hasClass('active')){toast('您还没开启上班，不能查看订单');return};
				window.only=null;
				window.only=index($('.content div'),$(element).parent());
				openXQ();
		}
		})
	};