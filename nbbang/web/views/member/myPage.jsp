<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
	Member m=(Member)request.getAttribute("member");
%>
<section>
	<div id="memberInfoContainer" name="memberInfoContainer">
        <table id="memberInfoTable" name="memberInfoTable">
            <tr>
                <td>아이디</td>
                <td><%=m.getMemberId() %></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><%=m.getMemberPwd() %></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><%=m.getMemberName() %></td>
            </tr>
            <tr>
                <td>닉네임</td>
                <td><%=m.getNickname() %></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><%=m.getPhone() %></td>
            </tr>
            <tr>
                <td>주소</td>
                <td><%=m.getAddress() %></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><%=m.getEmail() %></td>
            </tr>
            <tr>
                <td>가입날짜</td>
                <td><%=m.getEnrollDate() %></td>
            </tr>
            <tr>
                <td>회원등급</td>
                <td><%=m.getGrade() %></td>
            </tr>
            <tr>
                <td>현재 개설한 방 개수</td>
                <td><%=m.getCurRoomCnt() %></td>
            </tr>
            <tr>
                <td>개설 가능한 방 개수</td>
                <td><%=m.getMaxRoomCnt() %></td>
            </tr>
            <tr>
                <td>신고당한 횟수</td>
                <td><%=m.getReportCnt() %></td>
            </tr>
            <tr>
                <td>가용포인트</td>
                <td><%=m.getPoint() %></td>
            </tr>
            <tr>
                <td>거래 중 내역</td>
                <td><%=m.getCurTradeList() %></td>
            </tr>
            <tr>
                <td>과거 거래 내역</td>
                <td><%=m.getTradeList() %></td>
            </tr>
            <tr>
                <td>좋아요 한 게시물</td>
                <td><%=m.getLikeList() %></td>
            </tr>
            <tr>
                <td>탈퇴하시겠습니까?</td>
                <td></td>
            </tr>
        </table>
    </div>
</section>
<%@ include file="/views/common/footer.jsp" %>