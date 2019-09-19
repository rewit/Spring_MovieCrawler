<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<c:if test="${sessionScope.userid != null }">
	<script>
		alert("로그아웃 후 사용해주세요")
		location.href="${path}/";
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
   href="${path}/resources/css/main.css?ver=2019090305">
<link rel="stylesheet" type="text/css"
   href="${path}/resources/css/common.css?ver=2019090502">
<title>Insert title here</title>
<style>
h1 {
   text-align: center;
}

.join-main {
   width: 100%;
   height: 100%;
   text-align: center;
}

input {
   width: 600px;
   height: 30px;
}

label {
   text-align: left;
   width: 104px;
   display: inline-block;
}

.input-join {
   width: 200px;
   height: 30px;
 
}

.input-URL {
   width: 500px;
   height: 30px;
}

.join-te {
   text-align: left;
   width: 700px;
}

.join-select {
   margin-top: 5px;
   width: 725px;
   height: 40px;
}

.join-ta {
   margin-top: 10px;
}

.err {
display:none;
}

label{
background-color: #ccc;
color:white;
}

.addrbtn{
width: 360px;
margin-top: 10px;
}
#addr_btn,#addr_btn2{
width: 360px;
margin-top: 10px;
}



</style>

</head>
<body>
   <%@ include file="../include/header.jsp"%>
   <div class="bla"></div>
   <h1>회원가입</h1>
   <div class="join-main">
      <div class="join-ta">
         <label>아이디</label> <input id="inputid" name="userid">
         <div class="err_check_msg"><span></span></div>
      </div>
      <div class="join-ta">
         <label>비밀번호</label> <input  type="password" id="inputpw" name="passwd">
		 <div class="err_check_msg"><span></span></div>
      </div>
      <div class="join-ta">
         <label>비밀번호 확인</label> <input type="password" id="inputRpw">
		 <div class="err_check_msg"><span></span></div>
      </div>
      <div class="join-ta">
         <label>이름</label> <input id="inputname" name="name">
         <div class="err_check_msg"><span></span></div>
      </div>

      <div class="join-ta">
         <label>전화번호</label>
         <input id="inputphone" placeholder="핸드폰번호(-)없이 숫자만 입력하세요" name="phone">
         <div class="err_check_msg"><span></span></div>
      </div>
      <div class="join-ta">
      	  <label></label>
      	  <div>
          <input name="email" id="email_id" class="input-join" placeholder="e-mail을 입력하세요">@<input id="email_url" class="input-URL"  placeholder="URL">
          <div id="email" class="err_check_msg"><span></span></div>
          </div>
      </div>
      <div class="join-ta">
         <select class="join-select" id="selmail">
            <option value="direct">직접입력</option>
            <option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
            <option value="gmail.com">gmail.com</option>
            <option value="nate.com">nate.com</option>
         </select>
	  
      </div>
      <div class="join-ta" name="post">
		<input class="join-addr-code addrbtn" type="text" id="sample6_postcode" placeholder="우편번호" readonly="readonly">
         <input class="join-addr-button" id="addr_btn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
         <input class="join-addr-address addrbtn" name="addr1" type="text" id="sample6_address" placeholder="주소" readonly="readonly"><br>
         <input class="join-addr-detailAddress"  name="addr2" type="text" id="sample6_detailAddress" placeholder="상세주소">
     	 <div id="email" class="err_check_msg"><span></span></div>
      </div>
      <div class="join-ta">
         <button id="btn_agree">회원가입</button>
         <button>취소</button>
      </div>
   </div>
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script type="text/javascript" src="${path}/resources/js/daumpost.js"></script>
   <script type="text/javascript" src="${path}/resources/js/validation.js"></script>
   <script>
   //유효성체크 flag값 (통과 여부)
	var check_id = false;
	var check_pw = false;
	var check_rpw = false;
	var check_name = false;
	var check_phone = false;
	var check_email = false;
	var check_post = false;
   
   $(function(){
	 
	$('#btn_agree').click(function(){
		//email을 합치고 input 담아야 전송됨
		var email_id = $('#email_id').val();
		var email_url = $('#email_url').val();
		var email = email_id + "@" + email_url;
		$('#email').val(email);
		
		if(!check_id){
			$('#inputid').focus();
			$('.err_check_msg').text('필수정보를 모두 입력해주세요').css('display','block').css('color','#FF3636');
			return false;
		} else if(!check_pw){
			$('#inputpw').focus();
			$('.err_check_msg').text('필수정보를 모두 입력해주세요').css('display','block').css('color','#FF3636');
			return false;
		} else if(!check_rpw){
			$('#inputrpw').focus();
			$('.err_check_msg').text('필수정보를 모두 입력해주세요').css('display','block').css('color','#FF3636');
			return false;
		} else if(!check_name){
			$('#inputname').focus();
			$('.err_check_msg').text('필수정보를 모두 입력해주세요').css('display','block').css('color','#FF3636');
			return false;
		} else if(!check_phone){
			$('#inputphone').focus();
			$('.err_check_msg').text('필수정보를 모두 입력해주세요').css('display','block').css('color','#FF3636');
			return false;
		} else if(!check_email){
			$('#email_id').focus();
			$('.err_check_msg').text('필수정보를 모두 입력해주세요').css('display','block').css('color','#FF3636');
			return false;
		} else if(!check_post){
			$('#sample6_detailAddress').focus();
			$('.err_check_msg').text('필수정보를 모두 입력해주세요').css('display','block').css('color','#FF3636');
			return false;
		}
		//유효성 체크
		alert("submit");
		alert('id='+check_id);
		alert('pw='+check_pw+'/'+'rpw='+check_rpw);
		alert('name='+check_name);
		alert('phone='+check_phone);
		alert('email='+check_email);
		alert('post='+check_post);
		
		//$('#frm_mem').submit();
	});
   
   $('#selmail').change(function(){
	   var url = $(this).val();
	   if(url =="direct"){
		   $('#email_url').val('');
		   $('#email_url').removeAttr('readonly');
		   $('#email_url').blur();
		   $('#email_url').focus();
		   
	   } else {
		   $('#email_url').val(url);
		   $('#email_url').prop('readonly',true);
		   $('#email_url').blur();
	   }
   });
   
	//id값 유효성 체크
	$("#inputid").blur(function(){
		var memId = $.trim($(this).val());
		var checkResult = joinValidate.checkId(memId);
		
		if(checkResult.code != 0){ //경고메시지를 출력
			$(this).next().text(checkResult.desc).css('display','block').css('color','#FF3636');
			check_id = false;
			return false;
		} else{
			if(ajaxCheck(memId)){
				check_id = true;
				return true;
			}
		}
		return false;
	});
	
	$('#inputpw').keyup(function(){
		var memPw = $.trim($(this).val());
		var memRpw = $.trim($('#inputRpw').val());
		var checkResult = joinValidate.checkPw(memPw,memRpw);
		if(checkResult.code == 4){
			$('#inputRpw').next().text(checkResult.desc).css('display','block').css('color','#FF3636');
			return false;
		}else if(checkResult.code != 0){ //경고메시지를 출력
			$(this).next().text(checkResult.desc).css('display','block').css('color','#FF3636');
			
			check_pw = false;
				return false;
		} else{
			if(memRpw !=""||memRpw.length !=0){
			$(this).next().text(checkResult.desc).css('display','block').css('color','#0000FF');
			}else{
				$(this).next().text('');
			}
			check_pw = true;
			return true;
			}
		return false;
	});
	
	$('#inputRpw').keyup(function(){
		var memPw = $.trim($('#inputpw').val());
		var memRpw = $.trim($(this).val());
		var checkResult = joinValidate.checkRpw(memPw,memRpw);
		
		if(checkResult.code != 0){
			$(this).next().text(checkResult.desc).css('display','block').css('color','#FF3636');
			check_rpw = false;
			return false;
			
		}else{
			$(this).next().text(checkResult.desc).css('display','block').css('color','#0000FF');
			check_rpw = true;
			return true;
		}
		return false;
	});
	$('#inputname').blur(function(){
		var name =$.trim($(this).val());
		var checkResult = joinValidate.checkName(name);
		
		if(checkResult.code != 0){
			$(this).next().text(checkResult.desc).css('display','block').css('color','#FF3636');
			check_name = false;
			return false;
		}else{
			$(this).next().text(checkResult.desc).css('display','block').css('color','#0000FF');
			check_name = true;
			return true;
		}
		return false;
	});
	$('#inputphone').blur(function(){
		var phone =$.trim($(this).val());
		var checkResult = joinValidate.checkPhone(phone);
		
		if(checkResult.code != 0){
			$(this).next().text(checkResult.desc).css('display','block').css('color','#FF3636');
			check_phone = false;
			return false;
		}else{
			$(this).next().text(checkResult.desc).css('display','block').css('color','#0000FF');
			check_phone = true;
			return true;
		}
		return false;
	});
	
	$('#email_id').blur(function(){
		var email = $.trim($(this).val());
		var url=$.trim($('#email_rul').val());
		var checkResult = joinValidate.checkEmail(email,url);
		
		if(checkResult.code != 0){
			$('#email_url').next().text(checkResult.desc).css('display','block').css('color','#FF3636');
			check_email = false;
			return false;
		}else{
			$('#email_url').next().text(checkResult.desc).css('display','block').css('color','#0000FF');
			check_email = true;
			return true;
		}
		return false;

	});
	$('#email_url').blur(function(){
		var email = $.trim($('#email_id').val());
		var url=$.trim($('#email_url').val());
		var checkResult = joinValidate.checkEmail(email,url);
		
		if(checkResult.code != 0){
			$('#email_url').next().text(checkResult.desc).css('display','block').css('color','#FF3636');
			check_email = false;
			return false;
		}else{
			$('#email_url').next().text(checkResult.desc).css('display','block').css('color','#0000FF');
			check_email = true;
			return true;
		}
		return false;
		
	});
	$('.addrbtn').click(function(){
		var zipcode = $('.addrbtn').eq(0).val();
		var addr = $('.addrbtn').eq(1).val();
		
		if(zipcode == "" || addr == ""){
			$('#addr_btn').click();
		}
	});
	  
	$('#sample6_detailAddress').blur(function() {
        var dAddr = $.trim($(this).val());
        if(dAddr == "" || dAddr.length == 0) {
           $("#sample6_detailAddress").next().text('필수 정보입니다.').css('display', 'block').css('color','#FF3636');
           check_post = false;
        } else {
           $("#sample6_detailAddress").next().css('display', 'none');
           check_post = true;
        }
     });
   })
</script>
</body>
</html>