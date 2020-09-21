<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    button.pnbtn{
        outline: none;
        background: #735020;
        min-width: 50px;
        width: 15%;
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
	<form id="memberEnrollFrm" action="<%=request.getContextPath()%>/updatePhoneCpl" method="post">
		<input type="tel" placeholder="변경할 휴대폰 번호를 입력해주세요." class="input checkLength" id="phone" name="phone" maxlength="11" required style="width : 59%;">
		<button type="button" class="pnbtn" onclick="fn_phone_duplicate();">중복검사</button>
		<input type="hidden" name="checked_pn" value="">
		<div class="constrain" id="pnConstrain"></div><br>
		<button type="button" class="pnbtn" onclick="fn_updatePhone();">수정완료</button>
		<button type="button" class="pnbtn" onclick="fn_resetTheForm();">수정취소</button>
		<input type="hidden" name="usid" value="<%=m.getUsid()%>">
	</form>
	<form action="" name="checkPNDuplicate">
        <input type="hidden" name="phone">
    </form>
</div>
<script>
    var pnPattern = /^[0-9]{10,11}$/;
		$(function(){
			$("#phone").blur(e=>{
				const phone=$("#phone").val().trim();
				if(phone===""){
					$("#pnConstrain").html("필수 입력 항목입니다.");
					$("#pnConstrain").css({"display":"block"});
					$("#pnConstrain").css({"color":"red"});
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
			if(pn.length==0 || !pnPattern.test(pn)){
				alert("휴대폰 번호를 입력해주세요.");
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
			}
		};

		function fn_updatePhone(){
			let pn=$("#phone").val().trim();
			if(pn.length==0 || !pnPattern.test(pn)){
				alert("휴대폰 번호를 입력해주세요.");
			}else if($("input[name='checked_pn']").val()==''){
				alert('휴대폰 번호 중복 확인을 해주세요.');
			}else{
				$("#memberEnrollFrm").submit();
			};
		}

		function fn_resetTheForm(){
			$("#phoneBtn").css({"display":"block"});
			$("#updatePhone").css({"display":"none"});
		}
</script>