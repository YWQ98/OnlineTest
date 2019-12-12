<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>教师登录界面</title>

<!-- CSS -->
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/form-elements.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/style.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- Favicon and touch icons -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/static/assets/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath }/static/assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath }/static/assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath }/static/assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/static/assets/ico/apple-touch-icon-57-precomposed.png">


	<script src="${pageContext.request.contextPath }/static/jquery/jquery-1.7.2.min.js"></script>
	<script src="${pageContext.request.contextPath }/static/jsencrypt-master/bin/jsencrypt.min.js"></script>
	 <script type="text/javascript">
		$(function(){
			
			
			
			$("#registerCheck").click(function(){
				var $rsNum=$("#rsNum").val();
				if($rsNum!="" && $rsNum!=null){
					
					var url = "${pageContext.request.contextPath }/teacher/ajaxCheckTNum";
					var args = {"tNum":$rsNum,"date":new Date()};
				
					$.post(url, args, function(data){
					if(data == "0"){
					
						var $emailcode=$("#emailcode").val();
						var url = "${pageContext.request.contextPath }/teacher/ajaxCheckEmailCode";
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
						alert("该工号已经存在");
					}
					});
					
					
				}else{
					alert("工号不能为空！！！");
				}
				
				
			});
			
			
			
			
			//忘记密码提交
			$("#fbsPwd").click(function(){
				var $rsNum=$("#fsNum").val();
				if($rsNum!="" && $rsNum!=null){
					
						var $emailcode=$("#femailcode").val();
						var url = "${pageContext.request.contextPath }/teacher/ajaxCheckEmailCode";
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
					alert("工号不能为空！！！");
				}
				
				
			});
			
			
			
			//忘记密码发送验证码
			$("#fsendemail").click(function(){
				var $rsNum=$("#fsNum").val();
				if($rsNum!="" && $rsNum!=null){
					
					var url = "${pageContext.request.contextPath }/teacher/ajaxCheckTNum";
					var args = {"tNum":$rsNum,"date":new Date()};
				
					$.post(url, args, function(data){
					if(data == "0"){
					
						alert("该工号不存在");

					}else if(data == "1"){
						
						
						var url = "${pageContext.request.contextPath }/teacher/ajaxFSendEmail";
						var args = {"tNum":$rsNum,"date":new Date()};
					
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
					alert("工号不能为空！！！");
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
				location.href = "${pageContext.request.contextPath }/teacher/loginRegister"; 
				return false;
				
			});
			
			
			
			//发送验证码
			$("#sendemail").click(function(){
				var $sEmail=$("#emailAd").val();
				
				//alert($sEmail);
				var url = "${pageContext.request.contextPath }/teacher/ajaxSendEmail";
				var args = {"tEmail":$sEmail,"date":new Date()};
				
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
			
			/* //以下为注册、登录、找回密码选择
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
				
			}); */
		});
	</script>


</head>

<body>

<!-- Content -->
<div class="top-content">
	
	<div class="inner-bg">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2 text">
					<!-- class="logo" --><h3><strong><a  href="${pageContext.request.contextPath }">返回首页</a></strong></h3>
					<h1><strong>磨刀石</strong> 在线考试系统</h1>
					<div class="description">
						<p>
							考试从注册登录开始 
						</p>
						<a id="asmall0"><b><font color="red">${msg }</font></b></a>
					</div>
					<div class="top-big-link">
						<a class="btn btn-link-1 launch-modal" href="#" data-modal-id="student-login">教师登录</a>
						<a class="btn btn-link-1 launch-modal" href="#" data-modal-id="student-register">教师注册</a>
						<a class="btn btn-link-1 launch-modal" href="#" data-modal-id="student-forget-pass">教师找回密码</a>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>

<!-- MODAL 
	学生登录
-->
<div class="modal fade" id="student-login" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="modal-register-label">教师登录</h3>
				<p></p>
			</div>
			
			<div class="modal-body">
				<input id="publicKey" name="publicKey" type="hidden" value="${publicKey }"/>
			
				<form role="form" id="login" action="${pageContext.request.contextPath }/teacher/loginCheck" method="post" class="registration-form">
					<div class="form-group">
						<label class="sr-only" for="sid_l">工号</label>
						<input type="text" name="tNum" onkeyup="this.value=this.value.replace(/[^0-9.]+/,'');" placeholder="工号" class="form-first-name form-control" required="required">
					</div>
					<div class="form-group">
						<label class="sr-only" for="spass_l">密码</label>
						<input type="password"  id="encryption" name="tPwd" required="required" placeholder="密码" class="form-last-name form-control" >
					</div>
					
					
					<button type="button" id="check" class="btn">登录</button>
				</form>
				
			</div>
			
		</div>
	</div>
</div>

<!--
	作者：offline
	时间：2019-11-11
	描述：学生注册
-->
<div class="modal fade" id="student-register" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="modal-register-label">教师注册</h3>
				<p></p>
			</div>
			
			<div class="modal-body">
				
				<form role="form"  id="register" action="${pageContext.request.contextPath }/teacher/register" method="post" class="registration-form">
					
					<div class="form-group">
						<label class="sr-only" for="sid_r">工号</label>
						<input id="rsNum" onkeyup="this.value=this.value.replace(/[^0-9.]+/,'');" type="text" name="tNum" placeholder="工号" required="" class="form-last-name form-control" >
					</div>
					<div class="form-group">
						<label class="sr-only" for="sname_r">姓名</label>
						<input id="rsName" type="text" name="tName" placeholder="姓名" required="" class="form-first-name form-control">
					</div>
					<div class="form-group">
						&nbsp;&emsp;<label  for="form-first-name">性别</label>&nbsp;&emsp;
						 <input type="radio" name="tGender" checked="checked" id="ssex_r" value="男" >男
						 &nbsp;&emsp;
						  <input type="radio" name="tGender" id="ssex_r" value="女">女
					</div>
					<div class="form-group">
						<label class="sr-only" for="spass_r1">密码</label>
						<input id="encryption1" type="password" name="tPwd" placeholder="密码" required="" class="form-last-name form-control">
					</div>
					<!-- <div class="form-group">
						<label class="sr-only" for="spass_r2">确认密码</label>
						<input type="password" name="spass_r2" placeholder="确认密码" class="form-last-name form-control" id="spass_r2">
					</div> -->
					<div class="form-group">
						<label class="sr-only" for="form-email">Email</label>
						<input id="emailAd" type="email" name="tEmail" placeholder="邮箱" required="" class="form-email form-control">
					</div>
					<div class="form-group">
						<label class="sr-only" for="scode_r">验证码</label>
						<input  id="emailcode" type="text" required="" name="scode_r" placeholder="验证码" class="form-control"><br />
						<button type="button" id="sendemail" class="btn" style="width: 200px; margin-left: 180px ;">获取验证码</button>
					</div>
					<!-- <div class="form-group">
						<label class="sr-only" for="form-about-yourself">自我介绍</label>
						<textarea name="form-about-yourself" placeholder="自我介绍" 
									class="form-about-yourself form-control" id="form-about-yourself"></textarea>
					</div> -->
					<button id="registerCheck" type="button" class="btn">注册</button>
				</form>
				
			</div>
			
		</div>
	</div>
</div>

<!--
	作者：offline
	时间：2019-11-11
	描述：学生找回密码
-->
<div class="modal fade" id="student-forget-pass" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="modal-register-label">教师找回密码</h3>
				<p></p>
			</div>
			
			<div class="modal-body">
				
				<form role="form"  id="forgetPassword" action="${pageContext.request.contextPath }/teacher/forgetPassword" method="post" class="registration-form">
					
					<div class="form-group">
						<label class="sr-only" for="sid_r">工号</label>
						<input  id="fsNum" type="text" name="tNum" placeholder="工号" class="form-last-name form-control">
					</div>
					
					<div class="form-group">
						<label class="sr-only" for="scode_r">验证码</label>
						<input type="text" id="femailcode" name="fEmailCode" placeholder="验证码" class="form-control" id="scode_r"><br />
						<button  id="fsendemail" type="button"  class="btn" style="width: 200px; margin-left: 180px ;">获取验证码</button>
					</div>
					
					<div class="form-group">
						<label class="sr-only" for="sid_r">工号</label>
						<input id="fsPwd" type="password" name="tPwd" placeholder="新密码" class="form-last-name form-control">
					</div>
					
					<button id="fbsPwd" type="button" class="btn">找回</button>
				</form>
				
			</div>
			
		</div>
	</div>
</div>

<!-- Javascript -->
<script src="${pageContext.request.contextPath }/static/assets/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath }/static/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/static/assets/js/jquery.backstretch.min.js"></script>
<script src="${pageContext.request.contextPath }/static/assets/js/scripts.js"></script>

<!--[if lt IE 10]>
	<script src="assets/js/placeholder.js"></script>
<![endif]-->

</body>
</html>