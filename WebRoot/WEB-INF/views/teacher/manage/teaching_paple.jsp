<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8">
		<title>创建试卷</title>
		<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/teacher/public.css" />
		<script src="${pageContext.request.contextPath }/static/js/teacher/do.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				
				
				
				$("#autoaddEPapersubmit").click(function(){//随机出卷
					
					var $autorpname=$("#autorpname").val();
					var $autottl=$("#autottl").val();
					if($autorpname=="" || $autottl=="")
					{
						alert("试卷名称或者考试时长不能为空！");
					}else{
						var data={
							paplename:$autorpname,
							autottl:$autottl
						};
						
						
						$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath }/teacher/manage/checkSPaperName",
						data:data,
						dataType:"JSON",
						success:function (data)
						{
							$("#autoAddEPaperfr").submit(); 
						},
						error:function()
						{
							alert("该试卷名称已存在");
						}
						
						});
					}
				
				});
				
				$("#addEPaper").click(function(){//新建试卷监听
					var $paplename11=$("#paplename11").val();
					var $ttl11=$("#ttl11").val();
					var $items1=$("#items1").children().length;
					var $items2=$("#items2").children().length;
					var $items3=$("#items3").children().length;
					var $items4=$("#items4").children().length;
					var $itemss=($items1!=0 || $items2!=0 || $items3!=0 || $items4!=0)
					if($paplename11!="" && $ttl11!="" && $itemss)
					{
						var data={
							paplename:$paplename11
						};
						
						
						$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath }/teacher/manage/checkSPaperName",
						data:data,
						dataType:"JSON",
						success:function (data)
						{
							$("#addpaple11").submit();
						},
						error:function()
						{
							alert("该试卷名称已存在");
						}
						
						});
					}else{
						alert("试卷名称、时长、题目缺一不可");
					}
				});
				
				
				$("#chose_item").on("click","a",function(){//题目删除监听事件
					var $deletea=$(this).parent();
					var $fz111=parseInt($(this).parent().children("#chil22").html());
					var $paple_score=parseInt($("#paple_score").html());
					$("#paple_score").html($paple_score-$fz111);
					$("#paple_score1").val($paple_score-$fz111);
					$deletea.remove();
					
				});
				
				
			
				$("#itemtb").on("click","a",function(){//题目添加监听事件
					var $papleqiid=$(this).parent().children("#papleqiid").val();
					var $diva="<div id='additem11'>"+$(this).parent().prop('firstChild').nodeValue+"<br/>"
					+$(this).parent().children("#chil11").html()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>删除</a><br/><input type='hidden' id='addpapleqiid' name='addpapleqiid' value='"+$papleqiid+"' /><br></div>";
					//alert($diva);
					//alert($papleqiid);
					var $fz111=parseInt($(this).parent().children("#chil11").children("#chil22").html());
					var $paple_score=parseInt($("#paple_score").html());
					$("#paple_score").html($paple_score+$fz111);
					$("#paple_score1").val($paple_score+$fz111);
					var $typeQT11=$("#typeQT11").val();//类型
					if($typeQT11==1)
					{
						$("#items1").append($diva);
					}
					if($typeQT11==2)
					{
						$("#items2").append($diva);
					}
					if($typeQT11==3)
					{
						$("#items3").append($diva);
					}
					if($typeQT11==4)
					{
						$("#items4").append($diva);
					}
				});
				
				
				$("#pages111").on("click","a",function(){//分页
					//$("#itemtb").find("div").remove();
					$("#itemtb").html("");
					var $typeQT=$("#typeQT").val();
					var $typeSJ=$("#typeSJ").val();
					var $pages1=$(this).text();
					/* alert($typeQT);
					alert($typeSJ); */
					//alert($pages1);
					
					var data={
						typeQT:$typeQT,
						page:$pages1,
						typeSJ:$typeSJ
					};
					
					
					$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath }/teacher/manage/searchItem",
					data:data,
					dataType:"JSON",
					success:function (data)
					{
						//var $itemtb=$("#itemtb");
						$.each(data, function(i,item){ // i：获取对象的下标 ，item:获取对象的值
							var trtd="<div class='unit' id='item11'>问题："+item.qiname+
							"<input type='hidden' id='papleqiid' name='papleqiid' value='"+item.qiid+"' /><br/><span id='chil11'>分值：<span id='chil22'>"+item.qiscore+"</span>分</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>添加</a></div><br/>";
							$("#itemtb").append(trtd);
						}); 
						$("#msg111").text("");
					},
					error:function()
					{
						$("#msg111").text("此类型没有题目！！！");
					}
					
					});
					
					
					
				});
				
				
			
				$("#searchitem11").click(function(){//搜索题目
					//$("#itemtb").find("div").remove();
					$("#itemtb").html("");
					var $typeQT=$("#typeQT").val();
					var $typeSJ=$("#typeSJ").val();
					$("#typeQT11").val($typeQT);
					/* alert($typeQT);
					alert($typeSJ); */
					
					
					var data={
						typeQT:$typeQT,
						typeSJ:$typeSJ
					};
					
					
					$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath }/teacher/manage/searchItem",
					data:data,
					dataType:"JSON",
					success:function (data)
					{
						//var $itemtb=$("#itemtb");
						$.each(data, function(i,item){ // i：获取对象的下标 ，item:获取对象的值
							var trtd="<div class='unit' id='item11'>问题："+item.qiname+
							"<input type='hidden' id='papleqiid' name='papleqiid' value='"+item.qiid+"' /><br/><span id='chil11'>分值：<span id='chil22'>"+item.qiscore+"</span>分</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>添加</a></div><br/>";
							
							$("#itemtb").append(trtd);
						}); 
						$("#msg111").text("");
						var sPages=data[data.length-1].sPages;
						$("#pages111").empty();
						for(var i=1;i<=sPages;i++)
						{
							var liil="<li><a id='pages1'>"+i+"</a></li>";
							$("#pages111").append(liil);
						}
					},
					error:function()
					{
						$("#msg111").text("此类型没有题目！！！");
					}
					
					});
					
					
					
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
					<li role="presentation" >
						<a href="${pageContext.request.contextPath }/teacher/manage/teaching_itembank" >题库管理</a>
					</li>
					<li role="presentation" class="active">
						<a href="#teach_paple_add" aria-controls="teach_paple_add" role="tab" data-toggle="tab">创建试卷</a>
					</li>
				</ul>
