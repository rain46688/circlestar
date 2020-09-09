<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section>
  <h2>공지사항 작성</h2>

  <div id="notice-container">
    <form action="<%=request.getContextPath() %>/notice/noticeWriteEnd" method="post"
    	enctype="multipart/form-data">
        <table id="tbl-notice">
        <tr>
            <th>제 목</th>
            <td><input type="text" name="title" id="title" required></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><input type="text" name="writer" id="writer"
             value="<%=loginnedmember.getUserId()%>" readonly></td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td><input type="file" name="upfile" id="upfile"></td>
        </tr>
        <tr>
            <th>내 용</th>
            <td><textarea cols="30" rows="5" name="content" ></textarea></td>
        </tr>
        <tr>
            <th colspan="2">
                <input type="submit" value="등록하기" 
                onclick="return validate();">
            </th>
        </tr>
    </table>
    </form>
    </div>
    <script>
    /* [name=content]: 속성값에 name이 content인거 */
    	function validate(){
    		const content=$("[name=content]").val();
    		if(content.trim().length==0){
    			alert("내용을 입력해주세요.");
    			$("[name=content]").focus();
    			return false;
    		}
    	}
    </script>
</section>
 <style>
    section#notice-container{width:300px; margin:0 auto; text-align:center;}
    section#notice-container h2{margin:10px 0; text-align:center;}
    table#tbl-notice{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse;}
    table#tbl-notice th, table#tbl-notice td {border:1px solid; padding: 5px 0; text-align:center;} 
    </style>
<%@ include file="/views/common/footer.jsp"%>