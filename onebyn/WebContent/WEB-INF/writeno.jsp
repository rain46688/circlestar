<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>semi1 write</title>
<link href="<%=application.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/cms.css" rel="stylesheet">
<script src="<%=application.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script src="<%=application.getContextPath()%>/js/bootstrap.bundle.min.js"></script>

</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <a href="">
            <img class="navbar-brand" src="<%=application.getContextPath()%>/images/b1.png">
        </a>
        <form class="form-inline" action="/action_page.php">
            <input class="form-control mr-sm-2" type="text" placeholder="검색">
            <button class="btn btn-success" type="submit">검색</button>
        </form>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarResponsive">
            <!-- 위치 조정용 -->
        </div>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto ">
                <!-- <li class="nav-item active"> -->
                <li class="nav-item">
                    <a class="nav-link" href="#">로그인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">회원가입</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">고객센터</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">마이페이지</a>
                </li>
            </ul>
        </div>




    </nav>


    <nav class="navbar navbar-expand-sm bg-warning navbar-light" id="onebyn-nav-mid">
        <div class="collapse navbar-collapse" id="navbarsExample02">
            <ul class="navbar-nav mr-auto">
                <!-- 위치 조정용 -->
            </ul>
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"> 특가 </a>
                    <div class="dropdown-menu mt-0" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">1</a>
                        <a class="dropdown-item" href="#">2</a>
                        <a class="dropdown-item" href="#">3</a>
                        <a class="dropdown-item" href="#">4</a>
                    </div>
                </li>
            </ul>

            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"> 식품 </a>
                    <div class="dropdown-menu mt-0" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">1</a>
                        <a class="dropdown-item" href="#">2</a>
                        <a class="dropdown-item" href="#">3</a>
                        <a class="dropdown-item" href="#">4</a>
                    </div>
                </li>
            </ul>

            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"> 패션잡화 </a>
                    <div class="dropdown-menu mt-0" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">1</a>
                        <a class="dropdown-item" href="#">2</a>
                        <a class="dropdown-item" href="#">3</a>
                        <a class="dropdown-item" href="#">4</a>
                    </div>
                </li>
            </ul>

            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"> 취미-문구 </a>
                    <div class="dropdown-menu mt-0" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">1</a>
                        <a class="dropdown-item" href="#">2</a>
                        <a class="dropdown-item" href="#">3</a>
                        <a class="dropdown-item" href="#">4</a>
                    </div>
                </li>
            </ul>

            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"> 티켓 </a>
                    <div class="dropdown-menu mt-0" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">1</a>
                        <a class="dropdown-item" href="#">2</a>
                        <a class="dropdown-item" href="#">3</a>
                        <a class="dropdown-item" href="#">4</a>
                    </div>
                </li>
            </ul>

            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"> 애완용품 </a>
                    <div class="dropdown-menu mt-0" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">1</a>
                        <a class="dropdown-item" href="#">2</a>
                        <a class="dropdown-item" href="#">3</a>
                        <a class="dropdown-item" href="#">4</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>




    <div class="container">
        <!-- <div class="row"> -->
            <div class="form-group">
            <h1> 게시글 작성 </h1>
            </div>
            
            <form method="post" action="wn" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="formGroupExampleInput">제목 : </label>
                    <input type="text" name="title" class="form-control" id="formGroupExampleInput">
                </div>

                <div class="form-group">
                    <label for="exampleFormControlFile1">파일 선택 : </label>
                    <input type="file" name="file" class="form-control-file" id="exampleFormControlFile1">
                </div>

                <div class="form-group">
                    <label for="exampleFormControlTextarea1">작성 내용 : </label>
                    <textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="20"></textarea>
                </div>

                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="게시글 작성 완료!"></input>
                    <a href="notice" class="btn btn-primary">게시글 작성 취소</a>
                </div>

            </form>
        <!-- </div> -->
    </div>




    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">주소 : 서울시 강동구 상일로 152 관리자 메일 : rain46688@kh.com 사업자 등록번호 :
                123-1234-12345</p>
            <p class="m-0 text-center text-white">통신 판매업 : 신고제 1234 호 상호 : CMS 대표 이사 : 최민수 전화 번호 : 010-8230-8775</p>
            <p class="m-0 text-center text-white">Copyright &copy; cms87750.com All right reserved since 1994</p>
            <p class="m-0 text-center text-white">end : ${end}</p>
            <p class="m-0 text-center text-white">start : ${start}</p>

        </div>
    </footer>

</body>

</html>