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
div#innerDiv {
	width: 50%;
	margin: 0 auto;
}
</style>
<script>
	$(function() {
		$("button#insertBrand").click(function(){
			$("form#frm").submit();
		});
	})
</script>
<body>
	<div id="wrapper">
		<jsp:include page="../include/bar.jsp" />

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							미지정 음식점 추가 <small>환영합니다 ${id}님
							</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<h2>미지정 음식점 추가</h2>

						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">
											<i class="fa fa-long-arrow-right fa-fw"></i> 추가
										</h3>
									</div>
									<div class="panel-body">
										<div id="innerDiv">
											<form action="unSelectedStoreInsertProcess.do" method="post" id="frm">
												<div class="col-lg-12">
													<div class="form-group">
														<select name="brandname" class="form-control" id="selectBn">
															<option value="empty" selected="selected">선택하세요</option>
																<c:forEach var="i" items="${brandName}">
																	<option value="${i.brandno}_${i.brandname}">${i.brandname}</option>
																</c:forEach>
															</select>
														<p class="help-block">브랜드를 선택하세요.</p>
													</div>
												</div>
												
												<div class="col-lg-12">
													<input type="text" class="form-control" name="storename">
													<p class="help-block">가게 이름을 입력하세요.</p>
												</div>
												
												<div class="col-lg-12">
													<input type="text" class="form-control" name="location">
													<p class="help-block">위치를 입력하세요.</p>
												</div>
												
												<div class="col-lg-12">
													<input type="text" class="form-control" name="tel">
													<p class="help-block">전화번호를 입력하세요.</p>
												</div>
												
												<div class="col-lg-12">
													<div class="form-group">
														<input type="text" class="form-control" name="minprice">
														<p class="help-block">배달 최소 가격을 입력하세요.</p>
													</div>
												</div>
												
												<div class="col-lg-12">
													<div class="form-group">
														<textarea rows="6" class="form-control" name="info"></textarea>
														<p class="help-block">매장 정보를 입력하세요.</p>
													</div>
												</div>
												
												<div class="col-lg-12">
													<button type="button" class="btn btn-sm btn-primary" id="insertBrand">추가</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
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