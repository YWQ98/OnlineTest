<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理试卷</title>
		<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/teacher/public.css" />
		<script src="${pageContext.request.contextPath }/static/js/teacher/do.js" type="text/javascript" charset="utf-8"></script>
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
            	描述：班级
            -->
			<div id="tool">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active">
						<a href="#teach_class_curd" aria-controls="teach_class_curd" role="tab" data-toggle="tab">管理班级</a>
					</li>
					<li role="presentation" >
						<a href="${pageContext.request.contextPath }/teacher/manage/teaching_itembank" >题库管理</a>
					</li>
					<li role="presentation">
						<a href="${pageContext.request.contextPath }/teacher/manage/teaching_paple">创建试卷</a>
					</li>
					
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="teach_class_curd">
						<!--
        	作者：offline
        	时间：2019-11-01
        	描述：班级管理视图
        -->
						<h3>在您麾下的试卷:</h3>
						<!-- <button type="button" class="btn btn-info" id="add_class_btn"  data-toggle="modal" data-target="#add_class">新增</button> -->
						<c:if test="${PagEPapers==null }">
						<span class="smg" style="color: blue;font-size: 23px" id="sp1">
						您还未创建试卷！！
						</span>
						</c:if>
						<c:if test="${PagEPapers!=null }">
						<c:forEach items="${PagEPapers.getContent() }" var="pep">
						<form action="${pageContext.request.contextPath }/teacher/manage/teaching_class" method="post">
						<div class="your_class">
							
								<table border="0px" cellspacing="" cellpadding="">
									<tr>
										<td colspan="2" class="class_img">
											<img src="${pageContext.request.contextPath }/static/img/teacher/class_1.png" />
										</td>
									</tr>
									<tr>
										<td>试卷名称</td>
										<td>${pep.getEname() }</td>
									</tr>
									<tr>
										<td>总分</td>
										<td>${pep.getEscore() }</td>
									</tr>

									<tr>
										<td>考试时长</td>
										<td>${pep.getEttl() }分钟</td>
									</tr>
									<tr>
										<td>创建时间</td>
										<td><fmt:formatDate  pattern="yyyy-MM-dd HH:mm:ss" value="${pep.getEcreatedate() }"/></td>
									</tr>
									<tr>
										<td>状态</td>
										<td>
										<input type="hidden" name="eid" value="${pep.getEid() }"/>
											<select name="estate">
												<option value="0" <c:if test="${pep.getEstate() eq 0 }">selected="selected"</c:if>>不能考试不能查看成绩</option>
												<option value="1" <c:if test="${pep.getEstate() eq 1 }">selected="selected"</c:if>>能考试不能查看成绩</option>
												<option value="2" <c:if test="${pep.getEstate() eq 2 }">selected="selected"</c:if>>不能考试能查看成绩</option>
											</select>
										</td>
									</tr>
									<tr>
										<td><input type="submit" value="修改状态"/></td>
										<td><a href="${pageContext.request.contextPath }/teacher/manage/checkoutEPScore?eid=${pep.getEid() }">查看成绩</a></td>
										
									</tr>
								</table>
							</a>
						</div>
						</form>
						</c:forEach>
						</c:if>
						
						<%-- <div class="your_class">
							<a href="myclass.html">
								<table border="0px" cellspacing="" cellpadding="">
									<tr>
										<td colspan="2" class="class_img">
											<img src="${pageContext.request.contextPath }/static/img/teacher/class_2.png" />
										</td>
									</tr>
									<tr>
										<td>班级名称</td>
										<td>17软件工程1班</td>
									</tr>
									<tr>
										<td>科目</td>
										<td>高等数学</td>
									</tr>

									<tr>
										<td>人数</td>
										<td>41</td>
									</tr>
									<tr>
										<td>邀请码</td>
										<td>X67UhYg5</td>
									</tr>
									<tr>
										<td>状态</td>
										<td>不可加入</td>
									</tr>
								</table>
							</a>
						</div>

						<div class="your_class">
							<a href="myclass.html">
								<table border="0px" cellspacing="" cellpadding="">
									<tr>
										<td colspan="2" class="class_img">
											<img src="${pageContext.request.contextPath }/static/img/teacher/class_3.png" />
										</td>
									</tr>
									<tr>
										<td>班级名称</td>
										<td>17软件工程1班</td>
									</tr>
									<tr>
										<td>科目</td>
										<td>高等数学</td>
									</tr>
									<tr>
										<td>人数</td>
										<td>41</td>
									</tr>
									<tr>
										<td>邀请码</td>
										<td>X67UhYg5</td>
									</tr>
									<tr>
										<td>状态</td>
										<td>不可加入</td>
									</tr>

								</table>
							</a>
						</div> --%>
<!-- Modal -->
<div class="modal fade" id="add_class" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">新增班级</h4>
      </div>
      <div class="modal-body">
        <form>
									<div class="form-group">
										<!-- <label for="ClassName"班级名称</label> -->
										<input type="text" class="form-control" id="ClassName" placeholder="ClassName">
										<br />
										<label for="Subject">科目:</label>
										<select class="form-control">
											<option value="1">高等数学I</option>
											<option value="2">概率论与数理统计</option>
											<option value="3">离散数学</option>
											<option value="4">高等数学II</option>
										</select>
										<br />
										<label for="ClassCode">班级邀请码:<span>Mn7s44X</span></label><br />
										<button type="button" class="btn btn-default">生成</button>				
									</div>

								
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary">保存</button>
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
</html>
