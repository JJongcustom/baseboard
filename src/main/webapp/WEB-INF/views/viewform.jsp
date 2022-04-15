<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
#articleForm {
	width: 700px;
	height: 500px;
	border: 1px solid silver;
	margin: auto;
}

h2 {
	text-align: center;
}

#basicInfoArea {
	height: 40px;
	text-align: center;
}

#articleContentArea {
	background: silver;
	margin-top: 20px;
	height: 350px;
	text-align: center;
	overflow: auto;
}

#commandList {
	margin: auto;
	width: 700px;
	text-align: center;
}
</style>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: red; text-decoration: underline;}
</style>


</head>

<body>
	<section id="articleForm">
		<h2 style="font-family: cursive; font-size: 30px;">글 상세보기</h2>
		<section id="basicInfoArea">
		<div style="font-size: 23px;">
			작성자 : ${article.board_name} &nbsp; 제 목 : ${article.board_subject }
		</div>
		<div>
			조회수 : ${article.board_readcount} &nbsp; 작성일 : ${article.board_date } &nbsp;
			첨부파일 :
			<c:if test="${article.board_filename!=null }">
				<a href="boardupload/${article.board_filename}"> ${article.board_filename} </a>
			</c:if>
		</div>
	</section>
	<section id="articleContentArea">
		<br>${article.board_content }
	</section>
	</section>
	<section id="commandList">
		<c:if test="${article.board_name == name}">
			<a href='modifyform?board_num=${article.board_num}'>[수정]</a>
			<a href='deleteform?board_num=${article.board_num}&page=${page}'>[삭제]</a>
		</c:if>
		
		 
		<a href="./boardlist?page=${page}"> [목록]</a>&nbsp;&nbsp;
	</section>
</body>
</html>