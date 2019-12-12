<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <base href="<%=basePath%>">
	<title>学生登录-注册- 找回密码</title>
<!-- metatags-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
	function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->
<!-- Custom-Style-Sheet -->
	<link href="${pageContext.request.contextPath }/static/LoginRegister/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${pageContext.request.contextPath }/static/LoginRegister/css/style.css" rel="stylesheet" type="text/css" media="all"/><!--style_sheet-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/LoginRegister/css/flexslider.css" type="text/css" media="screen" property="" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/LoginRegister/css/font-awesome.css"> <!-- Font-Awesome_Icons-CSS -->
<!--//Custom-Style-Sheet -->
<!--online_fonts-->	
	<link href="http://maxcdn.bootstrapcdn.com/css?family=Audiowide" rel="stylesheet">
	<link href="http://maxcdn.bootstrapcdn.com/css?family=Montserrat+Alternates" rel="stylesheet">
<!--//online_fonts-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/LoginRegister/js/jquery-2.1.4.min.js"></script>
	<script src="${pageContext.request.contextPath }/static/jquery/jquery-1.7.2.min.js"></script>
	<script src="${pageContext.request.contextPath }/static/jsencrypt-master/bin/jsencrypt.min.js"></script>
	 <script type="text/javascript">
		$(function(){
			
			
			
			$("#registerCheck").click(function(){
				var $rsNum=$("#rsNum").val();
				if($rsNum!="" && $rsNum!=null){
					
					var url = "${pageContext.request.contextPath }/student/ajaxCheckSNum";
					var args = {"sNum":$rsNum,"date":new Date()};
				
					$.post(url, args, function(data){
					if(data == "0"){
					
						var $emailcode=$("#emailcode").val();
						var url = "${pageContext.request.contextPath }/student/ajaxCheckEmailCode";
						var args = {"emailcode":$emailcode,"date":new Date()};
				
						$.post(url, args, function(data){
						if(data == "0"){
						
							var $rsName=$("#rsName").val();
							if($rsName!="" && $rsName!=null){
								
								var encrypt = new JSEncrypt();
								$publicKey=$("#publicKey").val();//公钥
								$encryption=$("#encryption1").val();//加密前密码
								if($encryption!="" && $encryption!=null){//加密前密码不为空
									encrypt.setPublicKey($publicKey);/* 'java生成的公钥' */
									var encrypted = encrypt.encrypt($encryption);/* '加密密码' */
									$("#encryption1").val(encrypted);//加密后的数据填到表单里
									$("#register").submit();//提交表单
								}else{
									alert("密码不能为空！！！");
								}
								
							}else{
								alert("姓名不能为空");
							}
							
						}else if(data == "1"){
							alert("验证码有误");
						}
						});

					}else if(data == "1"){
						alert("该学号已经存在");
					}
					});
					
					
				}else{
					alert("学号不能为空！！！");
				}
				
				
			});
			
			
			
			
			//忘记密码提交
			$("#fbsPwd").click(function(){
				var $rsNum=$("#fsNum").val();
				if($rsNum!="" && $rsNum!=null){
					
						var $emailcode=$("#femailcode").val();
						var url = "${pageContext.request.contextPath }/student/ajaxCheckEmailCode";
						var args = {"emailcode":$emailcode,"date":new Date()};
				
						$.post(url, args, function(data){
						if(data == "0"){
						
								
								var encrypt = new JSEncrypt();
								$publicKey=$("#publicKey").val();//公钥
								$encryption=$("#fsPwd").val();//加密前密码
								if($encryption!="" && $encryption!=null){//加密前密码不为空
									encrypt.setPublicKey($publicKey);/* 'java生成的公钥' */
									var encrypted = encrypt.encrypt($encryption);/* '加密密码' */
									$("#fsPwd").val(encrypted);//加密后的数据填到表单里
									/* var newUrl="${pageContext.request.contextPath }/student/forgetPassword?sNum="+$rsNum
									$("#forgetPassword").attr('action',newUrl) */
									$("#forgetPassword").submit();//提交表单
								}else{
									alert("密码不能为空！！！");
								}
							
						}else if(data == "1"){
							alert("验证码有误");
						}
						});

					
					
					
				}else{
					alert("学号不能为空！！！");
				}
				
				
			});
			
			
			
			//忘记密码发送验证码
			$("#fsendemail").click(function(){
				var $rsNum=$("#fsNum").val();
				if($rsNum!="" && $rsNum!=null){
					
					var url = "${pageContext.request.contextPath }/student/ajaxCheckSNum";
					var args = {"sNum":$rsNum,"date":new Date()};
				
					$.post(url, args, function(data){
					if(data == "0"){
					
						alert("该学号不存在");

					}else if(data == "1"){
						
						
						var url = "${pageContext.request.contextPath }/student/ajaxFSendEmail";
						var args = {"sNum":$rsNum,"date":new Date()};
					
						$.post(url, args, function(data){
						
						});
						
						
						alert("验证码发送成功");
						//2分钟后才可以再次获取验证码
						 var btn = $($("#fsendemail"));
		             	 var count = 120;
		             	 var resend = setInterval(function(){
		                 count--;
		                 if (count > 0){
		                     btn.val(count+"秒后可重新获取");
		                     $.cookie("captcha", count, {path: '/', expires: (1/86400)*count});
		                 }else {
		                     clearInterval(resend);
		                     btn.val("获取验证码").removeAttr('disabled style');
		                 }
		             	 }, 1000);
		             	 btn.attr('disabled',true).css('cursor','not-allowed');
					}
					});
				}else{
					alert("学号不能为空！！！");
				}
				
				
			});
			
			
			$("#check").click(function(){
				var encrypt = new JSEncrypt();
				$publicKey=$("#publicKey").val();//公钥
				$encryption=$("#encryption").val();//加密前密码
				if($encryption!="" && $encryption!=null){//加密前密码不为空
					encrypt.setPublicKey($publicKey);/* 'java生成的公钥' */
					var encrypted = encrypt.encrypt($encryption);/* '加密密码' */
					$("#encryption").val(encrypted);//加密后的数据填到表单里
					$("#login").submit();//提交表单
				}else{
					alert("密码不能为空！！！");
				}
			});
			$("#asmall0").click(function(){//返回登录界面获取秘钥
				location.href = "${pageContext.request.contextPath }/student/loginRegister"; 
				return false;
				
			});
			
			
			
			//发送验证码
			$("#sendemail").click(function(){
				var $sEmail=$("#emailAd").val();
				
				//alert($sEmail);
				var url = "${pageContext.request.contextPath }/student/ajaxSendEmail";
				var args = {"sEmail":$sEmail,"date":new Date()};
				
				$.post(url, args, function(data){
					if(data == "1"){
						alert("发送成功");
					}else if(data == "0"){
						alert("请输入正确邮箱");
					}
				});
				//2分钟后才可以再次获取验证码
				 var btn = $(this);
             	 var count = 120;
             	 var resend = setInterval(function(){
                 count--;
                 if (count > 0){
                     btn.val(count+"秒后可重新获取");
                     $.cookie("captcha", count, {path: '/', expires: (1/86400)*count});
                 }else {
                     clearInterval(resend);
                     btn.val("获取验证码").removeAttr('disabled style');
                 }
             	 }, 1000);
             	 btn.attr('disabled',true).css('cursor','not-allowed');
			});
			
			//以下为注册、登录、找回密码选择
			$("#asmall1").click(function(){
				$("#small-dialog1").css('display','block');
				$("#small-dialog2").css('display','none');
				$("#small-dialog3").css('display','none');
				return false;
				
			});
			$("#asmall2").click(function(){
				$("#small-dialog2").css('display','block');
				$("#small-dialog3").css('display','none');
				$("#small-dialog1").css('display','none');
				return false;
				
			});
			$("#asmall3").click(function(){
				$("#small-dialog3").css('display','block');
				$("#small-dialog2").css('display','none');
				$("#small-dialog1").css('display','none');
				return false;
				
			});
		});
	</script>
