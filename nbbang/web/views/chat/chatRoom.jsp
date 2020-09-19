<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script> 

<style>

</style>

<div id="side">
	<div id="chat">
			<c:if test="${tradeStage == 2}">
					<div id="ChatArea"></div>
					<div id="inputDiv">
						<textarea id="msgText" rows="3" cols="33"></textarea>
						<button type="button" onclick="sendMessage()" class="btn btn-success" id="chatBtn">전송</button>
					</div>
			</c:if>
	</div>
</div>

<script>

/* 메인 Window 사이즈 조절 막기 */

$(this).resize(fixedSize);
function fixedSize() {
		this.resizeTo()
}


</script>