<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<style>

.accordion {position:absolute;margin-top:5.5%;margin-left:50em;transform:translateX(-50%);width:36em;}
input[id*="answer"] {display:none;}
input[id*="answer"] + label {display:block;padding:1.5em;border:1px solid #ffd478;border-bottom:0;color:black;font-weight:900;background:#ffdb12;cursor:pointer;position:relative;}
input[id*="answer"] + label em {position:absolute;top:50%;right:10px;width:30px;height:30px;margin-top:-15px;display:inline-block;background:url('./img/arrow.png') 0 0 no-repeat;}
input[id*="answer"] + label + div {max-height:0;transition: all .35s;overflow:hidden;background:#ebf8ff;font-size:13px; width: auto;}
input[id*="answer"] + label + div p {display:inline-block;padding:2em;}
input[id*="answer"]:checked + label + div {max-height:30em;}
input[id*="answer"]:checked + label em {background-position:0 -30px;}

</style>
<jsp:include page="maincss.jsp"></jsp:include>
     <div class="accordion">
        <input type="radio" name="accordion" id="answer01">
        <label for="answer01">컨텐츠 제목 부분<em></em></label>
        <div><p>여기에 추가되는 부분이 자주묻는 질문의 답변내용이 이 영역에 들어갑니다. 이곳에서 자연스럽게 나오는 효과를 볼 수 있습니다. 이 기능으로 자주묻는 질문컨텐츠를 만들 수 있습니다.</p></div>
        <input type="radio" name="accordion" id="answer02">
        <label for="answer02">컨텐츠 제목 부분<em></em></label>
        <div><p>여기에 추가되는 부분이 자주묻는 질문의 답변내용이 이 영역에 들어갑니다. 이곳에서 자연스럽게 나오는 효과를 볼 수 있습니다. 이 기능으로 자주묻는 질문컨텐츠를 만들 수 있습니다.</p></div>
        <input type="radio" name="accordion" id="answer03">
        <label for="answer03">컨텐츠 제목 부분<em></em></label>
        <div><p>여기에 추가되는 부분이 자주묻는 질문의 답변내용이 이 영역에 들어갑니다. 이곳에서 자연스럽게 나오는 효과를 볼 수 있습니다. 이 기능으로 자주묻는 질문컨텐츠를 만들 수 있습니다.</p></div>
        <input type="radio" name="accordion" id="answer04">
        <label for="answer04">컨텐츠 제목 부분<em></em></label>
        <div><p>여기에 추가되는 부분이 자주묻는 질문의 답변내용이 이 영역에 들어갑니다. 이곳에서 자연스럽게 나오는 효과를 볼 수 있습니다. 이 기능으로 자주묻는 질문컨텐츠를 만들 수 있습니다.</p></div>
    </div> 


<%@ include file="/views/common/footer.jsp"%>
