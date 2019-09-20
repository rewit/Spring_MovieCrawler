<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/include.jsp"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#modal-box {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 1000;
	display: none;
}

.modal-body {
	width: 500px;
	height: 600px;
	border: 2px solid blue;
	margin: 100px auto 0 auto;
	border-radius: 5px;
	background-color: #ccc;
}

.modal-content {
	width: 350px;
	margin: 0 auto;
}

.modal-header {
	background-color: blue;
	color: #fff;
	font-size: 30px;
	text-align: center;
	margin-bottom: 30px;
}

.modal-body input, .btn-login {
	width: 350px;
	height: 40px;
	margin: 15px auto;
}

.select {
	text-align: center
}

.err_msg {
	color: red;
}
.dropbtn {
  background-color: #ea2129;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
	

</style>
</head>
<script src="https://kit.fontawesome.com/8b002b7edc.js"></script>


<button id="topBtn" class="sideBtn">
	<i class="fas fa-arrow-up"></i>
</button>
<nav class="main">
	<ul class="main-menu">
		<li><a href="${path}/">홈</a></li>
		<li><a href="${path}/board/list">커뮤니티</a></li>

		<c:choose>
			<c:when test="${empty sessionScope.name}">
				<li><a href="#" id="login" class="a-menu">로그인</a></li>
				<li><a class="jss" href="#">회원가입</a></li>

			</c:when>
			<c:otherwise>
				<li><a href="#" id="logout_btn" class="a-menu">로그아웃</a></li>
				<div class="dropdown">
					<button class="dropbtn">마이페이지</button>
					<div class="dropdown-content">
					    <a href="${path}/member/update">수정</a>
					    <a href="${path}/member/delete">탈퇴</a>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>
<div id="modal-box">
	<div class="modal-body">
		<div class="modal-header">
			로그인<span id="modal-close" style="float: right; cursor: pointer">&times;</span>
		</div>
		<div class="modal-content">
			<div>
				<input class="userid" type="text" placeholder="id">
			</div>
			<div>
				<input class="password" type="password" placeholder="password">
			</div>
			<div class="err_msg"></div>
			<div>
				<button class="btn-login">로그인</button>
			</div>
			<div class="select">
				<span>회원가입</span> <span>｜</span> <span>아이디찾기</span> <span>｜</span> <span>비밀번호찾기</span>
			</div>
		</div>
	</div>
</div>

<script>
	$(function(){
		$("#login").click(function(){
			$("#modal-box").css('display', 'block')
		})
		$(".jss").click(function(){
			location.href="${path}/member/write"
		})
		$("#modal-close").click(function() {
			$("#modal-box").css("display", "none")
			$(".err_msg_id").text("");
			$(".err_msg_pass").text("");
			$(".userid").val("");
			$(".password").val("");
		})
		$(".btn-login").click(function(){
         // 유효성체크:id,pw null값체크 및 공백 체크
         var id = $.trim($("input.userid").val())
         var pw = $.trim($("input.password").val())
         var regEmpty = /\s/g; //공백문자체크
         // null값체크
         if(id == '' || id.length == 0){
            $('.err_msg').text('아이디를 입력해주세요.').css('visibility','visible')
            return false;
         } else if(id.match(regEmpty)){
            $('.err_msg').text('공백없이 입력해주세요.').css('visibility','visible')
            return false;
         } else if(pw == '' || pw.length == 0){
            $('.err_msg').text('비밀번호를 입력해주세요.').css('visibility','visible')
            return false;
         } else if(pw.match(regEmpty)){
            $('.err_msg').text('공백없이 입력해주세요.').css('visibility','visible')
            return false;
         }
         
         $.ajax({
            url: '${path}/member/login',
            type:'POST',
            async: true,
            dataType: 'text',
            data: 'userid='+id+'&passwd='+pw,
            success:function(data){
               if(data == '1'){
                  location.reload();
               } else if(data == '-1'){
                  $('input.userid').focus();
                  $('.err_msg').text('회원 아이디 또는 비밀번호가 일치하지 않습니다').css('visibility','visible');
               } else{
                  alert("Error")
               }
            },
            error:function(){
               alert("System Error")
            }
         })
      })
        //로그아웃
		$('#logout_btn').click(function() {
		      $.ajax({
		         url: "${path}/member/logout",
		         type: "POST",
		         async: true,
		         success: function() {
		            location.reload();
		         },
		         error:function() {
		            alert("System Error");
		         }
		      })
		   })
		})
</script>

