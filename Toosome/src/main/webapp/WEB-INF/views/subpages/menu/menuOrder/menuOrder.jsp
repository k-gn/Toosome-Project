<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/resources/css/share/nav_footer_bt.css">
  <link rel="stylesheet" href="/resources/css/subpages/menu/menuOrder/menuOrder.css">
  <script src="/resources/js/subpages/menu/menuOrder/menuOrder.js" defer></script>
  <title>A TOOSOME PLACE</title>
</head>
<body>
<div id="container">
  <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>
  <!-- 주문 페이지 -->
  <section>
      <p>주문 / 결제</p>
      <!-- 주문 상단 아이콘 -->
      <div class="process-container">
        <div>
          <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/basket/payment.png" alt="#">
          <span>주문/결제</span>
        </div>
        <div>
          <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/basket/complete.png" alt="#">
          <span>결제완료</span>
        </div>
      </div>
      <!-- 메뉴 이미지와 이름 가격 -->
      <div class="menu-content">
        <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/product/b05.png" alt="">
        <p class="menu-text">${menuOrderList.menuMainTitle}</p>
        <div class="pay-box">
          <span class="com">${menuOrderList.menuPrice}</span>
          <span>&nbsp;원</span>
        </div>
      </div>
	  <!-- 주문 테이블(주문하시는 분 내용) -->
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
                    <input type="text" name="orderName" id="orderName" placeholder="ex)홍길동" value="${memberOrderList.memberName} " required>
                  </td>
                </tr>
                <tr>
                  <td>
                    전화번호
                  </td>
                  <td>
                    <input type="text" name="orderName" id="orderName" placeholder="01012341234" value="${memberOrderList.memberPhone}" required>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </form>
      </div>
      
      <!-- 결제금액 확인 테이블 -->
      <div class="total-test">
        <p class="order-title"><span class="big">02.</span><strong>결제금액 확인</strong></p>
        <table class="table table-borderless">
          <tbody>
            <tr>
              <td>
                상품금액
              </td>
              <td>
                <div class="pay-box">
                  <span class="com" style="float: left;">${menuOrderList.menuPrice}</span>
                  <span style="float: left;">&nbsp;원</span>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                적립 포인트
              </td>
              <td>
                <span class="re-point">${point}</span> P
              </td>
            </tr>
            <tr>
              <td>
                할인 금액
              </td>
              <td>
                <span class="discount-pay com">${msi}</span> 원
              </td>
            </tr>
            <tr>
              <td>결제금액</td>
              <td><span class="bold txt_blue com">${menusal}</span>원</td>
            </tr>
            <!-- 포인트 사용부분 -->
            <tr>
              <td> 포 인 트 </td>
              <td>
                사용가능 포인트 : <span name="left_pnt">${memberPoint.membershipPoint}</span>p <span><br/>
                <input type="checkbox" id="chk_use" onclick="chkPoint(${menusal},${memberPoint.membershipPoint},100,10)">&nbsp;포인트 전체 사용</span>
                <span style="color: #ff0000; font-size: 16px;">(포인트는 최소 3,000p부터 100p단위로 사용 가능합니다.)</span>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <span> <input type="text" name="use_pnt" id="use_pnt" min="100" onchange="changePoint(${menusal},${memberPoint.membershipPoint},100,10)"></span> p 
                <span> ( 남은포인트 : </span><span name="left_pnt" id="left_pnt">${memberPoint.membershipPoint}</span>p )
              </td>
             </tr>
          </tbody>
        </table>
        <!-- 최종결제금액 -->
        <div class="pay-do">
          <p class="txt-red"> 최종 결제 금액 : <span class="bold txt_red com" id="result_pnt">${menusal}</span> 원</p>
          <a id="abcd" href="/import1?menuId=${menuOrderList.menuId}&menuEndPrice=${menusal}&menusal=${menusal}">결제하기</a>
        </div>

      </div>

    </section>
    <jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
 </div>
  
<script>
  // 1000단위 마다 , 찍기
  const coms = document.querySelectorAll('.com');
  coms.forEach((com => {
      let num = +(com.innerHTML);
      com.innerHTML = num.toLocaleString('en');
  }))
  // 포인트 사용

function chkPoint(amt, pnt, min, unit) {
  //input값을 전체 마일리지로 설정 > minusPoint
  //amt : 최초 결제 금액 / pnt : 사용가능,남은 포인트 / min : 사용 가능 최소 포인트 / unit : 사용단위
  var v_point = 0; //사용할 포인트 (input 입력값)

  if (document.getElementById("chk_use").checked) {
    if (pnt < min) {
      //최소 사용 단위보다 작을 때
      v_point = 0;
    } else {
      v_point = pnt - (pnt % unit); //사용할 포인트 = 전체 마일리지 중 최소단위 이하 마일리지를 뺀 포인트
    }

    if (pnt > amt) {
        //결제금액보다 포인트가 더 클 때
        v_point = amt - ((amt % unit)+100); //사용할 포인트는 결제금액과 동일하게 설정
      }
    
  	console.log(v_point);
  	
  	if (v_point < min) {
      	//최소 사용 단위보다 작을 때
      	v_point = 0;
      	document.getElementById("use_pnt").value = v_point; //input 값 재설정
    	} else {
      	v_point = v_point - (v_point % unit); //사용할 포인트 = 사용할 마일리지 중 최소단위 이하 마일리지를 뺀 포인트
    	}
  }
  document.getElementById("use_pnt").value = v_point; //input 값 설정

  changePoint(amt, pnt, min, unit);
  document.getElementById("result_pnt").innerHTML = amt - v_point;
}

function changePoint(amt, pnt, min, unit) {
  //input값을 불러옴 > left_pnt 변경 > 최종결제 변경
  //amt : 최초 결제 금액 / pnt : 사용가능,남은 포인트 / min : 사용 가능 최소 포인트 / unit : 사용단위
  var v_point = parseInt(document.getElementById("use_pnt").value); //사용할 포인트 (input 입력값)
  
  if (v_point > pnt) {
    //입력값이 사용가능 포인트보다 클때
    v_point = pnt - 100;
    document.getElementById("use_pnt").value = v_point; //input 값 재설정
  }

  if (v_point > amt - 100) {
    //결제금액보다 포인트가 더 클 때
    v_point = amt; //사용할 포인트는 결제금액과 동일하게 설정
    document.getElementById("use_pnt").value = v_point; //input 값 재설정
  }

  if (v_point < min) {
    //최소 사용 단위보다 작을 때
    v_point = 0;
    document.getElementById("use_pnt").value = v_point; //input 값 재설정
  } else {
    v_point = v_point - (v_point % unit); //사용할 포인트 = 사용할 마일리지 중 최소단위 이하 마일리지를 뺀 포인트
    document.getElementById("use_pnt").value = v_point;
  }

  var v_left = document.getElementsByName("left_pnt"); //사용가능 마일리지, 남은 포인트 값 설정
  for (var i = 0; i < v_left.length; i++) {
    v_left[i].innerHTML = pnt - v_point; //= 전체 포인트 중에 사용할 포인트빼고 남은 포인트
  }
  document.getElementById("result_pnt").innerHTML = amt - v_point; //최종 결제금액 = 결제금액 - 사용할 포인트
  
  var dlatl = amt - v_point;
  var menusal = ${menusal};
  document.getElementById("abcd").href = "/import1?menuId=${menuOrderList.menuId}&menuEndPrice=" + dlatl + "&menusal=" + menusal;
  
}

</script>
</body>
</html>