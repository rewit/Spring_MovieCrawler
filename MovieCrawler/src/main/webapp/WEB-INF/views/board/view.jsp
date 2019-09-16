<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/include.jsp"%>
<% String referer = request.getHeader("referer"); %>
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
	href="${path}/resources/css/view.css?ver=201909100128">
<title>Insert title here</title>
</head>
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
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
			<fmt:formatDate value="${one.regdate}" pattern="yyyy-MM-dd"
				var="regdate" />
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
		<div class="button-tas">
			<button>게시판 목록</button>
			<button class="button-de">삭제</button>
			<button class="button-up">수정</button>
		</div>
	</div>
	<div id="reply_wrap">
		<div id="commentList">
			
		</div>
	</div>
</body>
<script>
	$(function() {

		if ("${one.writer}" == "${sessionScope.name}") {
			$(".button-de").css('display', 'inline');
			$(".button-up").css('display', 'inline');
		}
		//뒤로가기 막기
		history.pushState(null, document.title,location.href)
		window.addEventListener('popstate',function(event){
			history.pushState(null, document.title, '<%=referer%>');
			location.reload();
		});
		
		function comment_list() {
			$.ajax({
				type: "get",
				url: "${path}/reply/list?bno=${one.bno}",
				success: function(page) {
					$("#commentList").html(page);
				}
			})
		}
		$(document).ready(function() {
			comment_list();
		})
		/* View.jsp에서 commntlist의 태그, 이벤트 처리 할때 사용*/
		$(document).on("click",".button-re-del", function() {
			var rno =$(this).attr("data_num");
			var bno = '${one.bno}';
			$.ajax({
				url: "${path}/reply/delete",
				data: "rno=" + rno + "&bno=" + bno,
				success: function(result) {
					comment_list();
				},
				error: function() {
					alert("System Error!!!!");
				}
			})
		})
		$(document).on("click",".button-btn-wr", function() {
			oEditors.getById["replyInsert"].exec("UPDATE_CONTENTS_FIELD", []);
			var content = $("#replyInsert").val();
			var text = content.replace(/[<][^>]*[>]/gi,"");
			if(text == null || text == "") {
				$(".error").css("display","inline");
				$("#replyInsert").focus();
				return false;
			} else {
				var bno ='${one.bno}';
				$('#re_bno').val(bno);
				$.ajax({
					url: "${path}/reply/write",
					type: "POST",
					data: $("#frm_reply").serialize(),
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					success: function() {
						comment_list();
						$("#replyInsert").val("");
					},
					error: function() {
						alert("System Error!!!")
					}
				})
			}
		})
	});
</script>
</html>