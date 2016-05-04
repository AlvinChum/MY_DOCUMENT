/**
 * Created by Administrator on 2016/2/29.
 */
(function(){
    $.fn.extend({
        //数组图片,需要绑定事件的元素
        "choujian":function(obj){
            Array.prototype.indexOf = function (val) {
                for (var i = 0; i < this.length; i++) {
                    if (this[i] == val)
                        return i
                }
                return -1;
            }
            Array.prototype.remove = function (val) {
                var index = this.indexOf(val);
                if (index > -1) {
                    this.splice(index, 1);
                }
            }
            var obj=obj;
            var auto=obj.auto;//自动抽取人数
            var pice=obj.pice;//图片显示区域
            var place=obj.place;//容器
            var $this=this;//抽奖
            var anew=obj.anew;//重新
            var count=obj.count;//总数
            var data=obj.data;//图片数据// 定时器
            var txt=obj.txt;//数据文本
            var text=obj.text;//放置文本的区域;
            var auto=auto;
                obj.$this=$this;
                obj.time=[];
            $this.addClass('loading').addClass('disable');
            pice.addClass('loading');
            //图片预加载
            (function loading(data,i,callback,$this,obj){
                var data=data;
                var i=i;
                var callback=callback;
                var img=new Image();
                var $this=$this;
                var obj=obj;
                if(i==data.length){
                    callback.call($this,obj);return}
                var src=data.slice(i,i+1)[0];
                img.src=src;
                i++;
                if(img.complete){
                    arguments.callee(data,i,callback,$this,obj);
                }else{
                    img.onload=function(){
                        loading(data,i,callback,$this,obj);
                    }
                }
            })(data,0,function(obj){
                var $this=this;
                var obj=obj;
                var pice=obj.pice;
                var count=obj.count;
                var auto=obj.auto;
                var anew=obj.anew;
                var count=obj.count;
                $this.removeClass('loading').removeClass('disable').addClass('start').text('开始抽奖');
                pice.removeClass('loading');
                count.text(data.length);
                select_value();
               $this.click(function(){
                   test_out.call($(this),obj);
               });
                anew.click(function(){
                        delete_all.call($(this),obj);
                });
                auto.on('change',select_value);
                return;
            },$this,obj);
            //删除全部
            function delete_all(obj){
                var obj=obj;
                var count=obj.count;
                var place=obj.place;
                var  place_img=place.find('img');
                var  text=place.find('.text');
                var   len=place_img.length;
                var txt=obj.txt;
                    for(var i=0;i<len;i++){
                        data.push(place_img.eq(i).attr('src'));
                       txt.push(text.eq(i).text())
                    }
                    count.text(data.length);
                  obj.$this.removeClass('disable');
                    place.html('');
                    return;
            }
            //查询要抽几次
            function select_value(){
               var select=auto.get(0)
               var len=select.options.length;
                for(var i=0;i<len;i++){
                    if(select.options[i].selected){
                        return $this.data('loop',select.options[i].value);
                    }
                }
            }
            //自动循环抽奖
            function  auto_count(obj){
                var obj=obj;
                var $this=obj.$this;
                var loop=$this.data('loop')-1;
                var data=obj.data;
                var txt=obj.txt;
                var pice=obj.pice;
                var count=obj.count;
                var time=obj.time;
                if(data.length==0||txt.length==0){
                    alert('人数已经抽完');
                    this_.text('开始抽奖');
                    return;
                }
                (function auto_loop(data,txt,pice,count,loop,time,callback,$this){
                        var data=data;
                        var txt=txt;
                        var pice=pice;
                        var count=count;
                        var loop=loop;
                        var time=time;
                        var callback=callback;
                        var $this=$this;
                    if(loop==0||data.length==0||txt.length==0){
                        callback();
                        return;
                    }
                    if ($this.hasClass('start')) {
                        $this.removeClass('start');
                        $this.text('停止');
                        var i=0;
                            time[0] = setInterval(function () {
                                if (i == data.length) {
                                    i = 0;
                                }
                                text.text(txt[i]);
                                pice.attr('src', data[i]);
                                i++;
                            },100);
                            setTimeout(function () {
                                auto_loop(data,txt, pice, count, loop, time,callback,$this);
                            },2000);
                    }else{
                        loop--;
                        clearInterval(time[0]);
                        $this.addClass('start').text('开始');
                        var src= pice.attr('src');
                        var $txt=text.text();
                        add_element(place,src,$txt);
                        data.remove(src);
                        txt.remove($txt);
                        count.text(data.length);
                        if(data.length==0||txt.length==0){
                            callback();
                            return ;
                        }
                        setTimeout(function () {
                            auto_loop(data,txt,pice, count, loop, time,callback,$this);
                        },500);
                    }
                })(data,txt,pice,count,loop,time,function(){
                    $this.removeClass('disable');
                },$this);
            }
            //点击抽奖
            function test_out(obj){
                if(this.hasClass('disable')){
                    alert('在自动抽奖');
                    return;
                }
                var data=obj.data;
                var  pice=obj.pice;
                var txt=obj.txt;
                var count=obj.count;
                var place=obj.place;
                var $this=this;
                var text=obj.text;
                var time=obj.time;
                var place=obj.place;
                if($this.hasClass('disable')){
                    alert('正在自动抽奖中');
                    return ;
                }
                if(data.length==0||txt.length==0){
                    alert('人数不足');
                    return;
                }
                if ($this.hasClass('start')) {
                        $this.removeClass('start').text('停止');
                        if(data.length==1||txt.length==1){
                            $this.addClass('start').text('开始摇奖');
                            text.text(txt[0]);
                            pice.attr('src', data[0]);
                            return;
                        }
                        (function (data, time, element,text,txt) {
                            var data = data;
                            var i = 0;
                            var element = element;
                            var len = data.length;
                            var time = time;
                            var text=text;
                            var txt=txt;
                            time[0]= setInterval(function () {
                                if (i == data.length) {
                                    i = 0;
                                }
                                text.text(txt[i]);
                                element.attr('src', data[i]);
                                i++;
                            }, 50)
                        })(data,time,pice,text,txt);
                    }else{
                        $this.addClass('start').text('开始抽奖');
                        if(data.length==0||txt.length==0){
                            return ;
                        }
                        clearInterval(time[0]);
                            var src= pice.attr('src');
                             var $txt=text.text();
                             add_element(place,src,$txt);
                             data.remove(src);
                             txt.remove($txt);
                            count.text(data.length);
                        if($this.data('loop')>1){
                            $this.addClass('disable')
                            auto_count(obj);
                            return;
                        }
                    }
            }
            //添加图片
            function add_element(parent,src,txt){
                var parent=parent;
                var src=src;
                var txt=txt;
                var li=$('<li></li>');
                var close=$('<span class=close></span>')
                var outer=$('<div></div>')
                var img=$('<img />')
                var text=$('<span class="text">'+txt+'</span>')
                    img.attr('src',src);
                   outer.append(text);
                   outer.append(img);
                   outer.append(close);
                    li.append(outer);
                  parent.append(li);
            }
        }
    })
})(jQuery)
