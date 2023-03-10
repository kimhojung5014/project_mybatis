<%@ page language="java" contentType="text/html; charset=UTF-16"
    pageEncoding="UTF-16"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="resources/css/searchId.css?12"> 
  <link rel="stylesheet" href="resources/css/header_footer.css?12">
  <title>비밀번호 변경</title>
</head>
<body>
<script src="resources/js/Join_Check.js?1" charset="UTF-8"></script>
  <!-- 메인 부분 -->
  <div id="mainStyle">

		<div id = "mainContent">

			<p class="subtitle">비밀번호 재설정</p>
			<div class="textarea">
			
				<c:choose>
					<c:when test="${pw eq 1}">
					<form action="resetPw" method="post" id="resetPwForm">
					<input type="hidden" name="userId" value="${userId }">
					<table id="join">
			            <tr>
			              <td class="textleft">새로운 비밀번호</td>
			              <td><input type="password" id="pw" name="pw" placeholder="8글자 이상 입력" required onkeyup="pw_Regular_Check()"></td>
			            </tr>
			            <tr>
			            <td></td>
			            	<td>
			            	<p id="pwMsg"></p>
			            	</td>
			            </tr>
			            <tr>
			              <td class="textleft">비밀번호 확인</td>
						  <td><input type="password" name="pwCheck" id="pwCheck" placeholder="비밀번호 입력" required onkeyup="pw_Check()"></td>
			            </tr>

			            <tr>
				          <td></td>
				          <td><p id ="pwCheckMsg"></p></td>
			            </tr>  
			            <tr>
			              <td colspan="2"><button class="button" type="button" onclick="resetPw('${pw}')">완료</button></td>
			            </tr>
					</table>
					</form>
					</c:when>
					<c:otherwise>
						<script type="text/javascript">
							alert("비밀번호를 찾을 수 없습니다.");
							history.go(-1);
						</script>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
  
  </div>
<!-- 메인  끝-->



</body>
</html>
