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
<script src="https://kit.fontawesome.com/6770ee5e63.js"></script>
<link rel="stylesheet" type="text/css" 
		href="${path}/resources/css/main.css?ver=3">
<link rel="stylesheet" type="text/css" 
		href="${path}/resources/css/view.css?ver=3">
<link rel="stylesheet" type="text/css" 
		href="${path}/resources/css/footer.css?ver=3">
<link rel="stylesheet" type="text/css" 
		href="${path}/resources/js/header.js?ver=21">
<style>
	.page{
		display: flex;
	}
	.page li{
		list-style: none;
		margin:0 10px;
		color:blue;
	}
	.page li a{
		text-decoration: none;
		color:inherit;
	}
</style>
</head>
<%@include file="../include/header.jsp" %>
	<div class=ls></div>
	<h2>자유게시판</h2>

	<div class="btn_t">
		<span><a href="${path}/board/list?sort_option=new">최신순</a></span>
		<span></span>
		<span><a href="${path}/board/list?sort_option=view">조회순</a></span>
		<span></span>
		<span><a href="${path}/board/list?sort_option=reply">댓글순</a></span>
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
		<c:forEach items="${map.list}" var="bDto">
			<tr>
				<td>${bDto.bno}</td>
				<td>${bDto.title}</td>
				<td>${bDto.writer}</td>
				<td>${bDto.viewcnt}</td>
				<td>${bDto.replycnt}</td>
				<td></td>
				<td>${bDto.regdate}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class=num>
	<ul class="page">
<c:if test="${map.pager.curBlock > 1}">
               <li><a href="${path}/board/list?curPage=${map.pager.blockBegin-10}"><i class="fas fa-angle-double-left"></i></a></li>
               <li><a href="${path}/board/list?curPage=1">1</a></li>
               <li><a>...</a></li>
            </c:if>
            <c:forEach begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}"  var="idx" >
               <li <c:out value="${map.pager.curPage == idx ? 'class=active':''}" /> > 
                  <a href="${path}/board/list?curPage=${idx}">${idx}</a>
               </li>
            </c:forEach>
            <c:if test="${map.pager.curBlock < map.pager.totBlock}">
               <li><a>...</a></li>
               <li><a href="${path}/board/list?curPage=${map.pager.totPage}">${map.pager.totPage}</a></li>
               <li><a href="${path}/board/list?curPage=${map.pager.blockEnd+1}"><i class="fas fa-angle-double-right"></i></a></li>
            </c:if>
	</ul>
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
	<script type="text/javascript">
		$(function(){
			var sort = "${map.sort_option}";
			if(sort == "new"){
				$('.btn_t > span:eq(0)').css('color','	#8B0000').css('font-weight','bold');
			}else if(sort == "view"){
				$('.btn_t > span:eq(2)').css('color','	#8B0000').css('font-weight','bold');
			}else if(sort == "reply"){
				$('.btn_t > span:eq(4)').css('color','	#8B0000').css('font-weight','bold');
			}
		});
	</script>
</html>