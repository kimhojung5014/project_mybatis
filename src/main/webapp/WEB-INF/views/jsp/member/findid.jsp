<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/find.css"> 
  <title>아이디 찾기 페이지</title>
</head>
<body>
<script src="/js/Join_Check.js" charset="UTF-8"></script>


 <!-- 메인 부분 -->
  <div id="mainStyle">

    <div id="mainContent">

      <p class="subtitle">아이디 찾기</p>
      <div class="textarea">
          <form action="searchId" method="post" id="searchIdForm">
            <table id=search>
              <tr>
                <td class="textleft"><p class="subsubtitle">이름</p></td>
                <td><input type="text" id="userName" name="userName" placeholder="이름" required maxlength="20"></td>
              </tr>
	           
              <tr>
                <td class="textleft"><p class="subsubtitle">이메일 주소</p></td>
                <td><input type="eMail" id="eMail" name="eMail" placeholder="이메일" required="required" maxlength="40"></td>
              </tr>

              <tr>
                <td class="textleft"><p class="subsubtitle">전화번호</p></td>
                <td><input type="tel" id="telNumber" name="telNumber" placeholder="전화번호" required="required" maxlength="20"></td>
              </tr>

              <tr>
                <td colspan="2">
                <button class="submitbutton" >완료</button>
                </td>
              </tr>
            </table>
          </form>
        </div>
    </div>
  </div>
   


</body>
</html>