<%@page import="com.nbbang.customer.model.vo.CustomerCenter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cstmcss/main.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&family=Song+Myung&display=swap"
  rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cstmcss/qnawriting.css" type="text/css">
<jsp:include page="maincss.jsp"></jsp:include>










<div class="writing-container">
  <div class="writing-wrap">
    
    <form action='<%=request.getContextPath() %>/customer/customerQnAWritingEnd' method="post"
      enctype="multipart/form-data">
      
    <!--  <div class="type-select">
        
        <input type="hidden" id="type-sel">
        <label for="type-sel">문의 유형</label>
       
        <input type="radio" name="qnaType" id="type0" value="회원정보">
        <label for="type0">회원정보</label>

        <input type="radio" name="qnaType" id="type1" value="신고">
        <label for="type1">신고</label>

        <input type="radio" name="qnaType" id="type2" value="불법거래">
        <label for="type2">불법거래</label>
        
        <input type="radio" name="qnaType" id="type3" value="신고">
        <label for="type3">신고</label>
        
        <input type="radio" name="qnaType" id="type4" value="신고">
        <label for="type4">신고</label>
        
        <input type="radio" name="qnaType" id="type5" value="신고">
        <label for="type5">신고</label>

      </div> -->
      <div class="type-wrap">
          <select class="type-select" name="qnaType" style="width:581px;">
                <option value="" selected>문의유형</option>
                <option value="">회원정보관련</option>
                <option value="">거래배송관련</option>
                <option value="">불법거래</option>
                <option value="">성희롱</option>
                <option value="">신고</option>
           </select> 
      </div>
    
     <div class="fix-writer">
        <input value="9999" class="writing-input" name="writer" id="" readonly size="75">
        <!-- 9999는 Admin에 USID 이다.USID는 회원가입을 하잖아 회원가입을 하면 시퀀스 넘버에 의해 
            자동으로 증가한다. 일단은 9999로 해놓고 나중에 세션값을 받아와서 닉네임을 조회한 다음에 
                넘겨서 DB에 넣어라. -->
      </div>
      
      <div class="write-title">
        <input type="text" class="writing-input" name="title" placeholder="제목을 입력하쇼." size="75">
        
      </div>
      
      <div class="write-content">
        <textarea name="contentwrite" rows="16" cols="80" placeholder="내용을 입력하쇼" >

					</textarea>
      </div>
     
      <div class="file-upload">
        <input type="file" name="csFile" multiple="true" >
      </div>
      <div class="file-upload">
        <input type="file" name="csFile" multiple="true" >
        </div>
     
      <div id="submitBtn-kdh">
        <button type="submit" class="btn-submit">문의등록</button>
      </div>
    
    </form>
  </div>
</div>
<%@ include file="/views/common/footer.jsp"%>