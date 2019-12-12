<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>

	<head>
		<meta charset="UTF-8">
		<title>题库管理</title>
		<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/teacher/public.css" />
		<script src="${pageContext.request.contextPath }/static/js/teacher/do.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				$("#qtid").change(function(){
					var $cb11=$(this).val();
					if($cb11==2)
					{
						$("#checkbox11").show();
						$("#radio11").hide();
						$("#judge11").hide();
						$("#jd111").hide();
					}
					if($cb11==1)
					{
						$("#checkbox11").hide();
						$("#radio11").show();
						$("#judge11").hide();
						$("#jd111").hide();
					}
					if($cb11==3)
					{
						$("#checkbox11").hide();
						$("#jd111").hide();
						$("#radio11").hide();
						$("#judge11").show();
					}
					if($cb11==4)
					{
						$("#checkbox11").hide();
						$("#jd111").show();
						$("#radio11").hide();
						$("#judge11").hide();
					}
				});
				
				
				$("#addSubJectbt").click(function(){
					$("#addSubJect11").submit();
				});
				$("#addQItem111").click(function(){
					var $qiscore=$("#qiscore").val();
					var $qiname=$("#qiname").val();
					var $qtid1=$("#qtid1").val();
					var $choice=$("#choice").val();
					var $answer=$("#answer").val();
					var $qtid=$("#qtid").val();
					
					var $radioch=$("#radioch").val();
					var $radioan=$("#radioan").val();
					
					var $choicech=$("#choicech").val();
					var $cbchoice=$("#cbchoice").val();
					
					var $judge=$("#judge").val();
					
					
					if($qiscore!="" && $qiname!="" && $qtid1!="")
					{
						$("#addQItemfr").submit();
						
						/* if($qtid==1) 
						{//单选
							$("#addQItemfr").submit();
						}
						else if($qtid==2)
						{//多选
							$("#addQItemfr").submit();
						}
						else if($qtid==3)
						{//判断
							$("#addQItemfr").submit();
						}
						else if($qtid==4)
						{//简答题
							$("#addQItemfr").submit();
						} */
						
						/* if($qtid==4){
							$("#addQItemfr").submit();
						}
						if($qtid!=4){
							if($choice!="" && $answer!="")
							{
								$("#addQItemfr").submit();
							}else{
								alert("非简答题选项或答案不能为空！！！");
							}
						} */
					}else{
						alert("问题、分值或题型不能为空！！！");
					}
					
				});
			});
		</script>
	</head>
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
				<li role="presentation" class="active">
					<a href="#teach_items_curd" aria-controls="teach_items_curd" role="tab" data-toggle="tab">题库管理</a>
				</li>
				<li role="presentation">
						<a href="${pageContext.request.contextPath }/teacher/manage/teaching_paple">创建试卷</a>
				</li>
			
			</ul>
			<div class="tab-content">

				<div role="tabpanel" class="tab-pane active" id="teach_items_curd">
						<!-- Modal -->
				<div class="modal fade" id="add_itembank" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">新增科目</h4>
							</div>
							<div class="modal-body">
								<form method="post" id="addSubJect11" action="${pageContext.request.contextPath }/teacher/manage/addSubJect">
									<div class="form-group">
										<label for="SubjectName">科目名称</label>
										<input type="text" class="form-control" name="sjname" id="SubjectName" placeholder="SubjectName">
										<br />
									</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button"  id="addSubJectbt" class="btn btn-primary">提交</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				<div class="modal fade" id="add_itembank1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">新增题目</h4>
							</div>
							<div class="modal-body">
								<form method="post" id="addQItemfr" action="${pageContext.request.contextPath }/teacher/manage/addQItem">
									<c:if test="${subject[0]==null }">
										<input type="hidden" class="form-control" name="qtid1" id="qtid1" value="">
									</c:if>
									<c:if test="${subject[0]!=null }">
									
										<input type="hidden" class="form-control" name="qtid1" id="qtid1" value="1">
									
									<div class="form-group">
										<label for="SubjectName">选择科目：</label>
										<input type="hidden" class="form-control" name="qtid1" id="qtid1" value="">
										<select id="sjid"  class="form-control" name="sjid">
											<c:forEach items="${subject }" var="sj">
												<option value="${sj.getSjid() }">${sj.getSjname() }</option>
											</c:forEach>
										</select><label for="SubjectName">题目类型：</label>
										<select id="qtid" class="form-control" name="qtid">
											<option value="1">单选</option>
											<option value="2">多选</option>
											<option value="3">判断</option>
											<option value="4">简答</option>
										</select>
									</div>
									</c:if>
									<div class="form-group">
										<label for="SubjectName">题目问题</label>
										<input type="text" class="form-control" name="qiname" id="qiname" placeholder="Question">
									</div>
									<div class="form-group">
										<label for="SubjectName">题目分值</label>
										<input type="text" class="form-control" onkeyup="this.value=this.value.replace(/[^0-9.]+/,'');"	 name="qiscore" id="qiscore" placeholder="score">
									</div>
									
									<div id="radio11" style="display: "><!-- 单选 -->
									
										<div class="form-group">
											<label for="SubjectName">题目选项(选择对应的答案)</label>
											<table style="width: 100%">
											<tr>
												<td>
													<input type="radio" name="radioan" checked="checked" id="radioan" value="A"/>
												</td>
												<td>
													<input type="text" class="form-control" required="required" name="radioch" id="radioch" placeholder="radioA">
												</td>
											</tr>
											<tr>
												<td>
													<input type="radio" name="radioan" id="radioan" value="B"/>
												</td>
												<td>
													<input type="text" class="form-control" name="radioch" id="radioch" placeholder="radioB">
												</td>
											</tr>
											<tr>
												<td>
													<input type="radio" name="radioan" id="radioan" value="C"/>
												</td>
												<td>
													<input type="text" class="form-control" name="radioch" id="radioch" placeholder="radioC">
												</td>
											</tr>
											<tr>
												<td>
													<input type="radio" name="radioan" id="radioan" value="D"/>
												</td>
												<td>
													<input type="text" class="form-control" name="radioch" id="radioch" placeholder="radioD">
												</td>
											</tr>
											</table>
										</div>
										<!-- <div class="form-group">
											<label for="SubjectName">题目答案(选项A是正确答案---填 A，选项AB是正确答案---填 AB)【简答可以置空】</label>
											<input type="text" class="form-control" name="answer" id="answer" placeholder="answer">
										</div> -->
										
									
									</div><!-- 单选 -->
									
									<div id="checkbox11" style="display: none"><!-- 多选 -->
									
										<div class="form-group">
											<label for="SubjectName">题目选项(在对应的答案前面打勾)</label>
											<table style="width: 100%">
											<tr>
												<td>
													<input type="checkbox" name="cbchoice" checked="checked" id="cbchoice" value="A"/>
												</td>
												<td>
													<input type="text" class="form-control" name="choicech" id="choicech" placeholder="choiceA">
												</td>
											</tr>
											<tr>
												<td>
													<input type="checkbox" name="cbchoice" id="cbchoice" value="B"/>
												</td>
												<td>
													<input type="text" class="form-control" name="choicech" id="choicech" placeholder="choiceB">
												</td>
											</tr>
											<tr>
												<td>
													<input type="checkbox" name="cbchoice" id="cbchoice" value="C"/>
												</td>
												<td>
													<input type="text" class="form-control" name="choicech" id="choicech" placeholder="choiceC">
												</td>
											</tr>
											<tr>
												<td>
													<input type="checkbox" name="cbchoice" id="cbchoice" value="D"/>
												</td>
												<td>
													<input type="text" class="form-control" name="choicech" id="choicech" placeholder="choiceD">
												</td>
											</tr>
											</table>
										</div>
										<!-- <div class="form-group">
											<label for="SubjectName">题目答案(选项A是正确答案---填 A，选项AB是正确答案---填 AB)【简答可以置空】</label>
											<input type="text" class="form-control" name="answer" id="answer" placeholder="answer">
										</div> -->
										
									
									</div><!-- 多选 -->
									
									
									<div id="judge11" style="display: none"><!-- 判断 -->
									
										<div class="form-group">
											<label for="SubjectName">题目选项(选择对应的答案)</label>
											<table style="width: 100%">
											<tr>
												<td>
													<input type="radio" name="judge" checked="checked" value="A"/>：正确
												</td>
												<td>
													
												</td>
											</tr>
											<tr>
												<td>
													<input type="radio" name="judge" id="judge" value="B"/>：错误
												</td>
												<td>
													
												</td>
											</tr>
											</table>
										</div>
										<!-- <div class="form-group">
											<label for="SubjectName">题目答案(选项A是正确答案---填 A，选项AB是正确答案---填 AB)【简答可以置空】</label>
											<input type="text" class="form-control" name="answer" id="answer" placeholder="answer">
										</div> -->
										
									
									</div><!-- 判断 -->
									
									<div id="jd111" style="display: none"><!-- 简答 -->
									
										<div class="form-group">
											<label for="SubjectName">题目参考答案</label>
											<input type="text" class="form-control" name="jdanswer" id="jdanswer" placeholder="简答参考答案">
										</div>
										
									
									</div><!-- 简答 -->
									
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button"  id="addQItem111" class="btn btn-primary">提交</button>
								</form>
							</div>
						</div>
					</div>
				</div>

						<div role="tabpanel" class="tab-pane" id="at_update">
							<br />
							<div id="search">
										<%-- <c:if test="${subject[0]!=null }">
											<form id="getPageForm" class="navbar-form navbar-left" role="search" action="">
												<div class="form-group">
												<select id="typeSJ" name="typeSJ">
													<c:forEach items="${subject }" var="sj">
														<option value="${sj.getSjid() }">${sj.getSjname() }</option>
													</c:forEach>
												</select>
												<select id="typeQT" name="typeQT">
													<option value="1">单选</option>
													<option value="2">多选</option>
													<option value="3">判断</option>
													<option value="4">简答</option>
												</select>
												<!-- <input type="radio" name="search_type" id="search_type" value="0" />通过姓名
												<input type="radio" name="search_type" id="search_type" value="1" />通过学号 -->
												<input id="searchStr" type="hidden" value=""/>
												<input type="text" class="form-control" id="exampleInput11" placeholder="题目问题" style="width: 300px;">
											</div>
											<button type="button" id="search11" class="btn btn-default">搜索</button><br />
											<div><p class="smg" id="sp">
												请先输入查询条件！！！
											</p></div>
											<div>
											<p class="smg" style="color: blue;font-size: 23px" id="sp1">
												
											</p></div>
											</form>	
										</c:if>
										<c:if test="${subject==null }">
											<p class="smg" style="color: red;font-size: 23px" id="sp1">
												数据库中没有科目，请添加！！！
											</p>
										</c:if> --%>
										
										<div style="padding-top: 58px;padding-left: 200px;float: left;">
											<button type="button" class="btn btn-info" id="add_itembank_btn" data-toggle="modal" data-target="#add_itembank">添加科目</button>
											<p class="smg" style="color: blue;font-size: 23px" id="sp1">
											${msgSubJect	 }	
											</p>
										</div>
										<div style="padding-top: 58px;padding-left: 30px;float: left;">
											<button type="button" class="btn btn-info" id="add_itembank_btn" data-toggle="modal" data-target="#add_itembank1">添加题目</button>
											<p class="smg" style="color: blue;font-size: 23px" id="sp1">
											${msgItem	 }	
											</p>
										</div>
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
				<!-- Button trigger modal -->

				
				
			</div>
		</div>

	</div>

	<body>
	</body>

</html>