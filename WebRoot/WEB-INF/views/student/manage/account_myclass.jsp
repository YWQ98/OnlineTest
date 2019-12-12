<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/home/public.css" />
		<script type="text/javascript">
			$(function(){
				$("#searchpaperName").click(function(){
					var $paperName=$("#paperName").val(); 
					var $ifclasscode=$("#ifclasscode");
					var $epapername=$("#epapername");
					var $epaperteacher=$("#epaperteacher");
					var data={
						paperName:$paperName,
					};
					
					
					$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath }/student/manage/searchPaper",
					data:data,
					dataType:"JSON",
					success:function (data)
					{
						$ifclasscode.html("");
						$epapername.html(data.ename);
						$epaperteacher.html(data.teacher.tName);
						var $paperName1=$("#paperName1").val(data.ename); 
					},
					error:function()
					{
						$ifclasscode.html("此试卷名称不存在");
					}
					
					});
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
			
			
				<div class="panle">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation">
						<a href="${pageContext.request.contextPath }/student/manage/account_security"  >账号安全</a>
					</li>
					<li role="presentation">
						<a href="${pageContext.request.contextPath }/student/manage/account_info"  >个人信息</a>
					</li>
					<li role="presentation" class="active">
						<a href="#myclass" aria-controls="myclass" role="tab" data-toggle="tab">我的试卷</a>
					</li>
					<li role="presentation">
						<a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">保留待定</a>
					</li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="myclass">
				<div id="class">
						<div class="panel-items">
							<span style="font-size: 21px">${msg }</span>
						</div>
						<c:if test="${studentPage!=null }">
						<c:forEach items="${studentPage.getContent() }" var="sp1">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">${sp1.getePaper().getEname() }</h3>
							</div>
							<div class="panel-body">
								<div class="panel-items">
									科任老师:${sp1.getePaper().getTeacher().gettName() }
								</div><!-- 
								<div class="panel-items">
									学生人数:49
								</div> -->
								<div class="panel-items">
									
									<a href="${pageContext.request.contextPath }/student/manage/beginTest?ename=${sp1.getePaper().getEname() }&Spid=${sp1.getSpid() }">进入考试</a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="${pageContext.request.contextPath }/student/manage/checkoutEX?ename=${sp1.getePaper().getEname() }&Spid=${sp1.getSpid() }">查看成绩</a>
								</div><br/>
								
							</div>
						</div>
						<hr />
						</c:forEach>
						</c:if>
						<c:if test="${studentPage.getContent() eq '[]' }">
							<span style="font-size: 39px">您还没有试卷</span><br/>
						</c:if>
						
						<!-- <div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">17软工一班高等数学[Xn21as45]</h3>
							</div>
							<div class="panel-body">
								<div class="panel-items">
									科任老师:XXX
								</div>
								<div class="panel-items">
									学生人数:49
								</div>
								<div class="panel-items">
									<a href="myclass.html">进入班级</a>
								</div>
								
							</div>
						</div>

						<hr />

						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">17软工一班高等数学[Xn21as45]</h3>
							</div>
							<div class="panel-body">
								<div class="panel-items">
									科任老师:XXX
								</div>
								<div class="panel-items">
									学生人数:49
								</div>
								<div class="panel-items">
									<a href="myclass.html">进入班级</a>
								</div>
								
							</div>
						</div>

						<hr/> -->
						<button type="button" class="btn btn-info" id="addpaper" style="width: 100px;"data-toggle="modal" data-target="#addNewClass">添加新试卷</button>

					</div>	
					

					</div>

				</div>

<!--
	作者：offline
	时间：2019-11-11
	描述：膜态框
-->
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="addNewClass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加一个新试卷</h4>
      </div>
      <div class="modal-body">
        <form action="${pageContext.request.contextPath }/student/manage/addSPaper" method="post">
        	<div class="form-group">
    <label for="exampleClassCode">班级邀请码:<span id="ifclasscode"></span></label>
    <input name="" type="text" class="form-control" id="paperName" placeholder="填入从老师获取的试卷名称">
      
        <button type="button" id="searchpaperName" class="btn btn-primary">查询</button><br/>
      <!--
      	作者：offline
      	时间：2019-11-11
      	描述：ajax从邀请码获取班级一些简略信息提高用户感知
      -->
    <input name="paperName" id="paperName1" type="hidden" value=""/>
    <label for="exampleClassName">试卷名称:<span id="epapername"></span></label><br />
    <label for="exampleClassTeacher">教师:<span id="epaperteacher"></span></label><br /><!-- 
      <label for="exampleClassSbuject">科目:</label><br /> -->
    
  </div>
        	
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <input type="submit" id="addclass_submit" class="btn btn-primary" value="添加">
        </form>
      </div>
    </div>
  </div>
</div>



			</div>
			
			
			
		</div>
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/home/do.js" ></script>
</html>
