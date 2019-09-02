<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" 
		href="${rootPath}/resources/css/main.css?ver=1">
</head>
<header>
	<h2>영화 예매 Top10</h2>
	<nav>
		<ul class="main-menu">
			<li><a href="">홈</a></li>
			<li><a href="">Top.10</a></li>
			<li><a href="">자유게시판</a></li>
			
			<c:if test="${empty USER}">
				<li><a href="">로그인</a></li>
				<li><a href="">회원가입</a></li>
			</c:if>
			<c:if test="${!empty USER}">
				<li><a href="#">${USER.m_email}</a></li>
			</c:if>
		</ul>
	</nav>
</header>
</html>