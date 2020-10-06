<%@page import="com.nbbang.board.model.vo.Card"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
	Member m=(Member)request.getAttribute("member");
	List<Card> bolist=(List<Card>)request.getAttribute("boardList");
%>
<style>
    div#myPageSideBar{
        position: relative;
        background: white;
        text-align: center;
        margin: 3% 3% 3% 20%;
        /* 세로정렬꽉차게 가운데:center */
        align-items: stretch;
        /* 가로정렬꽉차게 가운데:center */
        justify-items: stretch;
        width: 14%;
        float: left;
        font-family: 'Do Hyeon', sans-serif;
    }
    div#sideBarTitleContainer{
        background-color: rgb(243, 183, 24);
        padding: 6%;
        color: white;
        border: 2px black solid;
    }
    p#sideBarTitle{
        font-size: 2.5em;
        margin-top: 10%;
    }
    p#sideBarText{
        font-size: 1.3em;
        margin-bottom: 10%;
    }
    div#sideBarLinkContainer{
        border: darkgrey 1px solid;
        border-top: none;
        padding: 10%;
        border: 2px black solid;
        border-top: none;
    }
    .postList{
        font-size: 1.3em;
        text-align: left;
    }
    .postList:hover{
        color: rgb(243, 183, 24);
    }

    div#modifyProfile{
        font-family: 'Do Hyeon', sans-serif;
    }
    div#iCreateContainer{
        position: relative;
        background: #FFFFFF;
        text-align: center;
        margin: 3% 12% 5% 0%;
        /* 세로정렬꽉차게 가운데:center */
        /*align-items: stretch;*/
        /* 가로정렬꽉차게 가운데:center */
        /*justify-items: stretch;*/
        width: 51%;
        float: left;
    }
    div.card{
        padding: 0;
        margin: 0 1% 3% 1%;
        width:30%;
    }
    div.card-body{
        padding:4%;
    }
    
    div.card-body *{
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }
    .card-img-top {
        width: 100%;
        height: 10vw;
        object-fit: cover;
    }
    a.active{
        font-weight: bold;
    }
    .imgContainer{
        cursor: pointer;
    }
    nav.listPageBar{
        text-align: center;
        margin: 0;
    }
    ul.pagination{
        text-align: center;
    }
    #productTitle{
        text-align: left;
        font-size: 16px;

    }
    #productPrice{
        text-align: right;
        font-size: 16px;
    }
</style>
<section>
    <div id="myPageWrapper">
         	<jsp:include page="/views/member/memsidebar.jsp"></jsp:include>
        <div id="iCreateContainer">
            <div class="item textField" id="containerTitle">
                <div id="modifyProfile" style="font-size: 24px; padding: 5px; padding-bottom: 0; text-align: left;" >내가 만든 거래</div>
                <div style="font-size: 16px; padding-left: 10px; text-align: left;" >내가 만든 거래 목록입니다.</div>
                <div style="margin-bottom: 20px; font-size: 16px; padding-left: 10px; text-align: left;" >이미지를 누르면 상세 페이지로 이동합니다.</div>
            </div>
            <div id="cardContainer">
            	<%for(Card c:bolist){ %>
                <div class="card">
                    <div class="imgContainer" onclick="location.href='<%=request.getContextPath()%>/board/boardPage?boardId=<%=c.getCardBoard().getBoardId()%>&writerUsid=<%=loginnedMember.getUsid()%>'">
                        <img src="<%=request.getContextPath()%>/upload/images/<%= c.getCardFile().getFileName()[0] %>" class="card-img-top" alt="...">
                    </div>
                    <div class="card-body">
                      <div id="productTitle">
                        <%= c.getCardBoard().getBoardTitle() %>
                      </div>
                      <div id="productPrice">
                        <%= c.getCardBoard().getProductPrice() %>
                      </div>
                    </div>
                </div>
                <%} %>
                <nav aria-lable="Page navigation" class="listPageBar">
					<ul class="pagination justify-content-center">
						<%=request.getAttribute("pageBar")%>
					</ul>
				</nav>
            </div>
        </div>
    </div>
</section>

<script>
$("#1").addClass( 'active' );
</script>



<%@ include file="/views/common/footer.jsp" %>