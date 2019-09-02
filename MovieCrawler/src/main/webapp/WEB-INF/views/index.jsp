<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/include.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" 
		href="${rootPath}/resources/css/main.css?ver=311">
<link rel="stylesheet" type="text/css" 
		href="${rootPath}/resources/css/view.css?ver=312">

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
      $( document ).ready( function() {
        $( window ).scroll( function() {
          if ( $( this ).scrollTop() > 200 ) {
            $( '.top' ).fadeIn();
          } else {
            $( '.top' ).fadeOut();
          }
        } );
        $( '.top' ).click( function() {
          $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
          return false;
        } );
      } );
    </script>
</head>
	<div class="movie_sort">
		<span><a href="${path}/sort?sort=booking">예매순</a></span>
		<span></span>
		<span><a href="${path}/sort?sort=score">평점순</a></span>
		<span></span>
		<span><a href="${path}/sort?sort=date">개봉일순</a></span>
		<span></span>
	</div>
<body>
	<a href="#" class="top"><ion-icon style="font-size:30px" name="arrow-round-up"></ion-icon></a>
	<table>
		<thead class=th>
			<tr class=smanu>
				<td>Rank</td>
				<td></td>
				<td>제목</td>
				<td>장르</td>
				<td>개봉일</td>
				<td>예매율</td>
				<td>상영시간</td>
				<td>감독</td>
				<td>출연배우</td>
				<td>네이버평점</td>
				<td>다음평점</td>
			<!-- 	<td>네이버코드</td> -->
			<!--	<td>다음코드</td>  -->
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${rankList}" var="one">
				<tr class=ssmanu>
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
				<!-- 	<td>${one.navercode}</td> -->
				<!-- 	<td>${one.daumcode}</td> -->
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>