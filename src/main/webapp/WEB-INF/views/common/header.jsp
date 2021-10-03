<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- main-menu Start -->
		<header class="top-area">
			<div class="header-area">
				<div class="container">
					<div class="row">
						<div class="col-sm-2">
							<div class="logo">
								<a href="index.jsp">
									돌봐줄<span>개</span>냥
								</a>
							</div><!-- /.logo-->
						</div><!-- /.col-->
						<div class="col-sm-10">
							<div class="main-menu">
							
								<!-- Brand and toggle get grouped for better mobile display -->
								<div class="navbar-header">
									<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
										<i class="fa fa-bars"></i>
									</button><!-- / button-->
								</div><!-- /.navbar-header-->
								<div class="collapse navbar-collapse">		  
									<ul class="nav navbar-nav navbar-right">
										<li class="smooth-menu"><a href="#">시터리스트</a></li>
										<li class="smooth-menu"><a href="PboardList.pg">포토갤러리</a></li>
										<li class="smooth-menu"><a href="#">리뷰</a></li>
										
										<c:set var="usernic" value="${loginUser.mnic}"/> <!-- sessionScope 생략 -->
											<c:choose>
												<c:when test="${usernic!=null}">
													<b>${usernic}</b> 로그인 상태
												</c:when>
												<c:otherwise>
													<b>로그인 하지 않으셨네요</b>
												</c:otherwise>
											</c:choose>
											
										<li>
											<form action="Login_temp.jsp" method=""><button class="book-btn">Login </button></form>
										</li><!--/.project-btn--> 
										<li>
											<form action="joinform.jsp" method=""><button class="book-btn">sing up </button></form>
										</li>
									</ul>
								</div><!-- /.navbar-collapse -->
							</div><!-- /.main-menu-->
						</div><!-- /.col-->
					</div><!-- /.row -->
					<div class="home-border"></div><!-- /.home-border-->
				</div><!-- /.container-->
			</div><!-- /.header-area -->

		</header><!-- /.top-area-->
		<!-- main-menu End -->
