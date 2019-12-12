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
		$(function(){/* updateemail */
			$("#sendEmailCode").click(function(){
				var data={
					
				};
				
				
				$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath }/student/manage/sendEmailCode",
				data:data,
				dataType:"JSON",
				success:function (data)
				{
					//2分钟后才可以再次获取验证码
					 var btn = $($("#sendEmailCode"));
	             	 var count = 120;
	             	 var resend = setInterval(function(){
	                 count--;
	                 if (count > 0){
	                     btn.val(count+"秒后可重新获取");
	                     $.cookie("captcha", count, {path: '/', expires: (1/86400)*count});
	                 }else {
	                     clearInterval(resend);
	                     btn.val("获取验证码").removeAttr('disabled style');
	                 }
	             	 }, 1000);
	             	 btn.attr('disabled',true).css('cursor','not-allowed');
				},
				error:function()
				{
					alert("发送失败！！！");
				}
				
				});
			});
			
			$("#oldemail").click(function(){
				var $newemail=$("#newemail").val();
				var data={
					newemail:$newemail
				};
				
				
				$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath }/student/manage/sendNewAndOldEmail",
				data:data,
				dataType:"JSON",
				success:function (data)
				{
					//2分钟后才可以再次获取验证码
					 var btn = $($("#oldemail"));
	             	 var count = 120;
	             	 var resend = setInterval(function(){
	                 count--;
	                 if (count > 0){
	                     btn.val(count+"秒后可重新获取");
	                     $.cookie("captcha", count, {path: '/', expires: (1/86400)*count});
	                 }else {
	                     clearInterval(resend);
	                     btn.val("获取验证码").removeAttr('disabled style');
	                 }
	             	 }, 1000);
	             	 btn.attr('disabled',true).css('cursor','not-allowed');
				},
				error:function()
				{
					alert("发送失败！！！");
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
					<a href="index.html"><img src="${pageContext.request.contextPath }/static/img/index/logo_min.png" /></a>
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
					<li role="presentation" class="active">
						<a href="#home" aria-controls="home" role="tab" data-toggle="tab">账号安全</a>
					</li>
					<li role="presentation">
						<a href="${pageContext.request.contextPath }/student/manage/account_info"  >个人信息</a>
					</li>
					<li role="presentation">
						<a href="${pageContext.request.contextPath }/student/manage/account_myclass" >我的试卷</a>
					</li>
					<li role="presentation">
						<a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">保留待定</a>
					</li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="home">
						<table>
							<tr>
								<td>
									邮箱:&emsp;
								</td>
								<td>
									${student.getsEmail().substring(0,3) }***${student.getsEmail().substring(student.getsEmail().length()-9,student.getsEmail().length()) }
								</td>
								<td>
									&emsp;&emsp;&emsp;
									<a data-toggle="modal" data-target="#myModal_mail">
										修改
									</a><span id="emmsg">${emmsg }</span>
								</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<%-- <tr>
								<td>密码:&emsp;</td>
								<td>******&emsp;&emsp;&emsp;</td>
								<td>
									&emsp;&emsp;&emsp;
									<a data-toggle="modal" data-target="#myModal_pass">
										修改
									</a><span id="pwdmsg">${pwdmsg }</span>
								</td>
							</tr> --%>
						</table>
						<!-- Button trigger modal -->

						<!-- Modal -->
						<!--
                        	作者：offline
                        	时间：2019-11-11
                        	描述：修改密码
                        -->
						<div class="modal fade" id="myModal_pass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">修改密码</h4>
									</div>
									<div class="modal-body">
										<form action="${pageContext.request.contextPath }/student/manage/updatePWD" method="post">
											<div class="form-group">
												<label for="exampleInputPassword1">新密码:</label>
												<input type="password" class="form-control" name="newPWD" id="exampleInputPassword1" placeholder="Password">
											</div>
											<div class="form-group">
												<label for="examplecode">验证码:<span id="ifcode_p">${pwdmsg }</span></label>
												<input type="text" name="emailcode" class="form-control" id="code_p" placeholder="查看邮箱里的验证码....">
												<button type="button" id="sendEmailCode" class="btn btn-success">获取验证码</button>
											</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="submit" class="btn btn-primary">保存</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!--
                        	作者：offline
                        	时间：2019-11-11
                        	描述：修改邮箱
                        -->
						<div class="modal fade" id="myModal_mail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">修改邮箱</h4>
									</div>
									<div class="modal-body">
										<form action="${pageContext.request.contextPath }/student/manage/updateEmail" method="post">
											<div class="form-group">
												<label for="exampleInputEmail1">新邮箱地址</label><span id="emmsg">${emmsg }</span>
												<input type="email" class="form-control" name="newemail" id="newemail" placeholder="Email">
											</div>
											<div class="form-group">
												<label for="exampleInputEmail1">验证码(新邮箱):</label>
												<input type="text" class="form-control" name="newemailcode" id="newemailcode" placeholder="查看新邮箱里的验证码....">
											</div>
											<div class="form-group">
												<label for="exampleInputEmail1">验证码(旧邮箱):</label>
												<input type="text" class="form-control" name="oldemailcode" id="oldemailcode" placeholder="查看旧邮箱里的验证码....">
												<button type="button" id="oldemail" class="btn btn-success">获取验证码</button>
											</div>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="submit" id="updateemail" class="btn btn-primary">保存</button>
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
	<script src="${pageContext.request.contextPath }/static/js/home/do.js" type="text/javascript" charset="utf-8"></script>

</html>