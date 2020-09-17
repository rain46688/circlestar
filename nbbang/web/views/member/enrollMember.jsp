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
	margin: 0 15px 15px 56px;
	padding: 0;
	align-items: flex-start;
   }
   div.dividedTitle{
	position: relative;
	width: 20%;
	float: left;
	text-align: left;
   }
   div.dividedText{
	position: relative;
	width: 80%;
	float: right;
	text-align: left;
   }
   div.constrain{
	margin-top: -10px;
	margin-bottom: 15px;
	margin-left: 60px;
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
				<input type="button" value="중복검사" class="button" id="idbtn" onclick="fn_id_duplicate();">
				<input type="hidden" name="checked_id" value="">
				<div class="constrain" id="idConstrain"></div>

				<input type="password" placeholder="비밀번호" class="input" id="pw" name="password" minlength="4" maxlength="16" required>
				<div class="constrain" id="pwConstrain"></div>
				<input type="password" placeholder="비밀번호 확인" class="input" id="pw2">
				<div class="constrain" id="pw2Constrain"></div>
				
				<input type="text" placeholder="닉네임" class="input" id="nickname" name="nickname" maxlength="10" required style="width : 59%;">
				<input type="button" value="중복검사" class="button" id="nnbtn" onclick="fn_nickname_duplicate();">
				<input type="hidden" name="checked_nn" value="">
				<div class="constrain" id="nnConstrain"></div>


				<input type="text" placeholder="이름" class="input checkLength" id="name" name="name" minlength="2" maxlength="5" required>
				<div class="constrain" id="nameConstrain"></div>

				<div class="dividedForm">
					<div class="dividedTitle">
						성별
					</div>
					<div class="dividedText">
						<input type="radio" class="gender" name="gender" id="male" value="M"><label for="gender0">남</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="gender" name="gender" id="female" value="F"><label for="gender1">여</label>
					</div>
				</div>
				<div class="constrain" id="gdConstrain"></div>

				<div class="dividedForm" style="margin-bottom: 0;">
					<div class="dividedTitle">
						생년월일
					</div>
					<div class="dividedText">
						<input type="text" class="input birthdate" id="year" name="year" maxlength="4" placeholder="년(4자)" style="width: 33%;">
						<select class="input birthdate" id="month" name="month" style="width: 32%;">
							<option>월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>                                    
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						<input type="text" class="input birthdate" id="date" name="date" maxlength="2" placeholder="일" style="width: 32%;">
					</div>
				</div>
				<div class="constrain" id="bdConstrain"></div>

				<input type="tel" placeholder="휴대폰" class="input checkLength" id="phone" name="phone" maxlength="11" required>
				<div class="constrain" id="pnConstrain"></div>
				
				<input type="text" placeholder="주소찾기 버튼을 눌러주세요" class="input" id="address" name="address" required readonly style="width : 59%;"  >
				<input type="button" value="주소찾기" class="button" onclick="fn_address_check();">
				<div class="constrain" id="adConstrain"></div>
				
				<button class="bottombtns" type="button" style="width:40%; margin-top: 30px;" onclick="fn_enroll();">가입</button>
				<button class="bottombtns" type="reset" style="width:40%; margin-top: 30px;">취소</button>
			</form>
			<form action="<%=request.getContextPath() %>/checkIdDuplicate" name="checkIdDuplicate">
				<input type="hidden" name="userId">
			</form>
		</div>
	</div>
	      
	<script>
		// id제약조건
		$(function(){
			$("#id").blur(e=>{
				const id=$("#id").val().trim();
				if(id===""){
					$("#idConstrain").html("필수 입력 항목입니다.");
					$("#idConstrain").css({"display":"block"});
				}
			})
			$("#id").keyup(function(e){
				const id=$("#id").val().trim();
				var idPattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				if(id.length!=0&&!idPattern.test(id)){
					$("#idConstrain").html("이메일 형식을 지켜주세요.");
					$("#idConstrain").css({"display":"block"});
				}else{
					$("#idConstrain").css({"display":"none"});
				}
			});
		});
		
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
			$("input[name=checked_id]").val('y');
		}

		// pw제약조건
		$(function(){
			$("#pw").blur(e=>{
				const pw=$("#pw").val().trim();
				if(pw===""){
					$("#pwConstrain").html("필수 입력 항목입니다.");
					$("#pwConstrain").css({"display":"block"});
				}
			})
			$("#pw").keyup(function(e){
				var pwPattern = /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{4,16}$/;
				const pw=$("#pw").val().trim();
				const pw2=$("#pw2").val().trim();
				if(!pwPattern.test(pw)){
					$("#pwConstrain").html("4~16자 영문, 숫자를 혼합하여 입력해주세요");
					$("#pwConstrain").css({"display":"block"});
				}else{
					$("#pwConstrain").css({"display":"none"});
				}				
				if(pw!=pw2){
					$("#pw2Constrain").html("비밀번호 확인을 해주세요.");
					$("#pw2Constrain").css({"display":"block"});
				}
			});
			$("#pw2").blur(e=>{
				const pw=$("#pw").val().trim();
				const pw2=$("#pw2").val().trim();
				if(pw2===""){
					$("#pw2Constrain").html("비밀번호 확인을 해주세요.");
					$("#pw2Constrain").css({"display":"block"});
				}else if(pw!=pw2){
					$("#pw2Constrain").html("비밀번호가 일치하지 않습니다.");
					$("#pw2Constrain").css({"display":"block"});
				}
			})
			$("#pw2").keyup(function(e){
				const pw=$("#pw").val().trim();
				const pw2=$("#pw2").val().trim();
				if(pw!=pw2){
					$("#pw2Constrain").html("비밀번호가 일치하지 않습니다.");
					$("#pw2Constrain").css({"display":"block"});
				}else{
					$("#pw2Constrain").css({"display":"none"});
				}

			});
		});

		// 닉네임 제약조건
		$(function(){
			$("#nickname").blur(e=>{
				const nn=$("#nickname").val().trim();
				if(nn===""){
					$("#nnConstrain").html("필수 입력 항목입니다.");
					$("#nnConstrain").css({"display":"block"});
					$("#nnConstrain").css({"color":"red"});
				}else{
					$("#nnConstrain").css({"display":"none"});
				}
			});
			$("#nickname").keyup(function(e){
				// var nnPattern= /[0-9]|[a-z]|[A-Z]|[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{1,10}/;
				const nn=$("#nickname").val().trim();
				if(nn!==""){
					$("#nnConstrain").html("10자 이하의 한글, 영문, 숫자입력이 가능합니다.");
					$("#nnConstrain").css({"display":"block"});
					$("#nnConstrain").css({"color":"green"});
				}
			});
		});

		function fn_nickname_duplicate(){
			let nn=$("#nickname").val().trim();
			$("input[name=checked_nn]").val('y');
		};

		//이름 제약조건
		$(function(){
			$("#name").blur(e=>{
				const name=$("#name").val().trim();
				if(name===""){
					$("#nameConstrain").html("필수 입력 항목입니다.");
					$("#nameConstrain").css({"display":"block"});
					$("#nameConstrain").css({"color":"red"});
				}else{
					$("#nameConstrain").css({"display":"none"});
				}
			});
			$("#name").keyup(function(e){
				var namePattern= /[a-z]|[A-Z]|[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,5}/;
				const name=$("#name").val().trim();
				if(name!==""){
					$("#nameConstrain").html("2~5자의 한글, 영문 입력이 가능합니다.");
					$("#nameConstrain").css({"display":"block"});
					$("#nameConstrain").css({"color":"green"});
				}
			});
		});

		//성별
		$("#male").click(function(e){
			$("#gdConstrain").css({"display":"none"});
		});
		$("#female").click(function(e){
			$("#gdConstrain").css({"display":"none"});
		});

		//생년월일 제약조건
		var yyPattern=/[0-9]{4}/;
		var ddPattern=/[0-9]{1,2}/;
		$(function(){
			$("#year").keyup(function(e){
				const yy=$("#year").val().trim();
				if(!yyPattern.test(yy)){
					$("#bdConstrain").html("태어난 년도 네 자리를 입력해주세요");
					$("#bdConstrain").css({"display":"block"});
				}else{
					$("#bdConstrain").css({"display":"none"});
				}
			});
			$("#date").keyup(function(e){
				const mm=$("#month").val();
				const dd=$("#date").val().trim();
				if(mm==="01" || mm==="03" || mm==="05" || mm==="07" || mm==="08" || mm==="10" || mm==="12"){
					if(!ddPattern.test(dd) || Number(dd)>31){
						$("#bdConstrain").html("태어난 날 두 자리를 입력해주세요");
						$("#bdConstrain").css({"display":"block"});
					}else{
						$("#bdConstrain").css({"display":"none"});
					}
				}else if(mm==="02"){
					if(!ddPattern.test(dd) || Number(dd)>29){
						$("#bdConstrain").html("태어난 날 두 자리를 입력해주세요");
						$("#bdConstrain").css({"display":"block"});
					}else{
						$("#bdConstrain").css({"display":"none"});
					}
				}else{
					if(!ddPattern.test(dd) || Number(dd)>30){
						$("#bdConstrain").html("태어난 날 두 자리를 입력해주세요");
						$("#bdConstrain").css({"display":"block"});
					}else{
						$("#bdConstrain").css({"display":"none"});
					}
				}
			});
			$(".birthdate").blur(e=>{
				const yy=$("#year").val().trim();
				const mm=$("#month").val().trim();
				const dd=$("#date").val().trim();
				if(yy==="" || mm==="" || dd==="" || mm=="월"){
					$("#bdConstrain").html("필수 입력 항목입니다.");
					$("#bdConstrain").css({"display":"block"});
					$("#bdConstrain").css({"color":"red"});
				}
				if(mm==="01" || mm==="03" || mm==="05" || mm==="07" || mm==="08" || mm==="10" || mm==="12"){
					if(!ddPattern.test(dd) || Number(dd)>31){
						$("#bdConstrain").html("태어난 날 두 자리를 입력해주세요");
						$("#bdConstrain").css({"display":"block"});
					}else{
						$("#bdConstrain").css({"display":"none"});
					}
				}else if(mm==="02"){
					if(!ddPattern.test(dd) || Number(dd)>29){
						$("#bdConstrain").html("태어난 날 두 자리를 입력해주세요");
						$("#bdConstrain").css({"display":"block"});
					}else{
						$("#bdConstrain").css({"display":"none"});
					}
				}else{
					if(!ddPattern.test(dd) || Number(dd)>30){
						$("#bdConstrain").html("태어난 날 두 자리를 입력해주세요");
						$("#bdConstrain").css({"display":"block"});
					}else{
						$("#bdConstrain").css({"display":"none"});
					}
				}
			});	
		});

		//전화번호 제약조건
		$(function(){
			$("#phone").blur(e=>{
				const phone=$("#phone").val().trim();
				if(phone===""){
					$("#pnConstrain").html("필수 입력 항목입니다.");
					$("#pnConstrain").css({"display":"block"});
				}else{
					$("#pnConstrain").css({"display":"none"});
				}
			});
			$("#phone").keyup(function(e){
				const phone=$("#phone").val().trim();
				if(phone!==""){
					$("#pnConstrain").html("-를 제외하고 11자 이하로 입력해주세요.");
					$("#pnConstrain").css({"display":"block"});
					$("#pnConstrain").css({"color":"green"});
				}
			});
		});

		//유효성 확인
		function fn_enroll(){
			//아이디
			const id=$("#id").val().trim();
			if(id===""){
				$("#idConstrain").html("필수 입력 항목입니다.");
				$("#idConstrain").css({"display":"block"});
			}
			//비밀번호
			const pw=$("#pw").val().trim();
			if(pw===""){
				$("#pwConstrain").html("필수 입력 항목입니다.");
				$("#pwConstrain").css({"display":"block"});
			}
			//비밀번호 확인
			const pw2=$("#pw2").val().trim();
			if(pw2===""){
				$("#pw2Constrain").html("비밀번호 확인을 해주세요.");
				$("#pw2Constrain").css({"display":"block"});
			}
			//닉네임
			const nn=$("#nickname").val().trim();
			if(nn===""){
				$("#nnConstrain").html("필수 입력 항목입니다.");
				$("#nnConstrain").css({"display":"block"});
				$("#nnConstrain").css({"color":"red"});
			}
			//이름
			const name=$("#name").val().trim();
			if(name===""){
				$("#nameConstrain").html("필수 입력 항목입니다.");
				$("#nameConstrain").css({"display":"block"});
				$("#nameConstrain").css({"color":"red"});
			}
			//성별
			const gender=$('input:radio[name="gender"]:checked');
			if(gender.length<1){
				$("#gdConstrain").html("필수 입력 항목입니다.");
				$("#gdConstrain").css({"display":"block"});
				$("#gdConstrain").css({"color":"red"});
			}
			//생년월일
			const yy=$("#year").val().trim();
			const mm=$("#month").val().trim();
			const dd=$("#date").val().trim();
			if(yy==="" || mm==="" || dd==="" || mm=="월"){
				$("#bdConstrain").html("필수 입력 항목입니다.");
				$("#bdConstrain").css({"display":"block"});
				$("#bdConstrain").css({"color":"red"});
			}
			//휴대폰
			const phone=$("#phone").val().trim();
			if(phone===""){
				$("#pnConstrain").html("필수 입력 항목입니다.");
				$("#pnConstrain").css({"display":"block"});
			}
			//주소
			const address=$("#address").val().trim();
			if(address===""){
				$("#adConstrain").html("필수 입력 항목입니다.");
				$("#adConstrain").css({"display":"block"});
			}
			//중복확인을 했나요
			if($("input[name='checked_id']").val()==''){
				alert('아이디 중복 확인을 해주세요.');
			}
			if($("input[name='checked_nn']").val()==''){
				alert('닉네임 중복 확인을 해주세요.');
			}
			//제약조건을 만족했나요

		}

	</script>
</section>
<%@ include file="/views/common/footer.jsp"%>
 
 
 
 
 
 
 
  