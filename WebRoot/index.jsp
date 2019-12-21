<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title></title>
		<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/index/public.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/static/js/doit.js" type="text/javascript" charset="utf-8"></script>
	</head>

	<body>
	<%-- <a href="${pageContext.request.contextPath }/admin/manage/userCURD">admin</a> --%>
		<div class="mask"></div>
		<div id="main_panle">
			<div id="top_bar">
				<img src="${pageContext.request.contextPath }/static/img/index/logo_min.png" />
				<div id="top_bar_button">
					<div class="dropdown">
						<h4 class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    						<font size="5" color="white" face="黑体">登录/注册</font>
    						<span class="caret"></span>
  						</h4>
						<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
							<li>
								<a href="${pageContext.request.contextPath }/student/loginRegister">学生</a>
							</li>
							<li role="separator" class="divider"></li>
							<li>
								<a href="${pageContext.request.contextPath }/teacher/loginRegister">教师</a>
							</li>
							<li role="separator" class="divider"></li>
							<li>
							<a href="${pageContext.request.contextPath }/admin/loginRegister">管理员</a>
							</li>
						</ul>
					</div>					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					
				</div>
			</div>
			
			
			
			<div class="adddz" style="display: none;">
				
				
				
				<div class="alert alert-warning" >
					
					<strong>注意！</strong><hr><br />您的网络连接有问题。<br />
					
				</div>
				<div class="bc" id="bc1">
					<button type="button" class="btn btn-default">知道啦</button>
				</div>
			</div>
			
			
			
			
			
		

			<div id="logo">
				<img src="${pageContext.request.contextPath }/static/img/index/logo.png" />
			</div>
			<div id="teacher">
				<p>
					<font color="white" size="6">666位教师共同建设</font>
				</p>
			</div>

			<div id="item">
				<p>
					<font color="white" size="6">777道高质量题目</font>
				</p>
			</div>

			<div id="user">
				<p>
					<font color="white" size="6">9999位注册用户</font>
				</p>
			</div>
			<!-- <div id="botton">
				<button type="button" class="btn btn-info" style="width: 150px;"><a href="problem_set.html"><font size="6">进入</font></a></button>
			</div> -->
		</div>

		<!-- <div id="message">
			<button type="button" class="btn btn-default">查看公告</button>
		</div> -->

		<footer class="btn" id="footer">
			<div id="footer_panle">
				<div id="footer1">
					<h4>版权归属</h4>
					<br/>
					<span>
					版权所有 &copy; 2019<br />
					厦门理工学院软件工程学院<br />
					测试用例
				</span>
				</div>
				<div id="footer2">
					<h4>常用站点</h4>
					<br/>
					<a href="www.csdn.net">CSDN</a><br />
					<a href="www.baidu.com">百度</a><br />
					<a href="www.pintia.cn">PTA</a>
					<br/>
				</div>

			</div>

		</footer>
	
	</body>

</html>