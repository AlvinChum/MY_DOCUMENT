/**
 * Created by Administrator on 2016/3/14.
 */
    /*
    //旋转角度
    var angles;
    //可抽奖次数
    var clickNum = 5;
    //旋转次数
    var rotNum = 0;
    //中奖公告
    var notice = null;
    //转盘初始化
    var color = ["#626262","#787878","rgba(0,0,0,0.5)","#DCC722","white","#FF4350"];
    var info = ["谢谢参与","  1000","   10","  500","  100"," 4999","    1","   20"];
    var info1 = ['再接再厉','      元','     元','  淘金币','     元','  淘金币','     元','  淘金币']
    canvasRun();
    $('#tupBtn').bind('click',function(){
        if (clickNum >= 1) {
            //可抽奖次数减一
            clickNum = clickNum-1;
            //转盘旋转
            runCup();
            //转盘旋转过程“开始抽奖”按钮无法点击
            $('#tupBtn').attr("disabled", true);
            //旋转次数加一
            rotNum = rotNum + 1;
            //“开始抽奖”按钮无法点击恢复点击
            setTimeout(function(){
                alert(notice);
                $('#tupBtn').removeAttr("disabled", true);
            },6000);
        }
        else{
            alert("亲，抽奖次数已用光！");
        }
    });

    //转盘旋转
    function runCup(){
        probability();
        var degValue = 'rotate('+angles+'deg'+')';
        $('#myCanvas').css('-o-transform',degValue);           //Opera
        $('#myCanvas').css('-ms-transform',degValue);          //IE浏览器
        $('#myCanvas').css('-moz-transform',degValue);         //Firefox
        $('#myCanvas').css('-webkit-transform',degValue);      //Chrome和Safari
        $('#myCanvas').css('transform',degValue);
    }

    //各奖项对应的旋转角度及中奖公告内容
    function probability(){
        //获取随机数
        var num = parseInt(Math.random()*(7 - 0 + 0) + 0);
        //概率
        if ( num == 0 ) {
            angles = 2160 * rotNum + 1800;
            notice = info[0] + info1[0];
        }
        //概率
        else if ( num == 1 ) {
            angles = 2160 * rotNum + 1845;
            notice = info[7] + info1[7];
        }
        //概率
        else if ( num == 2 ) {
            angles = 2160 * rotNum + 1890;
            notice = info[6] + info1[6];
        }
        //概率
        else if ( num == 3 ) {
            angles = 2160 * rotNum + 1935;
            notice = info[5] + info1[5];
        }
        //概率
        else if ( num == 4 ) {
            angles = 2160 * rotNum + 1980;
            notice = info[4] + info1[4];
        }
        //概率
        else if ( num == 5 ) {
            angles = 2160 * rotNum + 2025;
            notice = info[3] + info1[3];
        }
        //概率
        else if ( num == 6 ) {
            angles = 2160 * rotNum + 2070;
            notice = info[2] + info1[2];
        }
        //概率
        else if ( num == 7 ) {
            angles = 2160 * rotNum + 2115;
            notice = info[1] + info1[1];
        }
    }
*/
    //绘制转盘
canvasRun({len:6,text:['一等奖','二等奖','三等奖','四等奖','五等奖','六等奖']})
function canvasRun(obj){
    var obj=obj;
    var btn=$('.btn').eq(0);
    var canvasOut=document.getElementById('out');
    var canvasInside=document.getElementById('inside');
    var len=obj.len?obj.len:5;
    var text=obj.text;
    var color=['#F94643','#FC5857'];
    var out=canvasOut.getContext('2d');
    var inside=canvasInside.getContext('2d');
    var startAngle=0;
    var endAngle=0;
    var reg=[];
    //外圆绘制
    for(var i=0;i<12;i++){
        out.save();
        out.beginPath();
        out.translate(250,250);
        out.rotate(i*(2*Math.PI/12));
        out.arc(162,162,10, 0,2*Math.PI,false);
        out.fillStyle='rgba(253,225,143,.8)';
        out.closePath();
        out.fill();
        out.restore();
    }
    //绘制内圆等分
    for(var i=0;i<len;i++){
       reg.push(i*(-360/len));
        startAngle=Math.PI*(i*2/len-1/len-0.5);
        endAngle=startAngle+Math.PI*(2/len);
        inside.save();
        inside.beginPath();
        inside.arc(210,210,210,startAngle,endAngle,false);
        inside.lineWidth=420;
        if(i%2==0||i==0){
            inside.strokeStyle=color[0];
        }else{
            inside.strokeStyle=color[1];
        }
        inside.stroke();
        inside.restore();
    }
        inside.textAlign='center';
        inside.textBaseline='middle';
        inside.fillStyle = color[3];
        var step = 2*Math.PI/len;
        for ( var i = 0; i < len; i++) {
            inside.save();
            inside.beginPath();
            inside.translate(210,210);
            inside.rotate(i*step);
            inside.font = '30px "微软雅黑", "华文细黑", Arial, Helvetica, sans-serif';
            inside.fillStyle ='#FDE18F';
            inside.fillText(text[i],0,-180,60);
            inside.font = " 14px Microsoft YaHei";
            inside.fillText(text[i],0,-95,60);
            inside.closePath();
            inside.restore();
        }
        inside.save();
        inside.beginPath();
        inside.arc(210,210,140,0,2*Math.PI,false);
        inside.strokeStyle='#FFEC58';
        inside.stroke();
        inside.restore();
        btn.click(function(){
            var $canvasInside=$(canvasInside);
            if($canvasInside.hasClass('start')){
               $canvasInside.removeClass('start');
            }else{
                var random=Math.round(Math.random()*5);
                $canvasInside.addClass('start');
               $canvasInside.css('transform','rotate('+reg[random]+'deg)');
            }
        })
}

