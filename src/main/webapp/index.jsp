<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div id="header">
            <div class="title">
                <a href="${pageContext.request.contextPath}">DEMO WEBSITE</a>
            </div>
            <div class="links">
                <a href="#">${pageContext.request.contextPath}</a>
                <a href="#">추후등록</a>
                <a href="#">추후로그아웃</a>

            </div>
        </div>        
        <div id="menu">
            <div>
                <ul>
                	<!-- a : 페이지 이동을 처리하는 마크업 -->
                    <li><a href="${pageContext.request.contextPath}/BoardList.do">BOARD LIST</a></li>
					<li><a href="${pageContext.request.contextPath}/BoardWrite.do">BOARD WRITE</a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
                </ul>
            </div>
        </div>

</body>
</html>