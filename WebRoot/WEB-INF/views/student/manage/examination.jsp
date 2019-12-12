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
		<script type="text/javascript">
			/* 
				id=spdid  是题目id  
				id=dananswer 学生给的单选答案
				id=duoanswer 学生给的多选答案
				id=pananswer 学生给的判断答案
				id=jdanswer textarea 学生给的简答答案
			*/
			$(function(){
				
				
				$("#exam_post").click(function(){
					var dataid=[];
					var datadan=[];
					var dataduo=[];
					var datapan=[];
					var datajd=[];
					$('input[id="spdid"]').each(function(){
						dataid.push($(this).val());
					});
					
					$('p[id="r1"]').each(function(){
						datadan.push("没有答案");
					});
					var rp=0;
					$('input[id="dananswer"]').each(function(){
						if($(this).prop("checked")){
							datadan[rp++]=$(this).val();
						}/* else{
							datadan.push("没有答案");
						} */
					});
					
					
					$('div[id="duodiv"]').each(function(){/* 'div[id="duodiv"]' */
						var str="";
						$(this).children('input[id="duoanswer"]').each(function(){
							if($(this).prop("checked")){
								str+=$(this).val();
							}
						});
						if(str!=""){
							dataduo.push(str);
						}else{
							dataduo.push("没有答案");
						}					
					});
					
					$('p[id="j1"]').each(function(){
						datapan.push("没有答案");
					});
					var rj=0;
					$('input[id="pananswer"]').each(function(){
						if($(this).prop("checked")){
							datapan[rj++]=$(this).val();
						}/* else{
							datapan.push("没有答案");
						} */
					});
					$('textarea[id="jdanswer"]').each(function(){
						var jdstr=$(this).val();
						jdstr=jdstr.replace(/,/g, "，");//将英文,换中文，
						jdstr=jdstr.replace(/-/g, "_");//将英文,换中文，
						datajd.push(jdstr);
					});
					var dataajax="";
					var j=0;
					for(var i=0;i<datadan.length;i++)
					{
						if(datadan[i]==null){
							dataajax+=dataid[j]+"-没有答案,";
						}else{
							dataajax+=dataid[j]+"-"+datadan[i]+",";
						}
						j++;
					}
					for(var i=0;i<dataduo.length;i++)
					{
						if(datadan[i]==null){
							dataajax+=dataid[j]+"-没有答案,";
						}else{
							dataajax+=dataid[j]+"-"+dataduo[i]+",";
						}
						j++;
					}
					for(var i=0;i<datapan.length;i++)
					{
						if(datapan[i]==null){
							dataajax+=dataid[j]+"-没有答案,";
						}else{
							dataajax+=dataid[j]+"-"+datapan[i]+",";
						}
						j++;
					}
					for(var i=0;i<datajd.length;i++)
					{
						if(datajd[i]==""){
							dataajax+=dataid[j]+"-没有答案,";
						}else{
							dataajax+=dataid[j]+"-"+datajd[i]+",";
						}
						j++;
					}
					/* alert(dataajax);
					alert($spid); */
					var $spid=$("#spid").val();
					
					var data={
						data:dataajax,
						spid:$spid
					};
					$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath }/student/manage/saveStuPaperDetail",
					data:data,
					dataType:"JSON",
					success:function (data)
					{
						alert("保存成功！！！");
					},
					error:function()
					{
						alert("保存失败(请刷新页面)！！！");
					}
					
					});
					
					/* alert(dataid);
					alert(datadan);
					alert(dataduo);
					alert(datapan);
					alert(datajd); */
				});
			});
		</script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/exam/public.css" />

	</head>

	<body>
		<input type="hidden" id="spid" name="spid" value="${Spid}"/>
		<div id="exam_main_panle">
			<!--
            	作者：offline
            	时间：2019-10-12
            	描述：顶部栏
            -->
			<div class="row" id="exam_top_main_panle">
				<div class="col-md-6" id="exam_top_logo">
					<a href="${pageContext.request.contextPath }"><img src="${pageContext.request.contextPath }/static/img/index/logo_min.png" /></a>
				</div>
				<div class="col-md-6" id="exam_top_bar">
					<!--
                    	作者：offline
                    	时间：2019-10-11
                    	描述：<h4 id="name"><a href="">欢迎你:XXX</a></h4>
                    -->
					<div class="dropdown">
						<h4 class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    						欢迎你${student.getsNum() }
    						<span class="caret"></span>
  						</h4>
						<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
							<li>
								<a href="${pageContext.request.contextPath }/student/manage/account_info">个人中心</a>
							</li>
							<li role="separator" class="divider"></li>
							<li>
								<a href="${pageContext.request.contextPath }/admin/logOut">退出</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div id="tools">
				<a href="${pageContext.request.contextPath }/student/manage/account_myclass">返回我的试卷</a>
				<hr /> 总分:${PageSPD.getContent()[0].getStuPaper().getePaper().getEscore()}
				<br /> 时间:${PageSPD.getContent()[0].getStuPaper().getePaper().getEttl()}分钟
				<hr /> 
				<br /> 
				<br /> 
				<br /> 
				<br />
				<hr />
				<div id="ttl">
					<span style="font-size: 21px" id="hour_show"></span><br/>
					<span style="font-size: 21px" id="end">结束时间</span><br/>
					<span id="second_show">${endtime }</span>
				</div>

			</div>

			<div id="exam_panle">
				<form>

					<div id="radio">
						<div class="items">
							一、单选题
						</div>
						<c:forEach items="${PageSPD.getContent()}" var="pspd">
						<c:if test="${pspd.getqItem().getsType().getqType().getQtid() eq 1 }">
						<p id="r1">
							<input id="spdid" name="spdid" type="hidden" value="${pspd.getSpdid()}"/>
							${pspd.getqItem().getQiname()}?(${pspd.getqItem().getQiscore()}分)&nbsp;
							<span class="type">
								单选题
							</span>
						</p>
						<c:forEach items="${optionPageSPD }" var="op">
						<c:if test="${op.getqItem().getQiid() == pspd.getqItem().getQiid() }">
						<input <c:if test="${pspd.getEdanswer() eq  op.getChoice().substring(0,1)}">checked="checked"</c:if> type="radio" name="edanswer${pspd.getSpdid()}" id="dananswer" value="${op.getChoice().substring(0,1)}" />&nbsp;${op.getChoice().substring(1,op.getChoice().length())} <!-- &nbsp;1&emsp;
						<input type="radio" name="item_r1" id="item_r1" value="B" />&nbsp;2&emsp;
						<input type="radio" name="item_r1" id="item_r1" value="C" />&nbsp;3&emsp;
						<input type="radio" name="item_r1" id="item_r1" value="D" />&nbsp;4 -->
						</c:if>
						</c:forEach>
						<hr />
						</c:if>
						</c:forEach>
					</div>
					<div id="multiple">
						<div class="items">
							二、多选题
						</div>
						<c:forEach items="${PageSPD.getContent()}" var="pspd">
						<c:if test="${pspd.getqItem().getsType().getqType().getQtid() eq 2 }">
						<p id="m1">
							<input id="spdid" name="spdid" type="hidden" value="${pspd.getSpdid()}"/>
							${pspd.getqItem().getQiname()}?(${pspd.getqItem().getQiscore()}分)&nbsp;
							<span class="type">
								多选题   【您目前数据库中的答案：${pspd.getEdanswer() }】
							</span>

						</p>
						<div id="duodiv">
						<c:forEach items="${optionPageSPD }" var="op">
						<c:if test="${op.getqItem().getQiid() == pspd.getqItem().getQiid() }">
						<input  type="checkbox" name="edanswer" id="duoanswer" value="${op.getChoice().substring(0,1)}" />&nbsp;${op.getChoice().substring(1,op.getChoice().length())}
						</c:if>
						</c:forEach>
							</div>
						<hr />
						</c:if>
						</c:forEach>
					</div>
					<hr />
					<div id="judge">
						<div class="items">
							三、判断题
						</div>
						<c:forEach items="${PageSPD.getContent()}" var="pspd">
						<c:if test="${pspd.getqItem().getsType().getqType().getQtid() eq 3 }">
						<p id="j1">
						<p>
							<input id="spdid" name="spdid" type="hidden" value="${pspd.getSpdid()}"/>
							${pspd.getqItem().getQiname()}?(${pspd.getqItem().getQiscore()}分)&nbsp;
							<span class="type">
								判断题
							</span>
						</p>
						<input <c:if test="${pspd.getEdanswer() eq  'A'}">checked="checked"</c:if> type="radio" name="edanswer${pspd.getSpdid()}" id="pananswer" value="A" />&nbsp;正确&emsp;
						<input <c:if test="${pspd.getEdanswer() eq  'B'}">checked="checked"</c:if> type="radio" name="edanswer${pspd.getSpdid()}" id="pananswer" value="B" />&nbsp;错误
						</p>
						<hr />
						</c:if>
						</c:forEach>
					</div>
					
					<div id="shortanswer">
						<div class="items">
							四、简答题
						</div>
						<c:forEach items="${PageSPD.getContent()}" var="pspd">
						<c:if test="${pspd.getqItem().getsType().getqType().getQtid() eq 4 }">
						<p id="jd1">
							<input id="spdid" name="spdid" type="hidden" value="${pspd.getSpdid()}"/>
							${pspd.getqItem().getQiname()}。(${pspd.getqItem().getQiscore()}分)&nbsp;
							<span class="type">
								简答题
							</span>
						</p>
						<textarea class="form-control"  id="jdanswer" rows="3" cols="10" style="width: 500px;">${pspd.getEdanswer()}</textarea>
						<hr />
						</c:if>
						</c:forEach>
					</div>
					<button type="button" class="btn btn-default" id="exam_post">提交</button>
				</form>

			</div>

		</div>
	</body>
	<script src="${pageContext.request.contextPath }/static/js/exam/do.js" type="text/javascript" charset="utf-8"></script>

</html>