</head>
<body>
<div class="w3l-head">
	<!-- <h1>用户登录/注册</h1> -->
	<h1>学生登录-注册-找回密码</h1>
</div>
<div class="w3l-main">
<div class="w3l-left-side">
	
<div class="flexslider">
<!--sign in form -->
<div  id="small-dialog1" style="display: block;"><!-- class="mfp-hide" -->
	<div class="wthree-container">
		<div class="wthree-form bg">
			<div class="agileits-2">
				<h2>登&nbsp;&nbsp;&nbsp;录</h2>
			</div>
				<input id="publicKey" name="publicKey" type="hidden" value="${publicKey }"/>
			<form action="${pageContext.request.contextPath }/student/loginCheck" id="login" method="post">
				<div class="w3-user">
					<span><i class="fa fa-user-o" aria-hidden="true"></i></span>
					<input type="text" name="sNum" onkeyup="this.value=this.value.replace(/[^0-9.]+/,'');" placeholder="学号" required="">
				</div>
				<div class="clear"></div>
				<div class="w3-psw">
					<span><i class="fa fa-key" aria-hidden="true"></i></span>
					<input type="password" id="encryption" name="sPwd" placeholder="密码" required="">
				</div>
				<div class="clear"></div>
				<div class="signin">
					<input style="width: 85%;height: 8%;background: none;background-color: #2da4cd;" type="button" id="check" value="登录">
				</div>
				<div class="clear"></div><br/>
				<!-- <div class="w3l-check">
					<span><a href="#">返回首页</a></span>  
				</div>
				<div class="clear"></div> -->
			</form>
		</div>
	</div>
