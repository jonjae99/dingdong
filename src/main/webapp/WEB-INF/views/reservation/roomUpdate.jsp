<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roomUpdate</title>
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
    width: 25%; 
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
	width: 1000px;
	height: 1000px;
	margin: 0 auto;
}

.cancel{
	color: black;
	background-color: #F0F0F0;
	text-decoration-line : none;
}

.fileName{
	 position: relative;
     left: 60px;
}

.hrFileName{
	position: relative;
    right: 60px;
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
				<h3 style="margin-top: 10px;"><b>룸 수정 화면입니다.</b></h3><br>
				<table class="table">
					<form form="role" method="post">
						<tr>
							<td>지점 번호 <input type="text" name="studyroom" placeholder="${studyRoomDTO.studyroom}" readonly/><hr>
						</td></tr>
						<tr>
							<td>지점 이름 <input type="text" name="studyroomName" placeholder="${studyRoomDTO.name}" readonly/><hr>
						</td></tr>
						<tr>
							<td>룸 번호 <input type="text" name="roomNumber" placeholder="${roomDTO.roomNumber}" readonly/><hr>
						</td></tr>
						<tr>
							<td>룸 이름 <input type="text" name="name" value="${roomDTO.name}"/><hr>
						</td></tr>
						<tr>
							<td>예약 최소시간 <input type="text" name="min" value="${roomDTO.min}"/><hr>
						</td></tr>	
						<tr>
							<td>예약 최대시간 <input type="text" name="max" value="${roomDTO.max}"/><hr>
						</td></tr>	
						<tr>
							<td>설  명 <input type="text" name="content" value="${roomDTO.content}"/><hr>
						</td></tr>	
						<tr>
							<td>단  가 <input type="text" name="cost" value="${roomDTO.cost}"/><hr>
						</td></tr>	
						<tr>
							<td>삭제여부 <input type="text" name="del" value="${roomDTO.del}" placeholder="삭제여부 0[유지], 1[삭제]"/><hr>
						</td></tr>				
						<tr>
							<td class="fileName">이 미 지 <input type="file" name="fileName" value=${roomDTO.fileName}/><hr class="hrFileName">
						</td></tr>
						<tr>
							<td><input type="submit" value="수정하기">
							<input type="reset" value="원래대로">
							<a href="${contextPath}/reservation/roomList?studyroom=${studyRoomDTO.studyroom}" class="cancel">취소</a></td>
						</tr>
					</form>
				</table>	
				</div>
			</div>	
	<!-- footer -->
 		<%@ include file="../include/footer.jsp" %>		

</body>
</html>


<div class="modal-body">
				      	
				      