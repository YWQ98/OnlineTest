$(document).ready(function(){
	$("#message").click(function(){
		$(".adddz").css("display","block")
		$(".mask"). css('display', 'block');
		 $(".mask").css('height', document.body.clientHeight + 'px'); 
	})
	
	$("#bc1").click(function(){
		$(".adddz").css("display","none")
		 $('.mask').css('height', "0"); 
		 $(".mask"). css('display', 'none');
	})
	$('.dropdown-toggle').dropdown();
})



