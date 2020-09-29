<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.member.model.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("member");
%>
<style>
	.input {
        outline: none;
        border: black solid 1px;
        background-color: white;
        width: 80%;
        height: 36px;
        margin: 10px 0 15px;
        padding: 5px;
        box-sizing: border-box;
        font-size: 14px;
    }
    input.button{
        outline: none;
        background: #735020;
        min-width: 100px;
        width: 20%;
        height: 36px;
        border: none;
        padding: 5px;
        color: #FFFFFF;
        font-size: 14px;
        cursor: pointer;
        text-align: center;
        margin: 0 0 15px;
    }
</style>
<div>
	<form id="updateAddressForm" action="<%=request.getContextPath()%>/member/updateAddressCpl" method="post">
		<input type="text" class="input" id="sample4_postcode" placeholder="우편번호" style="width : 59%;" readonly>
		<input type="button" class="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="min-width:100px;"><br>
		<input type="hidden" name="checked_ad" value="">
		<input type="text" class="input" id="sample4_roadAddress" name="address1" placeholder="도로명주소" style="width : 40%; min-width:180px;" readonly>
		<input type="text" class="input" id="sample4_jibunAddress" placeholder="지번주소" style="width : 39%; min-width:180px;" readonly>
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" class="input" id="sample4_detailAddress" name="address2" placeholder="상세주소" style="width : 40%; min-width:180px;">
		<input type="text" class="input" id="sample4_extraAddress" placeholder="참고항목" style="width : 39%; min-width:180px;" readonly>
		<div class="constrain" id="adConstrain"></div><br>
		<input type="button" class="button" onclick="fn_updateAddress();" value="수정완료">
		<input type="button" class="button" onclick="fn_resetTheForm();" value="수정취소">
		<input type="hidden" name="usid" value="<%=m.getUsid()%>">
	</form>
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
	function fn_resetTheForm(){
		$("#addressBtn").css({"display":"block"});
		$("#updateAddress").css({"display":"none"});
	};
	function fn_updateAddress(){
		let address=$("#sample4_detailAddress").val().trim();
		if(address.length==0){
			alert("상세주소를 입력해주세요.");
		}else if($("input[name=checked_ad]").val()==''){
			alert('우편번호 찾기를 눌러주세요.');
		}else{
			$("#updateAddressForm").submit();
		};
	};
	
</script>