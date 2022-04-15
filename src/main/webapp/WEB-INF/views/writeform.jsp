<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
h2 {
	text-align: center;
	font-family: cursive;
}

table {
	margin: auto;
	width: 450px;
}

.td_left {
	width: 150px;
	background: silver;
}

.td_right {
	width: 300px;
	background: silver;
}

#commandCell {
	text-align: center;
}
</style>
</head>
<body>
	<!-- 게시판 글쓰기 -->

	<section id="./writeForm">
		<h2>글쓰기</h2>
		<!-- boardwrite 를 통해 listform으로 보냄 -->
		<form action="./boardwrite" method="post" enctype="multipart/form-data" name="listform">
			<table>
				<tr>
					<td class="td_left"><label for="board_name">글쓴이</label></td>
					<td class="td_right"><input type="text" name="board_name"
						id="board_name" value="${name }" readonly required></td>
					<!-- 태그에 리콰이어드 안넣으면 서브밋이 안됨. 필수입력항목 -->
				</tr>
				<tr>
					<td class="td_left"><label for="board_subject">제 목</label></td>
					<td class="td_right"><input name="board_subject" type="text"
						id="board_subject" required ><c:out /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="board_content">내 용</label></td>
					<td><textarea id="board_content" name="board_content"
							cols="40" rows="15" required ></textarea></td>
				</tr>
				<tr>
					<td class="td_left"><label for="board_file"> 파일 첨부 </label></td>
					<td class="td_right"><input name="file" type="file"
						id="board_file" ></td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="등록">&nbsp;&nbsp;
				<!-- 취소 누르면 boardlist 페이지로 이동 -->
				<button type=button onclick="location.href='./boardlist';"/>취소
                        
			</section>
		</form>
	</section>
</body>
</html>