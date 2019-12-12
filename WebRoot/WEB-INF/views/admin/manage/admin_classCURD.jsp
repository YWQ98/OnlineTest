<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title>班级查删</title>
		<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/admin/public.css" />
		<script src="${pageContext.request.contextPath }/static/js/admin/do.js" type="text/javascript" charset="utf-8"></script>
	</head>

	<body>
		
		<div id="admin_main_panle">
			<!--
            	作者：offline
            	时间：2019-10-12
            	描述：顶部栏
            -->
			<div class="row" id="admin_top_main_panle">
				<div class="col-md-6" id="admin_top_logo">
					<a href="${pageContext.request.contextPath }"><img src="${pageContext.request.contextPath }/static/img/index/logo_min.png" /></a>
				</div>
				<div class="col-md-6" id="admin_top_bar">
					<div class="dropdown">
						<h4 class="dropdown-toggle" type="button" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    						欢迎你:${sessionScope.admin.getaName() }
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
            	时间：2019-10-21
            	描述：顶部导航栏
            -->
			<div class="admin_tool">

				<div id="tool">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation">
							<a href="${pageContext.request.contextPath }/admin/manage/admin_addUser">用户导入</a>
						</li>
						<li role="presentation">
							<a href="${pageContext.request.contextPath }/admin/manage/userCURD">用户查删</a>
						</li>		
						<li role="presentation">
							<a href="${pageContext.request.contextPath }/admin/manage/admin_itembankCURD">题库查删</a>
						</li>
						<li role="presentation">
							<a href="${pageContext.request.contextPath }/admin/manage/admin_subjectCURD">新增科目</a>
						</li>
						
						<li role="presentation" class="active">
							<a href="#" aria-controls="at_c_update" role="tab" data-toggle="tab">班级查删</a>
						</li>
					</ul>
					
					<div role="tabpanel" class="tab-pane" id="at_c_update">
							<div id="c_update">
								<div id="c_search">
								<form class="navbar-form navbar-left" role="search">
									<div class="form-group">
										<input type="radio" name="search_type" id="search_type" value="0" />通过班级名
										<input type="radio" name="search_type" id="search_type" value="1" />通过班级号
										<input type="radio" name="search_type" id="search_type" value="2" />通过教师名
										<input type="text" class="form-control" id="exampleInput" placeholder="班级号/班级名" style="width: 300px;">
									</div>
									<button type="submit" class="btn btn-default">搜索</button><br />
									<span id="sp">
										查无此班级
									</span>
								</form>

							</div><br /><br />
								<div id="search_panle">
								<div id="search_data">
									<table class="table table-hover">
 										<tr>
 											<td>班级号</td>
 											<td>班级名</td>
 											<td>班任教师</td>
 											<td>人数</td>
 											<td>操作</td>
 										</tr>
 										<tr>
 											<td>1111111111</td>
 											<td>17软工高数I班</td>
 											<td>XXX</td>
 											<td>44</td>
 											<td><a href="">冻结</a>/<a href="">恢复</a></td>
 										</tr>
									</table>
								</div>
								<nav aria-label="Page navigation">
								
									<ul class="pagination">
										<li>
											<a href="#" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
										<li>
											<a href="#">1</a>
										</li>
										<li>
											<a href="#">2</a>
										</li>
										<li>
											<a href="#">3</a>
										</li>
										<li>
											<a href="#">4</a>
										</li>
										<li>
											<a href="#">5</a>
										</li>
										<li>
											<a href="#" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									</ul>
								</nav>
							</div>
							</div>
						</div>
					</div>
			</div>
	</body>
</html>
