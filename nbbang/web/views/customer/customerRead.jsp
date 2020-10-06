<%@page import="com.nbbang.customer.model.vo.CustomerFile"%>
<%@page import="java.util.List"%>
<%@page import="com.nbbang.customer.model.vo.CustomerCenter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cstmcss/main.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&family=Song+Myung&display=swap" rel="stylesheet">

<%
	CustomerCenter c = (CustomerCenter) request.getAttribute("cc");
%>


<style>
#writecontainer {
	/* position: relative; */
	background: #FFFFFF;
	text-align: center;
	margin: 3% 21% auto;
	/* align-items: stretch; */
	/* justify-items: stretch; */
	width:100%;
	height:100em;
/* 	border:1px solid black;	 */
}

h2 {
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px
		#BFBFBF;
	margin: 15px 0 10px 0;
}

.divCell, .divTableHead {
	border-bottom: 1px #DEE2E6 solid;
	display: table-cell;
	padding: 25px 10px;
	width: 16.67%;
	font-size: 15px;
}

.divListBody {
	display: table-row-group;
}

.divList {
	display: table;
	width: 100%;
	height: 150px;
	text-align: center;
}

.divRow {
	display: table-row;
}

.divRowTitle {
	display: table-row;
	font-size: 15px;
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px
		#BFBFBF;
	width: 100%;
}

#downpage, #uppage {
	width: 100%;
	height: auto;
	font-size: 15px;
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px
		#BFBFBF;
}

#downpage{
	font-size: 20px;
}

#noanswer {
	float: center;
	width: 100%;
	height: 15em;
}

#date {
	float: right;
	font-size: 10px;
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px
		#BFBFBF;
	padding: 1em;
}

.cuscon>p {
	width: 200%;
	padding: 0 auto;
	padding-top: 2em;

}
.cuscon>.cuscon2{
	border-bottom: 1px #DEE2E6 solid;
	padding-bottom:2em;
}

  #imageWrapper {
    margin-bottom: 2em;
    	width: 200%;
  }

  #imageWrapper>img {
    border-radius: 1em;
  }
  /* 위 텍스트 영역 눌르면 옆에 테두리 생기는거 지우는 용도 */
textarea:focus {
	outline: none;
}	
.admin-answer{
border: none;
width:auto;
padding:2em;
}

.bor{
border:2px solid #FFC107;

}

#downpage > .btn{
margin-bottom:2em;
}

</style>




<%-- <div>
	<jsp:include page="/views/notice/sideBar.jsp"></jsp:include>
</div> --%>

<div class="container" id="writecontainer">

	<div class="form-group">
		<h2>문의 보기</h2>
	</div>


	<p id="date">
		작성 날짜
		<%=c.getCsDate()%></p>
	<div id="uppage" class="shadow p-3 mb-5 bg-white rounded">
		<div class="divList">
			<div class="divListBody">

				<div class="divRowTitle">
					<div class="divCell">
						문의 ID :
						<%=c.getCsId()%></div>
					<div class="divCell">
						작성자 :
						<%=c.getCsNickname()%></div>
				</div>

				<div class="divRowTitle">
					<div class="divCell">
						문의 제목 :
						<%=c.getCsTitle()%></div>
					<div class="divCell">
						문의 타입 :
						<%=c.getCsType()%></div>
				</div>

				<div class="divRowTitle cuscon">
					<p class="cuscon2"><%=c.getCsContent()%></p>
				</div>
				
					<div class="divRowTitle cuscon">
					
		    <div id="imageWrapper">
					      <div id="carouselField" name="carouselField" >
					        <div id="carouselNB" class="carousel slide " data-ride="carousel" data-interval="false">
					          <ol class="carousel-indicators">
					            <% for(int i = 0; i < c.getCf().size(); i++)  {%>
					            <% if(i==0) { %>
					              <li data-target="#carouselInhee" data-slide-to="<%= i %>" class="active"></li>
					            <% }else { %>
					              <li data-target="#carouselInhee" data-slide-to="<%= i %>"></li>
					            <% }} %>
					          </ol>
					          <div class="carousel-inner" role="listbox">
					            <% for(int i = 0; i < c.getCf().size(); i++)  {%>
					              <% if(i==0) { %>
					            <div class="carousel-item active">
					              <img src="<%=request.getContextPath()%>/upload/customerImages/<%= c.getCf().get(i).getCsFileName() %>"
					                class="d-block w-90 card-img-top" alt="..." width="100%" height="400em">
					            </div>
					            <% }else { %>
					              <div class="carousel-item">
					                <img src="<%=request.getContextPath()%>/upload/customerImages/<%= c.getCf().get(i).getCsFileName() %>"
					                  class="d-block w-90 card-img-top" alt="..." width="100%" height="400em">
					              </div>
					            <% }} %>
					          </div>
					    
					          <a class="carousel-control-prev" href="#carouselNB" role="button"
					            data-slide="prev"> <span class="carousel-control-prev-icon"
					            aria-hidden="true"></span> <span class="sr-only">Previous</span>
					          </a> 
					          <a class="carousel-control-next" href="#carouselNB" role="button"
					            data-slide="next"> <span class="carousel-control-next-icon"
					            aria-hidden="true"></span> <span class="sr-only">Next</span>
					          </a>
					        </div>
					      </div>
					    </div>
    
				</div>

			</div>
		</div>


	</div>
	<div class="form-group">
		<h2>문의 답변</h2>
	</div>

        <% if(c.getCsIscheck() == false) {%>
        
        <%if (loginnedMember.getNickname().equals("ADMIN")) {%>
					<div id="downpage" class="shadow p-3 mb-5 bg-white rounded admin" style="cursor: pointer"> 
					<div id="noanswer">클릭하여 답변 작성</div>
					</div>
		        <% }else { %>      
					<div id="downpage" class="shadow p-3 mb-5 bg-white rounded "> 
					<div id="noanswer">관리자 답변이 없음</div>
					</div>
		       <% } %>

        <% }else { %>
        
	<%if (loginnedMember.getNickname().equals("ADMIN")) {%>
		        	<div id="downpage" class="shadow p-3 mb-5 bg-white rounded admin" style="cursor: pointer">
					<div id="noanswer"><%=c.getCsAnswer() %></div>
					</div>
		       <% }else { %>
		             <div id="downpage" class="shadow p-3 mb-5 bg-white rounded">
					<div id="noanswer"><%=c.getCsAnswer() %></div>
					</div>
		        <% } %>
		              
               <% } %>
