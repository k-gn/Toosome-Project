<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
  	<jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <!-- Google web font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700;800;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="/resources/css/main/main.css" />
    <link rel="stylesheet" href="/resources/css/main/slick.css" />
    <link rel="stylesheet" href="/resources/css/main/slick-theme.css" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />  
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <script src="/resources/js/main/jquery.mousewheel.min.js"></script>
    <script src="/resources/js/main/slick.js"></script>
    <script src="/resources/js/main/script.js"></script>
    <title>A TOOSOME PLACE</title>
    <!-- 상태 알림 -->
    <script>
		const msg = "${msg}"
		if(msg === "Denied") {
			alert("잘못된 접근입니다.");
		}else if(msg === "duplogin") {
			alert("다른 기기에서 접속중인 계정입니다.");
		}
	</script>   
  </head>
  <body>
    <div id="container">
      <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
      <div id="img-wrap" class="img-slide">       
        <div class="slide">
        <!-- banner 이미지  -->
          <ul class="slide-imgs cf slider autoplay">
          	<c:forEach var="banner" items="${bannerList}">
	            <li class="img">
	            	<img src="${path}${banner.bannerRoute}${banner.bannerName}" alt=""/>
	            	<div class="img-title">
	        			<div class="img-content">${banner.bannerTitle}</div>
	        		</div>
	        	</li>
          	</c:forEach>
          </ul>
        </div>
      </div>
      <!-- 신메뉴 이미지 -->
      <div id="new-menu" class="img-slide">
        <div class="new-cover">
          <div class="new-wrap">
	          <span class="new">NEW MENU</span>
	          <a class="new-more" href="/menu-new">MORE</a>
          </div>
          <div class="img_box">
            <ul class="new-menu-box cf slider autoplay2">
              <c:forEach var="news" items="${newList}">
	              <li>
	                <a href="/menuDetail?menuId=${news.menuId}"><img src="${path}/${news.menuImageVO.menuImageRoute}/${news.menuImageVO.menuImageName}.${news.menuImageVO.menuImageExtention}" alt="" /></a>
	              </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div>
      <!-- section -->
      <div class="section">
        <div class="quick-menu">
          <div class="quick-menu-coffee">
            <div class="coffee">
              <a href="/menu-new"></a>
              <span class="quick-title">Coffee &amp; Cake</span>
            </div>
            <div class="coffee-ment">
              <h3>전문가의 섬세함으로<br />완성한 최상의 커피</h3>
              <p>
                투썸플레이스의 큐그레이더(Q-grader)는 <br />좋은 원산지의 신선한
                원두만을 선별해<br />
                개성 있는 풍미의 블렌드를 제공합니다. <br />원두 타입별 최적의
                밸런스를 맞춘 로스팅 <br />
                포인트에 최상의 에스프레소 추출 기술을 <br> 더해 오늘도 가장 맛있는 커피를 완성합니다.
              </p>
            </div>
          </div>
          <div class="quick-menu-beverage">
            <div class="beverage">
            <a href="/product-new"></a>
              <span class="quick-title">Tumbler &amp; Goods</span>
            </div>
            <div class="beverage-ment">
              <h3>일상에 가치를 더하는<br />라이프스타일 MD 상품</h3>
              <p>
                감각적인 디자인과 실용성을 동시에<br />
                갖춘 투썸플레이스만의 MD 상품은<br />
                당신의 스타일을 돋보이게 합니다.
              </p>
            </div>
          </div>
        </div>
      </div>
      <!-- 쳇봇 버튼 -->
      <!-- 채널톡 API -->
      <script>
		  (function() {
		    var w = window;
		    if (w.ChannelIO) {
		      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
		    }
		    var ch = function() {
		      ch.c(arguments);
		    };
		    ch.q = [];
		    ch.c = function(args) {
		      ch.q.push(args);
		    };
		    w.ChannelIO = ch;
		    function l() {
		      if (w.ChannelIOInitialized) {
		        return;
		      }
		      w.ChannelIOInitialized = true;
		      var s = document.createElement('script');
		      s.type = 'text/javascript';
		      s.async = true;
		      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
		      s.charset = 'UTF-8';
		      var x = document.getElementsByTagName('script')[0];
		      x.parentNode.insertBefore(s, x);
		    }
		    if (document.readyState === 'complete') {
		      l();
		    } else if (window.attachEvent) {
		      window.attachEvent('onload', l);
		    } else {
		      window.addEventListener('DOMContentLoaded', l, false);
		      window.addEventListener('load', l, false);
		    }
		  })();
		  ChannelIO('boot', {
		    "pluginKey": "da283034-998c-46aa-b9d4-f284589b8309"
		  });
		</script>
		<!-- End Channel Plugin -->
		
      <!-- 간편 지도 검색 -->
      <div class="map">
        <div class="form-cover">
          <form action="/map?" method="GET">
            <h1>STORE</h1>

            <fieldset>
              <legend>
                <h3>매장 찾기</h3>
              </legend>
              <input
                type="search"
                name="address"
                id="search"
                placeholder="매장명 또는 주소를 입력해 주세요."
              />
              <input id="search-button" type="submit" value="" />
            </fieldset>
            
          </form>
        </div>
      </div>
      <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
  </body>
  <!-- 휴면 계정 / 정지계정 알람 -->
  <script type="text/javascript">
  	const state = "${state}";
  	console.log(state);
  	if(state == 3) {
  		alert("사이트 이용 정지된 계정입니다. 자세한 내용은 문의바랍니다.");
  		document.getElementById('dologout').submit();
  	}else if(state == 2) {
  		alert("휴면 계정입니다. 문의 후 해제 가능합니다.");
  		document.getElementById('dologout').submit();
  	}
  </script>
</html>
