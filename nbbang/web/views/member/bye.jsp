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
	<form id="byeFrm" action="<%=request.getContextPath()%>/member/reallyBye" method="post">
		<input type="password" placeholder="비밀번호를 입력해주세요." class="input" id="password" name="password" required style="width: 59%;">
		<button type="button" class="nnbtn" onclick="fn_byebye();">확인</button>
		<input type="hidden" name="usid" value="<%=m.getUsid()%>">
	</form>
</div>
<script>
    function fn_byebye(){
        $("#byeFrm").submit();
    };
</script>