<%@page import="kr.dogcat.dao.MemberDao"%>
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
<title>PhotoGallery List</title>

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

<!--reviewboard.css-->
<link rel="stylesheet" href="css/reviewboard.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
<body>
	<table>
		<tr>
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</tr>
		<tr>
			<!-- 포토갤러리 게시판 리스트 -->
			<c:set var="pagesize" value="${requestScope.pagesize}"></c:set>
			<c:set var="cpage" value="${requestScope.cpage}"></c:set>
			<c:set var="pagecount" value="${requestScope.pagecount}"></c:set>
			<c:set var="list" value="${requestScope.list}"></c:set>
			<c:set var="totalboardcount" value="${requestScope.totalboardcount}"></c:set>
			<c:set var="pager" value="${requestScope.pager}"></c:set>

			<div id="reveiwBoardListContainer">
				<h1>Photo Gallery</h1>

				<table>
					<tr>

						<c:forEach var="item" items="${list}">
							<td><a href="PboardContent.pg?pbnum=${item.pbnum}&cp=1&ps=5">
									<img alt="" src="upload/${item.pfilename}"
									style="width: 100px; height: 100px"><br>
									${item.pbsubj} <input type="button" id="heart" name="heart" value="♥${item.heart}"><br>
							</a></td>
						</c:forEach>
					</tr>
					<tr>
						<td colspan="5"><a href="PboardWrite.pg">글쓰기</a></td>
					</tr>
				</table>
			</div>
		</tr>
	</table>
</body>
</html>