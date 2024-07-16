<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Room listAll</title>
</head>
<%@ include file="../include/head.jsp"%>

<style>
* {
	padding: 0;
	margin: 0;
	border: none;
}

html,body {
	max-width: 100%;
	height: 100%;
	font-size: 14px;
	font-family: 'Roboto', sans-serif;
	text-align: center;
	padding: 0;
	margin: 0;
}

.frame{
	min-height: 100%;
    position: relative;
    padding-bottom: 60px;
    top: 1px;
	height: 10vh;
}


/* modal */
#modal.modal-overlay {
     width: 100%;
     height: 100%;
     position: absolute;
     left: 0;
     top: 0;
     display: none;
     flex-direction: column;
     align-items: center;
     justify-content: center;
     background: rgba(255, 255, 255, 0.25);
     box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
     backdrop-filter: blur(1.5px);
     -webkit-backdrop-filter: blur(1.5px);
     border-radius: 10px;
     border: 1px solid rgba(255, 255, 255, 0.18);
 }
 #modal .modal-window {
     background: rgba( 69, 139, 197, 0.70 );
     box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
     backdrop-filter: blur( 13.5px );
     -webkit-backdrop-filter: blur( 13.5px );
     border-radius: 10px;
     border: 1px solid rgba( 255, 255, 255, 0.18 );
     width: 400px;
     height: 500px;
     position: relative;
     top: -100px;
     padding: 10px;
 }
 #modal .title {
     padding-left: 10px;
     display: inline;
     text-shadow: 1px 1px 2px gray;
     color: white;
     
 }
 #modal .title h2 {
     display: inline;
 }
 #modal .close-area {
     display: inline;
     float: right;
     padding-right: 10px;
     cursor: pointer;
     text-shadow: 1px 1px 2px gray;
     color: white;
 }
 
 #modal .content {
     margin-top: 20px;
     padding: 0px 10px;
     text-shadow: 1px 1px 2px gray;
     color: white;
 }
 
 /*modal button*/
 .btn btn-secondary{
 
 }
 
 .btn btn-primary{
 
 }
 
 .fileName{
	 position: relative;
     left: 50px;
}
 
.table{
	width: 80%;
	margin: 0 auto;
}

</style>

