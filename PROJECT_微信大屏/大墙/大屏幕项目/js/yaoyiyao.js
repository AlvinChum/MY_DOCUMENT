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
YOY({id:[1,2,3,4],vote:[7,7,6,5]});
setTimeout(function() {
    YOY({
        id:[8, 2, 4,3], vote:[7, 7, 7, 7]
    })


},2000);


function YOY(data) {
    var data = data;
    var progressbar = $('.progressbar');
    var len = progressbar.length;
    var id = data.id;
    var vote = data.vote;
    var y = [];
    var ID=[];
    // var height=parseInt(progressbar.css('height'));
    for(var i=0;i<len;i++){
        ID.push(progressbar.get(i).dataset.id);
    }
    for(var i=0;i<len;i++){
        var index=ID.indexOf(id[i]);
        if(index!=-1) {
            progressbar.get(index).dataset.vote=vote[i];
            progressbar.get(index).dataset.top =i * 60;
            progressbar.get(i).dataset.vote=vote[index];
            progressbar.get(i).dataset.top=60*index;
            progressbar.get(i).dataset.id=id[i];
        }else{
            progressbar.get(i).dataset.vote=vote[i];
            progressbar.get(i).dataset.top = i * 60;
            progressbar.get(i).dataset.id=id[i];
        }
    }
    for(var i=0;i<len;i++){
        var vote= progressbar.get(i).dataset.vote;
        var top=progressbar.get(i).dataset.top ;
        progressbar.eq(i).animate({top:top},1000).find('.bar').animate({width:vote * 5.58}, 1000).parent().find('.label').animate({left: vote * 5.58}).find('.pre').text(vote);
    }
}
