<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/subpages/share/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">   
    <link rel="stylesheet" href="/resources/css/subpages/franchise/franchise.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="/resources/js/subpages/franchise/franchise.js"></script>
    <title>A TOOSOME PLACE</title>
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/subpages/share/nav/nav.jsp"></jsp:include>

        <div class="franchise-container">
            <div class="title-container">
                <img class="title-logo" src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/share/banner.png" alt="">
                <span class="franchise-title">창업정보</span>
            </div>

            <div class="contents">
                <div class="img-title">
                   <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/franchise/tit_procedure01.png" alt="">
                </div>

                <div class="click-way">
                    <article class="art1 click-on">
                        <a href="#"></a>
                        <div class="art-display"></div>
                    </article>
                    <article class="art2">
                        <a href="#"></a>
                        <div class="art-display"></div>
                    </article>
                    <article class="art3">
                        <a href="#"></a>
                        <div class="art-display"></div>
                    </article>
                    <article class="art4">
                        <a href="#"></a>
                        <div class="art-display"></div>
                    </article>
                    <article class="art5">
                        <a href="#"></a>
                        <div class="art-display"></div>
                    </article>
                    <article class="art6">
                        <a href="#"></a>
                        <div class="art-display"></div>
                    </article>
                    <article class="art7">
                        <a href="#"></a>
                        <div class="art-display"></div>
                    </article>
                    <article class="art8">
                        <a href="#"></a>
                        <div class="art-display"></div>
                    </article>
                    <article class="art9">
                        <a href="#"></a>
                        <div class="art-display"></div>
                    </article>
                </div>
            </div>

            <div class="contents2">
                <h3>창업 정보</h3>
                <p>01. 창업조건</p>
                <table class="table table-bordered table-hover">
                    <thead class="thead-light">
                        <tr>
                            <th>구분</th>
                            <th>내용</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>창업 가능 상권</td>
                            <td>상업지, 오피스, 역세권, 대학가, 대형 집객시설물 등</td>
                        </tr>
                        <tr>
                            <td>창업 기준 면적</td>
                            <td>1층 : 148.7㎡(45평) / 전면 8M 이상</td>
                        </tr>
                        <tr>
                            <td class="line">기본 시설 사항</td>
                            <td>
                                전기 : 70Kw 이상<br/>
                                용도 : 근린생활시설 1종 또는 2종<br/>
                                기타 : 급, 배수 / 급, 배기 가능
                            </td>
                        </tr>
                    </tbody>
                </table>

                <ul class="sub-title">
                    <li>02. 예상 투자 비용</li>
                    <li>(VAT 별도)</li>
                </ul>
                <table class="table table-bordered table-hover">
                    <thead class="thead-light">
                        <tr>
                            <th>구분</th>
                            <th>투자비(천원)</th>
                            <th>내용</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>가맹비</td>
                            <td>20,000</td>
                            <td>소멸성 (영업표지의 사용 및 영업관리 등의 대가)</td>
                        </tr>
                        <tr>
                            <td>보증금</td>
                            <td>10,000</td>
                            <td>계약 종료시 반환 (VAT 없음)</td>
                        </tr>
                        <tr>
                            <td>교육비</td>
                            <td>1,500</td>
                            <td>이론, 실습 교육 (10일)</td>
                        </tr>
                        <tr>
                            <td>기획관리비</td>
                            <td>5,000</td>
                            <td>인테리어 설계비</td>
                        </tr>
                        <tr>
                            <td>인테리어</td>
                            <td>83,250 ~ 94,050</td>
                            <td>45평기준(185만원/평 ~ 209만원/평)</td>
                        </tr>
                        <tr>
                            <td>간판/사인물</td>
                            <td>12,000</td>
                            <td>전면 15M 점포 기준(1면 추가시 400만원 추가/1M당 100만원 추가)</td>
                        </tr>
                        <tr>
                            <td>가구</td>
                            <td>33,000 ~ 35,000</td>
                            <td>의자, 테이블 등</td>
                        </tr>
                        <tr>
                            <td>장비/설비류</td>
                            <td>69,700 ~ 77,000</td>
                            <td>커피 머신, 케익 쇼케이스, 냉장고 등</td>
                        </tr>
                        <tr class="table-active">
                            <td>계</td>
                            <td>234,450 ~ 254,550</td>
                            <td>45평, 전면 15M 점포 기준</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <ul class="star-text">
                <li>*별도공사: 철거공사, 화장실공사, 외부테라스공사, 계단공사, 전기증설(70KW), 용도변경,</li>
                <li>&nbsp;냉 난방기(냉 난방기 본사 구매 시 약 850만원/설치비 별도)</li>
                <li>*점주(자체)공사 시 SI관리비 평당 15만원</li>
                <li>*상기 투자비는 매장형태 및 상황에 따라 변동될 수 있습니다.</li>
            </ul>

            <div class="call">
                <img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/franchise/140731_banner.jpg" alt="">
            </div>

            <div class="down-box">
                <p>03. 브랜드 소개 브로슈어</p>
                <ul class="download">
                    <li>
                        <span>브랜드북</span>
                        <button type="submit">다운로드</button>
                    </li>
                    <li>
                        <span>가보고 싶은 투썸</span>
                        <button type="submit">다운로드</button>
                    </li>
                    <li>
                        <span>Drive Thru, Drive in</span>
                        <button type="submit">다운로드</button>
                    </li>
                </ul>
            </div>
            
        </div>
		<jsp:include page="/WEB-INF/views/subpages/share/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>