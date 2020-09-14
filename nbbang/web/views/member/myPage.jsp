<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
	Member m=(Member)request.getAttribute("member");
%>
<section>
	<div id="infoContainer" name="infoContainer">
        <span id="MIbtn">회원정보</span>
        <span id="AIbtn">활동내역</span>
        <div id="memberInfo" name="memberInfo" class="infoDiv">
            <form action="">
                <table id="memberInfoTable" name="memberInfoTable" class="infoTable">
                    <tr>
                        <td>아이디</td>
                        <td>
                            <%=m.getMemberId() %>
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td>
                            <input type="password">
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인</td>
                        <td>
                            <input type="password">
                        </td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td>
                            <%=m.getMemberName() %>
                        </td>
                    </tr>
                    <tr>
                        <td>닉네임</td>
                        <td>
                            <input type="text" value="<%=m.getNickname()%>">
                        </td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td>
                            <input type="text" value="<%=m.getPhone()%>">
                        </td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td>
                            <input type="text" value="<%=m.getAddress()%>">
                        </td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td>
                            <input type="text" value="<%=m.getEmail()%>">
                        </td>
                    </tr>
                    <tr>
                        <td>가입날짜</td>
                        <td>
                            <%=m.getEnrollDate() %>
                        </td>
                    </tr>
                </table>
                <button type="submit">회원정보 수정</button>
                <button type="button">회원탈퇴</button>
            </form>
        </div>
        <div id="activityInfo" name="activityInfo" class="infoDiv">
            <table id="activityInfoTable" name="activityInfoTable" class="infoTable">
                <tr>
                    <td>회원등급</td>
                    <td>
                    	<%=m.getGrade() %>
                    </td>
                </tr>
                <tr>
                    <td>가용포인트</td>
                    <td>
                    	<%=m.getPoint() %>
                    </td>
                </tr>
                <tr>
                    <td>총 개설 가능한 방 개수</td>
                    <td>
                    	<%=m.getMaxRoomCnt() %>
                    </td>
                </tr>
                <tr>
                    <td>현재 개설 가능한 방 개수</td>
                    <td>
                    	<%=m.getCurRoomCnt() %>
                    </td>
                </tr>
                <tr>
                    <td>개설 중인 방 리스트</td>
                    <td>
                    	<%=m.getCurTradeList() %>
                    </td>
                </tr>
                <tr>
                    <td>거래 완료 리스트</td>
                    <td>
                    	<%=m.getTradeList() %>
                    </td>
                </tr>
                <tr>
                    <td>관심있는 게시물</td>
                    <td>
                    	<%=m.getLikeList() %>
                    </td>
                </tr>
                <tr>
                    <td>신고 당한 횟수</td>
                    <td>
                    	<%=m.getReportCnt() %>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</section>
<%@ include file="/views/common/footer.jsp" %>