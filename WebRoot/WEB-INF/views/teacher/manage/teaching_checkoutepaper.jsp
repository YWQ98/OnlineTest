<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>

	<head>
		<meta charset="UTF-8">
		<title>试卷成绩</title>
		<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/teacher/public.css" />
		<script src="${pageContext.request.contextPath }/static/js/teacher/do.js" type="text/javascript" charset="utf-8"></script>
		<style>
	        table {
	            border-collapse: collapse;
	        }
	    </style>
	</head>
	<body>
	<div id="teach_main_panle">

		<!--
            	作者：offline
            	时间：2019-10-12
            	描述：顶部栏
            -->
		<div class="row" id="teach_top_main_panle">
			<div class="col-md-6" id="teach_top_logo">
				<a href="${pageContext.request.contextPath }"><img src="${pageContext.request.contextPath }/static/img/index/logo_min.png" /></a>
			</div>
			<div class="col-md-6" id="teach_top_bar">
				<div class="dropdown">
					<h4 class="dropdown-toggle" type="button" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    						欢迎你:${sessionScope.teacher.gettName() }
    						<span class="caret"></span>
  						</h4>
					<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu">
						<!-- <li>
							<a href="#">个人中心</a>
						</li> -->
						<li role="separator" class="divider"></li>
						<li>
							<a href="${pageContext.request.contextPath }/admin/logOut">退出</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--
            	作者：offline
            	时间：2019-11-14
            	描述：导航栏
            	
            -->
		<div id="tool">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" >
						<a href="${pageContext.request.contextPath }/teacher/manage/teaching_class">管理班级</a>
				</li>
				<li role="presentation">
						<a href="${pageContext.request.contextPath }/teacher/manage/teaching_itembank" >题库管理</a>
				</li>
				<li role="presentation">
						<a href="${pageContext.request.contextPath }/teacher/manage/teaching_paple">创建试卷</a>
				</li>
			
			</ul>
			<div class="tab-content">
			
			
				<table border="1" style="width: 300px">
				<caption>学生成绩表</caption>
				<tr>
				<td>学号</td>
				<td>姓名</td>
				<td>成绩</td>
				</tr>
				<c:forEach items="${finAllStuPaper.getContent() }" var="fasp">
				<tr>
				<td>${fasp.getStudent().getsNum() }</td>
				<td>${fasp.getStudent().getsName() }</td>
				<td>${fasp.getSpscore() }分</td>
				</tr>
				</c:forEach>
				</table>
				<a id="excel111">导出表格</a>
			</div>
		</div>

	</div>

 	<script>
        var html = "<html><head><meta charset='utf-8' /></head><body>" + document.getElementsByTagName("table")[0].outerHTML + "</body></html>";
        var blob = new Blob([html], { type: "application/vnd.ms-excel" });
        var a = document.getElementsByTagName("a")[5];
        a.href = URL.createObjectURL(blob);
        a.download = "学生成绩表.xls";
    </script>
	</body>
</html>