</head>
<body>
	<div class="frame">

		<header>
			<!-- header -->
		</header>

		<!--  nav -->
		<nav>
			<%@ include file="../include/nav.jsp"%>
		</nav>
 			<caption ><h2 style="margin-top: 10px;"> ${studyRoomDTO.name} 지점 </h2></caption>
 			<div>
 			<table class=table style="table-layout:fixed">
 			<thred>
 				<tr>
 					<!-- <th scope="col"> 지점번호 </th>
 					<th scope="col"> 지점이름 </th> -->
 					<th scope="col"> 번호 </th>
 					<th scope="col"> 이름 </th>
 					<th scope="col"> 설명 </th>
 					<th scope="col"> 수정하기 </th>
				</tr>
			</thred>
			 <tbody class="table-group-divider">
			 	<!-- 멤버 아이디 확인용 -->
			 	<input type="hidden" class="hidden-id" value="${member.id}"/>
    			<tr>
					 <c:forEach items="${roomList}" var="roomDTO">
					 <c:if test="${status.index%3==0}">
				</tr>
				<tr>
					 </c:if>
						<th scope="row">
						<!-- ${studyRoomDTO.studyroom}</th>
						<td>${roomDTO.studyName}</td> -->
					 	<a href="${contextPath}/reservation/detail?roomNumber=${roomDTO.roomNumber}"> ${roomDTO.roomNumber}</th>
					 	<td> ${roomDTO.roomName}</td>
					 	<td> ${roomDTO.content}</td>
					 	<!-- <td> ${RoomDTO.del}</td>
					 	<td> ${RoomDTO.fileName}</td> -->
						<!-- 룸 수정하기 --> 
						<td><button type="button" class="btn btn-outline-light" onclick="location.href='${contextPath}/reservation/roomUpdate?roomNumber=${roomDTO.roomNumber}'">수정하기</button></td>
					 </c:forEach>
				 </tr>
		      </tbody>
		 		<tr>
	 				<!-- 추가로 구현해봄 
	 				<button type="button" class="btn btn-warning" onclick="location.href='${contextPath}/reservation/roomInsert?studyroom=${studyRoomDTO.studyroom}'">추가하기</button>  -->
	 			</tr>
			</table>
			</div>
			<br>
			
		<!-- 룸 추가하기 Modal -->
			<div>				
				<!-- Button trigger modal -->
				<!-- 룸 추가하기 -->
				<button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#roomInsertModal">추가하기</button>
				
				<!-- Modal -->
				<div class="modal fade" id="roomInsertModal" tabindex="-1" aria-labelledby="roomModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				    
				    <!-- Modal Header -->
				      <div class="modal-header">
				        <h5 class="modal-title" id="roomModalLabel">룸 정보를 입력하세요</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      
			      <!-- Modal body -->
				      	<!-- 보일 내용 -->
				      	<form action="${contextPath}/reservation/roomInsert" method="post">
				      		<div>
				      			<label>지점 번호&nbsp;</label><input type="text" name="studyroom" value="${studyRoomDTO.studyroom}" readonly>
				      		</div><div>
				      			<label>지점 이름&nbsp;</label><input type="text" value="${studyRoomDTO.name}"readonly>
		      		 		</div>
				      		<div>
				      			<label>룸 이 름&nbsp;</label><input type="text" name="name" placeholder=" 룸이름을 입력하세요">
		      		 		</div><div>
				      			<label>최소 인원&nbsp;</label><input type="text" name="min" placeholder=" 최소인원을 입력하세요"/>
		      		 		</div><div>
								<label>최대 인원&nbsp;</label><input type="text" name="max" placeholder=" 최대인원을 입력하세요"/>
		      		 		</div><div>
								<label>설&nbsp;&nbsp;명&nbsp;</label><input type="text" name="content" placeholder=" 설명을 입력하세요"/>
		      		 		</div><div>
								<label>비&nbsp;&nbsp;용&nbsp;</label><input type="text" name="cost" placeholder=" 시간당 비용을 입력하세요"/>
		      		 		</div><div>
								<label class="fileName">대표사진 </label><input class="fileName" type="file" name="fileName"/>
		      		 		</div><div>
								<label></label><input type="hidden" name="del" value=0 placeholder=" 삭제여부 0[유지], 1[삭제]"/>
		      		 		</div>
				      
				   <!-- Modal footer -->   
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <input type="submit" class="btn btn-warning" value="저장하기" />
					      </div>
				      </form>
			      	</div>
			      </div>
		      </div>
		    </div><!-- end of modal -->
		    
		</div><!--  end of frame -->
		
 <%@ include file="../include/footer.jsp" %>
 
 <script>
 
 $(document).ready(function(){
	 console.log("Hell");
	 
	 //id값이 root인 경우 버튼 활성화
	 var id = $(".hidden-id").val();
	 console.log(id);
	 
	 
	 //추가하기 modal창
	 if(id == "root"){
		$(".btn.btn-warning").prop('disabled', false), // 활성화
		$(".btn.btn-outline-light").prop('disabled', false); // 활성화
		console.log("버튼 활성화");
	 }else{
		$(".btn.btn-warning").prop('disabled', true), // 비활성화
		$(".btn.btn-outline-light").prop('disabled', true); // 비활성화
		console.log("버튼 비활성화");		 
	 }
	 
	 //추가하기 form
	 if(id == "root"){
		$(".btn.btn-warning").prop('disabled', false), // 활성화
		$(".btn.btn-outline-light").prop('disabled', false); // 활성화
		console.log("버튼 활성화");
	 }else{
		$(".btn.btn-warning").prop('disabled', true), // 비활성화
		$(".btn.btn-outline-light").prop('disabled', true); // 비활성화
		console.log("버튼 비활성화");		 
	 }
 
	 
	 
	 
 })
 
 
 
 
 
 
 </script>
 
 
 
</body>
</html>