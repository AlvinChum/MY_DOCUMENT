$(function(){
  
  $(".yhelpt").click(function(){
	  $(".help_box").show();
  });
  
  $(".yhelpc").click(function(){
	  $(".help_box").hide();
  });
  
});

function AutoScroll(obj) {

	$(obj).find("ul:first").animate({
	marginTop: "-2.2em"
	}, 1000, function() {
	$(this).css({ marginTop: "0px" }).find("li:first").appendTo(this);
	});

}

$(document).ready(function() {

	setInterval('AutoScroll("#igg")', 2000)

});