<%@page import="com.nbbang.customer.model.vo.CustomerCenter"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%

List<CustomerCenter> list = (List) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id='board-container'>
        <h3>문의를 작성하시오.</h3>
        <form action='<%=request.getContextPath() %>/customer/customerQnAWritingEnd' method="post"
          enctype="multipart/form-data">
            <%for(CustomerCenter cc : list){%>
          <div class="wrtie-content">
            <textarea name="contentwrite" rows="5" cols="50" >
                <%=cc.getCsContent()%>
                          </textarea>
          </div>
          <div class="file-upload">
            <div>
                <%=cc.getCsDate()%>
            </div>
            <%}%>
      
          </div>
          <div id="submitBtn">
            <button type="submit" class="btn-submit">문의등록</button>
          </div>
        </form>
      </div>
</body>
</html>