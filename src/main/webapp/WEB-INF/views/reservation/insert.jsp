<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약완료</title>
<%@ include file="../include/head.jsp"%>
<style>
* {
	padding: 0;
	margin: 0 auto;
	border: none;
}

html,body {
	height: 100%;
	font-size: 14px;
	font-family: 'Roboto', sans-serif;
	text-align: center;
	
}

hr {
    width: 30%; 
    margin: 0 auto; 
}

td{
 	border: none;
}

.frame{
	min-height: 100%;
    position: relative;
    padding-bottom: 60px;
    top: 1px;
    left: 1%;
    right: 1%;
	height: 200vh;
	width: 100%;
	height: 100%;
}

.content-frame{
	width: 100%;
	height: 100%;

}

.tab-content{
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

.check{
	color: black;
	background-color: #F0F0F0;
	text-decoration-line : none;
}

.b{
	text-align: left;
}

</style>
</head>
<body>
<div class="frame">
	<!-- header -->
	<div class="content-frame">
		<!--  nav -->
			<nav>
				<div class="fixed"><%@ include file="../include/nav.jsp"%></div>
			</nav>
			
			<div>
			<h3 style="margin-top: 10px;"><b>예약 완료.</b></h3><br>
			<div class="tab-content" >
				<table class="table">
					<tr>
						<td><b>예약번호:</b> ${reservation.reservationNumber}<hr></td>
					</tr><tr>	
						<td><b>예약자명:</b> ${reservation.name}<hr></td>
					</tr><tr>	
						<td><b>연락처:</b> ${reservation.phone}<hr></td>
					</tr><tr>	
						<td><b>예약날짜:</b> ${reservation.reservationDate}<hr></td>
					</tr><tr>	
						<td><b>시작시간:</b> ${reservation.start}<hr></td>
					</tr><tr>	
						<td><b>마감시간:</b> ${reservation.end}<hr></td>
					</tr><tr>	
						<td><b>결제금액:</b> ${reservation.cost}원<hr></td>
					</tr>
				</table>	
					<a href="${contextPath}/member/mypage" class="check">예약확인하기</a>
			</div>
		</div>	
		</div>
		</div>
	<!-- footer -->
 		<%@ include file="../include/footer.jsp" %>		
</body>
</html>