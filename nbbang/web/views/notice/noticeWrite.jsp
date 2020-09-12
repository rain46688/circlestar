<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">


<section>
	<h2>공지사항 작성</h2>
	<div class="container">
		<form action="<%=request.getContextPath()%>/notice/noticeWriteEnd"
			method="post" encType="multipart/form-data">
			<table class="table table-bordered">


				<tbody>
					<tr>
						<th>제목:</th>
						<td><input type="text" placeholder="제목을 입력하세요. " name="title" /></td>
					</tr>
					<tr>
						<th>작성자:</th>
						<td><input type="text" name="writer" id="writer"
							value="<%=loginnedMember.getMemberId()%>" readonly></td>
					</tr>
					<tr>
						<th>내용:</th>
						<td><textarea cols="10" placeholder="내용을 입력하세요. "
								name="content"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일:</th>
						<td><input type="file" placeholder="파일을 선택하세요. "
							name="filename"></td>
					</tr>

					<tr>
						<td colspan="2"><input type="button" value="등록"
							onclick="return validate();">
							 <input type="button"value="reset" /> 
							<input type="button" value="목록보기"
							onclick="javascript:location.href='noticeList.jsp'"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<script>
		function validate() {
			const content = $("[name=content]").val();
			if (content.trim().length == 0) {
				alert("내용을 입력해주세요.");
				$("[name=content]").focus();
				return false;
			}
		}
	</script>
</section>




<%@ include file="/views/common/footer.jsp"%>