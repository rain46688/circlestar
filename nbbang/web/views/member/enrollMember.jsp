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
			<form id="memberEnrollFrm" name="memberEnrollFrm" action="<%=request.getContextPath() %>/memberEnrollEnd" method="post">
				<input type="email" id="id" name="userId" class="input" placeholder="이메일" required style="width : 59%;">
				<input type="button" value="중복검사" class="button" id="idbtn" onclick="fn_id_duplicate();">
				<input type="hidden" name="checked_id" value="">
				<div class="constrain" id="idConstrain"></div>

				<input type="password" placeholder="비밀번호" class="input" id="pw" name="password" minlength="4" maxlength="16" required>
				<div class="constrain" id="pwConstrain"></div>
				<input type="password" placeholder="비밀번호 확인" class="input" id="pw2">
				<div class="constrain" id="pw2Constrain"></div>
				
				<input type="text" placeholder="닉네임" class="input" id="nickname" name="nick" maxlength="10" required style="width : 59%;">
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

				<input type="tel" placeholder="휴대폰" class="input checkLength" id="phone" name="phone" maxlength="11" required style="width : 59%;">
				<input type="button" value="중복검사" class="button" id="pnbtn" onclick="fn_phone_duplicate();">
				<input type="hidden" name="checked_pn" value="">
				<div class="constrain" id="pnConstrain"></div>
				
				<div style="text-align: left; margin: 0 15px 10px 56px;">주소</div>
				<input type="text" class="input" id="sample4_postcode" placeholder="우편번호" style="width : 59%;" readonly>
				<input type="button" class="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="hidden" name="checked_ad" value="">
				<input type="text" class="input" id="sample4_roadAddress" name="address1" placeholder="도로명주소" style="width : 40%;" readonly>
				<input type="text" class="input" id="sample4_jibunAddress" placeholder="지번주소" style="width : 39%;" readonly>
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" class="input" id="sample4_detailAddress" name="address2" placeholder="상세주소" style="width : 40%;">
				<input type="text" class="input" id="sample4_extraAddress" placeholder="참고항목" style="width : 39%;" readonly>
				<div class="constrain" id="adConstrain"></div>
				
				<button class="bottombtns" type="button" style="width:40%; margin-top: 30px;" onclick="fn_enroll();">가입</button>
				<button class="bottombtns" type="reset" style="width:40%; margin-top: 30px;">취소</button>
			</form>
			<form action="" name="checkIdDuplicate">
				<input type="hidden" name="userId">
			</form>
			<form action="" name="checkNNDuplicate">
				<input type="hidden" name="nick">
			</form>
			<form action="" name="checkPNDuplicate">
				<input type="hidden" name="phone">
			</form>
		</div>
	</div>

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== '' && data.apartment === 'Y'){
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraRoadAddr !== ''){
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample4_postcode').value = data.zonecode;
					document.getElementById("sample4_roadAddress").value = roadAddr;
					document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
					
					// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
					if(roadAddr !== ''){
						document.getElementById("sample4_extraAddress").value = extraRoadAddr;
					} else {
						document.getElementById("sample4_extraAddress").value = '';
					}

					var guideTextBox = document.getElementById("guide");
					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if(data.autoRoadAddress) {
						var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
						guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
						guideTextBox.style.display = 'block';

					} else if(data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
						guideTextBox.style.display = 'block';
					} else {
						guideTextBox.innerHTML = '';
						guideTextBox.style.display = 'none';
					}
				$("input[name=checked_ad]").val('y');
				}
			}).open();
		}
	</script>
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
				$("input[name=checked_id]").val('');
				if(id.length!=0&&!idPattern.test(id)){
					$("#idConstrain").html("이메일 형식을 지켜주세요.");
					$("#idConstrain").css({"display":"block"});
				}else{
					$("#idConstrain").css({"display":"none"});
				}
			});
		});
		
		function fn_id_duplicate(){
			let id=$("#id").val().trim();
			if(id.length==0){
				alert("이메일을 입력해주세요.");
			}else{
				const url="<%=request.getContextPath()%>/checkIdDuplicate";
				const title="chekcIdDuplicate";
				const status="left=500px,top=100px,width=500px,height=200px";
	
				open("",title,status);
		
				checkIdDuplicate.target=title;
				checkIdDuplicate.action=url;
				checkIdDuplicate.method="post";
	
				checkIdDuplicate.userId.value=id;
				checkIdDuplicate.submit();
			}
		};

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
				$("input[name=checked_nn]").val('');
				if(nn!==""){
					$("#nnConstrain").html("10자 이하의 한글, 영문, 숫자입력이 가능합니다.");
					$("#nnConstrain").css({"display":"block"});
					$("#nnConstrain").css({"color":"green"});
				}
			});
		});

		function fn_nickname_duplicate(){
			let nn=$("#nickname").val().trim();
			if(nn.length==0){
				alert("닉네임을 입력해주세요.");
			}else{
				const url="<%=request.getContextPath()%>/checkNNDuplicate";
				const title="checkNNDuplicate";
				const status="left=500px,top=100px,width=500px,height=200px";

				open("",title,status);

				checkNNDuplicate.target=title;
				checkNNDuplicate.action=url;
				checkNNDuplicate.method="post";

				checkNNDuplicate.nick.value=nn;
				checkNNDuplicate.submit();
			}
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
				$("input[name=checked_pn]").val('');
				if(phone!==""){
					$("#pnConstrain").html("-를 제외하고 11자 이하로 입력해주세요.");
					$("#pnConstrain").css({"display":"block"});
					$("#pnConstrain").css({"color":"green"});
				}
			});
		});

		function fn_phone_duplicate(){
			let pn=$("#phone").val().trim();
			if(pn.length==0){
				alert("이메일을 입력해주세요.");
			}else{
			const url="<%=request.getContextPath()%>/checkPNDuplicate";
			const title="checkPNDuplicate";
			const status="left=500px,top=100px,width=500px,height=200px";

			open("",title,status);

			checkPNDuplicate.target=title;
			checkPNDuplicate.action=url;
			checkPNDuplicate.method="post";

			checkPNDuplicate.phone.value=pn;
			checkPNDuplicate.submit();
		};

		//주소 제약조건
		$(function(){
			$("#sample4_detailAddress").blur(e=>{
				const address=$("#sample4_detailAddress").val().trim();
				if(address===""){
					$("#adConstrain").html("상세주소를 입력해주세요.");
					$("#adConstrain").css({"display":"block"});
				}else{
					$("#adConstrain").css({"display":"none"});
				}
			});
			$("#sample4_detailAddress").keyup(function(e){
				const address=$("#sample4_detailAddress").val().trim();
				if(address===""){
					$("#adConstrain").html("상세주소를 입력해주세요.");
					$("#adConstrain").css({"display":"block"});
				}else{
					$("#adConstrain").css({"display":"none"});
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
			const address=$("#sample4_detailAddress").val().trim();
			if(address===""){
				$("#adConstrain").html("상세주소를 입력해주세요.");
				$("#adConstrain").css({"display":"block"});
			}
			//중복확인을 했나요
			if($("input[name='checked_id']").val()==''){
				alert('아이디 중복 확인을 해주세요.');
			}
			if($("input[name='checked_nn']").val()==''){
				alert('닉네임 중복 확인을 해주세요.');
			}
			if($("input[name='checked_pn']").val()==''){
				alert('휴대폰 번호 중복 확인을 해주세요.');
			}
			//주소 확인을 했나요
			if($("input[name='checked_ad']").val()==''){
				alert('주소 입력을 해주세요.');
			}
			//제약조건을 만족했나요
			if(id!=="" && pw!=="" && pw2!=="" && nn!=="" && name!=="" && (gender.length=1||gender.length>1)
				&& yy!=="" && mm!=="" && mm!=="월" && dd!=="" && phone!=="" && address!==""
				&& $("input[name='checked_id']").val()!='' && $("input[name='checked_nn']").val()!=''
				&& $("input[name='checked_ad']").val()!='' && $("input[name='checked_pn']").val()!=''){
				$("#memberEnrollFrm").submit();
			}else{
				alert("필수 입력 항목을 작성해주세요.");
			}

		}

	</script>
</section>
<%@ include file="/views/common/footer.jsp"%>
 
 
 
 
 
 
 
  