<!--
    	作者：offline
    	时间：2019-11-02
    	描述：创建试卷模块
    -->
    <div class="modal fade" id="add_itembank1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">新增试卷</h4>
							</div>
							<div class="modal-body">
								<form method="post" id="autoAddEPaperfr" action="${pageContext.request.contextPath }/teacher/manage/autoAddEPaper">
									<div class="form-group">
										<label for="SubjectName">试卷名称</label>
										<input type="text" class="form-control" name="autorpname" id="autorpname" placeholder="试卷名称">
									</div>
									<div class="form-group">
										<label for="SubjectName">考试时长</label>
										<input onkeyup="this.value=this.value.replace(/[^0-9.]+/,'');" type="text" class="form-control" name="autottl" id="autottl" placeholder="考试时长">
									</div>
									<c:if test="${subject[0]!=null }">
									
										<input type="hidden" class="form-control" name="qtid1" id="qtid1" value="1">
									
									<div class="form-group">
										<label for="SubjectName">选择科目：</label>
										<input type="hidden" class="form-control" name="qtid1" id="qtid1" value="">
										<select id="autosjid"  class="form-control" name="autosjid">
											<c:forEach items="${subject }" var="sj">
												<option value="${sj.getSjid() }">${sj.getSjname() }</option>
											</c:forEach>
										</select>
										
									</div>
									</c:if>
									<div class="form-group">
										<label for="SubjectName">总分</label>
										<select name="autoscore" id="autoscore" class="form-control">
											<option value="100">100</option>
											<option value="120">120</option>
										</select>
									</div>
									
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button"  id="autoaddEPapersubmit" class="btn btn-primary">提交</button>
								</form>
							</div>
						</div>
					</div>
				</div>

					<div role="tabpanel" class="tab-pane" id="teach_paple_add">
						<h3>创建一份试卷:   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-info" id="AutoaddEPaper" data-toggle="modal" data-target="#add_itembank1">随机出卷</button>
						<span class="smg" style="color: blue;font-size: 23px" id="sp1">
						${msgItem	 }	
						</span></h3>
						
						<div class="add_paple_panle">
							<form id="addpaple11" action="${pageContext.request.contextPath }/teacher/manage/addPaple" method="post" class="form-inline">
								<nav class="navbar navbar-default" id="add_paple_tips">
									<div class="form-group">
										<label style="display:inline">试卷名称(唯一，学生可以通过该名称添加试卷)</label>
										<input id="paplename11" name="paplename" type="text" class="form-control" placeholder="试卷名称">
										<label style="display:inline">试卷状态(任何状态学生都可以添加试卷)</label>
										<select name="estate">
											<option value="0">保存但不能考试不能查看成绩</option>
											<option value="1">保存且可以考试但不能查看成绩</option>
											<option value="2">保存但不能考试能查看成绩</option>
										</select><br/>
										<label style="display:inline">考试时长(单位:分钟)</label>
										<input id="ttl11" name="ttl" type="text"  onkeyup="this.value=this.value.replace(/[^0-9.]+/,'');" class="form-control" placeholder="考试时长">
										<label style="display:inline">试卷分值</label>
										<span id="paple_score">0</span>分
										<input id="paple_score1" type="hidden" name="paple_score"/>
									</div>
								</nav>
								<div id="chose_item">
									<!-- 新增单选题 -->
									<h4>I.单选题</h4>
									<div id="items1">
									
										
									</div>
									
									<hr>
									<!-- Modal -->
									

									<!-- 新增多选题 -->
									<h4>II.多选题</h4>
									<div id="items2">
									
										
									</div>
									<hr />
								

									<!-- 新增判断题 -->
									<h4>III.判断题</h4>
									<div id="items3">
									
										
									</div>
									<hr />
									
									<h4>IV.简答题</h4>
									<div id="items4">
									
										
									</div>
									<hr />
									

								</div>
								<div id="chose_items">
									<div id="X">
									
									<c:if test="${subject[0]==null }">
									<p class="smg" style="color: blue;font-size: 23px" id="sp1">
										题库为空		
									</p>
									</c:if>
									<c:if test="${subject[0]!=null }">
										<h4>搜索添加题目</h4>
										
									<select id="typeSJ" name="typeSJ" class="form-control">
										<c:forEach items="${subject }" var="sj">
											<option value="${sj.getSjid() }">${sj.getSjname() }</option>
										</c:forEach>
									</select>
									<!-- <select name="" class="form-control">
										<option value="">单选题</option>
										<option value="">多选题</option>
										<option value="">判断题</option>
										<option value="">简答题</option>
									</select> -->
									<select id="typeQT" name="typeQT" class="form-control">
										<option value="1">单选</option>
										<option value="2">多选</option>
										<option value="3">判断</option>
										<option value="4">简答</option>
									</select>
									<button type="button" class="btn btn-default" id="searchitem11" style="width: 80px;">搜索</button>
									<!-- <select name="" class="form-control">
										<option value="">题库14</option>
										<option value="">题库13</option>
										<option value="">题库12</option>
										<option value="">题库10</option>
									</select> -->
									</c:if>
									</div>
									<input type="hidden" id=typeQT11 value="">
									<hr>
									<div id="add_item_area">
									<p class="smg" style="color: blue;font-size: 23px" id="msg111">
												
									</p>
										<table id="itemtb">
											
										</table>
										<ul class="pagination" id="pages111">
										
										</ul>
										<!-- <div class="unit">
											1+1=?(2分)&emsp;&emsp;<a>添加</a>
										</div>
										<div class="unit">
											1+1=?(2分)&emsp;&emsp;<a>添加</a>
										</div>
										<div class="unit">
											1+1=?(2分)&emsp;&emsp;<a>添加</a>
										</div>
										<div class="unit">
											1+1=?(2分)&emsp;&emsp;<a>添加</a>
										</div>
										<div class="unit">
											1+1=?(2分)&emsp;&emsp;<a>添加</a>
										</div> -->
									</div>
								</div>
								
								<button type="button" class="btn btn-default" id="addEPaper" style="width: 80px;">新建</button>
								
							</form>

						</div>

					</div>
		</div>
	</div>
	</body>
</html>
