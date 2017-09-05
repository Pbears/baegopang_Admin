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
<script>
$(function(){
	$("tr.requestTr").hide();
	$("button.btn-primary").click(function(){
		var id = $(this).parent().parent().prev().find('.tdId').text()
		var pw = $(this).parent().parent().prev().find('.tdPw').text()
		var name = $(this).parent().parent().prev().find('.tdName').text()
		var address = $(this).parent().parent().prev().find('.tdAddress').text()
		var tel = $(this).parent().parent().prev().find('.tdTel').text()
		var birth = $(this).parent().parent().prev().find('.tdBirth').text()
		var storename = $(this).parent().prev().children().val();
		
		var result = confirm('승인할 정보가 맞습니까?\n\n'+'   id : '+id+'\n   pw : '+pw+'\n   name : '+name
				+'\n   address : '+address+'\n   tel : '+tel+'\n   birth : '+birth+'\n   storename : '+storename);
		if(result) { 
			location.href="masterInsert.do?id="+id+
					"&pw="+pw+"&name="+name+"&address="+address+"&tel="+tel+"&birth="+birth+"&storename="+storename;
		}
		
	});
	$("button.btn-danger").click(function(){
		var result = confirm('정말 삭제하시겠습니까?');
		if(result) { 
			location.href="masterInsertRequestNegative.do?id="+$(this).attr("id");
		}
	});
	$("tr.ttr").click(function(){
		$(this).next().toggle(500);
	});
})
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
							사장 가입 요청 <small>환영합니다 ${id}님
							</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<h2>사장님 가입 요청 목록</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<td class="headTd" width="10%">아이디</td>
										<td class="headTd" width="10%">비밀번호</td>
										<td class="headTd" width="5%">이름</td>
										<td class="headTd" width="40%">주소</td>
										<td class="headTd" width="10%">전화번호</td>
										<td class="headTd" width="5%">생년월일</td>
										<td class="headTd" width="15%">음식점이름</td>
										<td class="headTd" width="5%">포인트</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="i" items="${list}">
										<tr class="ttr">
											<td class="tdId">${i.id}</td>
											<td class="tdPw">${i.pw}</td>
											<td class="tdName">${i.name}</td>
											<td class="tdAddress">${i.address}</td>
											<td class="tdTel">${i.tel}</td>
											<td class="tdBirth">${i.birth}</td>
											<td class="tdStoreName">${i.storename}</td>
											<td class="tdPoint">${i.point}</td>
										</tr>
										<tr class="requestTr">
											<td colspan="4">
												<select class="form-control">
													<option value="empty" selected="selected">선택하세요</option>
													<c:forEach var="i" items="${unStoreNameList}">
														<option value="${i.storename}">${i.storename}</option>
													</c:forEach>
												</select>
											</td>
											<td colspan="3">
												<button type="button" class="btn btn-sm btn-primary">승인</button>
												<button type="button" class="btn btn-sm btn-danger" id="${i.id}">거절</button>	
											</td>
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
												<a href="requestSign.do?pages=${pageBean.currentPage-1}">Previous</a>
											</li>
										</c:when>
									</c:choose>
									
									<span> 
										<c:forEach var="i" begin="${pageBean.startPage}" end="${pageBean.endPage}" step="1">
											<c:choose>
												<c:when test="${pageBean.currentPage == i}">
													<li>
								 						<a href="requestSign.do?pages=${i}"><strong>${i}</strong></a>
								 					</li>
												</c:when>
												<c:otherwise>
													<li>
								 						<a href="requestSign.do?pages=${i}">${i}</a>
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
												<a href="requestSign.do?pages=${pageBean.currentPage+1}">Next</a>
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