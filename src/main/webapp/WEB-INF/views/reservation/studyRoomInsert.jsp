<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>studyroom 지점추가</title>
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
<body>
<div class="frame">
	<!-- header -->
	<div class="content-frame">
		<!--  nav -->
			<nav>
				<div class="fixed"><%@ include file="../include/nav.jsp"%>
			</nav>
	
			<div>
			<h3 style="margin-top: 10px;"><b>지점 추가 화면입니다.</b></h3><br>
				<form form="role" method="post">
					<table class="table">
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지 점 명 <input type="text" name="name" placeholder="지점명을 입력하세요."/><hr>
						</td></tr>
						<tr>
							<td class="fileName">이 미 지 <input type="file" name="fileName" placeholder="사진"/><hr class="hrFileName">
						</td></tr>
						<tr>
							<td>소 개 <input type="text" name="content" placeholder="내용을 입력하세요."/><hr>
						</td></tr>
						<tr>
							<td><input type="hidden" name="del" value=0 placeholder="삭제여부 0[유지], 1[삭제]"/>
						</td></tr>				
						<tr>
							<td><input type="submit" value="추가하기">
							<input type="reset" value="원래대로">
							<a href="${contextPath}/reservation/branchList?studyroom=${studyRoomDTO.studyroom}" class="cancel">취소</a></td>
						</tr>
					</table>	
				</form>
				</div>
			</div>
	</div>	
	<!-- footer -->
 		<%@ include file="../include/footer.jsp" %>		


</body>
</html>


<div class="modal-body">
				      	
				      