<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&family=Song+Myung&display=swap"
    rel="stylesheet">

<style>
    div.contaniner2-kdh {
        padding: 5em;
        margin-left: 1em;
        
    }

    .content1,
    .content2 {
        margin-left: 2em;
    }

    .main-content-kdh a {
        text-decoration: none;
    }

    #wrapper-1 {
        margin-top: 2em;
        margin-bottom: 3em;
        margin-left: 0%;
        display: flex;
        justify-content: center;
        align-items: center;
        float: left;
    }

    /* Accordion Container */
    .container-kim {
        width: 43em;
        margin-left: 4em;
        position: relative;
    }

    /* shadow */
    .container-kim:before {
        content: '';
        position: absolute;
        width: calc(100% - 30px);
        height: 100%;
        margin: 0;

        background-color: transparent;

        box-shadow: 0px 20px 40px #52616b;
        opacity: 0.2;
        z-index: -1;
        transition: ease-in-out 0.6s all;
    }

    .container-kim:hover.container-kim:before {
        box-shadow: 0px 40px 90px #52616b;
    }

    ul.accordion {
        list-style: none;
        margin: 0;
        padding: 0;

        border-radius: 3px;
    }

    .accordionTitle {
        padding: 20px;
        position: relative;
        margin: 0;
        font-size: 13px;
        font-weight: 450;
        letter-spacing: 0.8px;
        color: #52616b;
        transition: ease-in-out 0.2s all;
        cursor: pointer;
    }

    .accordionTitle:hover {
        padding-left: 25px;
    }

    /* Accordion Item line */
    .accordionTitle:before,
    .accordionTitle:after {
        content: '';
        position: absolute;
        height: 2px;
        border-radius: 50px;
        transition: ease-in-out 0.6s all;
        bottom: 0;
        left: 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .accordionTitle:before {
        width: 100%;
        background-color: #c9d6df;
    }

    .accordionTitle:after {
        background-image: linear-gradient(90deg, #52616b, #c9d6df);
        width: 0%;
    }

    .accordionTitle:hover::after {
        width: 100%;
    }

    /* Accordion Item line - Active */
    .accordionTitleActive:after {
        content: '';
        position: absolute;
        height: 2px;
        border-radius: 50px;
        transition: ease-in-out 0.6s all;
        bottom: 0;
        left: 0;
        display: flex;
        justify-content: center;
        align-items: center;

    }

    .accordionTitleActive:after {
        background-image: linear-gradient(90deg, #52616b, #c9d6df);
        width: 100%;
    }


    /* Accordion Item Icon  */
    .accIcon {
        float: right;
        width: 10em;
        height: 30px;
        display: flex;
        margin-top: -3px;
        align-items: center;
        justify-content: center;
    }

    .accIcon:before,
    .accIcon:after {
        content: '';
        position: absolute;
        border-radius: 50px;
        background-color: #c9d6df;
        transition: ease 0.3s all;
    }

    .accIcon:before {
        width: 2px;
        height: 20px;
    }

    .accIcon:after {
        width: 20px;
        height: 2px;
    }

    .accordionTitle:hover .accIcon:before,
    .accordionTitle:hover .accIcon:after {
        background-color: #52616b;
    }

    .accIcon.anime.accIcon:before {
        transform: rotate(90deg);
    }

    /* Text Content */
    .accordion .item .text1 {
        opacity: 0;
        height: 0;
        padding: 0px 20px;
        position: relative;
        line-height: 24px;
        font-size: 12px;
        font-weight: 200;
        transition: all 0.6s cubic-bezier(.42, .2, .08, 1);
        overflow: hidden;
        background-color: #f0f5f9;
        letter-spacing: 0.5px;
    }

    /* Text Content - Class for JS to hide and show */
    .accordion .item .text1.show {
        opacity: 1;
        height: auto;
        padding: 25px 20px;
        position: relative;
        z-index: 0;
        border-radius: 0px 0px 3px 3px;
    }
    #wrapper-1{
    padding-top:2em;
    }
    
</style>




<div>
	<jsp:include page="/views/notice/sideBar.jsp"></jsp:include>
</div>

<section id="wrapper-1">
    <div class="container-kim">
        <ul class="accordion">
            <li class="item">
                <h2 class="accordionTitle">Nbbang 운영정책 <span class="accIcon"></span></h2>
                <div class="text1">우리 엔빵의 따뜻한 거래를 위해 다음과 같은 약속을 꼭꼭 지켜주세요. <br>
                    엔빵의 거래 매너를 잘 지켜주세요. <br>
                    거래약속은 꼭 지켜주세요. <br>
                    이왕이면 근처에서 직거래를 해주세요. <br>
                    판매금지 물품은 판매할 수 없어요. <br>
                    광고/홍보는 엔빵 광고주센터에 등록된 지역 광고만 허용됩니다. <br>
                    전문판매업자의 게시글은 제한하고 있어요. <br>
                    최대 2개의 지역에 게시글을 올리고 거래할 수 있어요. <br>
                    중복 게시글이나 도배는 안 돼요. <br>
                    카테고리를 준수해주세요. <br>
                    거래 관련 문제가 생겼을 때는 중고거래 게시판 거래 및 환불 정책을 따르고 있어요. <br>
                    거래분쟁이 생겼을 때 상대방의 닉네임을 공개하면서 명예를 훼손하는 글을 올리면 안 돼요. <br>
                    <br><br>

                    서비스 이용제한 <br>
                    위 약속을 포함하여 아래의 경우라면 정상적으로 당근마켓을 사용하는 사용자 보호를 위해 사전 안내 없이 서비스 이용이 한시적 또는 영구적으로 제한될 수 있어요.

                    <br><br>

                    외부 관계법령을 위반한 경우 <br>
                    앱 시스템 및 다른 사용자의 정상적인 앱 사용을 방해하는 활동을 한 경우 <br>
                    범죄 행위(사기, 성범죄, 폭력 등) 기록이 있거나 확인되는 경우 <br>
                    <br><br>

                    위 운영정책은 엔빵 이웃과의 즐겁고 따뜻한 공간을 만들기 위한 최소한의 장치예요. <br>

                    앞으로도 계속 찾게 되고, 오래 사용하고 싶은 엔빵이 되도록 더욱 노력하겠습니다. </div>
            </li>
            <li class="item">
                <h2 class="accordionTitle">Nbbang에서 지켜야 할 거래 매너 <span class="accIcon"></span></h2>
                <div class="text1"> <br><br>

                    엔빵에서 따뜻한 거래 경험을 함께 나눠요😊

                    여러분의 작은 친절이 엔빵 이웃에게 큰 감동을 줄 수 있어요. 당근마켓의 모든 사용자가 우리 동네의 이웃이라는 점을 기억해 주세요.

                    여러분 근처의 이웃에게 따뜻한 배려를 베풀어 주세요.
                    <br><br>


                    기본 매너<br>

                    기본적으로 지켜야 하는 매너에는 무엇이 있을까요? 기본 매너인 만큼 꼭 지켜 주실 거라고 믿어요 :)<br><br>

                    • 서로 존중해요. 우리 존댓말로 대화해요.<br>

                    • 모두의 시간은 소중합니다. 시간 약속을 꼭 지켜주세요.<br>

                    • 절대로 중간에 연락 끊기는 일이 없도록 해요. (잠수는 절대 안 돼요!)<br>

                    • 따뜻한 감사 인사로 마무리를 지어요.<br>

                    • 어떤 상황에서도 욕설, 비방, 명예훼손 등의 언행은 지양해 주세요.<br>

                    • 늦은 시간 채팅은 부담스러울 수 있어요. 특히 새벽 시간에는 채팅을 자제해 주세요. <br>

                    • 택배 거래는 부득이한 경우에만 요청하시고 가능한 한 직거래로 해주세요.<br><br>



                    구매자 매너 <br>

                    이웃의 상품을 구매하는 구매자로서 따뜻함을 나눠주세요:) <br><br>

                    • 신중하게 고민한 뒤 판매자와 확실하게 거래 약속을 잡아요.<br>

                    • 질문하기 전에 판매글을 꼼꼼히 읽어 주세요.<br>

                    • 지나치게 가격을 깎지 말아 주세요. 가격제안 할 수 있는 경우에만 가격제안 해주세요. (정말 구매할 마음이 있을 때만 해주실 거죠?)<br>

                    • 직거래할 땐 판매자에게 가까운 장소에서 만나요.<br>

                    • 물건 금액에 맞게 현금을 미리 준비해 주세요.<br>

                    • 무료나눔을 받은 경우 감사 인사로 마무리해 주세요.<br><br>



                    판매자 매너<br>

                    개인 간의 거래인 만큼 신뢰할 수 있는 매너를 보여주세요:)<br><br>

                    • 직접 촬영한 사진으로 판매글을 작성해 주세요.<br>

                    • 물품에 대한 설명을 자세하게 써주세요. 특히, 주요 하자에 대한 내용은 꼭 명시해 주세요. (명시되지 않은 하자는 환불 사유가 돼요.)<br>

                    • 판매하기 전에 깨끗하게 세탁 또는 관리해 주세요. 사용감이 있더라도 청결한 물건은 서로의 기분을 좋게 한답니다.<br>

                    • 물품의 시세를 알아보고 가격을 정해주세요. 판매확률을 높일 수 있어요.<br>

                    • 거래 약속이 정해지면 게시글의 상태를 '예약중'으로 바꿔주세요.<br>

                    • 예약한 분이 있다면 그분에게 판매해 주세요. <br>

                    • 엔빵에서 구매한 상품을 불가피한 사정 때문에 재판매하면 재판매하는 이유와 함께 구매한 가격과 동일하거나 더 싼 가격에 판매해 주세요.</div>
            </li>
            <li class="item">
                <h2 class="accordionTitle">Nbbang에서 믿고 거래하세요. <span class="accIcon"></span></h2>
                <div class="text1">엔빵은 믿을 수 있어요! <br><br>
                    1:1 엔빵채팅으로 대화해요<br>

                    엔빵 내의 채팅을 통해 거래하는게 가장 안전해요. 당근채팅에서는 안전한 거래를 위해 대화 내용에 따라 다양한 안내 및 경고 메시지들을 보내고 있어요. 교묘해지고 있는 사기
                    케이스들을 모니터링하고, 이를 막기 위한 시스템을 고도화하고 있어요. 일부 사용자들을 실시간으로 제재하여 거래가 진행되지 않도록 채팅을 막기도 해요. 1년 365일 24시간
                    안전하게 지켜지는 당근 채팅으로 믿고 거래하세요!
                    <br><br>


                    당신 근처에서 만나요<br><br>

                    중고거래 사기의 대부분은 택배거래에서 발생한다는 사실, 알고 계셨나요? 근처 이웃들과 사고 파는 엔빵에서는 직거래를 권장하고 있어요. 직거래할 때는 누구나 찾기 쉽고 안전한
                    공공장소가 좋아요. 이웃과 따뜻하게 거래하세요.
                    <br>

                    지금 이 순간에도 당신을 위해 노력하고 있어요!<br><br>


                    사기꾼은 실시간으로 제재해요 <br>

                    당근마켓은 다양한 사기 사례들을 분석하고 있어요. 비슷한 수법의 범죄가 재발하지 않도록 모니터링하여 실시간으로 제재하고 있어요. 제재 당한 사용자는 서비스를 사용할 수 없어요.
                    사기를 저지른 사용자가 계정을 바꾸며 재가입해도 서비스를 사용할 수 없어요.
                    <br><br>


                    채팅 메시지로 미리 알려줘요<br>
                    대화 내용에 따라 다양한 안내 및 경고 메시지들을 보내고 있어요. 사기 이력이 있는 사용자와 대화를 하면 사기 이력이 있다고 알려주고, 메신저나 문자 등으로 대화를 유도하면 주의할
                    수 있게 안내 메시지를 보내요. 새롭게 등장한 사기 사례들도 채팅방에서 미리 알려주고 사용자가 피할 수 있게 돕고 있어요. 이 외에도 정말 많은 시스템 메시지가 있어요. 안전한
                    거래를 만들기 위해 오늘도 개선하고 있답니다.
                    <br><br>

                    게시글을 분석해요<br>
                    머신러닝 기술을 이용해 게시글을 분석하고 있어요. 사기꾼의 게시글을 포함 판매금지품목이나 전문판매업자들의 판매글, 광고글, 중복게시글 등은 노출되지 않아요. 신뢰할 수 있는
                    개인들의 마켓을 만들기 위해 노력하고 있어요.
            </li>
            <li class="item">
                <h2 class="accordionTitle">지역광고비는 얼마인가요?<span class="accIcon"></span></h2>
                <div class="text1">지역광고 비용은 선택한 동네의 방문자 수와 기간에 따라 달라져요. <br><br>

                    그래서 방문자가 많을수록 기간이 길수록 광고비용이 조금씩 비싸진답니다. <br>
                    적은 비용으로 높은 광고 효과 제공 <br>
                    엔빵은 지역 소상공인/개인/비영리 업체를 위한 광고 상품을 제공하고 있기 때문에 적은 비용으로 효율적인 광고를 집행 할 수 있게 비용을 책정하고 있습니다. <br>
                    1. 전단지/지역신문/버스광고 등 기존 오프라인 지역광고에 비교해 많게는 20배 이상의 가격대비 광고 노출 효과를 제공합니다. <br>
                    2. 페이스북/네이버 키워드 등의 기존 온라인 광고대비 최대 3배 이상의 가격대비 광고 노출 효과를 제공하며 더 정확한 지역 타게팅이 가능합니다. <br>
                </div>
            </li>
            <li class="item">
                <h2 class="accordionTitle">나눔의 날이 궁금해요. <span class="accIcon"></span></h2>
                <div class="text1">
                    우리는 어떤 마음으로 물건을 나눔 할까요? <br>

                    옷 한 벌, 장난감 하나에도 그 물건에 담긴 따뜻한 추억이 있답니다. <br>

                    아이가 커버려 더는 가지고 놀지 않는 모빌, 그 모빌 하나에는 부모와 아이의 추억이 고스란히 담겨 있지 않을까요? <br>



                    매월 xx일, 1+1, 나누면 2배가 되는 나눔의 날에 참여해 보세요 :) <br>

                    매달 따뜻한 나눔을 실천한 이웃 중 11명을 뽑아 따뜻한 추억을 영원히 간직할 수 있는 선물을 드립니다. <br>
                    나눔의 날에 참여하기 전에 아래 내용을 읽어 보세요 :) <br><br>



                    판매할 가치가 없는 물건은 나눔 하지 않기로 해요. <br>
                    자신의 판매목록을 홍보하는 나눔은 하지 않기로 해요. (예시: 제 상점 구경하고 가세요~) <br>
                    조건부 나눔은 엔빵 운영정책에 어긋나기 때문에 제재를 받을 수 있습니다. <br> (예시: 제 상품 사시면 무료로 드려요~) <br>
                    나눔 받은 것은 절대! 되팔지 말아 주세요. <br>
                    한 사람이 여러 개의 나눔을 받지 않기로 해요. <br>
                    나눔 받은 사람은 꼭 다른 사람에게 나눔을 실천하기로 해요. <br>
                    나눔은 선착순이 아니에요. 따뜻한 나눔을 하는 이웃의 결정을 존중해 주세요. <br>
                    나눔 글을 올릴 때 나눔 조건을 정할 수 있어요! 빛나는 센스를 보여 주세요~ <br>
                    (예시: 예비 엄마에게 드려요~, 우리 아이처럼 잘 물어 뜯는 아이에게 주고 싶어요~) <br> <br>
                    나눔을 받으면 거래후기를 꼭 남겨주는 센스를 보여 주세요.



                </div>
            </li>

        </ul>

        <div class="contaniner2-kdh">

            <div class="main-content-kdh">
                <p class="content1">그 외에 궁금한 점은 ?</p>
                <a href="<%=request.getContextPath() %>/customer/customerQnA"
                    class="content2">1:1 고객센터로 문의해주세요.</a>
            </div>
        </div>
    </div>

</section>
















<script>
    // variables
    var accordionBtn = document.querySelectorAll('.accordionTitle');
    var allTexts = document.querySelectorAll('.text');
    var accIcon = document.querySelectorAll('.accIcon');

    // event listener
    accordionBtn.forEach(function (el) {
        el.addEventListener('click', toggleAccordion)
    });

    // function
    function toggleAccordion(el) {
        var targetText = el.currentTarget.nextElementSibling.classList;
        var targetAccIcon = el.currentTarget.children[0];
        var target = el.currentTarget;

        if (targetText.contains('show')) {
            targetText.remove('show');
            targetAccIcon.classList.remove('anime');
            target.classList.remove('accordionTitleActive');
        }
        else {
            accordionBtn.forEach(function (el) {
                el.classList.remove('accordionTitleActive');

                allTexts.forEach(function (el) {
                    el.classList.remove('show');
                })

                accIcon.forEach(function (el) {
                    el.classList.remove('anime');
                })

            })

            targetText.add('show');
            target.classList.add('accordionTitleActive');
            targetAccIcon.classList.add('anime');
        }
    }
</script>

<%@ include file="/views/common/footer.jsp"%>