<%@page import="com.nbbang.customer.model.vo.CustomerCenter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<style>


    h1 {
        background-color: lightsalmon;
        font-size: 22px;
        margin-left: auto;
        margin-right: auto;
        margin-top: 1.8%;
        width: 600px;
        height: 70px;
        padding-left: 24px;
    }

    button {
        width: 100px;
        background-color:sandybrown;
        border: none;
        color: rgb(22, 19, 19);
        text-decoration: none;
        display: inline-block;
        font-size: 15px;
        margin: 4px;
        cursor: pointer;
        padding: 15px 0;
        text-align: center;

    }
	
	#fontBold{font-weight:bold;}
	</style>
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
                        >
                        <label for="type0">회원정보</label>
                        
                        <input type="radio" name="qnaType" id="type1" value="신고"
                        >
                        <label for="type1">신고</label>
                    </td>
                </tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="title"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer"  value="9999" readonly></td>
				<!-- 9999는 Admin에 USID 이다.USID는 회원가입을 하잖아 회원가입을 하면 시퀀스 넘버에 의해 
						자동으로 증가한다. 일단은 9999로 해놓고 나중에 세션값을 받아와서 닉네임을 조회한 다음에 
							넘겨서 DB에 넣어라. -->
				</tr> 
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

