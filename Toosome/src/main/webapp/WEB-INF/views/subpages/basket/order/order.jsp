<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
  <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/resources/css/share/nav_footer_bt.css">
  <link rel="stylesheet" href="/resources/css/subpages/basket/order/order.css">
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="/resources/js/subpages/basket/basket.js" defer></script>
  <script src="/resources/js/subpages/basket/order/order.js" defer></script>
<title>A TOOSOME PLACE</title>
</head>
<body>
<div id="container">
  <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
  <section>
      <p>주문 / 결제</p>
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
              <th></th>
              <th colspan="2">주문 품목</th>
              <th>수량</th>
              <th>상품명</th>
              <th>결제금액</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="basket" items="${baskets}" varStatus="i">
              <tr>
                <td></td>
                <td style="width: 100px;"><img style="display: block; width: 100px; height: 100px;" src="${basket.imagePath}" alt=""></td>
                <td></td>
                <td style="width: 50px;">
                  <input style="width: 50px;" type="text" name="quantity${i.count}" value="${basket.basketAmount}" id="quantity" oninput="modBasket(${i.count}, ${basket.basketId})" disabled/>
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
                    <input type="text" name="orderName" id="orderName" placeholder="ex)홍길동" value="${memberList.memberName}" required>
                  </td>
                </tr>
                <tr>
                  <td>
                    우편번호
                  </td>
                  <td>
                    <input type="text" name="post" id="postcode" placeholder="(5자리)" value="${memberList.memberPostcode}" required>
                    <input id="post-search" type="button" onclick="pCode();" value="검색">
                  </td>
                </tr>
                <tr>
                  <td>
                    주소
                  </td>
                  <td>
                    <input type="text" name="address" id="addr1" placeholder="주소를 입력해주세요." value="${map.address1}" required>
                  </td>
                </tr>
                <tr>
                  <td>
                    상세주소
                  </td>
                  <td>
                    <input type="text" name="address" id="addr2" placeholder="상세 주소를 입력해주세요." value="${map.address2 == null ? '' : map.address2}" required>
                  </td>
                </tr>
                <tr>
                  <td>
                    전화번호
                  </td>
                  <td>
                    <select name="phone1" id="tel">
                      <option value="010" ${map.tel1 == '010' ? 'selected' : ''}>010</option>
                	  <option value="011" ${map.tel1 == '011' ? 'selected' : ''}>011</option>
                	  <option value="016" ${map.tel1 == '016' ? 'selected' : ''}>016</option>
                	  <option value="017" ${map.tel1 == '017' ? 'selected' : ''}>017</option>
                	  <option value="018" ${map.tel1 == '018' ? 'selected' : ''}>018</option>
                	  <option value="019" ${map.tel1 == '019' ? 'selected' : ''}>019</option>
                    </select>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone2" id="tel3" placeholder="1234" value="${map.tel2}" required>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone3" id="tel4" placeholder="1234" value="${map.tel3}" required>
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
                    <input type="text" name="orderName" id="orderName2" placeholder="ex)홍길동" value="" required>
                    &nbsp;<div class="order-enter" style="display: inline;"><input type="checkbox" name="same" id="same">&nbsp;주문하시는 분과 동일</div>
                  </td>
                </tr>
                <tr>
                  <td>
                    우편번호
                  </td>
                  <td>
                    <input type="text" name="post" id="postcode2" placeholder="(5자리)" required>
                    <input id="post-search" type="button" onclick="pCode2();" value="검색">
                  </td>
                </tr>
                <tr>
                  <td>
                    주소
                  </td>
                  <td>
                    <input type="text" name="address" id="addr3" placeholder="주소를 입력해주세요." required>
                  </td>
                </tr>
                <tr>
                  <td>
                    상세주소
                  </td>
                  <td>
                    <input type="text" name="address" id="addr4" placeholder="상세 주소를 입력해주세요." required>
                  </td>
                </tr>
                <tr>
                  <td>
                    전화번호
                  </td>
                  <td>
                    <select name="phone1" id="tel2">
                      <option value="010" selected>010</option>
                      <option value="011">011</option>
                      <option value="016">016</option>
                      <option value="017">017</option>
                      <option value="018">018</option>
                      <option value="019">019</option>
                    </select>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone2" id="tel5" placeholder="1234" required>
                    &nbsp;-&nbsp;
                    <input type="tel" name="phone3" id="tel6" placeholder="1234" required>
                  </td>
                </tr>
                <td>
                  배송 유의사항
                </td>
                <td>
                  <input type="text" name="postText" id="postText" placeholder="예) 부재시 경비실에 맡겨주세요.">
                </td>
              </tbody>
            </table>
          </div>
          
        </form>
      </div>
      
      <div class="total-test">
        <p class="order-title"><span class="big">03.</span><strong>결제금액 확인</strong></p>

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
              할인금액
              </td>
              <td>
                <span class="product-delivery">${basketUtil.discount}</span> 원
              </td>
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
              <td>
                적립금액
              </td>
              <td>
                <span class="product-delivery">${basketUtil.point}</span> 원
              </td>
            </tr>
            <tr>
              <td>결제금액</td>
              <td><span class="bold txt_blue" id="realPay">${basketUtil.realPayment}</span>원</td>
            </tr>
            <tr>
              <td> 포 인 트 </td>
              <td>
                사용가능 포인트 : <span name="left_pnt">${memberPoint.membershipPoint}</span>p <span><br/>
                <input type="checkbox" id="chk_use" onclick="chkPoint(${basketUtil.realPayment},${memberPoint.membershipPoint},100,10)">&nbsp;포인트 전체 사용</span>
                <span style="color: #ff0000; font-size: 16px;">(포인트는 최소 3000p부터 10p단위로 사용 가능합니다. 최소 결제금액은 100원입니다.)</span>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <span> <input type="number" name="use_pnt" id="use_pnt" min="3000" onchange="changePoint(${basketUtil.realPayment},${memberPoint.membershipPoint},100,10)" value=""></span> p 
                <div class="enter" style="display: inline;"><span class="span-enter"> ( 남은포인트 : </span><span name="left_pnt" id="left_pnt"  class="span-enter">${memberPoint.membershipPoint}</span>p )</div>
              </td>
            </tr>
          </tbody>
        </table>
        <div class="pay-do">
          <p class="txt-red"> 최종 결제 금액 : <span class="bold txt_red" id="result_pnt">${basketUtil.realPayment}</span> 원</p>
          <!-- <input type="submit" value="결제하기">-->
           <a class="order-submit" id="abcd">결제하기</a>
        </div>
        
      </div>

    </section>
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
 </div>
   
</body>
</html>