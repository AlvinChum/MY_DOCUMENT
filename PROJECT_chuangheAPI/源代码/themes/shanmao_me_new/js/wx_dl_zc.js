function genggai(){
	var s=document.getElementById('denglu');
        s.innerHTML='登录中..';
        s.style.background='#ccc'
}
function tijiao(){
	var s=document.getElementById('tijiao_zc');
        s.innerHTML='提交中..';
        s.style.background='#ccc'
}
function mima(){
	document.getElementById('zc_ming').value=document.getElementById('zc_an').value;
	document.getElementById('yangjing').style.display='none';document.getElementById('yangjing2').style.display='block'
}
function mima0(){
	document.getElementById('zc_an').value=document.getElementById('zc_ming').value;
	document.getElementById('yangjing2').style.display='none';document.getElementById('yangjing').style.display='block'
}
function mima_1(){
	document.getElementById('zc_ming2').value=document.getElementById('zc_an1').value;
	document.getElementById('yangjing3').style.display='none';document.getElementById('yangjing4').style.display='block'
}
function mima_2(){
	document.getElementById('zc_an1').value=document.getElementById('zc_ming2').value;
	document.getElementById('yangjing4').style.display='none';document.getElementById('yangjing3').style.display='block'
}



