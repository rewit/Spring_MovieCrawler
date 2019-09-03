<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/include.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="stylesheet" type="text/css" 
		href="${path}/resources/css/main.css?ver=3">
<link rel="stylesheet" type="text/css" 
		href="${path}/resources/css/view.css?ver=31">
<link rel="stylesheet" type="text/css" 
		href="${path}/resources/css/footer.css?ver=3">
<link rel="stylesheet" type="text/css" 
		href="${path}/resources/js/header.js?ver=21">
</head>
<%@include file="../include/header.jsp" %>
	<div class=ls></div>
	<h2>자유게시판</h2>

		<div class="btn_t">
		<span><a href="#">최신순</a></span>
		<span></span>
		<span><a href="#">조회순</a></span>
		<span></span>
		<span><a href="#">댓글순</a></span>
		<span></span>
	</div>
	
<body>
	<table class=tc>
			<tr class = mtr>
				<td>No</td>
				<td>제목</td>
				<td>작성자</td>
				<td>조회수</td>
				<td>댓글</td>
				<td>첨부파일</td>
				<td>등록일자</td>
			</tr>
		<colgroup>
			<col width="50" />
			<col width="1000" />
			<col width="120" />
			<col width="60" />
			<col width="60" />
			<col width="70" />
			<col width="50" />
		</colgroup>
		<tbody>
			<tr>
				<td>1</td>
				<td>제목1</td>
				<td>작성자1</td>
				<td>5</td>
				<td>2</td>
				<td></td>
				<td>2019/09/01</td>
			</tr>
			<tr>
				<td>2</td>
				<td>제목2</td>
				<td>작성자2</td>
				<td>3</td>
				<td>4</td>
				<td></td>
				<td>2019/09/02</td>
			</tr>
			<tr>
				<td>3</td>
				<td>제목3</td>
				<td>작성자3</td>
				<td>8</td>
				<td>1</td>
				<td></td>
				<td>2019/09/03</td>
			</tr>
			<tr>
				<td>4</td>
				<td>제목4</td>
				<td>작성자4</td>
				<td>2</td>
				<td>0</td>
				<td></td>
				<td>2019/09/02</td>
			</tr>
			<tr>
				<td>5</td>
				<td>제목5</td>
				<td>작성자5</td>
				<td>5</td>
				<td>5</td>
				<td></td>
				<td>2019/09/03</td>
			</tr>
		</tbody>
	</table>
	<div class=num>
		<input type="button" value="<"/>
		<input type="button" value="1"/>
		<input type="button" value="2"/>
		<input type="button" value="3"/>
		<input type="button" value="4"/>
		<input type="button" value="5"/>
		<input type="button" value="6"/>
		<input type="button" value="7"/>
		<input type="button" value="8"/>
		<input type="button" value="9"/>
		<input type="button" value="10"/>
		<input type="button" value=">"/>
	</div>
	<div class=btn>
		<select class=select name="type">
			<option value="제목+내용">제목+내용</option>
			<option value="제목">작성자</option>
		</select>
		<input type="text" placeholder="검색"/>
		<input type="button" value="찾기"/>
		<input type="button" value="글쓰기"/>
		<input type="button" value="처음으로"/>
	</div>
	
</body>
</html>