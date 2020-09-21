<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<section>
	<div id="memberInfoContainer">
        <div class="item textField" id="containerTitle">
            <div id="updatePwTitle" style="margin-bottom: 20px; font-size: 24px; padding: 5px;" >나의 정보</div>
        </div>

        <div class="item textField">
            <div class="fieldCapsule">
                <div class="capsuleLeft" style="border-top: black 1px solid;">아이디</div>
                <div class="capsuleRight" style="border-top: black 1px solid;"><%=m.getMemberId()%></div>
            </div>
        </div>

        <div class="item textField">
            <div class="fieldCapsule">
                <div class="capsuleLeft">이름</div>
                <div class="capsuleRight"><%=m.getMemberName()%></div>
            </div>
        </div>
    </div>
</section>
<%@ include file="/views/common/footer.jsp" %>