<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>배고팡 관리자</title>
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
</head>
<style>
div.innerDiv {
	width: 60%;
	margin: 0 auto;
}
div.innerInnerDiv {
	padding: 20px;
}
textarea {
	resize: none;
}
</style>
<script>
	$(function() {
	});
</script>
<body>
	<%
		String id = (String) session.getAttribute("id");
	%>
	<div id="wrapper">
		<jsp:include page="../include/bar.jsp" />

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							공지사항 <small>환영합니다 ${id}</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<form action="noticeInsertProcess.do" method="post" name="insertFrm">
						<div class="innerDiv">
							<div class="form-group innerInnerDiv col-lg-12">
								<h2>공지사항 등록하기</h2>
							</div>

							<div class="form-group innerInnerDiv">
								<label>제목</label> <input class="form-control" name="title">
							</div>

							<div class="form-group innerInnerDiv">
								<label>내용</label>
								<textarea class="form-control" rows="25" name="info"></textarea>
							</div>

							<div class="form-group innerInnerDiv">
								<button type="submit" class="btn btn-default">등록</button>
								<button type="reset" class="btn btn-primary">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>
</html>