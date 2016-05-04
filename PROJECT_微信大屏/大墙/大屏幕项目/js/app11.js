/**
 * Created by Administrator on 2016/3/8.
 */
(function ($)
    {
        $.fn.extend({
            'toupiao':function(){
                //初始加载投票
                var $this=this;
                (function initial_Vote(){
                    var arr=[25,25,25,25,25,25,25,0];
                    var Max=Math.max.apply(Math, arr);//票数中的最大值
                    var len=arr.length;
                    var arr2=[];
                    var chart_all=$this.find('.chart');
                    var chart_num_all=$this.find('.num');
                    var chart_num_height=chart_num_all.eq(0).height();
                    var chart_height=chart_all.eq(0).height();
                    var height=chart_height-chart_num_height;
                    var span_height=10;
                    //填充25个span
                    for(var i=0;i<len;i++){
                        var oFrag=$(document.createDocumentFragment());
                        for(var j=0;j<20;j++){
                            var span=document.createElement('span');
                            oFrag.append(span);
                        }
                        chart_all.eq(i).append(oFrag);
                    }
                    for(var i=0;i<len;i++){
                        arr2.push(Max>20?Math.round((arr[i]/Max)*20):Math.floor((arr[i])));
                        var chart_span=chart_all.eq(i).children('span');
                        var chart_num=chart_num_all.eq(i)
                        chart_num.find('span').text(arr[i]);
                        //函数参数span总数,票数,开始的初始位置,标题票的位置
                        (function callback(element,count,index,chart_num){
                            var element=element;
                            var count=count;
                            var chart_num=chart_num;
                            var index=index-1;
                            if(count==0)return;
                            chart_num.css('top',200-(-index*10));
                            element.eq(index).animate({'opacity':1},100,'swing',function(){
                                if(count==0)return;
                                count--;
                                callback(element,count,index,chart_num);
                            });
                        })(chart_span,arr2[i],0,chart_num);
                    }
                })();
                //链接投票机制
                function link_Vote(arr_now){
                    var arr_now=arr_now;
                    var Max1=Math.max.apply(Math,arr_now);//原来票数中的最大值
                    var chart=$('#con .chart');
                    var chart_num_all=$('#con .chart .num');
                    var len=chart_num_all.length;
                    var arr_old=[];
                    var now;
                    var old;
                    for(var i=0;i<len;i++){
                        var chart_num_span=chart_num_all.eq(i)
                        arr_old.push(chart_num_span.text());
                    }
                    var Max2=Math.max.apply(Math,arr_old)
                    for(var i=0;i<len;i++){
                        var now=Max1>25?Math.round((arr_now[i]/Max1)*25):Math.floor((arr_now[i]))
                        var old=Max2>25?Math.round((arr_old[i]/Max2)*25):Math.floor((arr_old[i]))
                        var chart_num=chart_num_all.eq(i)
                        var chart_span=chart.eq(i).children('span');
                        if(now==old){continue;}
                        (function callback(element,count,index,chart_num,judeg){
                            var element=element;
                            var count=count;
                            var chart_num=chart_num;
                            var judeg=judeg;
                            var index=judeg?-index-1:(-index)+1;
                            if(count==0)return;
                            chart_num.css({'top':250-Math.abs(index)*10});
                            element.eq(index).animate({'opacity':judeg?1:0},100,'swing',function(){
                                if(count==0)return;
                                callback(element,count,Math.abs(index),chart_num,judeg);
                            });
                            count--;
                        })(chart_span,Math.abs(now-old),now-old>0?old:old+1,chart_num,now-old>0?true:false);
                        chart_num_all.eq(i).find('span').text(arr_now[i]);
                        //传递参数,span,绝对值差,原来位置,看是增还是减
                    }
                }
            }
        })
    }
)(jQuery)

