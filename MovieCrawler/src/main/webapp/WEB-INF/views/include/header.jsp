<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>



<link rel="stylesheet" type="text/css" 
		href="${rootPath}/resources/css/main.css?ver=2">
		
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
          $( 'html, body' ).animate( { scrollTop : 0 }, 800 );
          return false;
        } );
      } );
    </script>
<header>
	<h2>무비무비</h2>
	<nav>
		<ul class="main-menu">
			<li><a href="#">홈</a></li>
			<li><a href="#">예매Rank Top.10</a></li>
			<li><a href="#">커뮤니티</a></li>
			
			<c:if test="${empty USER}">
				<li><a href="#">로그인</a></li>
				<li><a href="#">회원가입</a></li>
			</c:if>
			<c:if test="${!empty USER}">
				<li><a href="#">${USER.m_email}</a></li>
			</c:if>
		</ul>
	</nav>
</header>