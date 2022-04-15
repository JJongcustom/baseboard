<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>게시판</title>

<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">
h2 {
	text-align: center;
	font-family: cursive;
}

table {
	margin: auto;
	width: 950px;
}

#tr_top {
	background: silver;
	text-align: center;
}

#listForm {
	font-size: large;
	text-align: center;
}

#pageList {
	margin: auto;
	width: 1000px;
	text-align: center;
}

#emptyArea {
	margin: auto;
	width: 950px;
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
	<nav>
		<ul>
			<li>안녕하세요 ${name} 님</li>
			<li>
				<form action='logout' method='post'>
					<button type="submit" class="btn btn-secondary" id="logout">로그아웃</button>
				</form>
				
			</li>
		</ul>
	</nav>
	<!-- 게시판 리스트 -->

	
			<h2>글 목록
			<a style="font-family:fantasy;" href="writeform" class="btn btn-primary">게시판글쓰기</a>
			</h2>
	
		

	<c:choose>
		<c:when test="${articleList!=null && pageInfo.listCount>0 }">
			<section id="listForm">
				<table>
					<tr id="tr_top">
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>날짜</td>
						<td>조회수</td>
					</tr>

					<c:forEach var="article" items="${articleList }">
						<tr>
							<td>${article.board_num }</td>
							<td><a
								href="./boarddetail?board_num=${article.board_num}&page=${pageInfo.page}">
									<!-- 링크 --> ${article.board_subject} <!-- 아티클 번호 -->
							</a></td>
							<td>${article.board_name }</td>
							<!-- 보드명 날짜 리드카운트 . 컨텐트는 없음 -->
							<td>${article.board_date }</td>
							<td>${article.board_readcount }</td>
						</tr>
					</c:forEach>
				</table>
			</section>
			<section id="pageList">
				<!-- 페이지 목록 -->
				<!-- if else 랑 같음.  페이지가 1보다 작거나 같으면 이전페이지로 -->
				<c:choose>
					<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
					<c:otherwise>
						<a href="boardlist?page=${pageInfo.page-1}">[이전]</a>&nbsp;
				</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${pageInfo.startPage }"
					end="${pageInfo.endPage }">
					<!-- end page 마지막 페이지 -->
					<!-- 현재페이지. 1페이지에서는 현재와 이전페이지 클릭될 필요가없음.-->
					<!-- 현재페이지를 제외한 나머지페이지 -->
					<c:choose>
						<c:when test="${pageInfo.page==i }">[${i }]</c:when>
						<c:otherwise>
							<a href="boardlist?page=${i}">[${i }]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
					<c:otherwise>
						<a href="boardlist?page=${pageInfo.page+1}">[다음]</a>
					</c:otherwise>
				</c:choose>
				<!-- 페이지에 답변 달았으면 그 페이지 목록이 보여야함. -->
				<!-- 눈에 보이진 않지만 페이지를 달고다님. -->
			</section>
		</c:when>
		<c:otherwise>
			<section id="emptyArea">등록된 글이 없습니다.</section>
		</c:otherwise>
	</c:choose>
	
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
			$('#logout').click(function() {
				alert("안녕히가세요");
			}); 
</script>
</html>