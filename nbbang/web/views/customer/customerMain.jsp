<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cstmcss/main.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&family=Song+Myung&display=swap" rel="stylesheet">
<style>
  

  figure.snip1200 {
    font-family: 'Raleway', Arial, sans-serif;
    position: relative;
    overflow: hidden;
    margin-top: 3%;
    margin-left: 25%;

    width: 700px;
    height: 600px;

    background: white;
    color: black;
    text-align: center;

    font-size: 16px;
  }

  figure.snip1200 * {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    -webkit-transition: all 0.45s ease-in-out;
    transition: all 0.45s ease-in-out;
  }

  figure.snip1200 img {
    width: 650px;
    height: 600px;
    position: relative;
    opacity: 0.9;
  }

  figure.snip1200 figcaption {
    position: absolute;
    top: 45%;
    left: 7%;
    right: 7%;
    bottom: 45%;
    border: 1px solid white;
    border-width: 1px 1px 0;
  }

  figure.snip1200 .heading {
    overflow: hidden;
    -webkit-transform: translateY(50%);
    transform: translateY(50%);
    position: absolute;
    bottom: 0;
    width: 100%;
  }

  figure.snip1200 h2 {
    display: table;
    margin: 0 auto;
    padding: 0 10px;
    position: relative;
    text-align: center;
    width: auto;
    text-transform: uppercase;
    font-weight: 400;
  }

  figure.snip1200 h2 span {
    font-weight: 800;
  }

  figure.snip1200 h2:before,
  figure.snip1200 h2:after {
    position: absolute;
    display: block;
    width: 1000%;
    height: 1px;
    content: '';
    background: white;
    top: 50%;
  }

  figure.snip1200 h2:before {
    left: -1000%;
  }

  figure.snip1200 h2:after {
    right: -1000%;
  }

  figure.snip1200 p {
    top: 50%;
    -webkit-transform: translateY(-50%);
    transform: translateY(-50%);
    position: absolute;
    width: 100%;
    padding: 0 20px;
    margin: 0;
    opacity: 0;
    line-height: 1.6em;
    font-size: 0.9em;
  }

  figure.snip1200 a {
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    position: absolute;
    z-index: 1;
  }

  figure.snip1200:hover img,
  figure.snip1200.hover img {
    opacity: 0.25;
    -webkit-transform: scale(1.1);
    transform: scale(1.1);
  }

  figure.snip1200:hover figcaption,
  figure.snip1200.hover figcaption {
    top: 7%;
    bottom: 7%;
  }

  figure.snip1200:hover p,
  figure.snip1200.hover p {
    opacity: 1;
    -webkit-transition-delay: 0.35s;
    transition-delay: 0.35s;
  }
</style>



<jsp:include page="maincss.jsp"></jsp:include>


<section class="content">
  <div id="kdh-content1">
    <figure class="snip1200">
      <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
      <figcaption>
        <p>NbbangNbbangNbbangNbbangNbbangNbbangNbbangNbbangNbbangNbbang</p>
        <div class="heading">
          <h2>Nbbang<span> Guide</span></h2>
        </div>
      </figcaption>
      <a href="#"></a>
    </figure>
  </div>
</section>





<script>
  $(".hover").mouseleave(
    function () {
      $(this).removeClass("hover");
    }
  );
</script>



<%@ include file="/views/common/footer.jsp" %>