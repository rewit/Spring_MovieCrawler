<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
   href="${path}/resources/css/main.css?ver=2019090305">
<link rel="stylesheet" type="text/css"
   href="${path}/resources/css/common.css?ver=2019090502">
   <link rel="stylesheet" type="text/css"
   href="${path}/resources/css/view.css?ver=20190904">
<%@ include file="../include/header.jsp"%>
<title>Insert title here</title>
<style>
.body-1 {
 text-align: center;
}

.div-ta {
   border: 1px solid black;
}

.sp-bl {
   color: blue;
}

#modal-delete {
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background: rgba(0, 0, 0, 0.5);
   z-index: 1000;
   display: none;
}

.modal-body-delete {
   width: 400px;
   height: 150px;
   border: 2px solid blue;
   margin: 100px auto 0 auto;
   border-radius: 5px;
   background-color: #ccc;
}

.modal-header-delete {
   background-color: black;
   color: white;
   font-size: 30px;
   text-align: center;
   margin-bottom: 30px;
}
.modal-button-delete {
   text-align: center;
}
.modal-div {
margin-bottom: 20px;
}
.modal-button-no, .modal-button-yes {
   width:100px;
   height: 30px;
}
..error {
display: none;
color: red;
}

</style>
</head>
<body>
   <div class="body-1">
   <div class="bla"></div>
      <h1>회원탈퇴</h1>
      <div class="div-ta">
         <span class="sp-bl">"${sessionScope.name}"</span>님 회원탈퇴시 아래의 조치가 취해집니다.<br>
         <br> 
         1. 계정정보는 <span class="sp-bl">'개인 정보 보호 정책'에 따라 60일간 보관(잠김) 되며,</span>
         60일이 경과된 후에는 모든 개인정보는 완전히 삭제되며 더 이상 복구할 수 없게 됩니다. <br> <br>
         2. 작성된 게시물은 삭제되지 않으며, 익명처리 후 <span class="sp-bl">무비데이로 소유권이 귀속</span>됩니다.
         <br> <br> 3. 게시물 삭제가 필요한 경우에는 <span class="sp-bl">관리자(ddddd@naver.com)</span>로
         문의해 주시기 바랍니다. <br> <br>
      </div>
      <div class="input-ps">
         <div id="fcryan_pw">
            <label>비밀번호</label><input type="password" id="inputpw">
         </div>
         <div class="error"><span>비밀번호를 입력해주세요</span></div>
      </div>
      <div class="btn-delete">
         <button>취소</button>
         <button class="tbn_ahree">예, 탈퇴하겠습니다.</button>
      </div>
      <form action="${path}/member/delete" method="POST" id="frm_memdel">
         <input type="hidden" name="userid" value="${sessionScope.userid}">
      </form>
   </div>
</body>
<div id="modal-delete">
   <div class="modal-body-delete">
   <div class="modal-header-delete">게시글 삭제</div>
   <div class="modal-div">정말 게시글을 삭제하시겠습니까?</div>
   <div class="modal-button-delete">
   <button class="modal-button-no">아니오</button><button class="modal-button-yes">예</button>
   </div>
   </div>
</div>
<script type="text/javascript" src="${path}/resources/js/validation.js"></script>
<script>
var state = false;
$('#inputpw').blur(function() {
   var nowId = "${sessionScope.userid}";
   var nowPw = $.trim($(this).val());
   
   if(nowPw == null || nowPw.length == 0) {
      $('.error').css('display','block');
      $(this).focus();   
   } else {
      $('.error').css('display','none');
      state = ajaxPwCheck(nowId, nowPw);
   }
})

$('.tbn_ahree').click(function() {
   if(state) {
      $('#modal-delete').css('display','block');
   } else {
      $('#inputpw').focus();
   }
})
$(".modal-button-no").click(function() {
         $("#modal-delete").css('display', 'none')
})
$(".modal-button-yes").click(function() {
         $('#frm_memdel').submit();
      })
</script>

</html>