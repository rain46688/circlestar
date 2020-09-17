<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<style>
   #loginField > form > button:nth-child(2){
      width : 20%;
   }
   #loginField > form > button:nth-child(9){
      width : 30%;
   }
   #loginField > form > button:nth-child(10){
      width : 30%;
   }
   #loginField > form:nth-child(2) > input.button{
    outline: none;
    background: #735020;
    width: 20%;
    border: none;
    margin: 0 0 15px;
    padding: 15px;
    color: #FFFFFF;
    font-size: 14px;
    cursor: pointer;
   }
   div.dividedForm{
	display: flex;
	width: 80%;
	margin: 0 15px 15px 50px;
	padding: 10px;
	align-items: flex-start;
   }
   div.dividedTitle{
	position: relative;
	width: 30%;
	float: left;
	text-align: left;
   }
   div.dividedText{
	position: relative;
	width: 70%;
	float: right;
	text-align: left;
   }
   div.constrain{
	margin-top: -10px;
	margin-bottom: 15px;
	margin-left: 55px;
	font-size: 12px;
	color: red;
	display: none;
	text-align: left;
	}

</style>
<section>
	<div id="loginBox" style="padding-top: 50px;">
		<div id="loginField">
			<h2 style="margin-bottom: 50px;">회원가입</h2>
			<form name="memberEnrollFrm" action="<%=request.getContextPath() %>/memberEnrollEnd" method="post">
				<input type="email" id="id" name="id" class="input" placeholder="이메일" required style="width : 59%;">
				<input type="button" value="중복검사" class="button" onclick="fn_id_duplicate();">  
				<div class="constrain" id="idConstrain"></div>

				<input type="password" placeholder="비밀번호" class="input checkLength" id="password" name="password" minlength="4" maxlength="16" required>
				<input type="password" placeholder="비밀번호 확인" class="input" id="password_2">
				<div id="checkPwField"></div>
				
				<input type="text" placeholder="닉네임" class="input checkLength" id="nickname" name="nickname" maxlength="30" required style="width : 59%;">
				<input type="button" value="중복검사" class="button">
				<input type="text" placeholder="이름" class="input checkLength" id="userName" name="userName" minlength="6" maxlength="15"required>
				<div class="dividedForm">
					<div class="dividedTitle">
						성별
					</div>
					<div class="dividedText">
						<input type="radio" name="gender" id="gender0" value="M"><label for="gender0">남</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="gender" id="gender1" value="F"><label for="gender1">여</label>
					</div>
				</div>
				<div class="dividedForm">
					<div class="dividedTitle">
						생년월일
					</div>
					<div class="dividedText">
						<input type="date" name="birthDate" id="birthDate" required>
					</div>
				</div>

				<input type="tel" placeholder="휴대폰" class="input checkLength" id="phone" name="phone" maxlength="11" required>
				<input type="text" placeholder="주소" class="input" id="address" name="address" required  style="width : 59%;"  >
				<input type="button" value="주소찾기" class="button" onclick="fn_address_check();">
				<button class="bottombtns" type="submit" style="width:30%; margin-top: 30px;">가입</button>
				<button class="bottombtns" type="reset" style="width:30%; margin-top: 30px;">취소</button>
			</form>
			<form action="<%=request.getContextPath() %>/checkIdDuplicate" name="checkIdDuplicate">
				<input type="hidden" name="userId">
			</form>
		</div>
	</div>
	      
	<script>
		$(function(){
			$("#id").blur(function(e){
				const id=$("#id").val().trim();
				if(id.length=0){
					$("#idConstrain").html("필수 입력 항목입니다.");
					$("#idConstrain").css({"display":"block"});
				}
			})
			$("#id").keyup(function(e){
				const id=$("#id").val().trim();
				var idPattern = /[@][.]/;
				if(id.length!=0&&!idPattern.test(id)){
					$("#idConstrain").html("이메일 형식을 지켜주세요.");
					$("#idConstrain").css({"display":"block"});
				}else{
					$("#idConstrain").css({"display":"none"});
				}
			});
		})

		function fn_id_duplicate(){
			const url="<%=request.getContextPath()%>/checkIdDuplicate";
			const title="chekcIdDuplicate";
			const status="left=500px,top=100px,width=300px,height=200px";

			open("",title,status);

			checkIdDuplicate.target=title;
			checkIdDuplicate.action=url;
			checkIdDuplicate.method="post";

			checkIdDuplicate.userId.value=id;
			checkIdDuplicate.submit();      
		}
	</script>
</section>
<%@ include file="/views/common/footer.jsp"%>
 
 
 
 
 
 
 
  