<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cstmcss/main.css" type="text/css">

<style>
    table {
        width: 800px;
        height: 300px;
        margin-left: auto;
        margin-right: auto;
        margin-top: 6%;
        margin-bottom: 10%;
        
    }

    th {
        background-color: #eeeeee;
        font-weight: bolder;
        text-align: center;
        font-size: 18px;
    }

    td {
        text-align: center;
        padding-top: 0.7%;
        font-size: 14px;
    }

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
<jsp:include page="maincss.jsp"></jsp:include>

<!-- News테이블 -->

        <h1>각종 공지사항과 이벤트를 확인하세요.</h1>
<section>
    <div class="coustomer-news">
        <table class="tbl-news" >
            <colgroup>
                <col width="15%">
                <col width="15%">
                <col width="35%">
                <col width="15%">
                <col width="20%">
            </colgroup>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>유형</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                </tr>

                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>

            </thead>
        </table>
    </div>
    <!-- 작성버튼 -->
    <div id="btn-news">
        <button type="submit" id="btn-news-check">글작성</button>
    </div>



</section>
<%@ include file="/views/common/footer.jsp" %>