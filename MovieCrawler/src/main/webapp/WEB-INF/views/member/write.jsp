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
         <label>아이디</label> <input id="inputid">
         <div class="err"><span></span></div>
      </div>
      <div class="join-ta">
         <label>비밀번호</label> <input  type="password" id="inputpw">
		 <div class="err"><span></span></div>
      </div>
      <div class="join-ta">
         <label>비밀번호 확인</label> <input type="password" id="inputRpw">
		 <div class="err"><span></span></div>
      </div>
      <div class="join-ta">
         <label>이름</label> <input id="inputname">
         <div class="err"><span></span></div>
      </div>

      <div class="join-ta">
         <label>전화번호</label>
         <input id="inputphone" placeholder="핸드폰번호(-)없이 숫자만 입력하세요">
         <div class="err"><span></span></div>
      </div>
      <div class="join-ta">
      	  <label></label>
      	  <div>
          <input id="email_id" class="input-join" placeholder="e-mail을 입력하세요">@<input id="email_url" class="input-URL"  placeholder="URL">
          <div id="email" class="err"><span></span></div>
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
      <div class="join-ta">
		<input class="join-addr-code addrbtn" type="text" id="sample6_postcode" placeholder="우편번호" readonly="readonly">
         <input class="join-addr-button" id="addr_btn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
         <input class="join-addr-address addrbtn" type="text" id="sample6_address" placeholder="주소" readonly="readonly"><br>
         <input class="join-addr-detailAddress" type="text" id="sample6_detailAddress" placeholder="상세주소">
      </div>
      <div class="join-ta">
         <button>회원가입</button>
         <button>취소</button>
      </div>
   </div>
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script type="text/javascript" src="${path}/resources/js/daumpost.js"></script>
   <script type="text/javascript" src="${path}/resources/js/validation.js"></script>
   <script>
   
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
			return false;
		} else{
			
			if(ajaxCheck(memId) == "OK"){
				return true;
			}
		}
		return false;
	});
	
	$('#inputpw').blur(function(){
		var memPw = $.trim($(this).val());
		var memRpw = $.trim($('#inputRpw').val());
		var checkResult = joinValidate.checkPw(memPw,memRpw);
		if(checkResult.code == 4){
			$('#inputRpw').next().text(checkResult.desc).cdd('display','block').css('color','#FF3636');
			return false;
		}else if(checkResult.code != 0){ //경고메시지를 출력
			$(this).next().text(checkResult.desc).css('display','block').css('color','#FF3636');
				return false;
		} else{
			if(memRpw !=""||memRpw.length !=0){
			$(this).next().text(checkResult.desc).css('display','block').css('color','#0000FF');
			}else{
				$(this).next().text('');
			}
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
			return false;
		}else{
			$(this).next().text(checkResult.desc).css('display','block').css('color','#0000FF');
			return true;
		}
		return false;
	});
	$('#inputname').blur(function(){
		var name =$.trim($(this).val());
		var checkResult = joinValidate.checkName(name);
		
		if(checkResult.code != 0){
			$(this).next().text(checkResult.desc).css('display','block').css('color','#FF3636');
			return false;
		}else{
			$(this).next().text(checkResult.desc).css('display','block').css('color','#0000FF');
			return true;
		}
		return false;
	});
	$('#inputphone').blur(function(){
		var phone =$.trim($(this).val());
		var checkResult = joinValidate.checkPhone(phone);
		
		if(checkResult.code != 0){
			$(this).next().text(checkResult.desc).css('display','block').css('color','#FF3636');
			return false;
		}else{
			$(this).next().text(checkResult.desc).css('display','block').css('color','#0000FF');
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
			return false;
		}else{
			$('#email_url').next().text(checkResult.desc).css('display','block').css('color','#0000FF');
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
			return false;
		}else{
			$('#email_url').next().text(checkResult.desc).css('display','block').css('color','#0000FF');
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

</script>
</body>
</html>