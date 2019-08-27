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
				<td>장르</td>
				<td>개봉일</td>
				<td>예매율</td>
				<td>상영시간</td>
				<td>감독</td>
				<td>출연배우</td>
				<td>네이버평점</td>
				<td>다음평점</td>
				<td>네이버코드</td>
				<td>다음코드</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${rankList}" var="one">
				<tr>
					<td>${one.rank}</td>
					<td><img src="${one.imgsrc}"></td>
					<td>${one.movie}</td>
					<td>${one.type}</td>
					<td>${one.opendate}</td>
					<td>${one.bookingrate}</td>
					<td>${one.runtime}</td>
					<td>${one.director}</td>
					<td>${one.actor}</td>
					<td>${one.naverscore}</td>
					<td>${one.daumscore}</td>
					<td>${one.navercode}</td>
					<td>${one.daumcode}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>