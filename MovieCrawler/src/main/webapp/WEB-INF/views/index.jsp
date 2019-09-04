<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/include.jsp" %>
<%@include file="include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" 
		href="${path}/resources/css/main.css?ver=311">
<link rel="stylesheet" type="text/css" 
		href="${path}/resources/css/view.css?ver=312">
<link rel="stylesheet" type="text/css" 
		href="${path}/resources/css/footer.css?ver=312">

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
	<div class=ps></div>
	<h2>실시간 예매순위</h2>
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

			<c:forEach items="${rankList}" var="one" varStatus="status">
				<tr class=ssmanu>
					<td>${status.count}</td>
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
	
	<script type="text/javascript">
		$(function(){
			var sort = "${sort}";
			
			if(sort == "booking"){
				$('.movie_sort > span:eq(0)').css('color','	#8B0000').css('font-weight','bold');
			}else if(sort == "score"){
				$('.movie_sort > span:eq(2)').css('color','	#8B0000').css('font-weight','bold');
			}else if(sort == "date"){
				$('.movie_sort > span:eq(4)').css('color','	#8B0000').css('font-weight','bold');
			}
		});
	
	</script>
	<%@include file="include/footer.jsp" %>
</body>
</html>