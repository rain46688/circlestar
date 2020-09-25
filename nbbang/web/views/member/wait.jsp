<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
	Member m=(Member)request.getAttribute("member");
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
    }
    div#sideBarTitleContainer{
        background-color: rgb(243, 183, 24);
        padding: 6%;
        color: white;
    }
    p#sideBarTitle{
        font-size: 2em;
        font-weight: bold;
        margin-top: 10%;
    }
    p#sideBarText{
        font-size: 1em;
        font-weight: bold;
        margin-bottom: 10%;
    }
    div#sideBarLinkContainer{
        border: darkgrey 1px solid;
        border-top: none;
        padding: 10%;
    }
    .postList{
        font-size: 1em;
        text-align: left;
    }
    .postList:hover{
        color: rgb(243, 183, 24);
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
        <div id="myPageSideBar">
            <div id="sideBarTitleContainer">
                <p id="sideBarTitle">마이 페이지</p>
                <p class="sideBarText">N빵은 고객님의<br>돈과 시간을<br>N빵해드립니다.</p>
            </div>
            <div id="sideBarLinkContainer">
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/iCreateList?usid=<%=loginnedMember.getUsid()%>">내가 만든 거래</a>
                </div>
                <div>
                    <a class="nav-link postList active" href="<%=request.getContextPath()%>/member/waitList?usid=<%=loginnedMember.getUsid()%>">신청한 거래</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/onGoingList?usid=<%=loginnedMember.getUsid()%>">시작된 거래</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/pastList?usid=<%=loginnedMember.getUsid()%>">과거 거래 내역</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/likeList?usid=<%=loginnedMember.getUsid()%>">좋아요 한 게시글</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/modifyProfile?usid=<%=loginnedMember.getUsid()%>">프로필 수정하기</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/updatePw?usid=<%=loginnedMember.getUsid()%>">비밀번호 수정하기</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/memberInfo?usid=<%=loginnedMember.getUsid()%>">개인정보 확인하기</a>
                </div>
            </div>
        </div>
        <div id="iCreateContainer">
            <div class="item textField" id="containerTitle">
                <div id="modifyProfile" style="font-size: 24px; padding: 5px; padding-bottom: 0; text-align: left;" >신청한 거래</div>
                <div style="font-size: 16px; padding-left: 10px; text-align: left;" >다른 참가자를 기다리는 중인 거래 목록입니다.</div>
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
<%@ include file="/views/common/footer.jsp" %>