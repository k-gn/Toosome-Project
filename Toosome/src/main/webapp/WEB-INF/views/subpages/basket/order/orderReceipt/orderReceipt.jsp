<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="/resources/css/subpages/basket/order/orderReceipt/orderReceipt.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/share/nav_footer_bt.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="/resources/js/subpages/basket/order/orderReceipt/orderReceipt.js" defer></script>
  <title>A TOOSOME PLACE</title>
</head>
<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
    
    <section>
      <p class="title">주문 내역 / 주문 취소</p>
      
      <div class="smart-post">
        <!-- 택배 공간 -->
      </div>

      <div class="table-cover">
        <table class="table">
          <thead>
            <tr>
              <th><input type="checkbox" class="c-box" name="checkAll" id="checkAll" onclick="selectAll(this)"></th>
              <th scope="col" colspan="2">주문 품목</th>
              <th scope="col">수량</th>
              <th scope="col">송장</th>
              <th scope="col">배송상태</th>
              <th scope="col">결제금액</th>
              <th scope="col" style="text-align: center;">비고</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><input type="checkbox" class="c-box" name="check" onclick="checkSelectAll()"></td>
              <td style="width: 150px;"><img style="display: block; width: 150px; height: 150px;" src="/resources/img/subpages/basket/p05.png" alt=""></td>
              <td><span class="name">이것 저것</span></td>
              <td>1</td>
              <td>
                <span class="post-number">11111111</span>
              </td>
              <td>
                <span class="post-state">가능중</span>
              </td>
              <td>
                <span class="total">450</span> 원
              </td>
              <td>
                <ul>
                  <li><a href="#">후기쓰기</a></li>
                  <li><a href="#">주문취소</a></li>
                </ul>
              </td>
            </tr>
            <tr>
              <td><input type="checkbox" class="c-box" name="check" onclick="checkSelectAll()"></td>
              <td style="width: 150px;"><img style="display: block; width: 150px; height: 150px;" src="/resources/img/subpages/basket/p05.png" alt=""></td>
              <td><span class="name">이것 저것</span></td>
              <td>1</td>
              <td>
                <span class="post-number">11111111</span>
              </td>
              <td>
                <span class="post-state">갈준비</span>
              </td>
              <td>
                <span class="total">450</span> 원
              </td>
              <td>
                <ul>
                  <li><a href="#">후기쓰기</a></li>
                  <li><a href="#">주문취소</a></li>
                </ul>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="text">
                        ※ <span class="red-text">배송중</span>이면 주문취소가 안됩니다!!!
        <p class="sub-text">
          <span class="bold-text">"결제완료" &amp; "상품준비중"</span>의 상태의 경우,  로그인 후, 마이페이지 &gt; 주문내역 &gt; 주문취소 선택 시 가능 합니다.<br/>
          <br/>
          <span class="bold-text">"배송준비중"</span>인 상태에서는 제품 포장되어 출고 과정에 있기에 취소처리가 어려움을 알려드립니다. 취소를 원한다면 고객센터 전화번호로 연락 주시기 바랍니다.<br/>
        </p>
      </div>
      
      <ul class="btn-group">
        <li><a class="payback" href="#">주문취소</a></li>
        <li><a class="main" href="#">MAIN</a></li>
      </ul>
      
    </section>
    
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
  </div>
</body>
</html>