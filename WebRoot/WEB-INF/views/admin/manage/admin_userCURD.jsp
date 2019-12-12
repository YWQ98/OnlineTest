<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta>
		<title>用户管理</title>
		<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/admin/public.css" />
		<script src="${pageContext.request.contextPath }/static/js/admin/do.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				
				
				$("#datatb").on("click","a",function(){  //激活或者冻结事件
					var $STnum=$(this).parent().siblings("#chil11").text();
					var $nowState=$(this).text();
					var $thisa=$(this);
					var $typeTS=$("#typeSTS").val();
					
					var data={
						nowState:$nowState,
						num:$STnum,
						typeTS:$typeTS
					};
					
					
					$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath }/admin/manage/changeState",
					data:data,
					dataType:"JSON",
					success:function (data)
					{
						if(data==1){
							alert($nowState+"成功！！！");
							var b1=($nowState=="激活");
							var b2=($nowState=="冻结");
							if(b1)
							{
								$thisa.text("冻结");
							}
							if(b2)
							{
								$thisa.text("激活");
							}
						}else /* if(data==0) */
						{
							alert("操作失败！！！");	
						}
					},
					error:function()
					{
						if(nowState=="激活")
						{
							nowState="冻结";
						}
						alert(nowState+"失败");
					}
					
					});
				});
				
				$("ul").on("click","a",function(){  //换页事件
					$("#datatb").find("tr").remove();
					var $spage=$(this).text();
					var $typeTS=$("#typeSTS").val();
					var $typeNN=$("#typeSNN").val();
					var $exampleInput=$("#searchStr").val();
					var data={
						page1:$spage,
						typeTS:$typeTS,
						typeNN:$typeNN,
						searchStr:$exampleInput
					};
					
					
					$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath }/admin/manage/getPage",
					data:data,
					dataType:"JSON",
					success:function (data)
					{
						$("#datatb").append("<tr><td>工号/学号</td><td>姓名</td><td>性别</td><td>操作</td></tr>");
						$.each(data, function(i,item){ // i：获取对象的下标 ，item:获取对象的值
							var ctrlA="冻结";
							if(item.sState=="1" || item.tState=="1")
							{
								ctrlA="激活";
							}
							if(item.sNum!=null)
							{
								var trtd="<tr><td id='chil11'>"+item.sNum+"</td><td>"+item.sName+"</td><td>"+item.sGender+"</td><td><a>"+ctrlA+"</a></td></tr>";
								$("#datatb").append(trtd);
							}
							else if(item.tNum!=null)
							{
								var trtd="<tr><td id='chil11'>"+item.tNum+"</td><td>"+item.tName+"</td><td>"+item.tGender+"</td><td><a>"+ctrlA+"</a></td></tr>";
								$("#datatb").append(trtd);
							}
						}); 
					},
					error:function()
					{
						document.getElementById("sp").innerText = "查无此人";
					}
					
					});
					
					
				});
				$("#search11").click(function(){
					$("#datatb").find("tr").remove();
					var $typeTS=$("#typeTS").val();
					$("#typeSTS").val($typeTS);
					var $typeNN=$("#typeNN").val();
					$("#typeSNN").val($typeNN);
					var $exampleInput=$("#exampleInput11").val();
					$("#searchStr").val($exampleInput);
					var data={
						typeTS:$typeTS,
						typeNN:$typeNN,
						searchStr:$exampleInput
					};
					
					/* var callback = function(result){
						alert(result);
					};
					url:"${pageContext.request.contextPath }/admin/manage/getPage",
					$.getJSON(url,data,callback); */
					
					$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath }/admin/manage/getPage",
					data:data,
					dataType:"JSON",
					success:function (data)
					{
						var tssp="";
						if($typeTS=="teacher")
						{
							tssp="教师";
						}else if($typeTS=="student")
						{
							tssp="学生";
						}
						document.getElementById("sp1").innerText = tssp;
						document.getElementById("sp").innerText = "";
						$("#search_data").show();
						$("#search_page").show();
						$("#datatb").append("<tr><td>工号/学号</td><td>姓名</td><td>性别</td><td>操作</td></tr>");
						$.each(data, function(i,item){ // i：获取对象的下标 ，item:获取对象的值
							var ctrlA="冻结";
							if(item.sState=="1" || item.tState=="1")
							{
								ctrlA="激活";
							}
							if(item.sNum!=null)
							{
								var trtd="<tr><td id='chil11'>"+item.sNum+"</td><td>"+item.sName+"</td><td>"+item.sGender+"</td><td><a>"+ctrlA+"</a></td></tr>";
								$("#datatb").append(trtd);
							}else if(item.tNum!=null)
							{
								var trtd="<tr><td id='chil11'>"+item.tNum+"</td><td>"+item.tName+"</td><td>"+item.tGender+"</td><td><a>"+ctrlA+"</a></td></tr>";
								$("#datatb").append(trtd);
							}
						}); 
						var sPages=data[data.length-1].sPages;
						$("#pages11").empty();
						for(var i=1;i<=sPages;i++)
						{
							var liil="<li><a id='pages1'>"+i+"</a></li>";
							$("#pages11").append(liil);
						}
					},
					error:function()
					{
						document.getElementById("sp").innerText = "查无此人";
						document.getElementById("sp1").innerText = "";
						$("#search_data").hide();
						$("#search_page").hide();
					}
					
					});
					
				});
			});
		</script>
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
						<li role="presentation">
							<a href="${pageContext.request.contextPath }/admin/manage/admin_addUser">用户导入</a>
						</li>
						<li role="presentation"  class="active">
							<a href="#" aria-controls="at_update" role="tab" data-toggle="tab">用户查删</a>
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
				</div>
				<!--
                        	作者：offline
                        	时间：2019-10-22
                        	描述：用户查删
                        -->

						<div role="tabpanel" class="tab-pane" id="at_update">
							<br />
							<div id="search">
								<form id="getPageForm" class="navbar-form navbar-left" role="search" action="">
									<div class="form-group">
										<select id="typeTS" name="typeTS">
											<option value="teacher">教师</option>
											<option value="student">学生</option>
										</select>
										<input id="typeSTS" type="hidden" value=""><!-- 隐藏以供换页使用 -->
										<select id="typeNN" name="typeNN">
											<option value="name">通过姓名</option>
											<option value="num">通过学号/工号</option>
										</select>
										<input id="typeSNN" type="hidden" value=""><!-- 隐藏以供换页使用 -->
										<!-- <input type="radio" name="search_type" id="search_type" value="0" />通过姓名
										<input type="radio" name="search_type" id="search_type" value="1" />通过学号 -->
										<input id="searchStr" type="hidden" value=""/>
										<input type="text" class="form-control" id="exampleInput11" placeholder="姓名/学号" style="width: 300px;">
									</div>
									<button type="button" id="search11" class="btn btn-default">搜索</button><br />
									<p class="smg" id="sp">
										请先输入查询条件！！！
									</p>
									<p class="smg" style="color: blue;font-size: 23px" id="sp1">
										
									</p>
								</form>

							</div><br /><br />
							<hr />
							<div id="search_panle">
								<div id="search_data" style="display: none">
									<table class="table table-hover" id="datatb">
 										<tr>
 											<td>学号</td>
 											<td>姓名</td>
 											<td>性别</td>
 											<td>操作</td>
 										</tr>
									</table>
								</div>
								<div id="search_page" style="display: none">
								<nav aria-label="Page navigation">
								
									<ul class="pagination" id="pages11">
										<!-- <li>
											<a href="#" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li> -->
										<!-- <li>
											<a href="#">1</a>
										</li> -->
										<!-- <li>
											<a href="#" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li> -->
									</ul>
								</nav>
								</div>
							</div>

						</div>
						
						
		</div>
	</body>
</html>