</div>
<div id="small-dialog2" style="display: none">
	<div class="wthree-container">
		<div class="wthree-form bg">	
			<div class="agileits-2">
				<h2>注&nbsp;&nbsp;&nbsp;册</h2>
			</div>
			<form id="register" action="${pageContext.request.contextPath }/student/register" method="post">
				<div >
					<input id="rsNum" onkeyup="this.value=this.value.replace(/[^0-9.]+/,'');" type="text" name="sNum" placeholder="学号" required="">
				</div>
				<div >
					<input id="rsName" type="text" name="sName" placeholder="姓名" required="">					
				</div>
				<div >
					<input id="encryption1" type="password" name="sPwd" placeholder="密码" required="">		
				</div><br/><br/><br/><br/>
				<div >
					<select name="sGender">
						<option value="男" selected="selected">男</option>
						<option value="女">女</option>
					</select>
				</div>
				<div >
					<input id="emailAd" type="email" name="sEmail" placeholder="邮箱" required="">					
				</div><div ><input id="sendemail" type="button" value="发送验证码"/></div>
				<div >
					<input id="emailcode" type="text"  placeholder="验证码" required="">
				</div>
				
				
				<div class="clear"></div>
				<div class="w3l-check">
					<span><a >i agree terms and conditions</a></span>  
					<input type="checkbox" class="checkbox" checked="checked" disabled="disabled">
				</div>
				<div class="clear"></div>
				<div class="signin">
					<input style="margin-right:14%; width: 85%;height: 8%;background: none;background-color: #2da4cd;" id="registerCheck" type="button" value="注册">
				</div>
				<div class="clear"></div>
			</form>
		</div>
	</div>
</div>
<div id="small-dialog3" style="display: none">
	<div class="wthree-container">
		<div class="wthree-form bg">	
			<div class="agileits-2">
				<h2>找回密码</h2>
			</div>
			<form id="forgetPassword" action="${pageContext.request.contextPath }/student/forgetPassword" method="post"><!-- "${pageContext.request.contextPath }/student/forgetPassword" -->
				<div >
					<input id="fsNum" type="text" name="sNum" placeholder="学号" required="">
				</div>
				<div class="clear"></div>
				<div ><input id="fsendemail" type="button" value="获取验证码"/></div>
				<div >
					<input  type="text" id="femailcode" placeholder="验证码" required="">
				</div>
				<div class="clear"></div>
				<div >
					<input id="fsPwd" type="password" name="sPwd" placeholder="新密码" required="">
				</div>
				<div class="clear"></div>
				<div class="signin">
					<input style="width: 85%;height: 8%;background: none;background-color: #2da4cd;" id="fbsPwd" type="button" value="找回密码">
				</div>
				<div class="clear"></div>
			</form>
		</div>
	</div>
</div>


</div>
</div>

<div class="w3l-rigt-side">
		<c:if test="${msg != null }">
		<div class="w3l-signup" style="background-color: white;">
			<font color="red">${msg }</font>
		</div>
			<div class="w3l-signup">
			<a id="asmall0">刷新</a>
			</div>
		</c:if>
		<div class="w3l-signup">
			<a id="asmall1">&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;</a>
		</div>
		<div class="w3l-signup">
			<a id="asmall3">&nbsp;找&nbsp;回&nbsp;密&nbsp;码&nbsp;</a>
		</div>
		<div class="w3l-signup">
			<a id="asmall2">&nbsp;注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册&nbsp;</a>
		</div>
		<div class="w3l-signup">
			<span><a href="#">返回首页</a></span>  
		</div>
		<div class="clear"></div>
</div>
<div class="clear"></div>
</div>

<footer>Copyright &copy; 2019.Company YWQ All rights reserved.</footer>

	
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

<!-- pop-up-box-js-file -->  
	<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
<!--//pop-up-box-js-file -->
<script>
	$(document).ready(function() {
	$('.w3_play_icon,.w3_play_icon1,.w3_play_icon2').magnificPopup({
		type: 'inline',
		fixedContentPos: false,
		fixedBgPos: true,
		overflowY: 'auto',
		closeBtnInside: true,
		preloader: false,
		midClick: true,
		removalDelay: 300,
		mainClass: 'my-mfp-zoom-in'
	});
																	
	});
</script>
<!-- flexSlider -->
	<script defer src="${pageContext.request.contextPath }/static/LoginRegister/js/jquery.flexslider.js"></script>
	<script type="text/javascript">
		$(window).load(function(){
		  $('.flexslider').flexslider({
			animation: "slide",
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
		});
	</script>
<!-- //flexSlider -->
</body>
</html>