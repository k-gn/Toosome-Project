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
          <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/basket/basket.png" alt="#">
          <span>장바구니</span>
        </div>
        <div>
          <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/basket/payment.png" alt="#">
          <span>주문/결제</span>
        </div>
        <div>
          <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/basket/complete.png" alt="#">
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
                <td style="width: 100px;"><img style="display: block; width: 100px; height: 100px;" src="${basket.imagePath}" alt=""></td>
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
                    <input type="text" name="orderName" id="orderName" value="${memberList.memberName}" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    우편번호
                  </td>
                  <td>
                    <input type="text" name="post" id="postcode" value="${memberList.memberPostcode}" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    주소
                  </td>
                  <td>
                    <input type="text" name="address" id="addr1" value="${map.address1}" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    상세주소
                  </td>
                  <td>
                    <input type="text" name="address" id="addr2" value="${map.address2 == null ? '' : map.address2}" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    전화번호
                  </td>
                  <td>
                  	<input type="tel" name="phone1" id="tel9" placeholder="123" value="${map.tel1}" disabled>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone2" id="tel3" placeholder="1234" value="${map.tel2}" disabled>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone3" id="tel4" placeholder="1234" value="${map.tel3}" disabled>
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
                    <input type="text" name="orderName" id="orderName2" value="${orderList.ordersReceiver }" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    우편번호
                  </td>
                  <td>
                    <input type="text" name="post" id="postcode2" value="${orderList.ordersPostcode}" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    주소
                  </td>
                  <td>
                    <input type="text" name="address" id="addr3" value="${map1.addresstwo1}" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    상세주소
                  </td>
                  <td>
                    <input type="text" name="address" id="addr4" value="${map1.addresstwo2 == null ? '' : map1.addresstwo2}" disabled>
                  </td>
                </tr>
                <tr>
                  <td>
                    전화번호
                  </td>
                  <td>
                  	<input type="tel" name="phone1" id="tel8" placeholder="123" value="${map1.tel1}" disabled>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone2" id="tel3" placeholder="1234" value="${map1.tel2}" disabled>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone3" id="tel4" placeholder="1234" value="${map1.tel3}" disabled>
                  </td>
                </tr>
                <td>
                  배송 유의사항
                </td>
                <td>
                  <input type="text" name="postText" value="${orderList.ordersContent }" disabled>
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
                <span class="product-pay">${basketUtil.total}</span> 원
              </td>
            </tr>
            <tr>
              <td>
                적립 포인트
              </td>
              <td>
                <span class="total-point">${basketUtil.point}</span> p
              </td>
            </tr>
            <tr>
              <td>
                할인 금액
              </td>
              <td>
                <span class="total-discount">${basketUtil.discount}</span> 원
              </td>
            </tr>
            <tr>
              <td>사용한 포인트</td>
              <td><span class="txt_blue">${usedPoint }</span> p</td>
            </tr>
            <tr>
              <td>
                배송비
              </td>
              <td>
                <span class="product-delivery">${basketUtil.deliveryPay}</span> 원
              </td>
            </tr>
            <tr>
              <td>결제금액</td>
              <td><span class="bold txt_blue">${basketEndPrice }</span>원</td>
            </tr>
                
          </tbody>
        </table>
        <div class="pay-do">
          <p class="txt-red"> 최종 결제된 금액 : <span class="bold txt_red" id="result_pnt">${basketEndPrice }</span> 원</p>
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