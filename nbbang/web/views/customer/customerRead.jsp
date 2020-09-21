<%@page import="com.nbbang.customer.model.vo.CustomerCenter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cstmcss/main.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&family=Song+Myung&display=swap"
  rel="stylesheet">

<div id="kdh-container">
  <div id="kdh-sidebar-left">
    <h2></h2>
    <ul class="side-bar-kdh">

      <li class="cstmt-list"><a class="main-a" style="font-family: 'Gothic A1', sans-serif;"
          href="<%=request.getContextPath() %>/customer/customerMain">N빵 가이드</a></li>

      <li class="cstmt-list"> <a class="main-a" style="font-family: 'Gothic A1', sans-serif;"
          href="<%=request.getContextPath() %>/customer/customerQnA">N빵 문의</a></li>

      <li class="cstmt-list"><a class="main-a" style="font-family:  'Gothic A1', sans-serif;"
          href="<%=request.getContextPath() %>/customer/customerNews">N빵 소식</a></li>

      <li class="cstmt-list"><a class="main-a" style="font-family: 'Gothic A1', sans-serif;"
          href="<%=request.getContextPath() %>/customer/customerAsk">N빵 질문</a></li>

    </ul>
    <ul class="side-bar-kdh">
      <li class="list-hiper"><a href="" class="hiper-tag" style="font-family: 'Gothic A1', sans-serif;">홈</a>
      </li>
      <li class="list-hiper"><a href="" class="hiper-tag" style="font-family: 'Gothic A1', sans-serif;">구경하기</a>
      </li>
      <li class="list-hiper"><a href="" class="hiper-tag" style="font-family: 'Gothic A1', sans-serif;">해외직구</a>
      </li>
      <li class="list-hiper"><a href="" class="hiper-tag" style="font-family: 'Gothic A1', sans-serif;">마이페이지</a></li>
    </ul>
    <ul class="side-bar-kdh">
      <li id="list-image1"><a href="">
          <image src="<%=request.getContextPath()%>/images/we.png" style="width: 150px; height: auto;">
        </a></li>
      <li id="list-image2"><a href="">
          <image src="<%=request.getContextPath()%>/images/pang.png" style="width: 150px; height: auto;">
        </a></li>
      <li id="list-image3"><a href="">
          <image src="<%=request.getContextPath()%>/images/llist1.png" style="width: 150px; height: auto;">
        </a></li>

    </ul>
  </div>
</div>

<style>
  div#QA-container {
    margin-top: 1.4%;
    margin-left: 35%;
    margin-bottom: 4%;
    width: 50%;
    height: 100%;
    box-shadow: 5px 5px 5px 5px #ecd051;
  }

  div.question-container {
    height: 300px;
    
  }

  div.answer-container {
    height: 300px;
    
  }
  div.content-write p, div.answer-content p{
    text-align: center;
  }
  div.file-upload{
    margin-left: 5%;
    margin-top: 26%;
    
    width: 200px;
  }
  div.answer-date{
    float: right;
   margin-top: 25%;
   margin-right: 4%;
  }
  div.hr-line{
    box-shadow: 1px 1px 1px 1px #ecd051;
    color: white;
    
    width: 100%;
  }
  div#submitBtn{
    margin-top:35%;
  }
</style>

<div id="QA-container">

  <form action='<%=request.getContextPath() %>/customer/customerQnAWritingEnd' method="post"
    enctype="multipart/form-data">
    <div class="question-container">
      
      <div class="write-content">
        
        <image src="<%=request.getContextPath()%>/images/q.png" style="width: 20px; height: auto;">
        
        <div class="content-write" name="contentwrite">
          <p> zzzzzzzzzzzzzzzz</p>        
        </div>
      </div>
      
      <div class="file-upload">
        <a href="">첨부파일</a>
      </div>
    </div>
    
    <div class="hr-line">
      <hr id="hr-line">
    </div>


    <div class="answer-container">
      <image src="<%=request.getContextPath()%>/images/A.png" style="width: 15px; height: auto;">
      <div class="answer-content">
        <p> GGGGGGGGGGGGGGGGGGGGGGGG</p>  
      </div>
      <div class="answer-date">
        2020.09.21 12:16pm
      </div>
      <div id="submitBtn">
        <button type="reset" class="btn-submit">닫기</button>
      </div>
    </div>




    <%--              <%for(CustomerCenter cc : list){%>
    <div class="wrtie-content">
      <textarea name="contentwrite" rows="5" cols="50">
                <%=cc.getCsContent()%>
                          </textarea>
    </div>
    <div class="file-upload">
      <div>
        <%=cc.getCsDate()%>
      </div>
      <%}%>
      
          </div> --%>

        </form>
</div>
<%@ include file="/views/common/footer.jsp"%>