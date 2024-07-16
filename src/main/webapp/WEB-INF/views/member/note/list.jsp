<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<%@ include file="../../include/head.jsp" %>
</head>
<body style="height: 100%;">
	<div class="frame">

		<!-- header -->
		
		
		<!--  nav -->
		<%@ include file="../../include/nav.jsp" %>
		

		
		<!-- container -->
		<div class="container" align="center">
		
	
			
		
		
		
			<div style="margin : 200px">
				
		<!--  
		새별: 모달창 안에 해당 id(noteHere)의 div가 있으면 그 div의 내용이 대체되는 걸로 바꿔놨어요! 
		-->
			
			<!-- 모달 -->
					<div id="noteModal" class="notemodal">
					  <!-- 모달 내용 -->
					  <div class="notemodal-content">
					    <div style="width: 100%; height: 38px;">
					    	<span class="noteModal-close">&times;</span>
					    </div>
					    <div id="noteHere"></div>
					  </div>
					</div>
			<br>
			<br>
			
			
			<button class="btn listbannerfont2" style="text-align:center; background-color: blue; color: white" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" id="quit-modal">작성</button> 
			
			<br>
			<br>
			<h3>쪽지</h3>
			
			
			<%-- 
			<c:if test="${fn:length(noteList) == 0} ">
					등록된 쪽지가 없습니다.
			</c:if>
			
			 --%>
			
						
			
			<div id="noteListHere"></div>
			
			
			<hr>
		
		
		</div>
		
	
	
	
		</div>
		 
		
		
	
		
		
		
	</div>
	<script>
	
	$(function() {
		allNote();
	})
	
	function getNote(idx){
		
		var htmls = "";
		var url = "/dingdong/member/note/read";
		var paramData = {
		 		'idx' : idx
		}
		
		$.ajax({
			url : url,
			data : paramData,
			dataType : 'json',
			type : 'GET',
			success : function(result) {
				
				console.log(result);
				console.log(result.receiver);

				htmls += "<div>"
				+ "받는 이: " + result.receiver
				+ "<br>"
				+ "보낸 이: " + result.sender
				+ "<br>"
				+ "내용 : " + result.content
				+ "<br>"
				+ "날짜: " + result.date
				+ "</div>";
				
				$("#noteHere").html(htmls);
				
				allNote();
				
			
		
				// 모달 창 선택
				var noteModal = document.getElementById("noteModal");
				
				
				noteModal.style.display = "block";
				
				
				
				
			},
			error : function(result) {
				// 여기에 통신 실패 로직 구현
			}
		})
		
	}
	
	// 모달 버튼 선택
	var noteListHere = document.getElementById("noteListHere");
	// 모달 창 닫기 버튼 선택
	var notecloseBtn = document.getElementsByClassName("noteModal-close")[0];
	
	// 모달 닫기 버튼 클릭 이벤트 핸들러
	notecloseBtn.onclick = function() {
		noteModal.style.display = "none";
	}
	window.onclick = function(event) {
		if (event.target == noteModal) {
			noteModal.style.display = "none";
		}
	}
	
	function allNote(){
		var htmls = "";
		url = "/dingdong/member/note/getList";
		
		$.ajax({
			url : url,
			dataType : 'json',
			type : 'GET',
			success : function(result) {
				// 여기에 통신 성공 로직 구현
				// result가 해당 url에서 보내는 return값
				
				console.log(result);
				
				
				$.each(result, function(index, item){
					if(item.read === 0){
						htmls += "<a onclick='getNote(" + item.idx + ")' style='text-decoration-line : none'>"
							+ "<div style='color:black'>"
							+ item.sender + " | " +  item.date + " | " + item.content
							+ "</div>"
							+ "</a>";
					}else if(item.read === 1){
						htmls += "<a onclick='getNote(" + item.idx + ")' style='text-decoration-line : none'>"
							+ "<div style='opacity: 0.2; color:black;'>"
							+ item.sender + " | " +  item.date + " | " + item.content
							+ "</div>"
							+ "</a>";
					}
					
					
					// 0개일 때도 구현
				})
				
				$("#noteListHere").html(htmls);
				
			},
			error : function(result) {
				// 여기에 통신 실패 로직 구현
			}
		})
	}
	
	</script>
	<!-- footer -->
	<%@ include file="../../include/footer.jsp" %>

</body>
</html>