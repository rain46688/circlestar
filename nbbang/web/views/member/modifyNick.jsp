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
    button.nnbtn{
        outline: none;
        background: #735020;
        min-width: 100px;
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
	<form id="memberEnrollFrm" action="<%=request.getContextPath()%>/member/modifyNickCpl" method="post">
		<input type="text" placeholder="변경할 닉네임을 입력해주세요." class="input" id="nickname" name="nick" maxlength="10" required style="width : 59%;">
		<button type="button" class="nnbtn" id="nnbtn" onclick="fn_nickname_duplicate();">중복검사</button>
		<input type="hidden" name="checked_nn" value="">
		<div class="constrain" id="nnConstrain"></div><br>
		<button type="button" class="nnbtn" onclick="fn_updateNick();">수정완료</button>
		<button type="button" class="nnbtn" onclick="fn_resetTheForm();">수정취소</button>
		<input type="hidden" name="usid" value="<%=m.getUsid()%>">
	</form>
	<form action="" name="checkNNDuplicate">
		<input type="hidden" name="nick">
	</form>
</div>
<script>
    var nnPattern= /[0-9]|[a-z]|[A-Z]|[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{1,10}/;
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
			const nn=$("#nickname").val().trim();
			$("input[name=checked_nn]").val('');
			if(nn!==""){
				$("#nnConstrain").html("10자 이하의 입력이 가능합니다.");
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


	function fn_updateNick(){
		let nn=$("#nickname").val().trim();
		if(nn.length==0 || !nnPattern.test(nn)){
			alert("닉네임을 입력해주세요.");
		}else if($("input[name='checked_nn']").val()==''){
			alert('닉네임 중복 확인을 해주세요.');
		}else{
			$("#memberEnrollFrm").submit();
		};
	}

	function fn_resetTheForm(){
		$("#nickBtn").css({"display":"block"});
		$("#updateNick").css({"display":"none"});
	}
</script>