<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/main.css?ver=2019090305">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/album.css?ver=20190904">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css?ver=2019090502">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/view.css?ver=2019090506">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1.jquery.min.js"></script>
	
<title>Insert title here</title>
</head>
<script>
	
if ("${one.writer}" == "${sessionScope.name}") {
    $(".b-del").css('display', 'inline');
    $(".b-up").css('display', 'inline');
 	}	
	function comment_list(){
		$.ajax({
			type: "get",
			url: "${path}/reply/list?bno=${one.bno}",
			success: function(page){
				$("#commentList").html(page);
			}
		});
		}
		$(document).ready(function(){
			comment_list();
		});
	
</script>
<body>
	<%@ include file="../include/header.jsp"%>

	<div class="body-1">
		<div class="bla"></div>
		<h3>커뮤니티 게시판</h3>
		<table>
			<tr>
				<th class="th-1">제목</th>
				<td colspan=3>${one.title}</td>
			</tr>
			<fmt:formatDate value="${one.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
			<tr>
				<th>작성일</th>
				<td>${regdate}</td>
				<th class="th-1">작성자</th>
				<td>${one.writer}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td></td>
				<th>조회수</th>
				<td>${one.viewcnt}</td>
			</tr>
			<tr>
				<td class="content" colspan=4>${one.content}</td>
			</tr>

		</table>
		<div>
			<button>게시판 목록</button>
			<c:if test="${sessionScope.name == one.writer}">
				<button type="b_del">삭제</button>
				<button type="b_up">수정</button>
			</c:if>
		</div>
	</div>
	<div id="reply_wrap">
		<div id="commentList">
			
		</div>
	</div>
</body>
</html>
