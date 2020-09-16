<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>회원가입</title>
   <link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
   #loginField > form > button:nth-child(2){
      width : 20%;
   }
   #loginField > form > button:nth-child(9){
      width : 30%;
   }
   #loginField > form > button:nth-child(10){
      width : 30%;
   }
   #loginField > form:nth-child(2) > input.button{
    outline: none;
    background: #735020;
    width: 20%;
    border: none;
    margin: 0 0 15px;
    padding: 15px;
    color: #FFFFFF;
    font-size: 14px;
    cursor: pointer;
   }
</style>
</head>
<body>
<%@ include file="/views/common/header.jsp"%>
       <div id="loginBox" style="padding-top: 20px;">
        <div id="loginField">
        <h2>회원가입</h2>
<form name="memberEnrollFrm" action="<%=request.getContextPath() %>/memberEnrollEnd" method="post">             
                <input type="text" placeholder="아이디"  class="input" name="userId" id="userId"  required  style="width : 59%;">
             <input type="button" value="중복검사" class="button" onclick="fn_id_duplicate();">  
              <input type="password" placeholder="비밀번호" class="input" id="password" name="password">
              <input type="password" placeholder="비밀번호 확인" class="input" id="password_2">
              <input type="text" placeholder="이름" class="input" id="userName" name="userName" >
              <input type="text" placeholder="닉네임" class="input" id="nickname" name="nickname" >
              <input type="email" placeholder="이메일" class="input" id="email" name="email">
              <input type="tel" placeholder="휴대폰" class="input" id="phone" name="phone" >
              <input type="text" placeholder="주소" class="input" id="address" name="address" >
              <button type="submit" style="width:30%;">가입</button>
              <button type="reset" style="width:30%;">취소</button>
              
            </form>
            <form action="<%=request.getContextPath() %>/checkIdDuplicate" name="checkIdDuplicate">
               <input type="hidden" name="userId">
            </form>
            
        </div>
    </div>
      
   <script>
      function fn_memberEnroll_validate(){
         //유효성검사!
         
      }
      $(function(){
         $("#password_2").blur(e => {
            let pw=$("#password").val();
            let pwck=$(e.target).val();
            if(pw.trim()!=pwck.trim()){
               alert("비밀번호가 일치하지 않습니다.");
               $("#password").val("");
               $(e.target).val("");
               $("#password").focus();
            }
         })
      });
      
      //아이디 중복확인하는 함수
      function fn_id_duplicate(){
         console.log("아")
         //중복확인 창을 출력하기
         //중복확인전 아이디는 기본 4글자 이상입력을 해야하기 때문에
         //입력된 아이디값이 4글자 이상인지 확인
         let id=$("#userId").val().trim();
         if(id.length<4){
            alert("아이디는 4글자 이상입력하세요!");
            return;
         }
         
         //중복확인할 새창을 띄우기
         const url="<%=request.getContextPath()%>/checkIdDuplicate";
         const title="chekcIdDuplicate";
         const status="left=500px,top=100px,width=300px,height=200px";
         
         open("",title,status);
         
         //form에 데이터를 채우고 open된 윈도우에서 결과를 받는 로직을 구성
         //자바스크립트에서 form은 name속성으로 요소를 가져올 수 있음
         console.log(checkIdDuplicate);
         checkIdDuplicate.target=title;//form을 전송하는 윈도우를 선정
         checkIdDuplicate.action=url;
         checkIdDuplicate.method="post";
         //input에 userId값 넣기 formname속성값에서 inputname속성값으로 가져올 수 있음
         console.log(checkIdDuplicate.userId);
         checkIdDuplicate.userId.value=id;
         //form 전송하기
         checkIdDuplicate.submit();      
         
         
      }
      
      
   </script>
   <%@ include file="/views/common/footer.jsp"%>
    
    
    
    
    
</body>
 
 
 
 
 
 
 
  