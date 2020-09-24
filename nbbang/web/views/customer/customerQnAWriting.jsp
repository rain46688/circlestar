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
      

      <div class="type-wrap">
          <select class="type-select" name="csType" style="width:581px;">
                <option value="" selected>문의유형을 선택하세요.</option>
                <option value="회원정보">회원정보관련</option>
                <option value="거래배송">거래배송관련</option>
                <option value="불법거래">불법거래</option>
                <option value="성희롱">성희롱</option>
                <option value="신고">신고</option>
           </select> 
      </div>
    
     <div class="fix-writer">

       <input type="hidden" name="csWriterUsid" value="<%=loginnedMember.getUsid()%>">
       
        <input value="<%=loginnedMember.getNickname()%>" class="writing-input" name="csNickname" id="" readonly size="75">

    </div>
      
      <div class="write-title">
        <input type="text" class="writing-input" name="csTitle" placeholder="제목을 입력하쇼." size="75">
        
      </div>
      
      <div class="write-content">
        <textarea name="csContent" rows="16" cols="80" placeholder="내용을 입력하쇼" ></textarea>
      </div>
     
      <div class="file-upload">
        <input type="file" name="csFile" multiple="true" >
      </div>
     
    </form>
  </div>
</div>
            <div id="submitBtn-kdh">
              <button type="button" class="btn-submit" onclick=" movingPage('<%=request.getContextPath()%>/customer/customerQnAWritingEnd')">문의등록</button>
            </div>
          


  <script>
    // $(".btn-submit").click(e => {

      function movingPage(url){
      var form=new FormData();
      //일반파일 넣기
      form.append("csNickname",$("[name=csNickname]").val());
      form.append("csType",$("[name=csType]").val());
      form.append("csWriterUsid",$("[name=csWriterUsid]").val());
      form.append("csContent",$("[name=csContent]").val());
      form.append("csTitle",$("[name=csTitle]").val());
      var filesdata=$("[name=csFile]")[0];
      console.log("print: "+filesdata)
      for(let i=0;i<filesdata.files.length;i++){
        form.append("test"+i, filesdata.files[i]);
      } 
      $.ajax({
        // url:"<%=request.getContextPath() %>/customer/customerQnAWritingEnd",
        url:url,
        data:form,
        type:"post",
        processData:false,
       
        contentType:false,
        success:data=>{
          console.log(data);
          alert("등록성공!");
        }
      
      })
      location.href ="<%=request.getContextPath()%>/customer/customerQnA"; 
    }


  </script>

<%@ include file="/views/common/footer.jsp"%>