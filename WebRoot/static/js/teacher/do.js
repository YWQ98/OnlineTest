
$(document).ready(function(){
	$('#myTabs a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
$('#myTabs a[href="#profile"]').tab('show') // Select tab by name
$('#myTabs a:first').tab('show') // Select first tab
$('#myTabs a:last').tab('show') // Select last tab
$('#myTabs li:eq(2) a').tab('show') // Select third tab (0-indexed)
$('#someTab').tab('show')
$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
  e.target // newly activated tab
  e.relatedTarget // previous active tab
})
//隐藏不必要的组件
$(".mask").css("display","none")
$(".add_class_panle").css("display","none")
$(".add_itembank_panle").css("display","none")
//点击事件
//添加班级
$("#add_class_btn").click(function(){
	
	$(".mask").css("display","block");
	$(".mask").css("height","100%");
	$(".add_class_panle").css("display","block")
	
})
$("#class_add_cancle").click(function(){
	$(".add_class_panle").css("display","none")
	$(".mask").css("height","0");
	$(".mask").css("display","none");
	
})
//添加题库
$("#add_itembank_btn").click(function(){
	
	$(".mask").css("display","block");
	$(".mask").css("height","100%");
	$(".add_itembank_panle").css("display","block")
	
})
$("#itembank_add_cancle").click(function(){
	$(".add_itembank_panle").css("display","none")
	$(".mask").css("height","0");
	$(".mask").css("display","none");
	
})


})