</div>

<script>

$('.admin').hover(function(){
    $(this).css('color','black');
    $(this).removeClass( 'shadow p-3 mb-5 bg-white rounded' );
    $(this).addClass( 'bor' );
}, function() {
    $(this).css('color','black');
    $(this).addClass( 'shadow p-3 mb-5 bg-white rounded' );
    $(this).removeClass( 'bor' );
});



$(".admin").click(e=>{
	console.log(<%=c.getCsIscheck()%>);

	let tmp = $(".admin").html();
	let html=" <textarea class='admin-answer' cols='45' rows='10' placeholder='답변을 입력해주세요'></textarea><br><a onclick='wri();' class='btn btn-success'>등록</a> <button onclick='cancel();' class='btn btn-success'>취소</button>";
	$(".admin").html(html);
	$(".admin").removeClass( 'shadow p-3 mb-5 bg-white rounded admin' );

});

function wri(){
	console.log($(".admin-answer").val());
	if($(".admin-answer").val() == ""){
		alert("입력창이 비어있습니다.");
		return;
	}
	
	if(<%=c.getCsIscheck()%> == true){
	var result = confirm("이미 답변이 작성되었습니다. 수정하시겠습니까?");
	if(result){

			//console.log("머야"+st.includes("\n"))
		/* 	if(st.includes("\n")){
				console.log("있");
			}else{
				console.log("없");
			} */
			let st = $(".admin-answer").val();
			st=st.replace("\n","<br>")
			//console.log("st : "+st);
			$.ajax({
				type:"GET",
				data:{"csId":<%= c.getCsId()%>,"admin-answer":st},
				url:"<%=request.getContextPath()%>/customer/customerAnswerEnd",
				success:function(data){
					if (data == 1) {
						$("#downpage").html("");
						$("#downpage").html("<div id='noanswer'>"+st+"</div>");
						if(<%=c.getCsIscheck()%> == true){
							alert("수정 성공");
						}else{
							alert("등록 성공");
						}
					}else{
						alert("답변 처리 실패");
					}
				}
			})
	}else{
		 location.reload();
	}
	
	}else{
		let st = $(".admin-answer").val();
		st=st.replace("\n","<br>")
		console.log("st : "+st);
		$.ajax({
			type:"GET",
			data:{"csId":<%= c.getCsId()%>,"admin-answer":st},
			url:"<%=request.getContextPath()%>/customer/customerAnswerEnd",
			success:function(data){
				console.log("성공"+$("#downpage").html());
				if (data == 1) {
					$("#downpage").html("");
					$("#downpage").html("<div id='noanswer'>"+st+"</div>");
					if(<%=c.getCsIscheck()%> == true){
						alert("수정 성공");
					}else{
						alert("등록 성공");
					}
				}else{
					alert("답변 처리 실패");
				}
			}
		})
	}
	
	
	
	
};

function cancel(){
	 location.reload();
};




</script>





<%@ include file="/views/common/footer.jsp"%>