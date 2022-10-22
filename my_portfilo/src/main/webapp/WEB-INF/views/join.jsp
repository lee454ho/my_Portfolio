<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>DreamDream 회원가입</title>
<link rel="shortcut icon" href="${path}/resources/image/siteLogopavi.ico">
<link type="text/css" rel="stylesheet" href="/css/regist_page.css"></link>
</head>
<style>
* {
	margin: 0;
	box-sizing: border-box;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	width: 100vw;
	background-image: url('/bg1.jpg');
}

#form {
	padding: 20px;
	margin-top: 150px;
	
}

input {
	width: 100%;
	padding: 15px;
	font-size: 1.05rem;
}

td {
	padding: 5px;
}

.red_star {
	color: crimson;
}

#addressBtn {
	width: 100%;
	height: 52px;
	font-size: 1.1rem;
}

.zipcode {
	width: 200px;
}

#zipcode {
	text-align: center;
}

#joinBtn {
	width: 100%;
	height: 60px;
	font-size: 1.1rem;
}

.emailSelect {
	width: 100%;
	height: 52px;
	padding: 5px;
	font-size: 1.05rem;
}

table {
	width: 700px;
}

button{
	background-color: rgb(95, 95, 95);
	color: white;
	border: none;
	border-radius: 5px;
}
</style>
<body>
	<form method="post" id="form">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<table>
			<tr>
				<td>
					<p>
						<span class="red_star">*&nbsp;</span>아이디
					</p>
				</td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" id="userID" name="user_id"
					placeholder="ID">
					<p class="idText"></p></td>
			</tr>
			<tr>
				<td>
					<p>
						<span class="red_star">*&nbsp;</span>비밀번호
					</p>
				</td>
			</tr>
			<tr>
				<td colspan="3"><input type="password" id="userPW"
					name="user_password" placeholder="비밀번호"><br>
					<p class="pwText"></p>
				</td>
				
			</tr>
			<tr>
				<td>
					<p>
						<span class="red_star">*&nbsp;</span>비밀번호 확인
					</p>
					
				</td>
			</tr>
			<tr>
				<td colspan="3"><input type="password" id="userPW2" name="passWd2"
					placeholder="비밀번호 확인"><br>
					<p class="pw2Text"></p>
				</td>
			</tr>
			<tr>
				<td>
					<p>
						<span class="red_star">*&nbsp;</span>이름
					</p>
				</td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" id="userName"
					name="user_name" placeholder="이름"><br>
					<p class="nameText"></p>
				</td>
			</tr>
			<tr>
				<td>
					<p>
						<span class="red_star">*&nbsp;</span>주소
					</p>
				</td>
			</tr>
			<tr>
				<td><input type="hidden" class="address1" name="address" >
					<input type="text" id="address" disabled
					placeholder="주소"></td>
				<td class="zipcode">
					<input type="hidden" class="zipcode1" name="zipcode">
					<input type="text" id="zipcode" disabled
					 placeholder="우편번호"></td>
				<td>
					<button type="button" id="addressBtn">주소 검색</button>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<p class="addressText"></p>
					<input type="text" id="detailAddress"
					name="address_detail" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<p class="text pwck">이메일 (@는 제외하고 입력)</p>
				</td>
			</tr>
			<tr>
				<td><input type="text" id="userEmail" name=""
					placeholder="email"></td>

				<td><input type="text" id="emailAddress"
					placeholder="@는 제외하고 입력" disabled></td>
				<td><select name="" id="emailAddressSelect" class="emailSelect">
						<option value="1" disabled selected>이메일 선택</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="2">직접 입력</option>
				</select> <input name="email" id="submitAddress" type="hidden">
				<p class="emailText"></p>
			</td>
			</tr>
			<tr>
				<td colspan="3">
					<button type="button" id="joinBtn">회원 가입</button>
				</td>
			</tr>
		</table>
		<br>
	</form>
