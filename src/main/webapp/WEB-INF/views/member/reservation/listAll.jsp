<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>


<%@ include file="../../include/head.jsp" %>

<!--  admin stylesheet -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />

<style>
.table {
	border: 1px solid rgb(209 213 219);
	border-collapse: collapse;
}

.font {
	font-size: 18px;
	color: #111827;
	font-weight: 600;
	text-align: center;
	line-height: 66px;
}

.reservationvalue {
	text-align: center;
	line-height: 66px;
	
}

.reservationprebtn {
	border-radius: 9999px;
	border: 1px solid rgb(209 213 219);
	width: 60px;
	height: 60px;
	padding: 0;
	background-color: #fff;
	margin: auto 0;
}

.reservationnextbtn {
	border-radius: 9999px;
	border: 1px solid rgb(209 213 219);
	width: 60px;
	height: 60px;
	padding: 0;
	background-color: #fff;
	margin: auto 0;
}

.opacitybtn {
	background-color: #fff;
	border: none;
	font-size: 14px;
	color: rgb(209 213 219);
	padding: 1px 4px;
	line-height: 52px;
	
}

.opacitybtn:hover {
	color: #111827;
}

/* 여기부터 내 예약 */

.myreservationformmargin {
   margin: 20px 50px 80px 50px;
   display: flex;
   justify-content: center;
}

.myreservationform {
   width: 370px;
   height: 400px;
   border: 1px solid rgb(209 213 219);
   border-left: 2px solid #0090F9;
   box-shadow: 0 14px 28px rgba(0,0,0,0.20), 0 10px 10px rgba(0,0,0,0.20);
   margin: 0 80px;
}

.myreservationtitle {
   height: 44px;
   background-color: #fff;
   display: flex;
   justify-content: center;
   line-height: 44px;
   margin-bottom: 36px;
   width: 100%;
}

.editform{
	text-align: right;
    border: none !important;
    background-color: white !important;
    box-shadow: none !important;
}

</style>

</head>

<body>
<!--  nav -->
<%@ include file="../../include/nav.jsp" %>
		
		
		
	<div class="middle" style="margin-top: 2.5rem; margin-left: auto; margin-right: auto;">

		<!--  mypage left -->
      <div class="leftform" style="width: 256px !important;border-right: 1px solid #dee2e6;" >
         <%@ include file="../include/mypageNav.jsp" %>
      </div>
		
		
		

		
		<!-- container -->
		<div class="container" style="max-width: 1024px; width: 100%; margin: 0; padding: 0;" align="center">
			
		
			<div class="myreservationtitle">
				<div style="width: 371px; display: flex; justify-content: flex-end;">
					<span style="font-size: 30px; color: #0090F9; margin-right: 20px;">나의 예약정보</span>
				</div>
			</div>
			<div class="myreservationformmargin">
				<button class="reservationprebtn"><img style="width: 30px; height: 30px; padding-right: 6px; filter: invert(91%) sepia(3%) saturate(12%) hue-rotate(320deg) brightness(92%) contrast(81%);" src="${contextPath }/resources/bootstrap/image/left.png"></button>
				
				<table class="myreservationform">
					<c:forEach var="reservation" items="${reservationList }">
				<!-- 수정 -->
						<tr>
							<td class="editform" colspan="4"> 
								<button class="opacitybtn" onclick="location.href='${contextPath}/member/reservation/detail?reservationNumber=${reservation.reservationNumber }'">수정</button>
								<button class="opacitybtn" onclick="location.href='${contextPath}/reservation/review/insert?reservationNumber=${reservation.reservationNumber }'">리뷰</button>
							</td>						
						</tr>
						<tr>
							<td class="table font" style="width: 93px;">예약번호</td>
							<td class="table reservationvalue" colspan="3" style="width: 277px;"><a href="${contextPath}/member/reservation/detail?reservationNumber=${reservation.reservationNumber}"> ${reservation.reservationNumber}</a></td>
						</tr>
						<tr>
							<td class="table font" style="width: 93px;">예약자명</td>
							<td class="table reservationvalue" style="width: 94px;">${reservation.name }</td>					
							<td class="table font" style="width: 93px;">연락처</td>					
							<td class="table reservationvalue" style="width: 94px;">${reservation.phone }</td>					
						</tr>
						<tr>
							<td class="table font" style="width: 93px;">입실시간</td>					
							<td class="table reservationvalue" style="width: 94px;" colspan="3">${reservation.start}</td>
						</tr>
						<tr>					
							<td class="table font" style="width: 93px;">퇴실시간</td>					
							<td class="table reservationvalue" style="width: 94px;" colspan="3">${reservation.end}</td>					
						</tr>
						<tr>
							<td class="table font" style="width: 93px;">인원</td>					
							<td class="table reservationvalue" style="width: 94px;">${reservation.party }<span>명</span></td>					
							<td class="table font" style="width: 93px;">금액</td>					
							<td class="table reservationvalue" style="width: 94px;">${reservation.cost }</td>					
						</tr>
						<tr>
							<td class="table font" style="width: 93px;">결제방식</td>					
							<td class="table reservationvalue" colspan="3" style="width: 277px;">${reservation.payWith}</td>					
						</tr>
					</c:forEach>
				</table>
				<button class="reservationnextbtn"><img style="width: 30px; height: 30px; padding-left: 6px; filter: invert(91%) sepia(3%) saturate(12%) hue-rotate(320deg) brightness(92%) contrast(81%);" src="${contextPath }/resources/bootstrap/image/right.png"></button>
			</div>
		
		</div>
		 
	</div>
	
	<!-- footer -->
	<%@ include file="../../include/footer.jsp" %>


</body>
</html>