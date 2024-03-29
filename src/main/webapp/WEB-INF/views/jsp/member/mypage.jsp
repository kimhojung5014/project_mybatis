<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/join.css?12"> 
  <title>마이 페이지</title>
</head>
<body>
<script src="/js/Join_Check.js"></script>


  <!-- 메인 부분 -->
  <div id="mainStyle">
    <div id="mainContent">
      <h1 class="subtitle" >개인정보수정</h1>
      

      <form action="edit" method="post" id ="editForm">
      <input type="hidden" name ="numId" id="numId" value="${userData.numId }">
        <div class="textarea">
         <table id="join">
      
            <tr>
              <td class="textleft">아이디</td>
              <td>
              	<input type="text" name="userId" id="userId" style="color: gray;" readonly value="${userData.userId}">
              </td>
            </tr>
            <tr>
            <td></td>
            	<td><p>아이디는 수정할 수 없습니다.</p></td>
            </tr>
            <tr>
              <td class="textleft">비밀번호</td>
              <td><input type="password" id="pw" name="pw" value="${userData.pw}" required onkeyup="pw_Regular_Check()">
    		   </td>
            </tr>
            <tr>
            <td></td>
            	<td>
            	<p id="pwMsg"></p>
            	</td>
            </tr>
            <tr>
              <td class="textleft">비밀번호 확인</td>
				 <td><input type="password" name="pwCheck" id="pwCheck"  value="${userData.pw}" placeholder="비밀번호 재입력" required onkeyup="pw_Check()">
                 </td>
            </tr>
            <tr>
            <td></td>
            <td><p id ="pwCheckMsg"></p></td>
            </tr>
				 <tr>
	             	<td class="textleft">닉네임</td>
	             	<td>
	             		<input type="text" id = "nickName" name="nickName"  placeholder="사이트에서 보여질 이름" required oninput="nick_Check()">
	             	</td>

	            </tr>
	            <tr>
	            	<td></td>
	            	<td>
	            		<span id="nickMsg"></span>
            		</td>
	            </tr>
            
            <tr>
              <td class="textleft">이름</td>
              <td><input type="text" id="userName" name="userName" value="${userData.userName}"  required onkeyup="name_Check()"></td>
            </tr>
            <tr>
            	<td></td>
            	<td><p id ="userNameMsg"></p></td>
            </tr>
            <tr>
              <td class="textleft">이메일주소</td>
              <td>
              	<input type="text" id ="eMail" name="eMail" value="${userData.eMail}" required onkeyup="eMail_Check()">
              </td>
            </tr>
            <tr>
            	<td></td>
            	<td><p id="eMailMsg"></p></td>
            </tr>
            <tr>
              <td class="textleft">전화번호</td>
              <td>
              	<input type="tel" id = "telNumber" name="telNumber" value="${userData.telNumber}"  required onkeyup="tel_Check()">
              </td>
            </tr>
            <tr>
            	<td></td>
            	<td><p id="telMsg"></p></td>
            </tr>
            
            
<!--             <tr> -->
<!--               <td colspan="3"><button class="button" type="button" onclick=" myPage_final_Check()" >완료</button></td> -->
<!--             </tr> -->
          </table>
          <div>
          <ul id="choose">
	          <li><button class="button" type="button" onclick=" myPage_final_Check()" >완료</button></li>
	          <li><a class="button" onclick="drop('${userData.userId}','${userData.pw}')" >회원탈퇴</a></li>
          </ul>
          </div>
        </div>
        </form>
        <script type="text/javascript">
        	function drop(id,pw) {
        		const check = prompt('탈퇴하실 경우 비밀번호를 입력바랍니다.')
        		if(check === pw){
        			alert('회원탈퇴 진행')
        			document.location.href = "drop?userId="+id
        		}else{
        			alert('비밀번호가 틀립니다.')
        		}
			}
        </script>
    </div>
  </div>
<!-- 메인  끝-->

</body>
</html>