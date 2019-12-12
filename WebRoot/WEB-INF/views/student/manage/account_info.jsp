<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<meta charset="UTF-8">
		<title>个人信息管理</title>
		<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/home/public.css" />
		<script type="text/javascript">
			$(function(){
				$("#updateinfo").click(function(){
					//sintroduction  ssex   sname
					var $sname=$("#sname").val();
					var $oldsNams=$("#oldsNams").val();
					
					if($sname!="" ){
						if($oldsNams!=$sname){
							$("#updateinfofr").submit();
						}else{
							$("#sname").val("");
							$("#updateinfofr").submit();
						}
					}else{
						alert("姓名不能为空！！");
					}
				});
			});
		</script>
		<title></title>
		
	</head>
	<body>
		<div id="main_panle">
			<!--
            	作者：offline
            	时间：2019-10-12
            	描述：顶部栏
            -->
			<div class="row" id="top_main_panle">
				<div class="col-md-6" id="top_logo">
					<a href="${pageContext.request.contextPath }"><img src="${pageContext.request.contextPath }/static/img/index/logo_min.png" /></a>
				</div>
				<div class="col-md-6" id="top_bar">
					<div class="dropdown">
						<h4 class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    						欢迎你${student.getsNum() }
    						<span class="caret"></span>
  						</h4>
						<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
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
            	时间：2019-11-11
            	描述：功能分隔
            -->
            		<div class="panle">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation">
						<a href="${pageContext.request.contextPath }/student/manage/account_security"  >账号安全</a>
					</li>
					<li role="presentation"  class="active">
						<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">个人信息</a>
					</li>
					<li role="presentation">
						<a href="${pageContext.request.contextPath }/student/manage/account_myclass" >我的试卷</a>
					</li>
					<li role="presentation">
						<a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">保留待定</a>
					</li>
				</ul>

				<!-- Tab panes -->
				<input type="hidden" id="oldsNams" value="${student.getsName() }"/>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="profile">
					<span style="font-size: 21px">${msg }</span>
					<table>
						<tr>
							<td>姓名:</td>
							<td>${student.getsName() }</td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</tr>
						<tr>
							<td>性别:</td>
							<td>${student.getsGender() }</td>
						</tr>
						<tr>
							<td>邮箱::</td>
							<td>${student.getsEmail().substring(0,3) }***${student.getsEmail().substring(student.getsEmail().length()-9,student.getsEmail().length()) }</td>
						</tr>
						<tr>
							<td>个人简介:</td>
							<td><textarea class="form-control" rows="3" readonly="readonly">${student.getsIntroduction() }</textarea></td>
						</tr>
						<tr>
							<td></td>
							<td>
								&emsp;&emsp;&emsp;
									<a data-toggle="modal" data-target="#myModal_info">
										修改
									</a>
							</td>
						</tr>
					</table>


					<!--
                    	作者：offline
                    	时间：2019-11-11
                    	描述：修改个人信息
                    -->
                    <div class="modal fade" id="myModal_info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">修改个人信息</h4>
									</div>
									<div class="modal-body">
										<form id="updateinfofr" action="${pageContext.request.contextPath }/student/manage/updateinfo">
											<div class="form-group">
												<label for="examplePhone">姓名:</label>
												<input type="text" class="form-control" name="sname" id="sname" value="${student.getsName() }" placeholder="姓名">
											</div>
											<div class="form-group">
												<label for="exampleSex">性别:</label>
												<div id="ssexd">
  													<input <c:if test="${student.getsGender() eq '男'}">checked="checked"</c:if> type="radio" name="ssex" id="ssex11" value="男"> 男
  													<input <c:if test="${student.getsGender() eq '女'}">checked="checked"</c:if> type="radio" name="ssex" id="ssex11" value="女"> 女
												</div>
											</div>
											<div class="form-group">
												<label for="exampleIntroduction">个人简介:</label>
												<textarea name="sintroduction" id="sintroduction" class="form-control" rows="3">${student.getsIntroduction() }</textarea>
											</div>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button id="updateinfo" type="button" class="btn btn-primary">保存</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
			
			</div>
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/home/do.js" ></script>
</html>
