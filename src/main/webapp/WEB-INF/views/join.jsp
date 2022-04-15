<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<style>
h3 {
	text-align: center;
	font-family: cursive;
}
</style>
<body>
	<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>회원가입</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			<form action="join" method="POST">
				<div class="form-group">
					<label for="inputName">성명</label> <input type="text"
						class="form-control" id="username" name="username"
						placeholder="이름을 입력해주세요" required>
				</div>
				<div class="form-group">
					<label for="InputEmail">아이디</label> <input type="text"
						class="form-control" id="userid" name="userid"
						placeholder="아이디를 입력해주세요" required>
					<button type="button" id="idCheck">아이디 중복확인</button>
				</div>
				<div class="form-group">
					<label for="inputPassword">비밀번호</label> <input type="password"
						class="form-control" id="userpw" name="userpw"
						placeholder="영문자+숫자+특수조합(8~20자리 입력)" required>
				</div>
				<div class="form-group">
					<label for="inputPasswordCheck">비밀번호 확인</label> <input
						type="password" class="form-control" id="userpwCheck"
						name="userpwCheck" placeholder="비밀번호 확인을 위해 다시 입력 해주세요" required>
				</div>
				<div class="form-group">
					<label for="inputMobile">휴대폰 번호</label> <input type="tel"
						class="form-control" id="userphone" name="userphone"
						placeholder="휴대폰번호를 입력해주세요" required>
				</div>

				<div class="form-group">
					<label>약관 동의</label>
					<div data-toggle="buttons">
						<label class="btn btn-primary active"> <span
							class="fa fa-check"></span> <input id="agree" name="agree"
							type="checkbox" autocomplete="off" checked>
						</label> <a href="#">이용약관</a>에 동의합니다.
					</div>
				</div>

				<div class="form-group text-center">
					<input type="submit" id="memberInsertBtn" class="btn btn-primary"
						value="회원가입">
					<button type=button class="btn btn-warning"
						onclick="location.href='./login';">
						가입취소 <i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>

	</article>


</body>
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Java Script -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->

<script type="text/javascript">
	//아이디 중복 체크 및 비밀번호 확인
	$(function() {
		let isCheck = false;
		
		$('#memberInsertBtn').click(function() {
			var valId = $('#userid').val();
			var valName = $('#username').val();
			var valPass = $('#userpw').val();
			var valCPass = $('#userpwCheck').val();
			var idCheck = $('#idCheck').attr('idCheck');
			var pw = $("#userpw").val();
			var num = pw.search(/[0-9]/g);
			var eng = pw.search(/[a-z]/ig);
			var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			
				if (valName == false) {
					alert("이름을 입력하세요")
					return false;
				}
			
				if (valId == false) {
					alert("아이디를 입력하세요")
					return false;
				}
			
				if (hangulcheck.test(valId)){
					 alert("아이디에 한글을 사용 할 수 없습니다.");
					 $('#userid').focus();
					return false; 
				}
			
				if (isCheck == false) {
					alert("아이디 중복을 확인하세요")
					return false;
				}
				
			
				if (valPass != valCPass) {
					alert('비밀번호가 같지 않습니다.');
					$('#userpw').val("");
					$('#userpwCheck').val("");
					$('#userpw').focus();
					return false;
				}
			
				if(pw.length < 8 || pw.length > 20){

					  alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
					  return false;
				} else if(pw.search(/\s/) != -1){
					  alert("비밀번호는 공백 없이 입력해주세요.");
					  return false;
				} else if(num < 0 || eng < 0 || spe < 0 ){
					  alert("비밀번호는 영문,숫자, 특수문자를 혼합하여 입력해주세요.");
					  return false;
				} else {
					console.log("통과"); 
				    return true;
				}
		})
		
		
			/* 8자리이상 영대,영소,숫자,툭스포함 한글x 아이디포함x 공백x 4번반복문자x */
			/* function chkPW(){

				var pw = $("#password").val();
				var id = $("#id").val();
					
				var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
				var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				 
				if(false === reg.test(pw)) {
				alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
				}else if(/(\w)\1\1\1/.test(pw)){
				 alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
				 return false;
				 }else if(pw.search(id) > -1){
				 alert("비밀번호에 아이디가 포함되었습니다.");
				  return false;
				 }else if(pw.search(/\s/) != -1){
				 alert("비밀번호는 공백 없이 입력해주세요.");
				 return false;
				 }else if(hangulcheck.test(pw)){
				 alert("비밀번호에 한글을 사용 할 수 없습니다."); 
				 }else {
				 console.log("통과");
				 } 
			$('#login').submit();
			
		});*/
			
		
		$('#idCheck').click(function() {
			let id = $('#userid').val();

			$.ajax({
				url : '/idCheck',
				data : {
					"userid" : id
				},
				dataType : 'text',
				type : 'post',
				success : function(msg) {
					alert(msg);
					if (msg != "사용가능한 아이디입니다.") {
						$('#userid').val('');
						isCheck = false;
					} else {
						isCheck = true;
					}
				}
			})
		})
	});
</script>
<!-- 휴대전화 하이픈 입력 -->
<script>
$(document).on("keyup", "#userphone", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
</script>


</html>