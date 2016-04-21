$(function(){
    
        $(".c").click(function(){
     
        $("#menber").find("iframe").attr("src","core/4.php");
        $("#a").hide();
        $("#menber").show();
    });
    
        $(".a").click(function(){
      
        $("#menber").find("iframe").attr("src","core/mingxi.php");
        $("#a").hide();
        $("#menber").show();
    });
    
    
    $("#out").click(function(){
        $.get("out.php",function(a,b){
         if(a=='outok'){
            location.href='login.php';
         }
        });
        
    });
    $("#main .left,#main .right").click(function(){
        var href = $(this).attr("id");
        $("#menber").find("iframe").attr("src",href);
        $("#a").hide();
        $("#menber").show();
    });
    
    $("#close").click(function(){
        $("#menber").hide();
        $("#a").show();
        $("#menber").find("iframe").removeAttr("src");
    });
$("#qiandao").click(function(){
    $.post("core/5-qiandao.php",function(a,b){
    if(a=="1"){
    $("#alert").text('签到成功,奖励已到账!');
    $("#alert").fadeToggle(500);
    $("#alert").fadeToggle(1500);
    setTimeout(function(){
    location.href='menber.php';
    },2000);
    }else{
    $("#alert").text('今日已签到,请明日再来哦~');
    $("#alert").fadeToggle(500);
    $("#alert").fadeToggle(1500);
    }
    });

    //$("#alert").animate({marginTop:'120px'},800);
    //$("#alert").fadeOut(1500);
    
});

$("#shoucang").click(function(){
   $("#weixinshoucang").show();
   $("#weixinshoucang").fadeToggle(5000);
});
 
});