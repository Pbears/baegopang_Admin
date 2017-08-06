<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
tr {
	height: 50px;
}

td {
	text-align: center;
	vertical-align: middle;
}

td.headTd {
	font-weight: bold;
	font-size: medium;
}

table {
	font-size: small;
}

div.storeInsertDiv {
	width: 100%;
	text-align: right;
}
div.answerDiv {
	width: 100%;
}
button.answerInsertBtn{
	width: 100px;
	height: 70px;
}
button.questionDeleteBtn{
	width: 100px;
}
textarea{
	resize: none;
}
</style>
<script>
	$(function() {
		$("tr.answerTr, .completeAnswer").hide();
		$("button.answerInsertBtn").click(function() {
			$("form[id='"+$(this).attr("id")+"']").submit();
		});
		$("button.questionDeleteBtn").click(function() {
			alert("삭제!");
		});
		$("tr.QeustionTr, .completeTr").click(function(){
			$(this).next().toggle(500);
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
							Question & Answer <small>환영합니다 ${id}</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<h2>Question List</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<td class="headTd" width="10%">번호</td>
										<td class="headTd" width="10%">질문자</td>
										<td class="headTd" width="20%">제목</td>
										<td class="headTd" width="30%">내용</td>
										<td class="headTd" width="10%">응답자</td>
										<td class="headTd" width="10%">등록일</td>
										<td class="headTd" width="10%">상태</td>
									</tr>
								</thead>
								<tbody>
									<tr class="QeustionTr">
										<td>1</td>
										<td>1</td>
										<td>1</td>
										<td>1</td>
										<td>1</td>
										<td>1</td>
										<td><button type="button" class="btn btn-sm btn-danger" disabled="disabled">답변요망</button></td>
									</tr>
									<tr class="answerTr">
										<td colspan="6">
											<form action="/baegopangAdmin/jsp/masterAskAdmin/insert.jsp" method="post">
												<textarea class="form-control answerTextArea" rows="3" name="answer"></textarea>
												<input type="hidden" name="no">
											</form>
										</td>
										<td colspan="1">
											<button type="button" class="btn btn-sm btn-primary answerInsertBtn">답변</button>
										</td>
									</tr>
									
									<tr class="completeTr">
										<td>2</td>
										<td>2</td>
										<td>2</td>
										<td>2</td>
										<td>2</td>
										<td>2</td>
										<td><button type="button" class="btn btn-sm btn-primary" disabled="disabled">답변완료</button></td>
									</tr>
									<tr class="completeAnswer">
										<td colspan="7">1</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					 <!-- 페이지이동페이징 -->
					<div class="col-lg-12">
						<div id="pagerDiv"
							style="width: 100%; margin: 0 auto; text-align: center;">
							<ul class="pagination">
								<ul class="pager">
									<li>
										<a href="#">Previous</a>
									</li>
									<span> 
					 					<li>
					 						<a href="#"><strong>1</strong></a>
					 					</li> 
					 					<li>
					 						<a href="#"><strong>1</strong></a>
					 					</li> 
					 					<li>
					 						<a href="#"><strong>1</strong></a>
					 					</li> 
									</span>
									<li>
										<a href="#">Next</a>
									</li>
								</ul>
							</ul>
						</div>
					</div>
					
					
					
					
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- /#page-wrapper -->

		</div>
		<!-- /#wrapper -->
</body>
</html>