//비밀번호 재설정

function resetPw(password) {
	const pw = password;
	console.log(pw)
	if (document.getElementById("pw").value === pw) {
		alert("기존 비밀번호와 같습니다.")
	}
	else if (pw_Check() && pw_Regular_Check() && document.getElementById("pw").value != pw) {
		document.getElementById('resetPwForm').submit();
	}
	else {
		alert("비밀번호 양식을 확인해주세요.")
	}
}
// 비밀번호 동일한지 체크하는 메소드
function pw_Check() {
	/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
	/* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
	/* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
	const password = document.getElementById('pw');					//비밀번호 
	const passwordConfirm = document.getElementById('pwCheck');	//비밀번호 확인 값
	const pwMsg = document.getElementById('pwMsg');				//확인 메세지
	const correctColor = "#28b428";	//맞았을 때 출력되는 색깔.
	const wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
		
		if(password.value == pwCheck.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			pwCheckMsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
			pwCheckMsg.innerHTML ="비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
			return true;
		}else{
			pwCheckMsg.style.color = wrongColor;
			pwCheckMsg.innerHTML ="비밀번호 불일치";
		
		}
	}


//비밀번호 글자 수 체크
//비밀번호 정규식 체크 ^[a-zA-Z\\d`~!@#$%^&*()-_=+]{8,24}$
//비밀번호 안먹으니 나중에
function pw_Regular_Check(){

	const password =  document.getElementById("pw");
	const pwMsg = document.getElementById("pwMsg");
	const correctColor = "#28b428";	//맞았을 때 출력되는 색깔.
	const wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
	  const  pattern = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 ( 3 가지 조합)
	  
	  if(pattern.test(password.value)){
		  pwMsg.style.color = correctColor;
		  pwMsg.innerHTML = "OK!";
			return true;
		  
	  }
	  else{
		  pwMsg.style.color = wrongColor;
		  pwMsg.innerHTML = "특수문자, 숫자, 영어 포함 8-15자리 이내로 작성해주세요.";	
	      
	}
	}

//아이디 정규식
function id_Check(){

	let userId = $('#userId').val();
	let idMsg = document.getElementById("idMsg");
	let correctColor = "#28b428";	//맞았을 때 출력되는 색깔.
	let wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
	const pattern =/^[A-Za-z]{1}[A-Za-z0-9]{7,20}$/; // 첫글자는 문자만 가능 뒤는 상관 없고 글자수는 8-20
	  
	if(pattern.test(userId)){
		  //정규식 통과하면 아작스 추가
		  $.ajax({
	            url:'/idCheck', //Controller에서 요청 받을 주소
	            type:'post', //POST 방식으로 전달
	            data:{userId:userId},
	            success:function(value){ //컨트롤러에서 넘어온 cnt값을 받는다 
	                if(value == 0){ //value가 0일 경우 -> 사용 가능한 아이디 
	        		  	idMsg.style.color = correctColor;
	        			idMsg.innerHTML = "사용가능합니다.";
	        			return true;
	                } else { // value가 1일 경우 -> 이미 존재하는 아이디
	                	idMsg.style.color = wrongColor;
	                	idMsg.innerHTML = "이미 사용중인 아이디입니다.";
	                	
	                }
	            },
	            error:function(){
	                alert("서버 연결 에러 입니다");
	            }
	        });
	
	  }else{
		  	idMsg.style.color = wrongColor;
			idMsg.innerHTML = "첫글자는 영어, 8 ~ 20 글자 특수문자 제외 입력";			
	  }
	}


//닉네임 2글자 이상 확인
function nick_Check(){

	let nickName = $('#nickName').val();
	let nickMsg = document.getElementById("nickMsg");
	const correctColor = "#28b428";	//맞았을 때 출력되는 색깔.
	const wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔

	const pattern =/^[A-Za-z]{1}[A-Za-z0-9]{1,20}$/; // 첫글자는 문자만 가능 뒤는 상관 없고 글자수는 5-20
	  if(pattern.test(nickName)){
		  //정규식 통과하면 아작스 추가
		  $.ajax({
	            url:'/nickCheck', //Controller에서 요청 받을 주소
	            type:'post', //POST 방식으로 전달
	            data:{nickName:nickName},
	            success:function(value){ //컨트롤러에서 넘어온 값을 받는다 
	                if(value == 0){ //value가 0일 경우 -> 사용 가능한 닉네임
	                	nickMsg.style.color = correctColor;
	                	nickMsg.innerHTML = "사용가능합니다.";
	                } else { // value가 1일 경우 -> 이미 존재하는 닉네임
	                	nickMsg.style.color = wrongColor;
	                	nickMsg.innerHTML = "이미 사용중인 닉네임입니다.";
	                }
	            },
	            error:function(){
	                alert("서버 연결 에러 입니다");
	            }
	        });
	  }else{
		  nickMsg.style.color = wrongColor;
		  nickMsg.innerHTML = "영어로 시작하는 영어와 숫자 조합 2~20 글자";
			return false;
			
	  }
	}



//이름 길이 체크
function name_Check(){

	const userName =  document.getElementById("userName");
	const userNameMsg = document.getElementById("userNameMsg");
	const correctColor = "#28b428";	//맞았을 때 출력되는 색깔.
	const wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
	const regKor = /^[가-힣]{2,20}$/;//한글이름 2~10글자
	const regEng = /^[a-zA-Z]{2,20}$/;//영어이름 2~20글자
	
	  if(regKor.test(userName.value)){ //한글이름 체크
		  userNameMsg.style.color = correctColor;
		  userNameMsg.innerHTML = "OK!";
		  return true;
		  
	  }else if (regEng.test(userName.value)) { // 영어 이름 체크
		  userNameMsg.style.color = correctColor;
		  userNameMsg.innerHTML = "OK!";
		  return true;			
	  }else {
		  userNameMsg.style.color = wrongColor;
		  userNameMsg.innerHTML = "영어, 한글 중 택해서 2~20글자 이내로 입력해주세요.";
		  return false;
	  }
	}
//이메일 주소 정규식 
function eMail_Check() {
	const correctColor = "#28b428";	//맞았을 때 출력되는 색깔.
	const wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
	const eMail = document.getElementById("eMail");
	const eMailMsg = document.getElementById("eMailMsg");
	const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if (regExp.test(eMail.value)) {
		eMailMsg.style.color = correctColor;
		eMailMsg.innerHTML = "OK!";
		return true;
	}else {
		eMailMsg.style.color = wrongColor;
		eMailMsg.innerHTML = "이메일을 확인해주세요.";
	}
}

//전화 번호 정규식
function tel_Check() {
	const correctColor = "#28b428";	//맞았을 때 출력되는 색깔.
	const wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
	const telNumber = document.getElementById("telNumber");
	const telMsg = document.getElementById("telMsg");
	const regExp = /01[016789][0-9]{4}[0-9]{4}/; // 전화번호 정규식 
	if (regExp.test(telNumber.value)) {
		telMsg.style.color = correctColor;
		telMsg.innerHTML = "OK!";
		return true;
	}else {
		telMsg.style.color = wrongColor;
		telMsg.innerHTML = "전화번호를 확인해주세요.";
	}
}
//회원가입에서 최종 확인시 쓰는 메소드 다른 메소드가 전부 참이면 인서트 컨트롤러로 값 넘김
function final_Check() {

 if(pw_Check() && pw_Regular_Check()&& eMail_Check() && tel_Check() && name_Check() &&
		 $('#idMsg').text() === '사용가능합니다.' && $('#nickMsg').text() === '사용가능합니다.'){
		alert("회원가입에 성공하였습니다.");
		document.getElementById('joinForm').submit();
	}else {
		alert("모든 항목을 입력해주세요");
	}
}

//마이페이지에서 수정 시 쓰는 메소드
function myPage_final_Check() {

	if (pw_Check() && pw_Regular_Check()  && name_Check() && eMail_Check() && tel_Check()
		&& $('#nickMsg').text() === '사용가능합니다.') {
		
		alert("정보수정이 완료되었습니다.");
		document.getElementById('editForm').submit();
	}else {
		alert("모든 항목을 입력해주세요");
	}
}


function loginCheck() {
	
	let id = document.getElementById("userId").value.length;
	let pw = document.getElementById("pw").value.length;
	
	if (id == 0 || pw == 0 || id > 20 || pw >15 ) {
		alert("아이디 비밀번호를 확인해주세요.");
	} else {
		document.getElementById("loginForm").submit();
	}
}