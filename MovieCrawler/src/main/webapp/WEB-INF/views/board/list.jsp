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
		href="${path}/resources/css/view.css?ver=31">
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
		<span><a href="${path}/board/list?sort_option=new&search_option=${map.search_option}&keyword=${map.keyword}">최신순</a></span>
		<span></span>
		<span><a href="${path}/board/list?sort_option=view&search_option=${map.search_option}&keyword=${map.keyword}">조회순</a></span>
		<span></span>
		<span><a href="${path}/board/list?sort_option=reply&search_option=${map.search_option}&keyword=${map.keyword}">댓글순</a></span>
		<span></span>
	</div>
	
<body>
	<table class=tc>
			<tr class = mtr>
				<td width="50px">No</td>
				<td width="950px">제목</td>
				<td width="120px">작성자</td>
				<td width="70px">조회수</td>
				<td width="50px">댓글</td>
				<td width="80px">첨부파일</td>
				<td width="50px">등록일자</td>
			</tr>
			
		

		<tbody>
		
		<c:forEach items="${map.list}" var="bDto">
		<jsp:useBean id="now" class="java.util.Date"/>
		<fmt:formatDate value="${now}" pattern ="yyyy-MM-dd" var="today"/>
		<fmt:formatDate value="${bDto.regdate}" pattern ="yyyy-MM-dd" var="regdate"/>
			
			<tr>
				<td>${bDto.bno}</td>
				<td>${bDto.title}
				<c:choose>
					<c:when test="${today == regdate}">
						<span class="new_re">New</span>
					</c:when>
				</c:choose>
				
				</td>
				<td>${bDto.writer}</td>
				<td>${bDto.viewcnt}</td>
				<td>${bDto.replycnt}</td>
				<td></td>
				<td>
					<c:choose>
						<c:when test="${today == regdate }">
							<fmt:formatDate pattern="hh:mm:ss" value="${bDto.regdate}"/>
						</c:when>
						<c:otherwise>
							${regdate}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class=num>
	<ul class="page">
<c:if test="${map.pager.curBlock > 1}">
               <li><a href="${path}/board/list?curPage=${map.pager.blockBegin-10}"><i class="fas fa-angle-double-left"></i></a></li>
               <li><a href="${path}/board/list?curPage=1">1</a></li>
               <li>...</li>
            </c:if>
            <c:forEach begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}"  var="idx" >
               <li <c:out value="${map.pager.curPage == idx ? 'class=active':''}" /> > 
                  <a href="${path}/board/list?curPage=${idx}&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}">${idx}</a>
               </li>
            </c:forEach>
            <c:if test="${map.pager.curBlock < map.pager.totBlock}">
               <li><a>...</a></li>
               <li><a href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}">${map.pager.totPage}</a></li>
               <li><a href="${path}/board/list?curPage=${map.pager.blockEnd+1}&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}"><i class="fas fa-angle-double-right"></i></a></li>
            </c:if>
	</ul>
	</div>
	<div class=search_end>

		<c:if test="${map.keyword != ''}">
			<span>"${map.keyword}"로 검색한 결과는 총 "${map.count}"입니다</span>
		</c:if>

	</div>
	<div class=btn>
		<select id="selsearch"class=select name="type">
			<option value="all"  selected="selected" >제목+내용</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="writer">작성자</option>
		</select>
		<input id="search_board" type="text" placeholder="검색어를 입력하세요"/>
		<input id="search_btn" type="button" value="검색"/>
		<input type="button" value="글쓰기"/>
		<input id="re_btn" type="button" value="처음으로">
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
		$('#search_btn').click(function(){
			var search_option = $('#selsearch').val()
			var keyword = $.trim($('#search_board').val());
			
			//유효성체크
			if(keyword == null || keyword.length == 0){
				$('#search_board').focus();
				$('#search_board').css('border','1px solid red');
				return false;
			}
			
			location.href="${path}/board/list?search_option="+search_option+"&keyword="+keyword;
		});
		$('#re_btn').click(function(){
			location.href="${path}/board/list";
		});

	</script>
</html>