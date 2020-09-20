<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style>
    div#updatePwContainer{
        position: relative;
	    background: #FFFFFF;
	    text-align: center;
        margin: 5% 35%;
        /* 세로정렬꽉차게 가운데:center */
        align-items: stretch;
        /* 가로정렬꽉차게 가운데:center */
        justify-items: stretch;
        width: 30%;
        
    }
    div .item *{
        width:100%;
        text-align: center;
    }
    form#updatePwForm button{
        outline: none;
        background: #735020;
        width: 38%;
        border: none;
        margin: 0 1% 20%;
        padding: 15px;
        color: #FFFFFF;
        font-size: 14px;
        cursor: pointer;
    }
    div#updatePwContainer .textField{
        padding: 1%;
    }
    div#updatePwContainer .input{
        outline: none;
        border: black solid 1px;
        background-color: white;
        width: 80%;
        margin: 0 0 15px;
        padding: 15px;
        box-sizing: border-box;
        font-size: 14px;
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
    <form id="updatePwForm" action="">
        <div id="updatePwContainer" style="padding-top: 50px;">
            <div class="item textField" id="containerTitle">
                <h2 id="updatePwTitle" style="margin-bottom: 40px;" >비밀번호 변경하기</h2>
            </div>

            <div class="item textField">
                <input type="password" class="input" id="crtPw" name="crtPw" placeholder="현재 비밀번호">
            </div>
            <div class="constrain" id="crtPwConstrain"></div>

            <div class="item textField">
                <input type="password" class="input" id="newPw" name="newPw" placeholder="새로운 비밀번호">
            </div>
            <div class="constrain" id="newPwConstrain"></div>

            <div class="item textField">
                <input type="password" class="input" id="newPw2" name="newPw2" placeholder="새로운 비밀번호 확인">
            </div>
            <div class="constrain" id="newPwConstrain2"></div>

            <div id="btnsField" class="item button">
                <button>변경하기</button>
                <button>취소</button>
            </div>
        </div>
    </form>
    <script>
		var pwPattern = /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{4,16}$/;
		$(function(){
		// 	$("#pw").blur(e=>{
		// 		const pw=$("#pw").val().trim();
		// 		if(pw===""){
		// 			$("#pwConstrain").html("필수 입력 항목입니다.");
		// 			$("#pwConstrain").css({"display":"block"});
		// 		}
		// 	})
		// 	$("#pw").keyup(function(e){
		// 		const pw=$("#pw").val().trim();
		// 		const pw2=$("#pw2").val().trim();
		// 		if(!pwPattern.test(pw)){
		// 			$("#pwConstrain").html("4~16자 영문, 숫자를 혼합하여 입력해주세요");
		// 			$("#pwConstrain").css({"display":"block"});
		// 		}else{
		// 			$("#pwConstrain").css({"display":"none"});
		// 		}				
		// 		if(pw!=pw2){
		// 			$("#pw2Constrain").html("비밀번호 확인을 해주세요.");
		// 			$("#pw2Constrain").css({"display":"block"});
		// 		}
		// 	});
		// 	$("#pw2").blur(e=>{
		// 		const pw=$("#pw").val().trim();
		// 		const pw2=$("#pw2").val().trim();
		// 		if(pw2===""){
		// 			$("#pw2Constrain").html("비밀번호 확인을 해주세요.");
		// 			$("#pw2Constrain").css({"display":"block"});
		// 		}else if(pw!=pw2){
		// 			$("#pw2Constrain").html("비밀번호가 일치하지 않습니다.");
		// 			$("#pw2Constrain").css({"display":"block"});
		// 		}
		// 	})
		// 	$("#pw2").keyup(function(e){
		// 		const pw=$("#pw").val().trim();
		// 		const pw2=$("#pw2").val().trim();
		// 		if(pw!=pw2){
		// 			$("#pw2Constrain").html("비밀번호가 일치하지 않습니다.");
		// 			$("#pw2Constrain").css({"display":"block"});
		// 		}else{
		// 			$("#pw2Constrain").css({"display":"none"});
		// 		}

		// 	});
		});
    </script>
</section>
<%@ include file="/views/common/footer.jsp" %>