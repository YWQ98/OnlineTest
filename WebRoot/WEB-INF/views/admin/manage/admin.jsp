<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/admin/public.css" />
		<script src="${pageContext.request.contextPath }/static/js/admin/do.js" type="text/javascript" charset="utf-8"></script>
	</head>

	<body>
		
		<div id="admin_main_panle">
			<!--
            	ä½èï¼offline
            	æ¶é´ï¼2019-10-12
            	æè¿°ï¼é¡¶é¨æ 
            -->
			<div class="row" id="admin_top_main_panle">
				<div class="col-md-6" id="admin_top_logo">
					<a href="../index.html"><img src="../img/index/logo_min.png" /></a>
				</div>
				<div class="col-md-6" id="admin_top_bar">
					<div class="dropdown">
						<h4 class="dropdown-toggle" type="button" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    						æ¬¢è¿ä½ :XXX
    						<span class="caret"></span>
  						</h4>
						<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu">
							<li>
								<a href="#">ä¸ªäººä¸­å¿</a>
							</li>
							<li role="separator" class="divider"></li>
							<li>
								<a href="#">éåº</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!--
            	ä½èï¼offline
            	æ¶é´ï¼2019-10-21
            	æè¿°ï¼é¡¶é¨å¯¼èªæ 
            -->
			<div class="admin_tool">

				<div id="tool">

					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active">
							<a href="#at_import" aria-controls="at_import" role="tab" data-toggle="tab">ç¨æ·å¯¼å¥</a>
						</li>
						<li role="presentation">
							<a href="#at_update" aria-controls="at_update" role="tab" data-toggle="tab">ç¨æ·æ¥å </a>
						</li>
						<li role="presentation">
							<a href="#at_export" aria-controls="at_export" role="tab" data-toggle="tab">æç»©å¯¼åº</a>
						</li>
						<li role="presentation">
							<a href="#at_ib_update" aria-controls="at_ib_update" role="tab" data-toggle="tab">é¢åºæ¥å </a>
						</li>
						<li role="presentation">
							<a href="#at_m_edt" aria-controls="at_m_edt" role="tab" data-toggle="tab">æ°å¢ä¸ä¸</a>
						</li>
						
						<li role="presentation">
							<a href="#at_c_update" aria-controls="at_c_update" role="tab" data-toggle="tab">ç­çº§æ¥å </a>
						</li>
					</ul>

					<!--
                    	ä½èï¼offline
                    	æ¶é´ï¼2019-10-22
                    	æè¿°ï¼ç¨æ·å¯¼å¥æ¨¡åï¼æ­¤æ¨¡åçidæå¥½ä¸å¯æ¹ï¼å¦åè¦èåæ¹ä¸é¢çï¼
                    -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="at_import">
							<div id="batch">
								<h2>ä»Excelæ¹éå¯¼å¥å¯æ³¨åç¨æ·:</h2>
								<form>
									<div class="form-group">
										<label for="exampleInputFile">File input</label>
										<input type="file" id="exampleInputFile" accept="application/msexcel">
										<p class="help-block">
											<font color="red">*æ³¨æ:Excelåå®¹å¡å¿ä¸æ°æ®åºå­æ®µè¡¨ä¿æä¸è´ï¼å¦ä¸å¾</font>
										</p>
										<img src="../img/example.png" />
									</div>
									<button type="submit" class="btn btn-default">æäº¤</button>
								</form>
								<hr />
								<h3>åä¸ªå¯¼å¥å¯æ³¨åç¨æ·:</h3>
								<form>
									<div class="form-group">
										<label for="exampleInputID">å­¦å·</label>
										<input type="text" class="form-control" id="exampleInputID" placeholder="å­¦å·" style="width: 300px;">
									</div>
									<div class="form-group">
										<label for="exampleInputName">å§å</label>
										<input type="text" class="form-control" id="exampleInputName" placeholder="å§å" style="width: 300px;">
									</div>
									<div class="form-group">
										<label for="exampleInputCode">éè¯·ç </label>
										<input type="text" class="form-control" id="exampleInputCode" placeholder="éè¯·ç " style="width: 300px;">
										<button type="button" class="btn btn-default">èªå¨çæ</button>
										
									</div>

									<button type="submit" class="btn btn-default">æäº¤</button>
								</form>
							</div>
						</div>

						<!--
                        	ä½èï¼offline
                        	æ¶é´ï¼2019-10-22
                        	æè¿°ï¼ç¨æ·æ¥å 
                        -->

						<div role="tabpanel" class="tab-pane" id="at_update">
							<br />
							<div id="search">
								<form class="navbar-form navbar-left" role="search">
									<div class="form-group">
										<input type="radio" name="search_type" id="search_type" value="0" />éè¿å§å
										<input type="radio" name="search_type" id="search_type" value="1" />éè¿å­¦å·
										<input type="text" class="form-control" id="exampleInput" placeholder="å§å/å­¦å·" style="width: 300px;">
									</div>
									<button type="submit" class="btn btn-default">æç´¢</button><br />
									<span id="sp">
										æ¥æ æ­¤äºº
									</span>
								</form>

							</div><br /><br />
							<hr />
							<div id="search_panle">
								<div id="search_data">
									<table class="table table-hover">
 										<tr>
 											<td>å­¦å·</td>
 											<td>å§å</td>
 											<td>æ§å«</td>
 											<td>ä¸ä¸</td>
 											<td>æä½</td>
 										</tr>
 										<tr>
 											<td>1111111111</td>
 											<td>XXX</td>
 											<td>ç·</td>
 											<td>è½¯ä»¶å·¥ç¨</td>
 											<td><a href="">å»ç»</a>/<a href="">æ¢å¤</a></td>
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
						
						
						
						<!--
                        	ä½èï¼offline
                        	æ¶é´ï¼2019-10-22
                        	æè¿°ï¼æç»©å¯¼åº
                        -->
						<div role="tabpanel" class="tab-pane" id="at_export">
							<div id="altent">
								<h2>æ³¨æ:</h2>
								<p>*è¾å¥å¯¹åºçè¯å·ç¼å·ä»¥æ¥çææåä¸è¿å¼ è¯å·ä½ç­çç¨æ·æç»©</p>
								<p>*å¦æä½ ä¸ç¥éè¯å·ç¼å·ï¼è¯·ä¸ç¼çºè¿å¼ è¯å·çæå¸åå¾èç³»</p>
								<p>*é»è®¤å¯¼åºæ ¼å¼ä¸ºå­¦å·+å§å+ä¸ä¸+ç§ç®+æç»©ï¼æä»¶åç¼ä¸º.xlsx</p>
							</div>
							<hr />
							<div id="ex">
								<form class="navbar-form navbar-left" role="search">
									<div class="form-group">
										<input type="text" class="form-control" id="exampleExport" placeholder="è¯å·ç¼å·" style="width: 300px;">
									</div>
									<button type="submit" class="btn btn-default">çæ</button><br />
									<span id="sp">
										æ¥æ æ­¤è¯å·
									</span>
								</form>
							</div>
						</div>
						<!--
                        	ä½èï¼offline
                        	æ¶é´ï¼2019-10-22
                        	æè¿°ï¼é¢åºæ¥å 
                        -->
						<div role="tabpanel" class="tab-pane" id="at_ib_update">
							<br />
							<div id="search">
								<form class="navbar-form navbar-left" role="search">
									<div class="form-group">
										<input type="radio" name="search_type" id="search_type" value="0" />éè¿æå¸åå­
										<input type="radio" name="search_type" id="search_type" value="1" />éè¿é¢åºåå­
										<input type="radio" name="search_type" id="search_type" value="2" />éè¿ä¸ä¸åå­
										<input type="text" class="form-control" id="exampleInput" placeholder="å§å/å­¦å·" style="width: 300px;">
									</div>
									<button type="submit" class="btn btn-default">æç´¢</button><br />
									<span id="sp">
										æ¥æ æ­¤åº
									</span>
								</form>

							</div><br /><br />
							<hr />
							<div id="search_panle">
								<div id="search_data">
									<table class="table table-hover">
 										<tr>
 											<td>é¢åºå·</td>
 											<td>é¢åºå</td>
 											<td>æå¸</td>
 											<td>ç§ç®</td>
 											<td>æä½</td>
 										</tr>
 										<tr>
 											<td>1111111111</td>
 											<td>XXX</td>
 											<td>é«ç­æ°å­¦IIå¼ºåç»ä¹ </td>
 											<td>æ°å­¦</td>
 											<td><a href="">å»ç»</a>/<a href="">æ¢å¤</a></td>
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
						
						
						<!--
                        	ä½èï¼offline
                        	æ¶é´ï¼2019-10-22
                        	æè¿°ï¼æ°å¢ä¸ä¸
                        -->
						
						<div role="tabpanel" class="tab-pane" id="at_m_edt">
							<div id="m_add">
								<form>
									<div class="form-group">
										<p class="help-block">*ä¸ä¸ç¼å·èªå¨çæ</p>
										<label for="exampleInputName">ä¸ä¸å</label>
										<input type="text" class="form-control" id="exampleInputName" placeholder="ä¸ä¸å" style="width: 300px;">
										<span style="color: red;">è¯¥ä¸ä¸å·²å­å¨</span>
									</div>
									<button type="submit" class="btn btn-default">æäº¤</button>
								</form>
							</div>
							<hr />
							<div id="m_update">
								<div id="m_search">
								<form class="navbar-form navbar-left" role="search">
									<div class="form-group">
										<input type="radio" name="search_type" id="search_type" value="0" />éè¿ä¸ä¸å
										<input type="radio" name="search_type" id="search_type" value="1" />éè¿ä¸ä¸å·
										<input type="text" class="form-control" id="exampleInput" placeholder="ä¸ä¸å·/ä¸ä¸å" style="width: 300px;">
									</div>
									<button type="submit" class="btn btn-default">æç´¢</button><br />
									<span id="sp">
										æ¥æ æ­¤ä¸ä¸
									</span>
								</form>

							</div><br /><br />
								<div id="search_panle">
								<div id="search_data">
									<table class="table table-hover">
 										<tr>
 											<td>ä¸ä¸å·</td>
 											<td>ä¸ä¸å</td>
 											<td>æä½</td>
 										</tr>
 										<tr>
 											<td>1111111111</td>
 											<td>XXX</td>
 											<td><a href="">å»ç»</a>/<a href="">æ¢å¤</a></td>
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

						<div role="tabpanel" class="tab-pane" id="at_c_update">
							<div id="c_update">
								<div id="c_search">
								<form class="navbar-form navbar-left" role="search">
									<div class="form-group">
										<input type="radio" name="search_type" id="search_type" value="0" />éè¿ç­çº§å
										<input type="radio" name="search_type" id="search_type" value="1" />éè¿ç­çº§å·
										<input type="radio" name="search_type" id="search_type" value="2" />éè¿æå¸å
										<input type="text" class="form-control" id="exampleInput" placeholder="ç­çº§å·/ç­çº§å" style="width: 300px;">
									</div>
									<button type="submit" class="btn btn-default">æç´¢</button><br />
									<span id="sp">
										æ¥æ æ­¤ç­çº§
									</span>
								</form>

							</div><br /><br />
								<div id="search_panle">
								<div id="search_data">
									<table class="table table-hover">
 										<tr>
 											<td>ç­çº§å·</td>
 											<td>ç­çº§å</td>
 											<td>ç­ä»»æå¸</td>
 											<td>äººæ°</td>
 											<td>æä½</td>
 										</tr>
 										<tr>
 											<td>1111111111</td>
 											<td>17è½¯å·¥é«æ°Iç­</td>
 											<td>XXX</td>
 											<td>44</td>
 											<td><a href="">å»ç»</a>/<a href="">æ¢å¤</a></td>
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

			</div>

		</div>

		<!--
        	ä½èï¼offline
        	æ¶é´ï¼2019-10-21
        	æè¿°ï¼ces
        -->

	</body>

</html>