</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

		/////////////////////////정규표현식///////////////////////////////////////////
		//아이디 - 숫자와 영문(대/소문자)만
		const ID_CHECK = /^[a-zA-Z0-9]*$/;
		//패스워드 - 영문(소문자), 숫자, 특수문자를 한 개 이상 사용
		const PW_CHECK = /(?=.*\d)+(?=.*[~`!@#$%\^&*()-+=])+(?=.*[a-z])+.{0,}$/
		//이름 - 한글과 영어 사용
		const NAME_CHECK = /^[가-힣a-zA-Z]*$/;
		//이메일 - 영문(소문자), 숫자만 사용
		const EMAIL_CHECK = /^[a-zA-Z0-9]*$/;
		//유효성 검사
		const REGIST_CHECK = /(pass){6,6}/
		///////////////////////////////////////////////////////////////////

		///////글씨 색깔////////////////
		let defaultColor = "D2691E";
		let warnColor = "crimson";
		let cautionColor = "orangered";
		
		///////////////////////////////

		///////////////////////변수///////////////////////
		let idCheck = document.querySelector('#userID');
		let pwCheck = document.querySelector('#userPW');
		let pwCheck2 = document.querySelector('#userPW2');
		let nameCheck = document.querySelector('#userName');
		let emailCheck = document.querySelector('#userEmail');
		let btn = document.querySelector('#joinBtn');
		let emailAddress = document.querySelector('#emailAddress');
		let emailAddressSelect = document.querySelector('#emailAddressSelect');
		let submitAddress = document.querySelector("#submitAddress");
		let addressBtn = document.querySelector("#addressBtn");
		let address = document.querySelector("#address");
		let zipcode = document.querySelector("#zipcode");
		let detailAddress = document.querySelector("#detailAddress");
		let flag = ['fail', 'fail', 'fail', 'fail', 'fail','fail'];
		let msg = [];
		const alertColor = 'crimson';
		const passColor = "rgb(19,168,99)";
		let idDuple = 0;
		////////////////////////////////////////////////////
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		/////////////////////유효성 검사///////////////////////////
	

		if (typeof (Storage) !== 'undefined') {


			//이메일 선택 박스
			emailAddressSelect.addEventListener('change', function (e) {

				if (e.target.value == '1') {
					emailAddress.disabled = true;
				} else if (e.target.value == '2') {
					emailAddress.disabled = false;
					emailAddress.value = '';
					submitAddress.value = emailCheck.value + '@' + emailAddress.value;
				} else {
					emailAddress.disabled = true;
					emailAddress.value = e.target.value;
					submitAddress.value = emailCheck.value + '@' + e.target.value;
				}
			})

			//이메일 값을 서브밋 했을 때 보내기 위한 부분
			emailAddress.addEventListener('keyup', function () {
				submitAddress.value = emailCheck.value + '@' + emailAddress.value;
			})
			emailCheck.addEventListener('keyup', function () {
				submitAddress.value = emailCheck.value + '@' + emailAddress.value;
			})


			//주소
			addressBtn.addEventListener('click', function () {
				new daum.Postcode({
					oncomplete: function (data) { //선택시 입력값 세팅
						address.value = data.address; // 주소 넣기
						zipcode.value = data.zonecode;
						detailAddress.focus(); //상세입력 포커싱
					}
				}).open();
			}); // 카카오 주소 찾기 api

			//회원가입 버튼을 눌렀을 때 유효성 검사를 한다.
			btn.addEventListener('click', function () {
				regexCheck();
			})



			//아이디
			idCheck.addEventListener('keyup', function(){
				if (idCheck.value.length == 0) {
					idDuple = 0;
					msg[0] = '아이디를 입력해 주세요.';
					flag[0] = 'fail';
					document.querySelector('.idText').innerHTML = msg[0];
					document.querySelector('.idText').style.color = alertColor;
				}
				if (ID_CHECK.test(idCheck.value) != true) {
					idDuple = 0;
					msg[0] = "아이디는 반드시 영문 혹은 숫자로 입력하셔야 합니다.";
					flag[0] = 'fail';

					document.querySelector('.idText').innerHTML = msg[0];
					document.querySelector('.idText').style.color = alertColor;

				} else if (idCheck.value.length > 20 || idCheck.value.length < 6) {
					idDuple = 0;
					msg[0] = "아이디는 반드시 6~20자 사이로 입력하셔야 합니다.";
					flag[0] = 'fail';

					document.querySelector('.idText').innerHTML = msg[0];
					document.querySelector('.idText').style.color = alertColor;

				} else {
					idDuple = 1;
					flag[0]	= 'pass';
				}
			})

			//비밀번호
			pwCheck.addEventListener('keyup', function(){
				if (pwCheck.value.length == 0) {
					msg[1] = '비밀번호를 입력해 주세요.'
					flag[1] = 'fail';

					document.querySelector('.pwText').innerHTML = msg[1];
					document.querySelector('.pwText').style.color = alertColor;
				}
				if (pwCheck2.value.length == 0) {
					msg[2] = '비밀번호 확인란을 입력하지 않으셨습니다.'
					flag[2] = 'fail';

					document.querySelector('.pw2Text').innerHTML = msg[2];
					document.querySelector('.pw2Text').style.color = alertColor;
				}
	
				if (PW_CHECK.test(pwCheck.value) != true) {
					msg[1] = "비밀번호는 반드시 대문자,특수문자,숫자를 포함해야 합니다."
					flag[1] = 'fail';
					
					document.querySelector('.pwText').innerHTML = msg[1];
					document.querySelector('.pwText').style.color = alertColor;
				} else if (pwCheck.value.length > 20 || pwCheck.value.length < 9) {
					msg[1] = "비밀번호는 반드시 9~20자 사이로 입력하셔야 합니다."
					flag[1] = 'fail';
					
					document.querySelector('.pwText').innerHTML = msg[1];
					document.querySelector('.pwText').style.color = alertColor;
				} else {
					msg[1] = '사용 가능';
					flag[1] = 'pass';
					
					document.querySelector('.pwText').innerHTML = msg[1];
					document.querySelector('.pwText').style.color = passColor;
				}
				if (pwCheck.value != pwCheck2.value) {
					msg[2] = "입력하신 비밀번호와 일치하지 않습니다."
					flag[2] = 'fail';

					
					document.querySelector('.pw2Text').innerHTML = msg[2];
					document.querySelector('.pw2Text').style.color = alertColor;
				} else {
					msg[2] = '비밀번호 일치';
					flag[2] = 'pass';

					
					document.querySelector('.pw2Text').innerHTML = msg[2];
					document.querySelector('.pw2Text').style.color = passColor;
				}
			})


			//비밀번호 확인
			pwCheck2.addEventListener('keyup',function(){
				if (pwCheck.value != pwCheck2.value) {
					msg[2] = "입력하신 비밀번호와 일치하지 않습니다.";
					flag[2] = 'fail';
					
					document.querySelector('.pw2Text').innerHTML = msg[2];
					document.querySelector('.pw2Text').style.color = alertColor;
				} else {
					msg[2] = '비밀번호 일치';
					flag[2] = 'pass';
					
					document.querySelector('.pw2Text').innerHTML = msg[2];
					document.querySelector('.pw2Text').style.color = passColor;
				}
			})



			//이름
			nameCheck.addEventListener('keyup', function(){
				if (nameCheck.value.length == 0) {
					msg[3] = "이름을 입력해 주세요."
					flag[3] = 'fail';
				} else if (NAME_CHECK.test(nameCheck.value) != true) {
					msg[3] = "이름은 반드시 영문과 한글로만 작성하셔야 합니다."
					flag[3] = 'fail';
				} else if (nameCheck.value.length < 2) {
					msg[3] = "이름은 반드시 두 글자 이상 입력하셔야 합니다."
					flag[3] = 'fail';
				} else {
					msg[3] = '사용 가능';
					flag[3] = 'pass';
				}
			})



			//이메일
			emailCheck.addEventListener('keyup', function(){
				if (emailCheck.value.length == 0) {
					msg[4] = "이메일을 입력해 주세요.";
					flag[4] = 'fail';
				} else if (EMAIL_CHECK.test(emailCheck.value) != true) {
					msg[4] = "이메일을 제대로 입력해 주세요.";
					flag[4] = 'fail';
				} else {
					msg[4] = '사용 가능';
					flag[4] = 'pass';
				}
			})

			//주소

			

			function regexCheck() {
			
			//주소 유효성 검사
			document.querySelector('.address1').value = address.value;
			document.querySelector('.zipcode1').value = zipcode.value;

			if(address.value.length == 0){
				flag[5] = 'fail';
				msg[5] = '주소 검색을 통해 주소를 입력해 주세요.'
			} else {
				msg[5] = '사용 가능';
				flag[5] = 'pass';
			}


				let lastCheck = '';
				let alertMsg = '';
				for (let i = 0; i < flag.length; i++) {
					lastCheck += flag[i]
					//flag에 들어있는 배열의 값들을 변수에 저장
				}
				
				for (let i = 0; i < msg.length; i++) {
					let msgTemp = "";
					msgTemp = msg[i];
					if (msgTemp != '') {
						alertMsg += msg[i] + "\n"
					}
				}
				
				
				if (REGIST_CHECK.test(lastCheck) != true) {
					if (idDuple == 0){
						alert('입력값이 잘못 되었습니다.')
						idCheck.focus();
					return false;
					} else if(flag[0] == 'fail'){
						alert('입력값이 잘못 되었습니다.')
						idCheck.focus();
					} else if (flag[1] == 'fail'){
						alert('입력값이 잘못 되었습니다.')
						pwCheck.focus();
					} else if (flag[2] == 'fail'){
						alert('입력값이 잘못 되었습니다.')
						pwCheck2.focus();
					} else if (flag[3] == 'fail'){
						alert('입력값이 잘못 되었습니다.')
						nameCheck.focus();
					} else if (flag[5] == 'fail'){
						alert('주소를 입력해 주세요.')
						addressBtn.focus();
					} else if (flag[4] == 'fail'){
						alert('입력값이 잘못 되었습니다.')
						emailCheck.focus();
					}
				} else {
					alert("회원 가입을 환영합니다.")
					document.querySelector("#form").action="insert.do";
					document.querySelector("#form").submit();
				}

			}

		}

		$('#userID').on('keyup', function(){
			let userid = $('#userID').val();
			
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
				});
			
			if(userid.length != 0 && ID_CHECK.test(userid)){
				
				$.ajax({
					type: "get",
					url: '/idCheck',
					data: {
						"user_id" : userid
					},
					success : function(data){
						if(data == 1){
							msg[0]="아이디 중복"
							document.querySelector('.idText').innerHTML = msg[0];
							document.querySelector('.idText').style.color = alertColor;
							idDuple = 0;
						} else {
							if(idDuple == 1){
								msg[0] = '';
								flag[0] = 'pass';
								document.querySelector('.idText').innerHTML = "사용 가능";
								document.querySelector('.idText').style.color = passColor;
							}
						}
					},
					error :function(){
					}
				})
			} else {
				alert("입력값을 다시 한 번 확인해 주세요.")
			}
		})
	 	

	</script>


</html>