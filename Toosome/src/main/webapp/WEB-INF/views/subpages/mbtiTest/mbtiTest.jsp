<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="나에게 어울리는 커피를 MBTI를 기반으로 추천해주는 테스트입니다.">
  <meta property="og:type" content="website"> 
  <meta property="og:title" content="나에게 어울리는 커피 테스트">
  <meta property="og:description" content="나에게 어울리는 커피를 MBTI를 기반으로 추천해주는 테스트입니다.">
  <meta property="og:url" content="https://seredong.netlify.app">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <link rel="stylesheet" href="/resources/css/subpages/mbtiTest/mbtiTest.css">
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
  <script src="/resources/js/subpages/mbtiTest/mbtiTest.js" defer></script>
  <title>A TOOSOME PLACE</title>
</head>
<body class="container">
  <div id="bg-img">
  	<img alt="" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/main/map.png">
  	<div class="black-cover"></div>
  </div>
  <article class="start">
    <h1 class="mt-5 text-center title">나에게 어울리는 커피는?</h1>
    <button type="button" class="btn btn-info mt-5" onclick="start()">테스트 시작하기</button>
  </article>
  <article class="question">
    <div class="progress mt-5">
      <div class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: calc(100/12*1%)"></div>
    </div>
    <h2 id="title" class="text-center mt-5">문제</h2>
    <input id="type" type="hidden" value="EI">
    <button id="A" type="button" class="btn btn-dark mt-5">dark</button>
    <button id="B" type="button" class="btn btn-dark mt-5">Dark</button>
  </article>
  <article class="result">
    <img id="img" class="rounded-circle mt-5" src="" alt="coffee">
    <h2 id="coffee" class="text-center mt-5">커피이름</h2>
    <h3 id="explain" class="text-center mt-5">설명</h3>
    <!-- Go to www.addthis.com/dashboard to customize your tools --> 
    <!-- sns 공유 -->
    <div class="share addthis_inline_share_toolbox"></div>
  </article>
  <article class="kakao_ad mt-5">
    <!-- 광고 -->
    <ins class="kakao_ad_area" style="display:none;" 
    data-ad-unit    = "DAN-ARgXcQcjIwe2ldtG" 
    data-ad-width   = "320" 
    data-ad-height  = "100"></ins> 
  </article>
  
  <script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
  <input type="hidden" id="EI" value="0">
  <input type="hidden" id="SN" value="0">
  <input type="hidden" id="TF" value="0">
  <input type="hidden" id="JP" value="0">

  <!-- Go to www.addthis.com/dashboard to customize your tools --> 
  <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-60687a2158f87593"></script>
</body>
</html>