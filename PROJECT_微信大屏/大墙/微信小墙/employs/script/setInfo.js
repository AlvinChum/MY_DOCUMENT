apiready = function(){
		window.appId='A6904850308837';
		window.appKey='2C5BFDD9-3C32-4D8A-E0B8-4EA57C411A67';
		window.Class='photo';
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
		var close=function(){
		api.closeWin({name:api.winName });}
		$('.close').click(close);
		/*图片上传函数*/
var imgUpload=function(type){
		//图片获取
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
        	img.className='upSuccess';
        	$this.children().remove();
        	$this.append($(img));
        	}
        if(err){
        	toast('上传失败');
        	}})
    }
};
//图片选择
$('.sfzphoto').click(function(){
var $this=$(this);
actionSheet('请选择图片来源',['图片库','相机获取'],imgUpload,$this);
});
//下拉选择
$('.slidedown').click(function(){
	var $this=$(this);
	if($this.hasClass('rotate')){
	$this.removeClass('rotate');
	return;
	}
	$this.addClass('rotate');
	actionSheet('请选择车牌类型',[1,2,3,4,5],function(type,length){
		var $this=this;
		if(type==length){
		$this.removeClass('rotate');return;
		}
		$this.removeClass('rotate').parent().find('strong').addClass('cp').text(length[type])
	},$this)
})
	var name=document.getElementsByName('name')[0];
	var sfz=document.getElementsByName('sfz')[0];
	$('.btn').click(function(){
	if(name.value.length<1){
	oast('姓名不对');
	return;
	}
	if(!/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/.test(sfz.value)){
	toast('身份证输入不正确');
	return
	}
	if($('.cp').length!==1){
	toast('车牌类型没有选择');
	return
	}
	if($('.upSuccess').length!==3){
	toast('照片没有上传');
	return
	}
	api.openWin({
	    name: 'index',
	    url: '../index.html'
    });
	})
}