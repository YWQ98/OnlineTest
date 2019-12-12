<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>管理员登录</title>

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
					
						<a class="btn btn-link-1 launch-modal" href="#" data-modal-id="admin-login">管理员登录</a>
					
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>



<!--
	作者：offline
	时间：2019-11-11
	描述：管理员登录
-->
<div class="modal fade" id="admin-login" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="modal-register-label">管理员登录</h3>
				<p></p>
			</div>
			
			<div class="modal-body">
				<input id="publicKey" name="publicKey" type="hidden" value="${publicKey }"/>
				<form role="form" id="login" action="${pageContext.request.contextPath }/admin/loginCheck" method="post" class="registration-form">
					<div class="form-group">
						<label class="sr-only" for="tid_l">账号</label>
						<input type="text"   name="aName"  placeholder="账号" class="form-first-name form-control" required="required">
					</div>
					<div class="form-group">
						<label class="sr-only" for="tpass_l">密码</label>
						<input type="password" placeholder="密码" class="form-last-name form-control" id="encryption" name="aPwd"  required="required">
					</div>
					
					
					<button type="button" id="check" class="btn">登录</button>
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