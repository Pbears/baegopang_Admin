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
</style>
<body>
	<div id="wrapper">
		<jsp:include page="include/bar.jsp" />

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							회원 <small>환영합니다 ${id}님</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<h2>회원 목록</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<td class="headTd" width="15%">아이디</td>
										<td class="headTd" width="10%">이름</td>
										<td class="headTd" width="35%">주소</td>
										<td class="headTd" width="10%">성별</td>
										<td class="headTd" width="10%">전화번호</td>
										<td class="headTd" width="10%">생년월일</td>
										<td class="headTd" width="10%">팡</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="i" items="${list}">
										<tr>
											<td>${i.id}</td>
											<td>${i.name}</td>
											<td>${i.address}</td>
											<td>${i.gender}</td>
											<td>${i.tel}</td>
											<td>${i.birth}</td>
											<td>${i.pang}</td>
										</tr>
									</c:forEach>
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
									<c:choose>
										<c:when test="${pageBean.currentPage == 1}">
											<li>
												<a href="#">Previous</a>
											</li>
										</c:when>
										<c:when test="${pageBean.currentPage <= pageBean.totalPage}">
											<li>
												<a href="member.do?pages=${pageBean.currentPage-1}">Previous</a>
											</li>
										</c:when>
									</c:choose>
									
									<span> 
										<c:forEach var="i" begin="${pageBean.startPage}" end="${pageBean.endPage}" step="1">
											<c:choose>
												<c:when test="${pageBean.currentPage == i}">
													<li>
								 						<a href="member.do?pages=${i}"><strong>${i}</strong></a>
								 					</li>
												</c:when>
												<c:otherwise>
													<li>
								 						<a href="member.do?pages=${i}">${i}</a>
								 					</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</span>
									
									<c:choose>
										<c:when test="${pageBean.currentPage == pageBean.totalPage}">
											<li>
												<a href="#">Next</a>
											</li>
										</c:when>
										<c:when test="${pageBean.currentPage < pageBean.totalPage}">
											<li>
												<a href="member.do?pages=${pageBean.currentPage+1}">Next</a>
											</li>
										</c:when>
									</c:choose>
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