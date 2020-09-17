<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cstmcss/main.css" type="text/css">
<style>
    div#customer-submain {
        padding-top: 2%;

    }

    div#container-qna {
        padding-top: 6.5%;
        margin-bottom: 7%;
    }

    .qna-list,
    .qna-list2 {
        text-align: center;
        list-style: none;
        /* border-left: 2px solid bisque; */
        display: inline;
        padding-top: 5%;
        margin-left: 15%;
        

    }

    .qna-list:first {
        border-left: none;
    }

    #fontBold {
        font-weight: bold;
    }

    #title-1,
    #title-2,
    #title-3{
        margin-left: 6%;
        border-bottom: 10px;
    }

    #customer-QNA{
        padding-top: 3%;
    }
    
    #fontBold{font-weight:bold;}
</style>
<section>
			    <div id="kdh-container">
      <div id="kdh-header">
        <h1>궁금하시거나 불펴하신점 편하게 물어보세요.</h1>
      </div>
      <div id="kdh-sidebar-left">
        <h2>사이드</h2>
        <ul>
 					<li class="cstmt-list" style="font-size:16px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerMain">N빵 가이드</a></li>
					<li class="cstmt-list" style="font-size:20px;" id="fontBold"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerQnA">N빵 문의</a></li>
					<li class="cstmt-list" style="font-size:16px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerNews">N빵 소식</a></li>
					<li class="cstmt-list" style="font-size:16px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerAsk">N빵 질문</a></li>
        </ul>
      </div>
       </div>
</section>
<br>
<br>
<section>
    <button type="submit" id="btn-sbmit" onclick="location.href='<%=request.getContextPath()%>/customer/customerQnAWriting'">문의하기</button>
    <div id="container-qna">
        <li id="title-1">1:1문의</li>
        <li id="title-2">*개인정보를 기입하지마세요.</li>
        <li id="title-3">*허위정보를 기입하지마세요.</li>
        <div id="customer-QNA">

            <ul class="cstmt-qna">
                <li class="qna-list">문의유형</li>
                <li class="qna-list">제목</li>
                <li class="qna-list">문의날짜</li>
                <li class="qna-list">답변상태</li>
            </ul>
            
             <ul class="cstmt-qna2">
                <li class="qna-list2"><%=c.getQnaType %></li>
                <li class="qna-list2"><a href="<%=request.getContextPath()%>/customer/customerQnAWriting?no=<%=c.getQnaNo()%>"><%=c.getQnaTitle() %>오늘 이벤트는?</a></li>
                <li class="qna-list2"><%=c.getCstmDate %></li>
                <li class="qna-list2"><%=c.getQnaStatus %></li>
            </ul>
            
            <ul class="cstmt-qna2">
                <li class="qna-list2">이벤트</li>
                <li class="qna-list2"><a href="">오늘 이벤트는?</a></li>
                <li class="qna-list2">2020.9.16</li>
                <li class="qna-list2">o</li>
            </ul>
        </div>
    </div>
</section>

<%@ include file="/views/common/footer.jsp"%>