<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.input_btn{
	width: 600px;
	height: 100px;
}

div.re_lo{
	width: 600px;
	height: 100px;
	margin: 0 auto;
}

div.re_out{
	width: 600px;
	height: 100px;
	border: 1px solid black;
	background-color: #ccc;
	font-size: 18px;
	color:red;
	text-align: center;
	margin: 0 auto;
	
}


table.re_write{
	width: 80%;
}
table.re_write th {
	height: 20px;
}

table.re_write td{
	height: 100px;
}


div.re_out a{
	text-decoration: none;
	color: inherit;
}

div button{
	border-radius: 8px;
	background-color: #eee;
	font-size: 13px;
}
.name_box{
	background-color: black;
	color:white;
}
#re_b{
	border: 1px solid black;
}
.t_box{
	width: 600px;
	height: 100px;
}

</style>
<body>
	<c:choose>
	<c:when test="${replyList.size() == 0 }">
		<div class="re_write">
			<div class="re_login">
				<div class="re_log">등록된 댓글이 없습니다</div>
			</div>
		</div>
		</c:when>
		<c:otherwise>
		<div>
		<c:forEach items="${replyList}" var="replyview">
			<table class="re_write">
				<tr>
					<th id=re_b class=name_box>작성자</th>
					<td id=re_b >${replyview.writer}</td>
					<th id=re_b  class=name_box>작성일자</th>
					<td id=re_b >${replyview.regdate}</td>
				</tr>
				<tr>
					<td id=re_b  colspan="4">${replyview.content}</td>
				</tr>
			</table>
			<div>
				<button>삭제</button>
			</div>
		</c:forEach>
		</div>
			<div id=in_log class="re_lo">
				<input class=t_box type="text">
				<div><input type="button">등록</div>
			</div>
			<div id=out_log class="re_out">
				<div class="re_log">로그인을 하셔야만 등록이 가능합니다</div>
			</div>
		</c:otherwise>
	</c:choose>
</body>
<script>
	$(function(){
		if("${sessionScope.name}" != ''){
			  $("#in_log").css('display', 'none');
			  $("#out_log").css('display', 'block');
		}	
	})
		
</script>
</html>