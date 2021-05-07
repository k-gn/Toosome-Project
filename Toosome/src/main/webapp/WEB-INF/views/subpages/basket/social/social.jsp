<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>A TOOSOME PLACE</title>
  <style>
    *{margin: 0; padding: 0;}
    ul,li {list-style: none;}
    a {text-decoration: none; color: #000;}

    .social-login {
      width: 500px;
      height: 300px;
      margin: 50px auto;
      /* border: 1px solid #000; */
    }
    .social-login p {
      text-align: center;
      font-size: 1.05rem;
    }
    .social-login .stop {
      color: #ff0000;
      font-size: 1.75rem;
      font-weight: bold;
    }
    .social-login .title {
      margin-top: 10px;
    }
    .social-login .red {
      color: orangered;
      font-weight: bold;
    }
    .social-login .sub-mt {
      font-weight: bold;
    }
    .social-login .btn {
      margin-top: 100px;
      width: 100%;
      height: 70px;
      display: flex;
      justify-content: space-between;
    }
    .social-login .btn li {
      width: 30%;
      height: 100%;
    }
    .social-login .btn li a {
      display: flex;
      width: 100%;
      height: 90%;
      justify-content: center;
      align-items: center;
      background-color: #a32625;
      color: #fff;
      font-family: gsdr;
      font-size: 1.25rem;
      border-radius: 10px;
    }
  </style>
</head>
<body>
  <div class="social-login">
    <p class="stop">주문 멈춰!!!!</p>
    <p class="title"><span class="red">소셜 로그인</span>을 하신 고객님께서는</p>
    <p class="sub"><span class="red">추가 정보를 반드시!</span> 입력하셔야 합니다.</p>
    <p class="sub-mt">정보를 입력하시지 않으면 주문을 하실 수 없습니다.</p>
    <ul class="btn">
      <li><a href="/mypage/update/${memberList.memberId}">개인정보입력</a></li>
      <li><a href="/">메인으로</a></li>
    </ul>
  </div>
</body>
</html>