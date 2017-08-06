<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="/web/css/sb-admin.css" rel="stylesheet">
<link href="/web/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="/web/js/bootstrap.min.js"></script>
<script src ="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/none.js"></script>
<title>����� ������</title>
</head>
<script>
	$(function() {
		$("button#monthly").click(function() {
			$.ajax({
				url : "chart/monthlySales.jsp",
				type : "POST",
				dataType : "html",
				beforeSend : function() {
					$("div#mainDiv").html("<div style=\"text-align:center;\"><img src=\"/baegopangAdmin/img/loading.gif\" width=\"50\" height=\"50\"/></div>");
				},
				success : function(data) {
					$("div#mainDiv").html(data);
				},
				error : function(request, status, error) {
					alert("code:" + request.status
							+ "\n" + "message:"
							+ request.responseText
							+ "\n" + "error:" + error);
				}
			});
		});
		$("button#weekly").click(function() {
			$.ajax({
				url : "chart/weeklySales.jsp",
				type : "POST",
				dataType : "html",
				beforeSend : function() {
					$("div#mainDiv").html("<div style=\"text-align:center;\"><img src=\"/baegopangAdmin/img/loading.gif\" width=\"50\" height=\"50\"/></div>");
				},
				success : function(data) {
					$("div#mainDiv").html(data);
				},
				error : function(request, status, error) {
					alert("code:" + request.status
							+ "\n" + "message:"
							+ request.responseText
							+ "\n" + "error:" + error);
				}
			});
		});
		$("button#genderly").click(function() {
			$.ajax({
				url : "chart/genderSales.jsp",
				type : "POST",
				dataType : "html",
				beforeSend : function() {
					$("div#mainDiv").html("<div style=\"text-align:center;\"><img src=\"/baegopangAdmin/img/loading.gif\" width=\"50\" height=\"50\"/></div>");
				},
				success : function(data) {
					$("div#mainDiv").html(data);
				},
				error : function(request, status, error) {
					alert("code:" + request.status
							+ "\n" + "message:"
							+ request.responseText
							+ "\n" + "error:" + error);
				}
			});
		});
	});
</script>
<body>
	<div id="wrapper">

		<jsp:include page="include/bar.jsp" />

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Chart <small>ȯ���մϴ� ${id}��
							</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<button type="button" class="btn btn-default" id="monthly">�������</button>
						<button type="button" class="btn btn-default" id="weekly">���Ϻ������</button>
						<button type="button" class="btn btn-default" id="genderly">�����������</button>
					</div>
				</div>
				
				<br>
				
				<!-- �Ϻ� �� ����� �׷��� -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-bar-chart-o fa-fw"></i> chart
								</h3>
							</div>
							<div class="panel-body" id="mainDiv">
								
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->



			</div>
			<!-- /.row -->

		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>
</html>