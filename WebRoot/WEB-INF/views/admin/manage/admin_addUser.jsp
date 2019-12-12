<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title>导入用户</title>
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
			<div class="admin_tool">
				<div id="tool">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active">
							<a href="#" aria-controls="at_import" role="tab" data-toggle="tab">用户导入</a>
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
						
						<li role="presentation">
							<a href="${pageContext.request.contextPath }/admin/manage/admin_classCURD">班级查删</a>
						</li>
					</ul>
					<!--
                    	作者：offline
                    	时间：2019-10-22
                    	描述：用户导入模块（此模块的id最好不可改，否则要联合改上面的）
                    -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="at_import">
							<div id="batch">
								<h2>从Excel批量导入可注册用户:</h2>
								<form>
									<div class="form-group">
										<label for="exampleInputFile">File input</label>
										<input type="file" id="exampleInputFile" accept="application/msexcel">
										<p class="help-block">
											<font color="red">*注意:Excel内容务必与数据库字段表保持一致，如下图</font>
										</p>
										<img src="../img/example.png" />
									</div>
									<button type="submit" class="btn btn-default">提交</button>
								</form>
								<hr />
								<h3>单个导入可注册用户:</h3>
								<form>
									<div class="form-group">
										<label for="exampleInputID">学号</label>
										<input type="text" class="form-control" id="exampleInputID" placeholder="学号" style="width: 300px;">
									</div>
									<div class="form-group">
										<label for="exampleInputName">姓名</label>
										<input type="text" class="form-control" id="exampleInputName" placeholder="姓名" style="width: 300px;">
									</div>
									<div class="form-group">
										<label for="exampleInputCode">邀请码</label>
										<input type="text" class="form-control" id="exampleInputCode" placeholder="邀请码" style="width: 300px;">
										<button type="button" class="btn btn-default">自动生成</button>
										
									</div>

									<button type="submit" class="btn btn-default">提交</button>
								</form>
							</div>
						</div>
				</div>
			</div>
		</div>
	</body>
</html>
