<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>


<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style>
.container {
	width: 350px;
}

h2 {
	text-align: center;
	font-family: cursive;
}

th {
	width: 100px;
	text-align: left;
}
</style>


</head>

<body>

	<div class='container'>
		<h2>로그인</h2>
		<hr>
		<form id="form" action="login" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" id="userid" name="userid" placeholder="아이디를 입력해주세요" required></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="userpw" name="userpw" placeholder="비밀번호를 입력해주세요" required></td>
				</tr>
				<tr>
					<td></td> <!-- 로그인 회원가입 가운데 정렬에 필요함 -->
					<td>
					<br>
					<div class="form-group text-center">
                        <input type="submit" id="memberInsertBtn" class="btn btn-primary"
                        value="로그인">
                        <button type="button" class="btn btn-warning" onclick="location.href='./join';">
                            회원가입<i class="fa fa-times spaceLeft"></i>
                        </button>
                    </div>
					</td>
					
				</tr>
			</table>
		</form>
	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
		$(function() {
			let msg = `${msg}`;
			if (msg != "") {
				alert(msg);
			}
			
			$('#memberInsertBtn').click(function() {
				
				var valId = $('#userid').val();
				var valPw = $('#userpw').val();
				
				if (valId == false) {
					alert("아이디를 입력하세요");
					return false;
				} else if (valPw == false) {
					alert("비밀번호를 입력하세요");
					return false;
				} 
			});	
			
		
		});
				
</script>
</html>