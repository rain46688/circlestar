<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<%@ include file="/WEB-INF/views/common/header.jsp" %>




    <div class="container" id="writecontainer">
        <!-- <div class="row"> -->
            <div class="form-group">
            <h1> 게시글 작성! </h1>
            </div>
            
            <form method="post" action="<%=application.getContextPath()%>/writenotice.do" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="formGroupExampleInput">제목 : </label>
                    <input type="text" name="title" class="form-control" id="formGroupExampleInput">
                </div>

                <div class="form-group">
                    <label for="exampleFormControlFile1">파일 선택 : </label>
                    <input type="file" name="file" class="form-control-file" id="exampleFormControlFile1" accept=".gif, .jpg, .png .jpeg">
                </div>

                <div class="form-group">
                    <label for="exampleFormControlTextarea1">작성 내용 : </label>
                    <textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="20"></textarea>
                </div>

                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="게시글 작성 완료!"></input>
                    <a href="<%=application.getContextPath()%>/board.do" class="btn btn-primary">게시글 작성 취소</a>
                </div>

            </form>
        <!-- </div> -->
    </div>




<%@ include file="/WEB-INF/views/common/footer.jsp" %>
