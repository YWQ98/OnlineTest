

var ttl=parseInt(120)//倒计时总分钟数量
var intDiff =ttl*60;
function timer(intDiff){
    window.setInterval(function(){
    /*var day=0,
        hour=0,
        minute=0,
        second=0;//时间默认值        
    if(intDiff > 0){
        day = Math.floor(intDiff / (60 * 60 * 24));
        hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
        minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
        second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
    }
    if (minute <= 9) minute = '0' + minute;
    if (second <= 9) second = '0' + second;*/
    $('#hour_show').html(""+new Date().getFullYear()+"-"+(new Date().getMonth()+1)+"-"+new Date().getDate()+"&nbsp;&nbsp;&nbsp;"+new Date().getHours()+":"+new Date().getMinutes()+":"+new Date().getSeconds()+"");
    /*$('#day_show').html(day+"天");
    $('#hour_show').html('<s id="h"></s>'+hour+'时');
    $('#minute_show').html('<s></s>'+minute+'分');
    $('#second_show').html('<s></s>'+second+'秒');
    intDiff--;*/
    }, 1000);
} 
$(function(){
    timer(intDiff);
}); 