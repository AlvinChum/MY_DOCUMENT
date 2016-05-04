apiready = function(){
		window.appId='A6904850308837';
		window.appKey='2C5BFDD9-3C32-4D8A-E0B8-4EA57C411A67';
		window.Class='photo';
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
		var progress=function(title,text){
		api.showProgress({
		    style: 'default',
		    animationType: 'fade',
		    title: title?title:'努力加载中...',
		    text: text?text:'',
		    modal: true
		});
		}
		var toast=function(msg){api.toast({
			    msg: msg?msg:'网络错误',
			    duration: 2000,
			    location: 'middle'});}
		//下拉选择
		var actionSheet=function(title,button,callback,$this){
		var title=title?title:'';
		var button=button?button:[];
		var $this=$this?$this:null;
		api.actionSheet({
		    title:title,
		    cancelTitle: '取消',
		    buttons: button,
		    style:{
		    titleFontColor:'#000'
		    }
		},function( ret, err ){
		    if(ret.buttonIndex){
		    	callback.call($this,ret.buttonIndex-1,button);
		    }
		});
		}
	//图片获取
var imgUpload=function(type){
		if(type>1)return;
		var type=type;
		var $this=this;
	  api.getPicture({
    sourceType:type==1?'camera':'library',
    encodingType:'png',
    mediaValue: 'pic',
    allowEdit: true,
    quality: 70,
    targetWidth: $('sfzphoto').width(),
    targetHeight: $('sfzphoto').height(),
    saveToPhotoAlbum: false
}, function( ret, err ){ 
    if( ret ){
      callback(ret.data);
    }
    if(err){
    toast('获取图片失败');
    }
});
//图片回调函数
var callback=function(path){
		if(!path){
		toast('获取图片失败');
		return
		}
		progress('正在上传中','图片正在上传');
		var path=path;
        var method = "post";
        var classInfo = {
              className:window.Class,
            fields: [{name:'photo', value: path,type: "file"}]}
        ajaxToAPICloud(window.appId,window.appKey, method, classInfo,function(ret,err){
        api.hideProgress();
        if(ret){
       		 toast('上传成功');
        	var image_url=ret.body.photo.url;
        	var img=new Image();
        	img.src=image_url;
        	$this.children().remove();
        	$this.append($(img));
        	}
        if(err){
        	toast('上传失败');
        	}})
    }
};
//图片结束
//图片选择
$('.head').click(function(){
var $this=$(this);
actionSheet('请选择图片来源',['图片库','相机获取'],imgUpload,$this);
});
		var toast=function(msg){api.toast({
			    msg: msg?msg:'网络错误',
			    duration: 2000,
			    location: 'middle'
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
        if($(this).hasClass('disable')){login(); return;}
        	prompt('退出登录','是否退出登录',function(){
        	});
        })
	};