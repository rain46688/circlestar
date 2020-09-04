<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container" id="writecontainer">
    <h1> 회원가입 </h1>
    <form class="form-horizontal" method="post" action="">

        <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">아이디</label>
            <div class="cols-sm-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                    <input type="text" class="form-control" name="userId" id="userId_" placeholder="아이디 입력" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">이름</label>
            <div class="cols-sm-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                    <input type="text" class="form-control" name="userName" id="userName" placeholder="이름 입력" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">닉네임</label>
            <div class="cols-sm-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                    <input type="text" class="form-control" name="nickName" id="nickName" placeholder="닉네임 입력" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="password" class="cols-sm-2 control-label">비밀번호</label>
            <div class="cols-sm-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                    <input type="password" class="form-control" name="password" id="password_"
                        placeholder="패스워드 입력" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="confirm" class="cols-sm-2 control-label">비밀번호 확인</label>
            <div class="cols-sm-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                    <input type="password" class="form-control" name="password" id="password_2" placeholder="패스워드 확인" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">전화번호</label>
            <div class="cols-sm-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                    <input type="text" class="form-control" name="phone" id="phone" placeholder="전화번호 입력" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">주소</label>
            <div class="cols-sm-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                    <input type="text" class="form-control" name="address" id="address" placeholder="주소 입력" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="name" class="cols-sm-2 control-label">이메일</label>
            <div class="cols-sm-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                    <input type="email" class="form-control" name="email" id="email" placeholder="이메일 입력" />
                </div>
            </div>
        </div>

        
        <div class="form-group ">
            <input type="submit" value="회원가입" class="btn btn-primary btn-lg btn-block login-button">
        </div>
        <div class="login-register">
            <a href="<%=request.getContextPath()%>/login.do">로그인</a>
        </div>
    </form>
</div>

<script>

	$(function(){
		$("#password_2").blur(e=>{
			let pw=$("#password_").val();
			let pwck=$(e.target).val();
			/* 빈칸 없애기 */
			if(pw.trim()!=pwck.trim()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#password_").val("");
				pw="";
				$(e.target).val("");
				pw.focus();
			}
		})
	});



</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>