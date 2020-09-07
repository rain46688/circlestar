<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<%@ include file="/WEB-INF/views/common/header.jsp"%>




<div class="container" id="writecontainer">
	<div class="form-group">
		<h1>게시글 작성!</h1>
	</div>

	<form method="post" action="<%=request.getContextPath()%>/writenotice.do" enctype="multipart/form-data">
		
		
		<div class="form-row form-group">
			<div class="col">
				<label for="formGroupExampleInput">제목 : </label> 
			<input type="text" name="title" class="form-control" id="formGroupExampleInput" placeholder="게시글 제목">
			</div>
			<div class="col">
				<label for="formGroupExampleInput">거래 종류 : </label>
				<select class="custom-select custom-select" name="select_trade" id="select_trade">
					<option selected>종류</option>
					<option value="직거래">직거래</option>
					<option value="택배배송">택배배송</option>
				</select>
			</div>
		</div>

		<div class="form-row form-group">
			<div class="col">
				<label for="formGroupExampleInput">제품 카테고리 : </label>
				<select class="custom-select custom-select" name="select_cate" id="select_cate">
					<option selected>분류</option>
					<option value="특가">특가</option>
					<option value="식품">식품</option>
					<option value="패션잡화">패션잡화</option>
					<option value="티켓">티켓</option>
					<option value="애완용품">애완용품</option>
				</select>
			</div>
			<div class="col">
				<label for="formGroupExampleInput">제품 상세 이름: </label> 
				<input type="text" name="pname" class="form-control" placeholder="상세 제품명">
			</div>
		</div>

		<div class="form-row form-group" >
			<div class="col">
				<label for="formGroupExampleInput">N빵 인원수 : </label>
				<select class="custom-select custom-select"  name="select_mem" id="select_mem">
					<option selected>인원 선택</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
				</select>
			</div>

			<div class="col">
				<label for="formGroupExampleInput">제품 가격 : </label> 
				<input type="text" name="price" class="form-control" placeholder="단위 (원)">
			</div>
		</div>

		<div class="form-row form-group">
			<div class="col">
				<label for="formGroupExampleInput">제품 보유 상태 : </label>
				<select class="custom-select custom-select" name="select_own" id="select_own">
					<option selected>상태</option>
					<option value="구매 예정">구매 예정</option>
					<option value="제품 보유중">제품 보유중</option>
				</select>
			</div>
			<div class="col">
				<label for="formGroupExampleInput">거래 지역 : </label> 
				<input type="text" name="tradeloc" class="form-control" id="formGroupExampleInput" placeholder="주소">
			</div>
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
			<a href="<%=request.getContextPath()%>/board.do" class="btn btn-primary">게시글 작성 취소</a>
		</div>


	</form>
</div>




<%@ include file="/WEB-INF/views/common/footer.jsp"%>
