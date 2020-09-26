<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cstmcss/main.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&family=Song+Myung&display=swap" rel="stylesheet">

<style>

 @import url(https://fonts.googleapis.com/css?family=Raleway:300,700);
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
figure.snip1384 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin-left: 40%;
  margin-top: 3%;
  width: 35em;
  height: 40em;
  color: #ffffff;
  text-align: left;
  font-size: 16px;
  background-color: white;
}
figure.snip1384 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
figure.snip1384 img {
  width: 33em;
  height: 35em;
  backface-visibility: hidden;
  vertical-align: top;
}
figure.snip1384:after,
figure.snip1384 figcaption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
figure.snip1384:after {
  content: '';
  background-color: rgba(0, 0, 0, 0.35);
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
  opacity: 0;
}
figure.snip1384 figcaption {
  z-index: 1;
  padding: 40px;
}
figure.snip1384 h3,
figure.snip1384 .links {
  width: 100%;
  margin: 5px 0;
  padding: 0;
}
figure.snip1384 h3 {
  line-height: 1.1em;
  font-weight: 700;
  font-size: 1.4em;
  text-transform: uppercase;
  opacity: 0;
}
figure.snip1384 p {
  font-size: 0.8em;
  font-weight: 300;
  letter-spacing: 1px;
  opacity: 0;
  top: 50%;
  -webkit-transform: translateY(40px);
  transform: translateY(40px);
}
figure.snip1384 i {
  position: absolute;
  bottom: 10px;
  right: 10px;
  padding: 20px 25px;
  font-size: 34px;
  opacity: 0;
  -webkit-transform: translateX(-10px);
  transform: translateX(-10px);
}
figure.snip1384 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}
figure.snip1384:hover img,
figure.snip1384.hover img {
  zoom: 1;
  filter: alpha(opacity=50);
  -webkit-opacity: 0.5;
  opacity: 0.5;
}
figure.snip1384:hover:after,
figure.snip1384.hover:after {
  opacity: 1;
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 10px;
  right: 10px;
}
figure.snip1384:hover h3,
figure.snip1384.hover h3,
figure.snip1384:hover p,
figure.snip1384.hover p,
figure.snip1384:hover i,
figure.snip1384.hover i {
  -webkit-transform: translate(0px, 0px);
  transform: translate(0px, 0px);
  opacity: 1;
} */

</style>
<section>
<jsp:include page="maincss.jsp"></jsp:include>



 <div class="kdh-main1">
  <figure class="snip1384">
    <img src="<%=request.getContextPath()%>/images/logo.png" alt="sample83" />
    <figcaption>
      <h3>Fleece Marigold</h3>
      <p>Which is worse, that everyone has his price, or that the price is always so low.</p><i class="ion-ios-arrow-right"></i>
    </figcaption>
    <a href="#"></a>
  </figure>
</div> 
</section>
<!-- <button type="button" class="btn-qna" style="font-size: 20px;"
  onclick="location.href='<%=request.getContextPath()%>/customer/customerQnA'">고객센터 바로가기</button> -->

  





<script>
$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);
</script>



<%@ include file="/views/common/footer.jsp" %>