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
table{
	font-size: small;
}
div .divAddress, .divMenuName{
	white-space: nowrap; 
    width: 15em; 
    overflow: hidden;
    text-overflow: ellipsis; 
}	
</style>
<script>
$(function(){

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
							승인대기 <small>환영합니다 ${id }님</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<h2>OrderConfirmWait List</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<td class="headTd" width="15%">주문번호</td>
										<td class="headTd" width="10%">주문자ID</td>
										<td class="headTd" width="5%">이름</td>
										<td class="headTd" width="10%">주문자전화번호</td>
										<td class="headTd" width="10%">주문자주소</td>
										<td class="headTd" width="5%">가격</td>
										<td class="headTd" width="10%">메뉴이름</td>
										<td class="headTd" width="5%">수량</td>
										<td class="headTd" width="10%">음식점이름</td>
										<td class="headTd" width="10%">음식점전화번호</td>
										<td class="headTd" width="5%">주문시간</td>
										<td class="headTd" width="5%">상태</td>
									</tr>
								</thead>
								<tbody>
								
									<tr class="orderTr">
										<td id="orderNumber">11</td>
										<td>1</td>
										<td>1</td>
										<td>1</td>
										<td><div class="divAddress">1</div></td>
										<td>1</td>
										<td><div class="divMenuName">1</div></td>
										<td>1</td>
										<td>1</td>
										<td>1</td>
										<td>1</td>
										<td>1</td>
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
					 						<a href="#"><strong>2</strong></a>
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