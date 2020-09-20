<%@page import="com.nbbang.customer.model.vo.CustomerCenter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cstmcss/main.css" type="text/css">
<style>


  #fontBold {
    font-weight: bold;
  }
</style>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cstmcss/main.css" type="text/css">
<div id="kdh-container">
  <div id="kdh-sidebar-left">
    <h2></h2>
    <ul class="side-bar-kdh">

      <li class="cstmt-list" ><a class="main-a"
          style="font-family: 'Gothic A1', sans-serif;"
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
      <li class="list-hiper"><a href="" class="hiper-tag"
          style="font-family: 'Gothic A1', sans-serif;">마이페이지</a></li>
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







<div id='board-container'>
  <h3>문의를 작성하시오.</h3>
  <form action='<%=request.getContextPath() %>/customer/customerQnAWritingEnd' method="post"
    enctype="multipart/form-data">
    <div class="type-select">
    <input type="radio" name="qnaType" id="type0" value="회원정보">
    <label for="type0">회원정보</label>

    <input type="radio" name="qnaType" id="type1" value="신고">
    <label for="type1">신고</label>
  </div>
    <!--     <select class="type-select" name="qnaType">
      <option value="" selected>문의유형</option>
      <option value="">회원정보관련</option>
      <option value="">신고</option>
    </select> -->
    <div class="fix-writer">
      <input value="9999" class="writing-input" name="writer" id="" readonly>
      <!-- 9999는 Admin에 USID 이다.USID는 회원가입을 하잖아 회원가입을 하면 시퀀스 넘버에 의해 
            자동으로 증가한다. 일단은 9999로 해놓고 나중에 세션값을 받아와서 닉네임을 조회한 다음에 
                넘겨서 DB에 넣어라. -->
    </div>
    <div class="wrtie-title">
      <input type="text" class="writing-input" name="title" placeholder="제목을 입력하쇼.">
    </div>
    <div class="wrtie-content">
      <textarea name="contentwrite" rows="5" cols="50" placeholder="내용을 입력하쇼">

					</textarea>
    </div>
    <div class="file-upload">

      <input type="file" name="csFile" multiple="true">

    </div>
    <div id="submitBtn">
      <button type="submit" class="btn-submit">문의등록</button>
    </div>
  </form>
</div>
<%@ include file="/views/common/footer.jsp"%>