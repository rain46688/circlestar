<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Member m = (Member)request.getAttribute("m");


%>

<%@ include file="/views/common/header.jsp"%>
<section id="enroll-container">
	<h2>해당 회원 상세 정보 보기</h2>
	<br>
	<br>
	<table>
			<tr>
                <th>아이디</th>
                <td>
						<label><%=m.getMemberId() %></label>                    
                </td>
            </tr>

            <tr>
                <th>이름</th>
                <td>
                 		<label><%=m.getMemberName()%></label>               
                </td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>
                 		<label><%=m.getNickname()%></label>            
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                  		<label><%=m.getEmail()%></label>         
                </td>
            </tr>
            <tr>
                <th>휴대폰</th>
                <td>
                  		<label><%=m.getPhone()%></label>         
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                   		<label><%=m.getAddress()%></label>         
                </td>
            </tr>
            <tr>
                <th>가입날짜</th>
                <td>
              		<label><%=m.getEnrollDate()%></label>         
                </td>
            </tr>
        </table>
<br>
<br>

</section>
<%@ include file="/views/common/footer.jsp"%>