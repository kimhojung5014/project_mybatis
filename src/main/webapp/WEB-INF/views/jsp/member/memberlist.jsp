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
  
</head>
<body>
<!-- JQuery 불러오기 -->
<script src="/js/jquery-3.6.3.min.js"></script>﻿



  <!-- 메인 부분 -->

  <div id="mainStyle">

    <div id="mainContent">
      <!-- 상단 메뉴 카테고리 -->
      <a class="subtitle" href="list">회원목록</a>
	  <br>
      <!-- 상단 메뉴 카테고리 끝 -->

      <!-- 테이블로 만든 게시판 형식 -->
      <table id="board">
        <thead>
        	<tr>
	          <th>회원번호</th>
	          <th>유저아이디</th>
	          <th>닉네임</th>
	          <th>가입날짜</th>
			  <th>삭제</th>
		   </tr>
		 </thead>
	  <!-- 페이지 개수 처리 부분 -->
        <c:choose>
        	<c:when test="${not empty memberList }">

		        <c:forEach var="list" items="${memberList}" varStatus="status" >
			          <tr>

			            <td>${list.numId }</td>
			            <td>${list.userId } </td>
			            <td>${list.nickName}</td>
			            <td>${list.joinDate}</td>
	    				<td>
				        <a type="button" class="deleteButton" onclick="deleteCheck('${list.userId}')">삭제</a>
			            </td>
					
			          </tr>

		  		</c:forEach>
		  		
	        </c:when>
	        <c:otherwise>
	        	<td colspan="5"><b>회원이 없습니다.</b></td>
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
   			
   			<c:if test="${pageMaker.cri.category ne null}">
   				<input type="hidden" name="category" value="${pageMaker.cri.category }">	
   			
   			</c:if>
   			
   			<c:if test="${pageMaker.cri.chooseSearch ne null}">
   				<input type="hidden" name="chooseSearch" value="${pageMaker.cri.chooseSearch }">	
   				<input type="hidden" name="search" value="${pageMaker.cri.search }">	
   			</c:if>
  	</form>
        <!-- 페이지 넘버부분 끝 -->
        
		<br>
        <!-- 검색창 -->
        <table style="width: 100%; padding-left: 35%;" >
          <tr>
            <td>
              <form action="list" id="boardSearch" method="get">
              	  <select name="chooseSearch">
              	  	<option value="userId">유저아이디</option>
              	  </select>
				  <input type="search" id="search" name="search" >&nbsp;
                  <button type="button" class="searchbutton" onclick="searchCheck()">검색</button>
              </form>
            </td>

          </tr>
        </table>
  
      <br>

    </div>
    
  </div>
<script type="text/javascript">
	
	
	$(".pageInfo a").on("click", function(e){
		let moveForm = $("#moveForm");
	    e.preventDefault();
	    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	    moveForm.attr("action", "memberList");
	    moveForm.submit();
	    
	});

// 	검색어 체크 펑션
	function searchCheck(){
		  const search = document.getElementById("search").value;
		  
		  if(search.length == 0){
		    alert("검색어를 입력해주세요");
		  }
		  else if(search.length > 100){
			alert("검색어는 100자까지 가능합니다.");
		  }
		  else{
			  document.location.href = "memberList?search="+search;  
		  }

		}
		
// 	삭제 확인 펑션
	function deleteCheck(userId) {
		const check = confirm("정말 삭제하시겠습니까?");
		if (check) {
			document.location.href = "exile?userId="+userId;
		}
	}
</script>
<!-- 메인  끝-->

</body>
</html>