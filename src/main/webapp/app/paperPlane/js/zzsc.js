$().ready(function() {
$('.send').click(function() {
alert($("#jingContent").html());	
setTimeout(function() {
$('#plate').removeClass('front');
$('#container').removeClass('beginning');
$('.curvable').addClass('curved');
setTimeout(function() {
$('#container').addClass('hover');
setTimeout(function() {
$('#container').addClass('fly_away_first');
setTimeout(function() {
$('#container').addClass('fly_away');
setTimeout(function(){
alert("静的愿望,已经发送出来,一定会实现的...可以在许下下一个愿望");
$('#plate').addClass('front');
$('#container').removeClass('fly_away fly_away_first hover').addClass('beginning');
$('.curvable').removeClass('curved');
},3000);
}, 600);
}, 2000);
}, 2800);
}, 200);
});
});