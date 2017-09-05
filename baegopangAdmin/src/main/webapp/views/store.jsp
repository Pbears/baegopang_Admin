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
div.divInfo {
    white-space: nowrap; 
    width: 45em; 
    overflow: hidden;
    text-overflow: ellipsis; 
}
div.divLocation {
	white-space: nowrap; 
    width: 15em; 
    overflow: hidden;
    text-overflow: ellipsis; 
}
</style>
<script>
$(function(){
	$("button.storeDeleteBtn").click(function(){
		alert("삭제!");
	});
});
</script>
<body>
	<div id="wrapper">
		<jsp:include page="include/bar.jsp"/>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Store <small>환영합니다 ${id }님</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->
				
				<div class="row">
                    <div class="col-lg-12">
                        <h2>Store List</h2>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    	<tr>
                                    		<td class="headTd" width="15%">음식점이름</td>
                                        	<td class="headTd" width="10%">브랜드번호</td>
                                        	<td class="headTd" width="10%">위치</td>
                                        	<td class="headTd" width="5%">평점</td>
                                        	<td class="headTd" width="10%">영업시간</td>
                                        	<td class="headTd" width="10%">전화번호</td>
                                        	<td class="headTd" width="10%">최저배달가격</td>
                                        	<td class="headTd" width="30%">정보</td>
									</tr>
								</thead>
								<tbody>
                                		<c:forEach var="i" items="${list}">	
	                                    	<tr>
	    	                                    	<td>${i.storename}</td>
	    	                                    	<td>${i.brandno}</td>
	    	                                    	<td><div class="divLocation">${i.location}</div></td>
	    	                                    	<td>${i.gpa}</td>
	    	                                    	<td>${i.hours}</td>
	    	                                    	<td>${i.tel}</td>
	    	                                    	<td>${i.minprice}</td>
											<td><div class="divInfo">${i.info}</div></td>
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
												<a href="store.do?pages=${pageBean.currentPage-1}">Previous</a>
											</li>
										</c:when>
									</c:choose>
									
									<span> 
										<c:forEach var="i" begin="${pageBean.startPage}" end="${pageBean.endPage}" step="1">
											<c:choose>
												<c:when test="${pageBean.currentPage == i}">
													<li>
								 						<a href="store.do?pages=${i}"><strong>${i}</strong></a>
								 					</li>
												</c:when>
												<c:otherwise>
													<li>
								 						<a href="store.do?pages=${i}">${i}</a>
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
												<a href="store.do?pages=${pageBean.currentPage+1}">Next</a>
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