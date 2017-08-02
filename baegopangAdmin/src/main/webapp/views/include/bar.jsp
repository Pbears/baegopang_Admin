<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> 
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">Baegopang Admin</a>
	</div>

	<!-- Top Menu Items -->
	<ul class="nav navbar-right top-nav">
		<!-- 내정보창 -->
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<i class="fa fa-user"></i> ${id}
				<b class="caret"></b>
			</a>
			<ul class="dropdown-menu">
				<li>
					<a href="/web/logout.do">
						<i class="fa fa-fw fa-power-off"></i> 로그아웃
					</a>
				</li>
			</ul>
		</li>
	</ul>

	<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">
			<li>
				<a href="#">
					<i class="fa fa-fw fa-dashboard"></i> 홈
				</a>
			</li>
			<li>
				<a href="#">
					<i class="fa fa-fw fa-bar-chart-o"></i> 그래프
				</a>
			</li>
			<li>
				<a href="#" data-toggle="collapse" data-target="#demo">
					<i class="fa fa-fw fa-table"></i> 테이블 관리 
					<i class="fa fa-fw fa-caret-down"></i>
				</a>
				<ul id="demo" class="collapse">
					<li>
						<a href="#">
							<i class="fa fa-fw fa-table"></i> 브랜드
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-fw fa-table"></i> 사장
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-fw fa-table"></i> 가입요청
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-fw fa-table"></i> 탈퇴요청
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-fw fa-table"></i> 사용자
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-fw fa-table"></i> 메뉴
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-fw fa-table"></i> 주문배달완료
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-fw fa-table"></i> 주문승인대기
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-fw fa-table"></i> 주문배달중
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-fw fa-table"></i> 주문승인거절
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-fw fa-table"></i> 음식점
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-fw fa-table"></i> 미선택음식점
						</a>
					</li>
				</ul>
			</li>
			<li>
            	<a href="#">
            		<i class="fa fa-fw fa-edit"></i> 공지사항
            	</a>
            </li>
            <li>
				<a href="#">
					<i class="fa fa-fw fa-edit"></i> 문의
				</a>
			</li>
		</ul>
	</div>
	<!-- /.navbar-collapse --> 
</nav>
