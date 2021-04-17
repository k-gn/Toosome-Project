<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="sidebar" data-color="danger" data-background-color="white">
  <div class="logo">
    <a href="/admin" class="simple-text logo-mini">
      ToosomePlace
    </a>
    <a href="/admin" class="simple-text logo-normal">
      Admin
    </a>
  </div>
  <div class="sidebar-wrapper">
    <ul class="nav">
      <!-- nav item start -->
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="material-icons">content_paste</i>
          <p>회원 관리</p>
        </a>
        <div class="sub-nav">
          <ul>
       		<li>
       			<a href="/admin/member-management">회원 리스트</a>
       		</li>
       		<li>
       			<a href="/admin/sleepmember-management">휴면회원 리스트</a>
       		</li>
       		<li>
       			<a href="/admin/outmember-management">탈퇴회원 리스트</a>
       		</li>
       		<li>
       			<a href="/admin/blackmember-management">블랙회원 리스트</a>
       		</li>
          </ul>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="material-icons">card_membership</i>
          <p>멤버십 관리</p>
        </a>
        <div class="sub-nav">
          <ul>
       		<li>
       			<a href="/admin/membership-list">멤버십 리스트</a>
       		</li>
       		<li>
       			<a href="/admin/membership-management">멤버십 관리</a>
       		</li>
          </ul>
        </div>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="#">
          <i class="material-icons">contact_page</i>
          <p>운영자 관리</p>
        </a>
        <div class="sub-nav">
          <ul>
       		<li>
       			<a href="/admin/admin-list">운영자 리스트</a>
       		</li>
       		<li>
       			<a href="/admin/admin-connectionrecord">운영자 접속기록 조회</a>
       		</li>
          </ul>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="material-icons">local_cafe</i>
          <p>메뉴 관리</p>
        </a>
        <div class="sub-nav">
          <ul>
       		<li>
       			<a href="/admin/menu-list">메뉴 리스트</a>
       		</li>
       		<li>
       			<a href="/admin/enroll-menu">메뉴 등록</a>
       		</li>
          </ul>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="material-icons">shopping_cart</i>
          <p>상품 관리</p>
        </a>
        <div class="sub-nav">
          <ul>
       		<li>상품 리스트</li>
       		<li>상품 등록</li>
          </ul>
        </div>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="#">
          <i class="material-icons">location_ons</i>
          <p>주문/배송 관리</p>
        </a>
        <div class="sub-nav">
          <ul>
       		<li>주문통합 리스트</li>
       		<li>입금대기 리스트</li>
       		<li>결제완료 리스트</li>
       		<li>상품준비중 리스트</li>
       		<li>배송준비중 리스트</li>
       		<li>배송중 리스트</li>
       		<li>배송완료 리스트</li>
       		<li>구매확정 리스트</li>
       		<li>결제 중단/실패 리스트</li>
       		<li>취소 리스트</li>
       		<li>반품 리스트</li>
       		<li>교환 리스트</li>
          </ul>
        </div>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="#">
          <i class="material-icons">table_view</i>
          <p>판매 현황</p>
        </a>
        <div class="sub-nav">
          <ul>
       		<li>매출 현황</li>
       		<li>베스트 현황</li>
          </ul>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="material-icons">language</i>
          <p>통계</p>
        </a>
        <div class="sub-nav">
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="material-icons">library_books</i>
          <p>게시판 관리</p>
        </a>
        <div class="sub-nav">
          <ul>
       		<li>이벤트 관리</li>
       		<li>공지사항 관리</li>
       		<li>뉴스 관리</li>
       		<li>QnA 관리</li>
       		<li>FAQ 관리</li>
          </ul>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="material-icons">build</i>
          <p>설정</p>
        </a>
        <div class="sub-nav">
          <ul>
       		<li>기본 설정</li>
       		<li>배너 관리</li>
       		<li>약관 관리</li>
          </ul>
        </div>
      </li>
    </ul>
  </div>
</div>