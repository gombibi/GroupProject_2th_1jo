<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<!-- META DATA -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!--font-family-->
<link href="https://fonts.googleapis.com/css?family=Rufina:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet" />
<!-- TITLE OF SITE -->
<title>Travel</title>
<!-- favicon img -->
<link rel="shortcut icon" type="image/icon" href="logo/favicon.png" />
<!--font-awesome.min.css-->
<link rel="stylesheet" href="css/font-awesome.min.css" />
<!--animate.css-->
<link rel="stylesheet" href="css/animate.css" />
<!--hover.css-->
<link rel="stylesheet" href="css/hover-min.css">
<!-- range css-->
<link rel="stylesheet" href="css/jquery-ui.min.css" />
<!--bootstrap.min.css-->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<!-- bootsnav -->
<link rel="stylesheet" href="css/bootsnav.css" />
<!--style.css-->
<link rel="stylesheet" href="css/style.css" />
<!--responsive.css-->
<link rel="stylesheet" href="css/responsive.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100,300,400,500,700,900"
	rel="stylesheet" />
	
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
</style>

<style type="text/css">

#reveiwBoardListContainer {
	padding-top: 100px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	font-family: 'Noto Sans KR', sans-serif;
}

h1{
font-family: 'jua';
}

#reveiwBoardListContainer > table{
  width:100%;
}

#reviewboard {
    width: 1000px;
    border-collapse:collapse;
}

#reviewboard_header {
  background:#00d8d5;
  color:white;
}

#reviewboard_body {
    border-collapse:collapse;
}

th,td{
  padding: 5px;
}

#reviewboard > tbody tr:hover:not(#reviewboard_header):not(#review_write_btn) {
	background: whitesmoke;
	color:#00d8d5;
}
</style>

</head>
<body>
	<c:set var="pagesize" value="${requestScope.pagesize}"></c:set>
	<c:set var="cpage" value="${requestScope.cpage}"></c:set>
	<c:set var="pagecount" value="${requestScope.pagecount}"></c:set>
	<c:set var="list" value="${requestScope.list}"></c:set>
	<c:set var="totalboardcount" value="${requestScope.totalboardcount}"></c:set>
	<c:set var="pager" value="${requestScope.pager}"></c:set>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div id="reveiwBoardListContainer">
		<h1>리뷰 게시판</h1>
		<h3>리뷰를 써주세요 어쩌구</h3>
		<div style="text-align: center">
			<table id="reviewboard" align="center">
				<tr id="review_write_btn">
					<td colspan="4" align="center"></td>
					<td colspan="1" align="center">총 게시물 수 : ${totalboardcount}</td>
				</tr>
				<tr id = "reviewboard_header">
					<td width="10%">글번호</td>
					<td>리뷰</td>
					<td width="15%">닉네임</td>
					<td width="15%">평가</td>
					<td width="15%">작성일</td>
				</tr>
				<!-- 데이터가 한건도 없는 경우  -->

				<!-- forEach()  목록 출력하기  -->
				<c:forEach var="board" items="${list}">
					<tr id = "reviewboard_body">
						<td align="center">${board.rbnum}</td>
						<td align="left"><c:forEach var="i" begin="1"
								end="${board.depth}" step="1">
									&nbsp;&nbsp;&nbsp;
								</c:forEach> <c:if test="${board.depth > 0}">
								<img src="">
								<!-- 들여쓰기아이콘넣기 -->
							</c:if> <a
							href="ReviewBoardContent.bd?idx=${board.rbnum}&cp=${cpage}&ps=${pagesize}">
								${board.rbsubj} </a></td>
						<td align="center">${board.email}</td>
						<td align="center">
						<c:if test="${board.point == 5}"> 💙💙💙💙💙 </c:if>
						<c:if test="${board.point == 4}"> 💙💙💙💙🤍 </c:if>
						<c:if test="${board.point == 3}"> 💙💙💙🤍🤍 </c:if>
						<c:if test="${board.point == 2}"> 💙💙🤍🤍🤍 </c:if>
						<c:if test="${board.point == 1}"> 💙🤍🤍🤍🤍 </c:if>
						</td>
						<td align="center">${board.rbdate}</td>
					</tr>
				</c:forEach>

				<tr id="review_write_btn">
					<td colspan="5" align="center">${pager}</td>
				</tr>
				<tr id="review_write_btn">
					<td colspan="4"></td>
					<td colspan="1" align="center">
						<button type="submit" class="about-view packages-btn"
							onclick="location.href = 'ReviewBoardWrite.bd';">글쓰기</button>
					</td>
				</tr>
			</table>
		</div>
	</div>



</body>
</html>