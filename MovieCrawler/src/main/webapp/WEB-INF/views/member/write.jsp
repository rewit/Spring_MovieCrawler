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
</style>

</head>
<body>
   <%@ include file="../include/header.jsp"%>
   <div class="bla"></div>
   <h1>회원가입</h1>
   <div class="join-main">
      <div class="join-ta">
         <label>아이디</label> <input id="inputid">
         <div class="err"><span>ㄱㄱ</span></div>
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
         <label class="join-te">핸드폰번호(-없이 입력하세요.)</label>
      </div>
      <div class="join-ta">
         <input class="input-join"  id="inputphone">@<input class="input-URL">
      </div>
      <div class="join-ta">
         <select class="join-select">
            <option>직접입력</option>
            <option>naver.com</option>
         </select>

      </div>
      <div class="join-ta">
         <input type="text" id="sample6_postcode" placeholder="우편번호">
         <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
         <input type="text" id="sample6_address" placeholder="주소"><br>
         <input type="text" id="sample6_detailAddress" placeholder="상세주소">
      </div>
      <div class="join-ta">
         <button>취소</button>
         <button>회원가입</button>
      </div>
   </div>
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script type="text/javascript" src="${path}/resources/js/daumpost.js"></script>
   <script type="text/javascript" src="${path}/resources/js/validation.js"></script>
   <script>
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
	});
	

</script>
</body>
</html>