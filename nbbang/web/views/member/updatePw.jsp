<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style>
    div#updatePwContainer{
        display: grid;
        /* grid-template-columns: repeat(2, 1fr);
        grid-template-rows: repeat(6, 1fr); */
    }
</style>
<section>
    <div id="updatePwContainer">
        <div id="containerTitle">
            <p id="updatePwTitle">비밀번호 변경하기</p>
        </div>
        <div>
            <p>현재 비밀번호</p>
        </div>
        <div>
            <input type="password">
        </div>
        <div>
            <p>변경할 비밀번호</p>
        </div>
        <div>
            <input type="password">
        </div>
        <div>
            <p>변경할 비밀번호 확인</p>
        </div>
        <div>
            <input type="password">
        </div>
        <div id="btnsField">
            <button>변경하기</button>
            <button>취소</button>
        </div>
    </div>
</section>
<%@ include file="/views/common/footer.jsp" %>