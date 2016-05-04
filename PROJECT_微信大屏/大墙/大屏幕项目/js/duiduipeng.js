/**
 * Created by Administrator on 2016/3/2.
 */
(function(){
    $.fn.extend({
        "duiduipeng": function (obj) {
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
            //对象，性别,1男2女，图像区域1男2女,图片容器，总数，全部清楚按钮,定时器数组
            var obj=obj;
            var sex1=obj.sex1;
            var sex2=obj.sex2;
            var pice1=obj.pice1;
            var pice2=obj.pice2;
            var place=obj.place;
            var anew=obj.anew;
            var $this=this;
            var place=obj.place;
            var data=sex1.concat(sex2);
            var count=obj.count;
            var txt1=obj.txt1;
            var txt2=obj.txt2;
            var text1=obj.text1;
            var text2=obj.text2;
            var ranking=obj.ranking;
            var count=obj.count;
            obj.this_=this;
            obj.time=[];
            obj.rank=0;
            $this.addClass('disable').addClass('loading');
            anew.addClass('loading');
            pice1.addClass('loading');
            pice2.addClass('loading');
            (function loading(data,i,callback,$this,obj){
                var data=data;
                var i=i;
                var callback=callback;
                var img=new Image();
                var $this=$this;
                var obj=obj;
                if(i==data.length){
                    callback.call($this,obj);
                    return;
                }
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
                var obj=obj;
                var $this=this;
                var count=obj.count;
                var sex1=obj.sex1;
                var sex2=obj.sex2;
                count.text(sex1.length+sex2.length);
                $this.removeClass('loading').removeClass('disable').addClass('start').text('开始抽奖');
                obj.pice1.removeClass('loading');
                obj.pice2.removeClass('loading');
                obj.anew.removeClass('loading');
                $this.click(function(){
                    var $this=$(this);
                    test_out.call($this,obj)
                });
                obj.anew.click(function(){delete_all.call($this,obj);});
            },$this,obj);
            //删除全部
            function delete_all(obj){
                    var place=obj.place;
                    var place_img=place.find('img');
                    var len=place_img.length;
                    var sex1=obj.sex1;
                    var sex2=obj.sex2;
                    var pice1=obj.pice1;
                    var pice2=obj.pice2;
                    var txt1=obj.txt1;
                    var txt2=obj.txt2;
                if(len==0)return;
               this.removeClass('single');
                    for(var i=0;i<len;i++){
                        var img=place_img.eq(i);
                        var sex=img.data('sex').sex;
                        if(img.data('sex')=='sex1'){
                            sex1.push(img.attr('src'));
                            txt1.push(img.parent().attr('title'));
                        }else{
                            sex2.push(img.attr('src'));
                            txt2.push(img.parent().attr('title'));
                        }
                        img.eq(i).removeData('sex');
                    }
                ranking.text(0);
                pice1.attr('src','');
                pice2.attr('src','');
                obj.rank=0;
                obj.count.text(sex1.length+sex2.length);
                    place.html('');
                    return;
            }
            //删除一组的
            function delete_group(obj){
                var obj=obj;
                var pice1=obj.pice1;
                var pice2=obj.pice2;
                var sex1=obj.sex1;
                var sex2=obj.sex2;
                var ranking=obj.ranking;
                if(obj.this_.hasClass('single')){
                    alert('不能在删除');
                    return;
                }
                    var $this=this;
                    var $this_img=$this.parent().find('img');
                    var len=$this_img.length;
                    for(var i=0;i<len;i++){
                        var img=$this_img.eq(i);
                        if(img.data('sex')=='sex1'){
                            sex1.push(img.attr('src'));
                            txt1.push(img.parent().attr('title'));
                        }else{
                            sex2.push(img.attr('src'));
                            txt2.push(img.parent().attr('title'));
                        }
                        img.removeData('sex');
                    }
                obj.rank=obj.rank-1;
                ranking.text(ranking.text()-1);
                obj.count.text(sex1.length+sex2.length);
                $this.parent().remove();
                pice1.attr('src','');
                pice2.attr('src','');
                return;
            }
            //删除单个的
            function delete_sex(obj){
                var obj=obj;
                var this_=obj.this_;
                var $this=this;
                var pice1=obj.pice1;
                var pice2=obj.pice2;
                var sex1=obj.sex1;
                var sex2=obj.sex2;
                var sex=this.data('sex');
               if(this_.hasClass('single')){
                   alert('不能在删除');
                   return;
               }
                if(sex1.length==0||sex2.length==0){
                    alert('不能单独删除,数量不够')
                    return
                }
                this_.addClass('single');
                $this.addClass('single');
                if(sex.sex=='sex1'){
                    pice2.attr('src',$this.parent().siblings('.sex2').find('img').attr('src'));
                    pice1.attr('src',' ');
                    txt1.push($this.parent().attr('title'));
                    sex1.push(sex.url);
                }else{
                    pice1.attr('src',$this.parent().siblings('.sex1').find('img').attr('src'));
                    pice2.attr('src',' ');
                    txt2.push($this.parent().attr('title'));
                    sex2.push(sex.url);
                }
                obj.count.text(sex1.length+sex2.length);
                this_.data('sex',sex);
                $this.parent().find('img').attr('src','').addClass('hide').removeData('sex');
                this.removeData('sex');
            }
            function test_out(obj){
               var $this=this;
               var obj=obj;
               var pice1 =obj.pice1;
               var  pice2=obj.pice2;
               var sex1 = obj.sex1;
               var sex2 =obj.sex2;
                var place =obj.place;
                var serial;
                var element =!$this.data('sex')?[pice1, pice2]:$this.data('sex').sex=='sex1'?[pice1]:[pice2];
                var data = !$this.data('sex')?[sex1,sex2]:$this.data('sex').sex=='sex1'?[sex1]:[sex2];
                var len = data.length;
                var sex=[];
                var src=[];
                var txt1=obj.txt1;
                var txt2=obj.txt2;
                var txt=!$this.data('sex')?[txt1, txt2]:$this.data('sex').sex=='sex1'?[txt1]:[txt2];
                var text1=obj.text1;
                var text2=obj.text2;
                var text=!$this.data('sex')?[text1,text2]:$this.data('sex').sex=='sex1'?[text1]:[text2];
                var time =obj.time;
                var TXT=[];
                var count=obj.count;
                var ranking=obj.ranking;
                    if ($this.hasClass('start')) {
                        if($this.hasClass('single')){
                            len=1;
                        }
                        if(sex1.length==0||sex2.length==0){
                            alert('人数不足');
                            return;
                        }
                        for (var i = 0; i < len; i++) {
                            //数据，定时，
                            (function (data, time, element, index,txt,text) {
                                var data = data;
                                var i = 0;
                                var element = element;
                                var len = data.length;
                                var time = time;
                                var txt=txt;
                                var text=text;
                                time[index] = setInterval(function () {
                                    if (i == data.length) {
                                        i = 0;
                                    }
                                    text.text(txt[i]);
                                    element.attr('src', data[i]);
                                    i++;
                                }, 50)
                            })(data[i],time,element[i], i,txt[i],text[i])
                        }
                        $this.removeClass('start').text('停止');
                    } else if (!$this.hasClass('start')) {
                        $this.addClass('start').text('开始');
                        if($this.hasClass('single')){
                            len=1;
                            $this.removeClass('single');
                            place=place.find('.single').eq(0).parent();
                            $this.removeData('sex');
                        }else{
                            ranking.text(++obj.rank);
                        }
                        for (var i = 0; i < len; i++) {
                            clearInterval(time[i]);
                            TXT.push(text[i].text());
                            txt[i].remove(TXT[i]);
                           src.push(element[i].attr('src'));
                            data[i].remove(src[i]);
                            sex.push(element[i]==pice1?'sex1':'sex2');
                        }
                        add_element(obj,place,src,sex,TXT);
                        count.text(sex1.length+sex2.length);
                    }

            }
            function add_element(obj,parent,src,sex,TXT){
                var parent=parent;
                var src=src;
                var sex=sex;
                var len=src.length;
                var obj=obj;
                var TXT=TXT;
                if(sex.length>1){
                         var number=place.find('li').length+1;
                        var li=$('<li></li>');
                        var close_group=$('<span class="group close"></span>');
                        close_group.click(function(){
                            delete_group.call($(this),obj);
                        });
                            li.append('<span>'+obj.rank+'</span>');
                                for(var i=0;i<len;i++){
                                var close=$('<b class="close">x</b>');
                                var outer=$('<span  title='+TXT[i]+'></span>');
                                var img=$('<img src="" />');
                                outer.addClass(sex[i]);
                                close.data('sex',{sex:sex[i],url:src[i]});
                                close.click(function(){
                                    delete_sex.call($(this),obj);
                                });
                                img.attr('src',src[i]);
                                img.data('sex',sex[i]);
                                 outer.append(close);
                                outer.append(img);
                                li.append(outer);
                            }
                             li.append(close_group);
                            parent.append(li);
                        }else{
                                parent.attr('title',TXT[0]);
                                parent.find('.single').removeClass('single').data('sex',{sex:sex[0],url:src[0]})
                                parent.find('img').attr('src',src[0]).data('sex',sex[0]).removeClass('hide');
                        }

            }
        }
    })
})(jQuery)