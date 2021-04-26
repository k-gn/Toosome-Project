<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/resources/css/share/nav_footer_bt.css">
  <link rel="stylesheet" href="/resources/css/subpages/basket/order/orderComplete/orderComplete.css">
  <title>A TOOSOME PLACE</title>
</head>
<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
    
    
    <section>
      <p>주문이 완료되었습니다.</p>
      <div class="process-container">
        <div>
          <img src="/resources/img/subpages/basket/basket.png" alt="#">
          <span>장바구니</span>
        </div>
        <div>
          <img src="/resources/img/subpages/basket/payment.png" alt="#">
          <span>주문/결제</span>
        </div>
        <div>
          <img src="/resources/img/subpages/basket/complete.png" alt="#">
          <span>주문완료</span>
        </div>
      </div>
      <div class="table-box basket-table">
        <table class="table text-center">
          <thead>
            <tr class="table-secondary">
              <th colspan="2">주문 품목</th>
              <th>수량</th>
              <th>상품명</th>
              <th>결제금액</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="basket" items="${baskets}" varStatus="i">
              <tr>
                <td style="width: 150px;"><img style="display: block; width: 150px; height: 150px;" src="${basket.imagePath}" alt=""></td>
                <td><span class="name"></span></td>
                <td>
                  <span class="number">${basket.basketAmount}</span>
                </td>
                <td>
                  <span class="pname">${basket.basketName}</span>
                </td>
                <td>
                  <span class="price">${basket.basketPrice}원</span>
                </td>
                
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      

      <div id="order1" class="order">
        <p class="order-title"><span class="big">01.</span><strong>주문하시는 분</strong></p>
        <form id="or1" action="#" method="post" name="form1">
          <div class="or1-wrap">
            <table class="table table-borderless">
              <tbody>
                <tr>
                  <td>
                    주문자
                  </td>
                  <td>
                    <input type="text" name="orderName" id="orderName" value="홍길동" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    우편번호
                  </td>
                  <td>
                    <input type="text" name="post" id="postcode" value="11111" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    주소
                  </td>
                  <td>
                    <input type="text" name="address" id="addr1" value="종로3가역" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    상세주소
                  </td>
                  <td>
                    <input type="text" name="address" id="addr2" value="9번출구" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    전화번호
                  </td>
                  <td>
                    <input type="tel" name="phone1" id="tel2" value="010" disabled>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone2" id="tel3" value="1234" disabled>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone3" id="tel4" value="5678" disabled>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          
        </form>
      </div>

      <div id="order2" class="order">
        <p class="order-title"><span class="big">02.</span><strong>받으시는 분</strong></p>
        <form id="or2" action="#" method="post" name="form2">
          <div class="or2-wrap">
            <table class="table table-borderless">
              <tbody>
                <tr>
                  <td>
                    받으실 분
                  </td>
                  <td>
                    <input type="text" name="orderName" id="orderName2" value="리송죄" disabled>
                    
                  </td>
                </tr>
                <tr>
                  <td>
                    우편번호
                  </td>
                  <td>
                    <input type="text" name="post" id="postcode2" value="22222" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    주소
                  </td>
                  <td>
                    <input type="text" name="address" id="addr3" value="종각역" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    상세주소
                  </td>
                  <td>
                    <input type="text" name="address" id="addr4" value="4번출구" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    전화번호
                  </td>
                  <td>
                    <input type="tel" name="phone1" id="tel7" value="010" disabled>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone2" id="tel5" value="9123" disabled>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone3" id="tel6" value="4567" disabled>
                  </td>
                </tr>
                <td>
                  배송 유의사항
                </td>
                <td>
                  <input type="text" name="postText" value="자고있으면 깨워주세요." disabled>
                </td>
              </tbody>
            </table>
          </div>
          
        </form>
      </div>
      
      <div class="total-test">
        <p class="order-title"><span class="big">03.</span><strong>주문내용</strong></p>

        <table class="table table-borderless">
          <tbody>
            <tr>
              <td>
                총 상품금액
              </td>
              <td>
                <span class="product-pay">18000</span> 원
              </td>
            </tr>
            <tr>
              <td>
                적립 포인트
              </td>
              <td>
                <span class="total-point">18</span> p
              </td>
            </tr>
            <tr>
              <td>
                할인 금액
              </td>
              <td>
                <span class="total-discount">2600</span> 원
              </td>
            </tr>
            <tr>
              <td>사용한 포인트</td>
              <td><span class="txt_blue">5400</span> p</td>
            </tr>
            <tr>
              <td>
                배송비
              </td>
              <td>
                <span class="product-delivery">20000</span> 원
              </td>
            </tr>
            <tr>
              <td>결제금액</td>
              <td><span class="bold txt_blue">30000</span>원</td>
            </tr>
                
          </tbody>
        </table>
        <div class="pay-do">
          <p class="txt-red"> 최종 결제된 금액 : <span class="bold txt_red" id="result_pnt">30000</span> 원</p>
        </div>
        
        <div class="out-btn">
          <a href="/">MAIN</a>
          <a href="/menu-new">구매계속하기</a>
        </div>
      </div>
      
    </section>
    
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
 </div>
</body>
</html>