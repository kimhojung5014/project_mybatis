<%@ page language="java" contentType="text/html; charset=UTF-16"
    pageEncoding="UTF-16"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="resources/css/searchId.css"> 
  <link rel="stylesheet" href="resources/css/header_footer.css">
  <title>임시</title>
</head>
<body>
  <!-- 메인 부분 -->
  <div id="mainStyle">

		<div id = "mainContent">

			<p class="subtitle">아이디 목록</p>
			<div class="textarea">
			
				<c:choose>
					<c:when test="${id ne null}">
					<div class="textarea">
						<span class ="title">아이디 : </span>&nbsp; <input type="text" readonly value="${id}">
					</div>
					</c:when>
					<c:otherwise>
						<script type="text/javascript">
							alert("아이디를 찾을 수 없습니다.");
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
