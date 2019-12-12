<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
	<title>管理员登录</title>
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
	<script src="${pageContext.request.contextPath }/static/jsencrypt-master/bin/jsencrypt.min.js"></script>
	<script src="${pageContext.request.contextPath }/static/jquery/jquery-1.7.2.min.js"></script>
	 <script type="text/javascript">
		$(function(){
			
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
				location.href = "${pageContext.request.contextPath }/admin/loginRegister"; 
				return false;
				
			});
			
		});
	</script>
</head>
<body>
<div class="w3l-head">
	<!-- <h1>用户登录/注册</h1> -->
	<h1>管理员登录</h1>
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
			<form action="${pageContext.request.contextPath }/admin/loginCheck" id="login" method="post">
				<div class="w3-user">
					<span><i class="fa fa-user-o" aria-hidden="true"></i></span>
					<input type="text" name="aName" placeholder="Username" required="">
				</div>
				<div class="clear"></div>
				<div class="w3-psw">
					<span><i class="fa fa-key" aria-hidden="true"></i></span>
					<input type="password" id="encryption" name="aPwd" placeholder="Password" required="">
				</div>
				<div class="clear"></div>
				<div class="signin">
					<input type="button" id="check" value="登录">
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
<%-- <div id="small-dialog2" style="display: none">
	<div class="wthree-container">
		<div class="wthree-form bg">	
			<div class="agileits-2">
				<h2>注&nbsp;&nbsp;&nbsp;册</h2>
			</div>
			<form id="insertUser" action="${pageContext.request.contextPath }/user/insertUser" method="post">
				<div >
					<input id="ruserName" type="text" name="userName" placeholder="Username" required="">
				</div>
				<div >
					<input id="ruserPassword" type="password" name="userPassword" placeholder="Password" required="">
					
					<span style="color: white">${MD5.getMd5('123123')}</span>
					
				</div>
				<div class="clear"></div>
				<div >
				<font color="white">问题：</font>
					<select style="height: 6%" name="problem.problemId">
					<c:forEach items="${problem }" var="problem">
						<option value="${problem.getProblemId() }">${problem.getProblem() }</option>
					</c:forEach>
					</select>
				</div>
				<br/>
				<br/>
				<div class="clear"></div>
				<div >
					<input id="ruserAnswer" type="text" name="userAnswer" placeholder="Answer" required="">
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
				<div class="clear"></div><br/>
				<div class="w3l-check">
					<span><a href="#">返回首页</a></span>  
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
			<form id="forgetPassword" action="${pageContext.request.contextPath }/user/forgetPassword" method="post">
				<div >
					<input id="fuserName" type="text" name="userName" placeholder="Username" required="">
				</div>
				<div class="clear"></div>
				<div >
					<font color="white">问题：</font>
					<select style="height: 6%" name="problem.problemId">
					
						<option id="fproblem" value=""></option>
					
					</select><br/><br/>
				</div>
				<div >
					<input type="text" name="userAnswer" placeholder="Answer" required="">
				</div>
				<div class="clear"></div>
				<div >
					<input id="fuserPassword" type="password" name="userPassword" placeholder="Password" required="">
				</div>
				<div class="clear"></div>
				<div class="signin">
					<input style="width: 85%;height: 8%;background: none;background-color: #2da4cd;" id="fbutton" type="button" value="找回密码">
				</div>
				<div class="clear"></div><br/>
				<div class="w3l-check">
					<span><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;返回首页</a></span>  
				</div>
				<div class="clear"></div>
			</form>
		</div>
	</div>
</div> --%>


</div>
</div>

<div class="w3l-rigt-side">
		<div class="w3l-signup">
			<span><a href="#">返回首页</a></span>  
		</div>
		<c:if test="${msg != null }">
		<div class="w3l-signup" style="background-color: white;">
			<font color="red">${msg }</font>
		</div>
			<div class="w3l-signup">
			<a id="asmall0">刷新</a>
			</div>
		</c:if>
		<!-- <div class="w3l-signup">
			<a id="asmall1">&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;</a>
		</div> -->
		<!-- <div class="w3l-signup">
			<a id="asmall2">&nbsp;注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册&nbsp;</a>
		</div>
		<div class="w3l-signup">
			<a id="asmall3">&nbsp;找&nbsp;回&nbsp;密&nbsp;码&nbsp;</a>
		</div> -->
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