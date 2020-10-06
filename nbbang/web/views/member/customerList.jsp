<%@page import="com.nbbang.customer.model.vo.CustomerCenter"%>
<%@page import="com.nbbang.board.model.vo.Card"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
    Member m=(Member)request.getAttribute("member");
    List<CustomerCenter> list=(List<CustomerCenter>)request.getAttribute("list");
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
        margin: 3% 8% 5% 0%;
        /* 세로정렬꽉차게 가운데:center */
        align-items: stretch;
        /* 가로정렬꽉차게 가운데:center */
        justify-items: stretch;
        width: 55%;
        float: right;
    }
    div .item *{
        width:100%;
        text-align: center;
        font-size: 16px;
    }
    a.active{
        font-weight: bold;
    }
    nav.listPageBar{
        text-align: center;
        margin-top: 3%;
    }
    ul.pagination{
        text-align: center;
    }
    div.fieldCapsule{
        display: flex;
        position: relative;
    }
    div.capsuleLeft{
        float: left;
        border-bottom: black 1px solid;
        padding: 1%;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }
    button.button{
        outline: none;
        background: #735020;
        width: 10%;
        min-width: 40px;
        border: none;
        padding: 5px;
        color: #FFFFFF;
        font-size: 14px;
        cursor: pointer;
        text-align: center;
        margin: 5px 0;
    }
</style>
<section>
    <div id="myPageWrapper">
	<jsp:include page="/views/member/memsidebar.jsp"></jsp:include>
 
            <div id="iCreateContainer">
                <div class="item textField" id="containerTitle">
                    <div id="modifyProfile" style="font-size: 24px; padding: 5px; padding-bottom: 0; text-align: left;" >내 문의 내역</div>
                    <div style="font-size: 16px; padding-left: 10px; text-align: left;" >나의 문의 내역과 관리자의 답변을 확인할 수 있습니다.</div>
                </div>
                <div class="item textField" style="margin-left: 1%; margin-top: 3%;">
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 10%; border-top: black 1px solid;">
                            글번호
                        </div>
                        <div class="capsuleLeft" style="width: 13%; border-top: black 1px solid;">
                            문의유형
                        </div>
                        <div class="capsuleLeft" style="width: 47%; border-top: black 1px solid;">
                            문의제목
                        </div>
                        <div class="capsuleLeft" style="width: 13%; border-top: black 1px solid;">
                            문의날짜
                        </div>
                        <div class="capsuleLeft" style="width: 15%; border-top: black 1px solid;">
                            관리자 답변 여부
                        </div>
                    </div>
                </div>
                <div class="item textField" style="margin-left: 1%;">
                    <%for(CustomerCenter c : list){ %>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 10%;">
                            <%=c.getCsId() %>
                        </div>
                        <div class="capsuleLeft" style="width: 13%;">
                            <%=c.getCsType() %>
                        </div>
                        <div class="capsuleLeft" style="width: 47%; cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/customer/customerReadFrm?num=<%=c.getCsId()%>'">
                            <%=c.getCsTitle() %>
                        </div>
                        <div class="capsuleLeft" style="width: 13%;">
                            <%=c.getCsDate() %>
                        </div>
                            <div class="capsuleLeft" style="width: 15%;">
                                    <%=(c.getCsIscheck()==false) ? "N" : "Y"%> 
                            </div>
       
                    </div>
                    <%}%>
                </div> 
                <nav aria-lable="Page navigation" class="listPageBar">
                    <ul class="pagination justify-content-center">
                        <%=request.getAttribute("pageBar")%>
                    </ul>
                </nav>
            </div>


    </div>
</section>


<script>
$("#10").addClass( 'active' );
</script>

<%@ include file="/views/common/footer.jsp" %>