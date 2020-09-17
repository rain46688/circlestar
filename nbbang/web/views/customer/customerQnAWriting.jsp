<%@page import="com.nbbang.customer.model.vo.CustomerCenter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%

CustomerCenter c = (CustomerCenter) request.getAttribute("center");
%>
<section>
   
    <div id='board-container'>
		<h2>게시판 작성</h2>
		<form action='<%=request.getContextPath() %>/customer/customerQnAWritingEnd' method="post"
		enctype="multipart/form-data">
			<table id='tbl-board'>
                <tr>
                    <th>문의유형</th>
                    <td>
                        <input type="radio" name="qnaType" id="type0" value="회원정보"
                        <%=c.getCsType().equals("회원정보")?"checked":"" %>>
                        <label for="type0">회원정보</label>
                        
                        <input type="radio" name="qnaType" id="type1" value="신고"
                        <%=c.getCsType().equals("신고")?"checked":"" %>>
                        <label for="type1">신고</label>
                    </td>
                </tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="title"></td>
				</tr>
<%-- 				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" value="<%=loginnedMember.getMemberId() %>" readonly></td>
				</tr> --%>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" cols="50" rows="3"></textarea></td>
                </tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="csFile"></td>
				</tr>
								<tr>
					<th colspan="2">
						<input type="submit" value="문의등록">
						<input type="reset" value="문의취소">
					</th>
				</tr>
			</table>
		</form>
	</div>


</section>
<%@ include file="/views/common/footer.jsp"%>

