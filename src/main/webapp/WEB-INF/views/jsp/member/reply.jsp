<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/board.css?1"> 

  <link rel="stylesheet" href="/css/page.css">
  
  <title>게시판</title>
</head>
<body>
<!-- JQuery 불러오기 -->
<script src="/js/jquery-3.6.3.min.js"></script>﻿



  <!-- 메인 부분 -->

  <div id="mainStyle">

    <div id="mainContent">
      <!-- 상단 메뉴 카테고리 -->
      <a class="subtitle" href="list">댓글 목록</a>
      <br>



      <!-- 테이블로 만든 게시판 형식 -->
      <table id="board">
        <thead>
        	<tr>

	          <th>작성자</th>
	          <th>내용</th>
	          <th>작성시간</th>
			  <th>삭제</th>
		   </tr>
		  </thead>
	  <!-- 페이지 개수 처리 부분 -->
        <c:choose>
        	<c:when test="${not empty replyList }">

		        <c:forEach var="list" items="${replyList}" varStatus="status" >
			          <tr>

			            <td>${list.nickName }</td>
			            <td>${list.content }</td>
			            <td>${list.commentDate }</td>
   						<td>
		            		<a type="button" class="deleteButton" href="replyDelete?commentNum=${list.commentNum}&writeNum=0&userId=${userData.userId}">삭제</a>
	            		</td>
			          </tr>
		  		</c:forEach>
		  		
	        </c:when>
	        <c:otherwise>
	        	<td colspan="4"><b>조건에 맞는 글이 없습니다.</b></td>
	        </c:otherwise>
  		</c:choose>

      </table>
      <!-- 게시판 끝 -->
      <br>
      <!-- 아래 페이지 넘버 부분 -->

        <div class="pageInfo_area">
 			<table id="pageInfo" class="pageInfo oncenter">
 				<!-- 이전페이지 버튼 -->
 				<tr>
 					<c:if test="${pageMaker.total ne 0}">
                		<td class="pageInfo_btn"><a style="display: inline-block;" href="${1}">처음</a></td>
                	</c:if>
                	
               		 <c:if test="${pageMaker.prev}">
                    <td class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">&larr;</a></td>
               		 </c:if>

                <!-- 각 번호 페이지 버튼 -->
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                   <c:if test="${num ne 0}">
                    <td class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></td>
                    </c:if>
                </c:forEach>

                <!-- 다음페이지 버튼 -->
                <c:if test="${pageMaker.next}">
                    <td class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">&rarr;</a></td>
                </c:if> 
                <c:if test="${pageMaker.total ne 0}">
                <td class="pageInfo_btn"><a style="display: inline-block;" href="${pageMaker.realEnd}">&nbsp;끝</a></td>
                </c:if>
                <tr>
 			</table>
        </div>
    <form id="moveForm" method="get">
            <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
   			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
   			
   			<input type="hidden" name="userId" value="${userData.userId}">	
   			

  	</form>
        <!-- 페이지 넘버부분 끝 -->




    </div>
    
  </div>
  <script type="text/javascript">
	
	
	$(".pageInfo a").on("click", function(e){
		let moveForm = $("#moveForm");
	    e.preventDefault();
	    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	    moveForm.attr("action", "replyMypage");
	    moveForm.submit();
	    
	});
	</script>

</body>
</html>