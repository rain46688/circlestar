<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section id="enroll-container">
	<h2>회원가입정보</h2>
	<form name="memberEnrollFrm" action="<%=request.getContextPath() %>/memberEnrollEnd" method="post">
		<table>
			<tr>
                <th>아이디</th>
                <td>
                    <input type="text" placeholder="4글자이상"
                    name="userId" id="userId_" required>
                    <input type="button" value="중복검사">
                </td>
            </tr>
            <tr>
                <th>패스워드</th>
                <td>
                    <input type="password" name="password" id="password_" required>
                </td>
            </tr>
            <tr>
                <th>패스워드확인</th>
                <td><input type="password" id="password_2"></td>
            </tr>
            <tr>
                <th>이름</th>
                <td>
                    <input type="text" name="userName" id="userName" required>
                </td>
            </tr>
            <tr>
                <th>나이</th>
                <td>
                    <input type="number" name="age" id="age" min="0">
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="email" placeholder="abc@sdf.com" name="email" id="email">
                </td>
            </tr>
            <tr>
                <th>휴대폰</th>
                <td>
                    <input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11">
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input type="text" name="address" id="address">
                </td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                    <input type="radio" name="gender" id="gender0" value="M">
                    <label for="gender0">남</label>
                    <input type="radio" name="gender" id="gender1" value="F">
                    <label for="gender1">여</label>
                </td>
            </tr>
            <tr>
                <th>취미</th>
                <td>
                    <input type="checkbox" name="hobby" id="hobby0" value="운동">
                    <label for="hobby0">운동</label>
                    <input type="checkbox" name="hobby" id="hobby1" value="등산">
                    <label for="hobby1">등산</label>
                    <input type="checkbox" name="hobby" id="hobby2" value="독서">
                    <label for="hobby2">독서</label>
                    <input type="checkbox" name="hobby" id="hobby3" value="게임">
                    <label for="hobby3">게임</label>
                    <input type="checkbox" name="hobby" id="hobby4" value="여행">
                    <label for="hobby4">여행</label>
                </td>
            </tr>
        </table>
        <input type="submit" value="가입">
        <input type="reset" value="취소">
	</form>
</section>
<%@ include file="/views/common/footer.jsp"%>