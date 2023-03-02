<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.error{
		font-size:1.25rem;
		border-style: solid;
		border-width: 1px;
		border-radius:10px;
		text-align: center;
		width: 30%;
		margin: auto;
		padding: 30px;
		background: rgb(76, 111, 219);
		color: white;
		font:bold;
	}
	
</style>
</head>
<body>
	<div class="error">
		죄송합니다. <br> 
		요청 처리 과정에서 문제가 발생하였습니다.<br>
		빠른 시간 내에 문제를 해결하도록 하겠습니다.
	
	</div>
	<!-- 
		Failde URL: ${URL}
		Exection: ${exeption.message}
		<c:forEach  var="stack" items="${exection.stackTrace}">
			${stack}
		</c:forEach>	 
	 -->
</body>
</html>