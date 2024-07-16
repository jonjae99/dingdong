<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roomInsert</title>
<%@ include file="../include/head.jsp"%>

<script>
const TIME_ZONE = 9 * 60 * 60 * 1000; // 9시간
const d = new Date();

const date = new Date(d.getTime() + TIME_ZONE).toISOString().split('T')[0];
const time = d.toTimeString().split(' ')[0];
const dateTime = date + time;
console.log(date + ' ' + time);
console.log(dateTime);
</script>

</head>
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
    width: 50%; 
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

.all{
	font-size: 20px;
	text-align: center;
	text-decoration-line : none;
	color: black;
	background-color: #F0F0F0;
	border-style: double;
	width: 90px;
	height: 24px;
	top: 100px;
	padding: 3px;
	margin: 0;
	
}

.tel{
	text-align: center;
}



</style>

<body>
<%
	String duplicate = request.getParameter("start"); 					//예약번호 중복 방지용
	String reservationDate = request.getParameter("reservationDate");	//이용할 날짜
	String date = request.getParameter("date"); 						//예약요청날짜
	String start = request.getParameter("start").substring(11,13);		//이용시작시간 /시간단위만 잘라서 계산
	String end = request.getParameter("end").substring(11,13);			//이용마감시간
	String party = request.getParameter("party");						//이용인원수
	String roomCost = request.getParameter("roomCost");					//룸단가(시간당)
	int cost = 0; //룸 최종 결제금액

	//out.println("1:" + roomCost);
	//out.println(date);
	
	//룸 이용금액
	if(Integer.parseInt(end) < 0 || Integer.parseInt(end) == 0 || Integer.parseInt(end) < Integer.parseInt(start) ){
		cost = 0;
	//out.println("2:" + cost);
	}else{
		cost = (Integer.parseInt(end)-Integer.parseInt(start))*(Integer.parseInt(roomCost)*Integer.parseInt(party));
	//out.println("3:" + cost);
	//out.println("3:" + end);
	//out.println("3:" + start);
	//out.println("3:" + roomCost);
	//out.println("3:" + party);
	}
	
	
	
%>	



<div class="frame">
	<!-- header -->
	<div class="content-frame">
		<!--  nav -->
			<nav>
				<div class="fixed"><%@ include file="../include/nav.jsp"%>
			</nav>
	
			<div>
			<h3 style="margin-top: 10px;"><b>예약 화면입니다.</b></h3><br>
				<div class="tab-content" >
					<form form="role" method="post">
					<table class="table">
						<tr>
							<td><b>예약번호</b><input type="text" name="reservationNumber" value="${studyRoomDTO.studyroom}${roomDTO.roomNumber}<%=duplicate%>" placeholder="예약번호" readonly/><hr>
						</td></tr>
						<tr>
							<td><b>지 점 명</b> <input type="text" name="studyRoomName" value="${studyRoomDTO.name}" readonly/><hr>
						</td></tr>
						<tr>
							<td><b>룸 명</b> <input type="text" name="roomName" value="${roomDTO.name}" readonly/><hr>
						</td></tr>
						<tr>
							<td><b>I  D</b> <input type="text" name="memberId" value="${member.id}" readonly/><hr>
						</td></tr>
						<tr>
							<td><b>예약자명</b> <input type="text" name="name" value="${member.name}"placeholder="예약자명을 입력하세요" required/><hr>
						</td></tr>	
						<tr>
							<td class="tel"><b>전화번호</b> <input style="width:170px;" type="text" name="phone" value="${member.phone}" placeholder="010-0000-0000 입력하세요" required/><hr>
						</td></tr>	
						<tr>
							<td><b>이 메 일</b> <input type="email" name="email" value="${member.email}" placeholder="이메일" required/><hr>
						</td></tr>	
						<tr>
							<td><b>시작시간</b> <input type="text" name="start" value="<%=start%>" placeholder="<%=start %>" readonly/><hr>
						</td></tr>
						<tr>
							<td><b>마감시간</b> <input type="text" name="end" placeholder="<%=end %>" readonly/><hr>
						</td></tr>
						<tr>
							<td><b>이용인원</b> <input type="text" name="party" value="<%=party %>" readonly/><hr>
						</td></tr>
						<tr>
							<td><b>이용금액</b><input type="text" name="cost" value="<%=cost %>" readonly/><hr>
						</td></tr>
						<tr>
							<td><b>결제카드</b> <input type="radio" name="payWith" value="1" placeholder="결제여부 1카드" required/>카카오페이
						</td></tr>
						<tr>
							<td><input type="hidden" name="studyroomNumber" value="${studyRoomDTO.studyroom}" placeholder="지점번호" readonly/>
						</td></tr>
						<tr>
							<td><input type="hidden" name="roomNumber" value="${roomDTO.roomNumber}" placeholder="룸번호" readonly/>
						</td></tr>
						<tr>
							<td><input type="hidden" name="del" value="0" placeholder="취소여부 삭제여부 0[유지], 1[취소]"/>
						</td></tr>
						<tr>
							<td><input type="hidden" name="state" value="0" placeholder="예약상태 int 0 예약, 1결제, 2취소"/>
						</td></tr>
						<tr>
							<td><input class="all" type="submit" value="예약하기">
							<input class="all" type="reset" value="초기화">
							<a href="${contextPath}/reservation/detail?roomNumber=${roomDTO.roomNumber}" class="all" style="position: relative; top: -2px;">취소</a></td>
						</tr>
					</table>	
					</form>
				</div>
			</div>
	</div>
</div>	
	<!-- footer -->
 		<%@ include file="../include/footer.jsp" %>

</body>
</html>


<div class="modal-body">
				      	
				      