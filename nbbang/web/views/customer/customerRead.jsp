<%@page import="com.nbbang.customer.model.vo.CustomerFile"%>
<%@page import="java.util.List"%>
<%@page import="com.nbbang.customer.model.vo.CustomerCenter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cstmcss/main.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&family=Song+Myung&display=swap"
  rel="stylesheet">


<%

 CustomerCenter c=(CustomerCenter)request.getAttribute("cc");
List<CustomerCenter> list = (List) request.getAttribute("list");

System.out.println("C: "+ c);
System.out.println("list: " + list);
%>
<style>
  section.answer-container-kdh{
    margin-top:3em;
    margin-bottom: 3em;
    width: 45em; 
    height: 40em;
    margin-left: 33em;
    
    position: relative;
  }





  div.writing-date {
    
    float: right;
    
    margin-top: 8em;
  }



  div.content-write p,
  div.answer-content p {
    text-align: center;
  }

  div.file-upload {
    
    margin-top: 26%;

    width: 10em;
  }
  div.answer-container{
    margin-top: 3em;
    margin-bottom: 50em;
    width: 45em; 
    
   
  }
  div.answer-date {
    float: right;
    margin-top: 8em;
    
  }

  div.hr-line {
    box-shadow: 1px 1px 1px 1px #f5f4f3;
    color: white;
    margin-bottom: 3em;

    
  }

  div#submitBtn {
    margin-top: 35%;
  }
  div.comment-container{
    margin-left: 0em;
  }


  .imgList {
    width: 100%;
    display: flex;
    justify-content: space-around;
    align-items: center;
  }

  .imgC p {
    text-align: center;
  }

  .modal {
    display: none;
    z-index: 500;
    width: 100%;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    background-color: rgba(0, 0, 0, 0.3);
  }

  .modal button {
    position: absolute;
    top: 3rem;
    right: 3rem;
    background: transparent;
    border: 0;
    color: #ffffff;
    font-size: 3rem;
  }

  .modalBox {
    position: relative;
    top: 20%;
    left: 50%;
    transform: translate(-50%, -20%);
    background-color: #ffffff;
    width: 30em;
    height: 20em;
    text-align: center;
  }

  .modalBox img {
    width: 20em;
    height: 20em;
  }



 .comment-container .comment-editor #btn-insert{
    margin-bottom: 5em;
  }
</style>
<jsp:include page="maincss.jsp"></jsp:include>
<section class="answer-container-kdh">
  <div id="QA-container">
  <form action="'<%=request.getContextPath() %>/customer/customerAnswerEnd'" method="post"
      enctype="multipart/form-data">
      <!-- 클라이언트 창 -->
      <div class="question-container">

        <div class="write-content">

          <img src="<%=request.getContextPath()%>/images/q.png" style="width: 20px; height: auto;">
          <input type="hidden" name="csWriterUsid" value="<%=loginnedMember.getUsid()%>">

          <div class="content-write" name="csContent">
            <p><%=c.getCsContent() %></p>
          </div>
          <div class="writing-date">
            <p><%=c.getCsDate() %></p>
          </div>
          <%for(CustomerFile cf : c.getCf()){ %>
            <div class="file-upload">
              
              
              <div class="imgList">
                <img class="imgC" src="<%=request.getContextPath() %>/upload/customerImages/<%=cf.getCsFileName() %>"
                width="60" height="60">
                <p><%=cf.getCsFileName() %> </p>
              </div>
          </div>

          <!-- 팝업 될 곳 -->
          <div class="modal">
            <button>&times;</button>
            <div class="modalBox">
              <img src="<%=request.getContextPath() %>/upload/customerImages/<%=cf.getCsFileName() %>"
                alt="<%=cf.getCsFileName() %>">
              <p></p>
            </div>
          </div>
          <%} %>
          
        </div>
      </div>
    </form>
        <div class="hr-line">
          <hr id="hr-line">
        </div>
        <%
        if (c.getCsAnswer()==null && loginnedMember.getNickname().equals("ADMIN")){
        %>
          <div class="comment-container">
            <div class="comment-editor">
              <%-- <%if(c.getCsAnswer()==null){ %> --%>
              <form action="<%=request.getContextPath()%>/customer/customerAnswerEnd" method="post">
                <div class="answer-content">
                  <input type="hidden" name="csId" value="<%=c.getCsId()%>">
                  <textarea name="admin-answer" cols="100" rows="10"></textarea>
        
                  <button type="submit" id="btn-insert">등록</button>
                </div>
                
              </form>
            </div>
          </div>
          <%}%> 
        <%if(c.getCsAnswer()!=null){ %>
      <div class="answer-container">
        <img src="<%=request.getContextPath()%>/images/A.png" style="width: 15px; height: auto;">
        
        <div class="answer-content">
          <p><%=c.getCsAnswer()%></p>
          <div class="answer-date">
            <%=c.getCsDate()%>
          </div>
        </div>
        <%}%>
      </div>
       </div> 
  </div>
  <!-- <%
if (c.getCsAnswer()==null && loginnedMember.getNickname().equals("ADMIN")){
%>
  <div class="comment-container">
    <div class="comment-editor">
      <%-- <%if(c.getCsAnswer()==null){ %> --%>
      <form action="<%=request.getContextPath()%>/customer/customerAnswerEnd" method="post">
        <div class="answer-content">
          <input type="hidden" name="csId" value="<%=c.getCsId()%>">
          <textarea name="admin-answer" cols="100" rows="10"></textarea>

          <button type="submit" id="btn-insert">등록</button>
        </div>
        
      </form>
    </div>
  </div>
  <%}%> -->
  </section>


    




			

    
  

    
  
      
<script>
  $(function () {
    // 	이미지 클릭시 해당 이미지 모달
    $(".imgC").click(function () {
      $(".modal").show();
      // 해당 이미지 가겨오기
      var imgSrc = $(this).children("img").attr("src");
      var imgAlt = $(this).children("img").attr("alt");
      $(".modalBox img").attr("src", imgSrc);
      $(".modalBox img").attr("alt", imgAlt);



      // 해당 이미지에 alt값을 가져와 제목으로
      $(".modalBox p").text(imgAlt);
    });

    //.modal안에 button을 클릭하면 .modal닫기
    $(".modal button").click(function () {
      $(".modal").hide();
    });

    //.modal밖에 클릭시 닫힘
    $(".modal").click(function (e) {
      if (e.target.className != "modal") {
        return false;
      } else {
        $(".modal").hide();
      }
    });
  });
</script>



<%@ include file="/views/common/footer.jsp"%>