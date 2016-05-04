/**
 * Created by Administrator on 2016/3/3.
 */
Array.prototype.indexOf=function(val){
    for(var i=0;i<this.length;i++){
        if(this[i]==val)
            return i
    }
    return -1;
}
Array.prototype.remove=function(val){
    var index=this.indexOf(val);
    if(index>-1){
        this.splice(index,1);
    }
}
//摇一揺
function start_YYY(data) {
    var data = data;
    var progressbar = $('.progressbar');
    var text=data.text;
    var len = progressbar.length;
    var id = data.id;
    var vote = data.vote;
    var ID=[];
    var Vote=[];
    var TXT=[];
    var img=data.img;
    // var height=parseInt(progressbar.css('height'));
    for(var i=0;i<len;i++){
        ID.push(progressbar.get(i).dataset.id);
    }
    for(var i=0;i<len;i++){
        var index=id.indexOf(ID[i]);
        if(index!=-1) {
            progressbar.get(i).dataset.top =index*79;
        }else{
            progressbar.get(i).dataset.top = i * 79;
            progressbar.get(i).dataset.id=id[i];
        }
    }

    for(var i=0;i<len;i++){
        var top=progressbar.get(i).dataset.top ;
        var number=id.indexOf(progressbar.get(i).dataset.id);
        progressbar.eq(i).find('li').eq(0).removeClass('one two three');
        progressbar.eq(i).find('li').eq(1).find('img').attr('src',img[number]);
        if(number==0||number==2||number==1){
            progressbar.eq(i).find('li').eq(0).addClass(number==0?'one':number==1?'two':'three');
        }{
            progressbar.eq(i).find('li').eq(0).text(number+1);
        }
        progressbar.eq(i).find('.text').text(text[number]);
        progressbar.eq(i).find('.pre').text(vote[number]);
        progressbar.eq(i).animate({top:top},1000).find('.bar').animate({width:vote * 5.58}, 1000).parent().find('.pre').text(1);
    }

}
