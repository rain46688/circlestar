<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.member.model.vo.Member" %>
 <%
	String email=(String)request.getAttribute("email");
	String name=(String)request.getAttribute("name");
	String phone=(String)request.getAttribute("phone");
	String address=(String)request.getAttribute("address");
	Member m=(Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- Favicon -->
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
<title>포인트 충전하기</title>
<style>
/* Customize the label (the container) */
body *{
	font-family: 'Jua', sans-serif;
}
.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 16px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default radio button */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom radio button */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 16px;
  width: 16px;
  background-color: #eee;
  border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: rgb(236, 175, 89);
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
  top: 5px;
  left: 5px;
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background:white;
}
div#radioContainer{
	margin: 10% 5% 0 5%;
	padding: 3%;
}
#chargeBtn{
        outline: none;
        background: #735020;
        width: 40%;
        border: none;
        padding: 15px;
        color: #FFFFFF;
        font-size: 18px;
		cursor: pointer;
		text-align: center;
		margin: 0 30%;
    }
</style>
</head>
<body>
<div class="card-body bg-white mt-0">
	<p style="font-size: 25px; text-align: center;">포인트 충전하기</p>
		<div id="radioContainer">
			<label class="container">5000
			<input type="radio" name="money" value="5000" checked>
			<span class="checkmark"></span>
			</label>
			
			<label class="container">10000
			<input type="radio" name="money" value="10000">
			<span class="checkmark"></span>
			</label>
			
			<label class="container">15000
			<input type="radio" name="money" value="15000">
			<span class="checkmark"></span>
			</label>
		
			<label class="container">20000
			<input type="radio" name="money" value="15000">
			<span class="checkmark"></span>
			</label>
		
			<label class="container">25000
			<input type="radio" name="money" value="15000">
			<span class="checkmark"></span>
			</label>
		
			<label class="container">30000
			<input type="radio" name="money" value="15000">
			<span class="checkmark"></span>
			</label>
		
			<label class="container">35000
			<input type="radio" name="money" value="15000">
			<span class="checkmark"></span>
			</label>
		
			<label class="container">40000
			<input type="radio" name="money" value="15000">
			<span class="checkmark"></span>
			</label>
		
		
			<label class="container">45000
			<input type="radio" name="money" value="15000">
			<span class="checkmark"></span>
			</label>
		
		
			<label class="container">50000
			<input type="radio" name="money" value="15000">
			<span class="checkmark"></span>
			</label>
		</div>
		<input type="hidden" name="usid" value="<%=m.getUsid()%>">
		<p  style="color: red;">카카오페이의 최소 충전금액은 5,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
		<button type="button" id="chargeBtn" onclick="fn_chargePoint();">충 전 하 기</button>
	</div>
<script>
	function fn_chargePoint(){
        var IMP = window.IMP;
        IMP.init('imp53290509');
        var money = $('input[name="money"]:checked').val();
		var usid=$('input[name="usid"]').val();
        console.log(money);

        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '포인트 충전',
            amount : money,
            buyer_email : '<%=email%>',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=phone%>',
            buyer_addr : '<%=address%>',
        }, function(rsp) {
            if ( rsp.success ) {
            	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            	jQuery.ajax({
            		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
            		type: 'POST',
            		dataType: 'json',
            		data: {
        	    		imp_uid : rsp.imp_uid
        	    		//기타 필요한 데이터가 있으면 추가 전달
            		}
            	});
				$.ajax({
                    type: "POST", 
                    url: "<%=request.getContextPath() %>/member/chargePointCpl", //충전 금액값을 보낼 url 설정
                    data: {
                        "point" : money,
						"usid" :usid
                    },
                });
				var msg = '결제가 완료되었습니다.';
				msg += '\n고유ID : ' + rsp.imp_uid;
				msg += '\n상점 거래ID : ' + rsp.merchant_uid;
				msg += '\n결제 금액 : ' + rsp.paid_amount+'원';
				alert(msg);
				close();
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                
                alert(msg);
                close();
            }
        });
	};

</script>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>