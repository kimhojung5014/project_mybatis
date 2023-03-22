<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/join.css?aa"> 
  <title>회원가입 페이지</title>
  
</head>
<body>

<script src="/js/Join_Check.js?ㄴㅇ"></script>


  <!-- 메인 부분 -->

  <div id="mainStyle">
    <div id="mainContent">
      <p class="subtitle">회원가입</p>
      

        <form action="join" method="post" name="joinForm" id ="joinForm">
        <input type="hidden" value="0" name="numId">
        <div class="textarea">
         <table id="join"> 
              	
			
				<tr>
            			<td class="textleft">아이디</td>
					<td>
						<input type="text" name="userId" id="userId" placeholder="아이디 입력" autofocus required oninput="id_Check()">
					</td>						

				</tr>
		        <tr>
	            	<td></td>
	            	<td>
	            		<span id="idMsg"></span>
	            	</td>
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
              <td class="textleft">비밀번호</td>
              <td><input type="password" id="pw" name="pw" placeholder="영어와 숫자 조합 8~15 글자" required onkeyup="pw_Regular_Check()">
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
				 <td><input type="password" name="pwCheck" id="pwCheck" placeholder="비밀번호 입력" required onkeyup="pw_Check()">
                 </td>
            </tr>
            <tr>
            <td></td>
            <td><p id ="pwCheckMsg"></p></td>
            </tr>
       
            <tr>
              <td class="textleft">이름</td>
              <td><input type="text" id="userName" name="userName"required onkeyup="name_Check()"></td>
            </tr>
            <tr>
            	<td></td>
            	<td><p id ="userNameMsg"></p></td>
            </tr>
            <tr>
              <td class="textleft">이메일주소</td>
              <td>
              	<input type="text" id ="eMail" name="eMail"  required onkeyup="eMail_Check()">
              </td>
            </tr>
            <tr>
            	<td></td>
            	<td><p id="eMailMsg"></p></td>
            </tr>
            <tr>
              <td class="textleft">전화번호</td>
              <td>
              	<input type="tel" id = "telNumber" name="telNumber" placeholder="'-'없이 입력 바랍니다." required onkeyup="tel_Check()">
              </td>
            </tr>
            <tr>
            	<td></td>
            	<td><p id="telMsg"></p></td>
            </tr>
            
            
            <tr>
              <td colspan="3">
	              <button style="margin: auto;" class="button" type="button" onclick="final_Check()">회원가입</button>
	          </td>
            </tr>
          </table>
        </div>
        </form>
    </div>
  </div>

<!-- 메인  끝-->

</body>
</html>