<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>DreamDream 로그인</title>
		<link rel="shortcut icon" href="${path}/resources/image/siteLogopavi.ico">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style>
			* {
				margin: 0;
				box-sizing: border-box;
			}

			body {
				width: 100vw;
				height: 100vh;
				display: flex;
				justify-content: center;
				align-items: center;
			}

			.container {
				display: flex;
				justify-content: center;
				align-items: center;
				width: 35%;
				height: 60%;
				border: 1px solid #DADADA;
			}
			form{
				width: 63%;	
			}
			table{
				width:100%;
			}
			td{
				padding: 5px 0;
			} 

			.loginBtn {
				width: 100%;
			}

			.joinBtn {
				width: 100%;
			}

			.loginHead {
				text-align: center;
				font-size: 4rem;
				font-weight: bold;
			}
			
			input{
				width: 100%;
				height: 30px;
			}
		</style>
		<script>
			function join() {
				location.href = "/join.do";
			}
		</script>
	</head>

	<body>

		<div class="container">
			<form action="/user/login_check.do" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<table>
					<tr>
						<td>
							<p class="loginHead">로그인</p> 
						</td>
					</tr>
					<tr>
						<td>
						</td>
					</tr>
					<tr>
						<td>
							<p style="color:red">${message}</p>
							<p>아이디</p>
						</td>
					</tr>
					<tr>
						<td><input type="text" name="userid">
					</tr>
					<tr>
						<td>
							비밀번호
						</td>
					</tr>
					
					<tr>
						<td><input type="password" name="passwd"></td>
					</tr>
					<tr>
						<td class="login">
							<input type="submit" value="로그인" class="loginBtn">
						</td>
					</tr>
					<tr>
						<td class="join">
							<input type="button" value="회원가입" class="joinBtn" onclick="join()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>