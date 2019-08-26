<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<td>Rank</td>
				<td>img</td>
				<td>제목</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${rankList}" var="one">
				<tr>
					<td>${one.rank}</td>
					<td><img src="${one.imgSrc}"></td>
					<td>${one.movie}</td>
					<td>${one.type}</td>
					<td>${one.openDate}</td>
					<td>${one.director}</td>
					<td>${one.actor}</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>