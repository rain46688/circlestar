<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section>
    <div id="qnaWriting-container">
        <form action="<%=request.getContextPath()%>/customer/customerQnAWriting" method="post"
            enctype="multipart/form-data">
            <div id="writingFrm">
                <ul>
                    <div id="type-select">

                        <li>
                            문의유형
                            <input type="radio" name="type" id="type0" value="회원정보">
                            <label for="type0">회원정보</label>
                            <input type="radio" name="type" id="type1" value="신고하기">
                            <label for="type1">신고하기</label>
                        </li>
                    </div>
                    <div id="title-typing">

                        <li>
                            제목
                            <input type="text" name="title" id="title" value="제목">
                        </li>
                    </div>
                    <div id="content-typing">

                        <li>
                            내용
                            <textarea name="textarea" rows="10" cols="50">Write something here</textarea>
                        </li>
                    </div>
                    <div id="file-select">

                        <li>
                            파일첨부
                            <a href="">
                                <img src="" width="20" height="20">
                            </a>
                        </li>
                    </div>
                </ul>
            </div>

        </form>

    </div>



</section>
<%@ include file="/views/common/footer.jsp"%>