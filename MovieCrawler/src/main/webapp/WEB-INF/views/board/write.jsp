<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/main.css?ver=2019090304">
</head>
<style>
	div.body1{
	width: 100%;
	}
</style>
<body>
<script type="text/javascript"
                src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js"
                charset="utf-8"></script>

	<%@ include file="../include/header.jsp"%>
</head>
<body>
	<div class=body1>
		<table>
		<caption>게시판 글쓰기</caption>	
        	<tr>
				<td>작성자</td>
   			</tr>
    		<tr>
     			<td>제 목</td>
    		</tr>
    		<tr>
     			<td>내 용</td>
     		</tr>
     		<tr>
    		<td><textarea name="content" id="contentInsert" class="input-re" placeholder=""></textarea>
				<script type="text/javascript"
					src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js"
					charset="utf-8"></script>
				<script type="text/javascript">
					var oEditors = [];
					nhn.husky.EZCreator
							.createInIFrame({
								oAppRef : oEditors,
								elPlaceHolder : "contentInsert",
								sSkinURI : "${path}/resources/smarteditor/SmartEditor2Skin.html",
								fCreator : "createSEditor2",
								htParams : {
									fOnBeforeUnload : function() {
									}
								}
							});
				</script>
    		</td>
  			</tr>
    		<tr>
     			<td><div align="center">
     			<input type="submit" value="등록" >
         		<input type="button" value="뒤로" ></div>
     			</td>
    		</tr> 
		</table>
	</div>
</body>
</html>