/**
 * Created by Administrator on 2016/3/3.
 */
(function($) {
        $.fn.extend({
            //传进来参数方向，距离，时间
            "slide_ad":function( direction,distance,time){
                var obj=direction=='margin-top'?{marginTop:distance}:{marginLeft:distance};
                var direction=direction;
                var time=time;
                var parent=this;
                slide();
                var data=1;
                function slide() {
                    $("li:first",parent).animate(obj,time,function(){
                        $(this).css(direction,0).appendTo(parent);
                        setTimeout(slide,3000);
                    })
                }
            }
        })
    }
)(jQuery)