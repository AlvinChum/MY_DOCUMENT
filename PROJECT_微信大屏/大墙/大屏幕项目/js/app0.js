/**
 * Created by Administrator on 2016/2/29.
 */
(function($) {
        $.fn.extend({
            //传进来参数方向，距离，时间
            "slide_liuyan":function( direction,distance,time){
                var obj=direction=='margin-top'?{marginTop:distance}:{marginLeft:distance};
                var direction=direction;
                var time=time;
                var parent=this;
                slide();
                function slide() {
                    $("li:first",parent).animate(obj,time,function(){
                       if( $(this).parent().children().size()>4){
                            $(this).remove();
                        }else{
                            $(this).css(direction,0).appendTo(parent);
                        }
                       setTimeout(slide,2000);
                    })
                }

            }
        })
    }
)(jQuery)