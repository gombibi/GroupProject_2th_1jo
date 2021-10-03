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
		<link href="https://fonts.googleapis.com/css?family=Rufina:400,700" rel="stylesheet" />

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet" />

		<!-- TITLE OF SITE -->
		<title>PhotoGallery Content</title>

		<!-- favicon img -->
		<link rel="shortcut icon" type="image/icon" href="logo/favicon.png"/>

		<!--font-awesome.min.css-->
		<link rel="stylesheet" href="css/font-awesome.min.css" />

		<!--animate.css-->
		<link rel="stylesheet" href="css/animate.css" />

		<!--hover.css-->
		<link rel="stylesheet" href="css/hover-min.css">

		<!--datepicker.css-->
		<link rel="stylesheet"  href="css/datepicker.css" >

		<!--owl.carousel.css-->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
		<link rel="stylesheet" href="css/owl.theme.default.min.css"/>

		<!-- range css-->
        <link rel="stylesheet" href="css/jquery-ui.min.css" />

		<!--bootstrap.min.css-->
		<link rel="stylesheet" href="css/bootstrap.min.css" />

		<!-- bootsnav -->
		<link rel="stylesheet" href="css/bootsnav.css"/>

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
</head>
<body>
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

		<script src="js/jquery.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->

		<!--modernizr.min.js-->
		<script  src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>


		<!--bootstrap.min.js-->
		<script  src="js/bootstrap.min.js"></script>

		<!-- bootsnav js -->
		<script src="js/bootsnav.js"></script>

		<!-- jquery.filterizr.min.js -->
		<script src="js/jquery.filterizr.min.js"></script>

		<script  src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

		<!--jquery-ui.min.js-->
        <script src="js/jquery-ui.min.js"></script>

        <!-- counter js -->
		<script src="js/jquery.counterup.min.js"></script>
		<script src="js/waypoints.min.js"></script>

		<!--owl.carousel.js-->
        <script  src="js/owl.carousel.min.js"></script>

        <!-- jquery.sticky.js -->
		<script src="js/jquery.sticky.js"></script>

        <!--datepicker.js-->
        <script  src="js/datepicker.js"></script>

		<!--Custom JS-->
		<script src="js/custom.js"></script>
			
			<!-- 로그인한 유저 닉네임 가져오기 -->
			<c:set var="usernic" value="${loginUser.mnic}"/>
		
            <!-- 게시판 글내용 시작 ---------->
            <c:set var="phnum" value="${requestScope.phnum}"></c:set>
			<c:set var="pboard" value="${requestScope.pboard}"></c:set>
			<c:set var="cpage" value="${requestScope.cpage}"></c:set>
			<c:set var="pagesize" value="${requestScope.pagesize}"></c:set>
			
			<c:set var="pagesize" value="${requestScope.replylist}"></c:set>
			
            <div>
                <table>
                    <tr>
                        <td width="20%" align="center">글번호</td>
                        <td width="30%">${phnum}</td>
                        <td align="center"> ♥ ${pboard.heart}</td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">글쓴이</td>
                        <td width="30%">${pboard.mnic}</td>
                        <td width="20%" align="center">이메일</td>
                        <td>${pboard.email}</td>
                    </tr>
             		<!-- 첨부파일 <file> -->
              		<tr>
					<td width="20%" align="center"><b>첨부파일</b></td>
					<td>
					<c:set var="originalfilename" value="${pboard.pfilename}" />
					<c:set var="lowerfilename" value="${fn:toLowerCase(originalfilename)}" />
					<c:forTokens var="file" items="${lowerfilename}" delims="." varStatus="status">
						<c:if test="${status.last}">
							<a href="upload/${originalfilename}" target="_blank">미리보기</a>
						</c:if>
						</c:forTokens>
					</td>
					<!-- 첨부파일 <file> -->
				</tr>
					<tr>
						<td width="20%" align="center"><b>제목</b></td>
						<td colspan="3">${pboard.pbsubj}</td>
					</tr>
					<tr height="100">
						<td width="20%" align="center"><b>글내용</b></td>
						<td colspan="3">${fn:replace(pboard.pbcont, newLineChar,"<br>")}</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
						<a href="PboardList.pg?cp=${cpage}&ps=${pagesize}">목록가기</a> |
						<a href="PboardEdit.pg?idx=${phnum}&cp=${cpage}&ps=${pagesize}">편집</a> |
						<a href="PboardDelete.pg?idx=${phnum}&cp=${cpage}&ps=${pagesize}">삭제</a> |
						</td>
					</tr>
                </table>
                
				<!--  꼬리글 달기 테이블 -->
				<form name="reply" action="PboardReply.pg" method="POST">
						<!-- hidden 태그  값을 숨겨서 처리  -->
						<input type="hidden" name="phnum" value="${phnum}"> 
						<input type="hidden" name="email" value="${loginUser.email}"> 
						<!-- hidden data -->
						<table width="80%" border="1">
							<tr>
								<th colspan="2">덧글 쓰기</th>
							</tr>
							<tr>
								<td align="left">작성자 : ${usernic}
								 	<textarea name="mmcont" rows="2" cols="50"></textarea>
								</td>
								<td align="left">
									<input type="button" value="등록" onclick="reply_check()">
								</td>
							</tr>
						</table>
				</form>
				<!-- 유효성 체크	 -->
				<script type="text/javascript">
					function reply_check() {
						var frm = document.reply;
						if (frm.mmcont.value == "") {
									alert("리플 내용을 입력해주세요.");
							return false;
						}
					frm.submit();
					}
					
					function reply_del(frm) {

						$.ajax({
							url :"Replydelete",
							type : 'POST',
							datatype : "text",
							data :{
								"memonum" : frm.memonum.value,
								"pbnum_fk" : frm.pbnum.value
							},
							success : function(data){
								replyList();
							},
							error : function() {
								alert('댓글 삭제 실패');
							}
						});
					}
				</script>
				<br>
				<!-- 꼬리글 목록 테이블 -->
				<c:if test="${not empty replylist}">
					<c:forEach var="reply" items="${replylist}">
						<table width="80%" border="1">
							<tr>
								<th colspan="2">REPLY LIST</th>
							</tr>
							<tr align="left">
								<td width="80%">
								[${reply.email}] : ${reply.mmcont}
								<br> 작성일:${reply.mmdate}
								</td>
								<td width="20%">
								<form action="PboardReplyDelete.pg" method="POST" name="replyDel">
									<input type="hidden" name="replyemail" value="${reply.email}"> 
								
									<input type="hidden" name="memonum" value="${reply.memonum}"> 
									<input type="hidden" name="pbnum" value="${pbnum}"> 
									<input type="button" value="삭제" onclick="reply_del(this.form)">
								</form>
								</td>
							</tr>
						</table>
					</c:forEach>
				</c:if>
	         
	         </div>
</body>
</html>