const listEl = document.getElementById('placesList');
const menuEl = document.getElementById('menu_wrap');
const fragment = document.createDocumentFragment();
// 지도를 표시할 div
const container = document.querySelector('#map');
const keyword = document.querySelector('#keyword');
const searchBtn = document.querySelector('#search-btn');

// index의 매장찾기 검색 후 넘어왔는지 여부
let isFromSection = false;

// 어디를 경유해서 왔는지 판별하는 함수
const isFromWhere = () => {
	location.href.includes('address') ? 
	isFromSection = true 
	: isFromSection = false;
};

// parameter 받아오는 함수
const getParam = (param) => {
	let url = location.href;
	let params = (url.slice(url.indexOf('?') + 1)).split('=');
	let [ variable, value ] = params;
	if(variable.toUpperCase() === param.toUpperCase()) {
		return decodeURIComponent(value);
	} else {
		/* error code 작성 */
		alert('경고!\n올바른 요청이 아닙니다.');
	};
};


// 지도 초기 옵션
const options = {
  center: new kakao.maps.LatLng(37.57123325991645, 126.9911719400817),
  level: 3,
};

// 지도 생성
const map = new kakao.maps.Map(container, options);

// 지도 컨트롤러 생성
const mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤러 추가
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 확대 축소 컨트롤러 생성
const zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 지정좌표를 중심좌표로 이동
const moveCenter = (locPosition, map) => {
  // Geolocation 좌표로 이동
  map.setCenter(locPosition);
};

let addrName = '';
// 주소-좌표 변환 객체 생성
const geocoder = new kakao.maps.services.Geocoder();

// 주소 이름 구하는 함수
const getAddressName = (result, status) => {
  if (status === kakao.maps.services.Status.OK) {
    addrName = result[0].address.address_name;
    keyword.value = addrName + ' 투썸플레이스';
  } else {
    keyword.value = '투썸플레이스';
  }
};

// 좌표로 행정동 주소를 요청하는 함수
const searchAddrFromCoords = (lng, lat, callback) => {
  geocoder.coord2Address(lng, lat, callback);
};

// 장소 검색 객체 생성
const place = new kakao.maps.services.Places();

// 장소 검색이 완료되었을때의 콜백함수
const placeSearchCB = (data, status, pagnition) => {
  if (status === kakao.maps.services.Status.OK) {
	// 검색 결과의 첫 번째 데이터 좌표 생성 후 이동
	let coords = new kakao.maps.LatLng(data[0].y,data[0].x);
	map.setCenter(coords);
	
    // OK시 검색목록, 마커 출력
    displayPlaces(data);
	
    // 페이지번호 표시
    displayPagnition(pagnition);

  } else if (status === kakao.maps.services.Status.ZERO_RESULT || status === kakao.map.services.Status.ERROR){
		// 검색결과 목록에 추가된 항목들을 제거
  		removeAllChildNods(listEl);

		// 지도에 표시되고 있는 마커 제거
		removeMarkers();
		
		let zeroStr = `
    		<span>검색 결과가 없습니다</span>
  		`;
	    const el = document.createElement('li');
		el.innerHTML = zeroStr;
		el.className = 'zero';
		fragment.appendChild(el);
		listEl.appendChild(fragment);
	};
};

// 지도 검색 요청
const searchPlaces = (places, coords) => {
  keyword.value = addrName + ' 투썸플레이스';
  if (!keyword.value.replace(/^\s+|\s+$/g, '')) {
    alert('검색어를 입력해주세요');
    return;
  };

  // 장소검색 객체를 통해 키워드로 장소검색 요청
  places.keywordSearch(keyword.value, placeSearchCB, {
    location: coords,
	radius: 1000,
	size: 10,
	sort: kakao.maps.services.SortBy.DISTANCE,
	useMapBounds: false,
  });
};

// 검색 버튼 클릭 핸들러
const searchHandler = (e) => {
	e.preventDefault();
	if (!keyword.value.replace(/^\s+|\s+$/g, '')) {
      alert('검색어를 입력해주세요');
      return;
    };
	let value = keyword.value + ' 투썸플레이스';
	place.keywordSearch(value, placeSearchCB);
};

// 검색 결과 목록, 마커 클릭시 장소명을 표출할 인포윈도우
const infoWindow = new kakao.maps.InfoWindow({ 
	zIndex: 1,
	disableAutoPan: true, 
});

// 검색 결과 목록, 마커를 표출하는 함수
const displayPlaces = (places) => {
  // const bounds = new kakao.maps.LatLngBounds();

  // 검색결과 목록에 추가된 항목들을 제거
  removeAllChildNods(listEl);

  // 지도에 표시되고 있는 마커 제거
  removeMarkers();

  places.map((place, i) => {
    // 마커 생성 후 지도에 표시
    let placePosition = new kakao.maps.LatLng(place.y, place.x);
    let marker = addMarker(placePosition, i);
    // 검색 결과 항목 Element 생성
    let itemEl = getListItem(i, place);

    // 마커, 검색결과 mouseover&out event
    ((marker, title, address, tel, url, coords) => {
      kakao.maps.event.addListener(marker, 'click', () => {
		infoWindow.close();
        displayInfoWindow(marker, title, address, tel, url);
		map.setCenter(coords);
      });
    })(marker, place.place_name, place.road_address_name, place.phone, place.place_url, placePosition);


    fragment.appendChild(itemEl);
  });

  // 검색결과 항목을 목록 Element로 추가
  listEl.appendChild(fragment);
  menuEl.scrollTop = 0;
};

// 검색결과 항목을 Element로 반환
const getListItem = (index, places) => {
  const el = document.createElement('li');
  let itemStr = `
    <span class="markerbg marker_${index + 1}"></span>
    <div class="info"><h5>${places.place_name}</h5>
  `;

  if (places.road_address_name) {
    itemStr += `
      <span>${places.road_address_name}</span>
      <span class="jibun gray">${places.address_name}</span>
    `;
  } else {
    itemStr += `<span>${places.address_name}</span>`;
  };

  itemStr += `<span class="tel">${places.phone}</span></div>`;

  el.innerHTML = itemStr;
  el.className = 'item';
  el.addEventListener('click', () => {
	geocoder.addressSearch(places.road_address_name, (result, status) => {
		// 정상적으로 검색이 완료되면 지도 이동
		if(status === kakao.maps.services.Status.OK) {
			const coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			map.setCenter(coords);
			keyword.value = `${places.road_address_name}`;
		};
	});
  });
  return el;
};

// 마커를 담을 빈 배열
let markers = [];

// 마커를 생성하고 지도에 표시하는 함수
const addMarker = (position, idx) => {
  // 마커 이미지
  const imageSrc =
    'https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/map/marker.png';
  const imageSize = new kakao.maps.Size(36, 37);
  const imageOptions = {
    spriteSize: new kakao.maps.Size(36, 691),
    spriteOrigin: new kakao.maps.Point(0, idx * 46 + 10),
    offset: new kakao.maps.Point(13, 37),
  };
  const markerImage = new kakao.maps.MarkerImage(
    imageSrc,
    imageSize,
    imageOptions
  );
  const marker = new kakao.maps.Marker({
    position: position,
    image: markerImage,
  });

  marker.setMap(map); // 지도 위에 마커를 표출합니다
  markers.push(marker);  // 배열에 생성된 마커를 추가합니다

  return marker;
};

// 지도 위의 마커 모두 제거
const removeMarkers = () => {
  for (let i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  markers = [];
};

// 검색 결과 하단 pagination
const displayPagnition = (pagination) => {
  const paginationEl = document.getElementById('pagination');
  const fragment = document.createDocumentFragment();

  // 기존에 추가된 페이지번호 삭제
  while (paginationEl.hasChildNodes()) {
    paginationEl.removeChild(paginationEl.lastChild);
  };

  for (let i = 1; i <= pagination.last; i++) {
    let el = document.createElement('a');
    el.href = '#';
    el.innerHTML = i;

    if (i === pagination.current) {
      el.className = 'on';
    } else {
      el.onclick = ((i) => {
        return () => {
          pagination.gotoPage(i);
        };
      })(i);
    };

    fragment.appendChild(el);
  }
  paginationEl.appendChild(fragment);
};

// 검색결과 목록, 마커 mouseover event
const displayInfoWindow = (marker, title, address, tel, url) => {
  let content = `
	<div class="infoWindow">
		<div class="info-title">
			<p>${title}</p>		
		</div>
		<div class="info-content">
			<div>
				<p>${address}</p>
				<p>${tel}</p>
			</div>
			<a href="${url}" target="_blank">
				<img src="https://toosome.s3.ap-northeast-2.amazonaws.com/img/pages/subpages/map/kakao_map.png" alt="#">
			</a>		
		</div>
	</div>
  `;

  infoWindow.setContent(content);
  infoWindow.open(map, marker);
};

// 검색결과 목록의 자식 Element를 제거
const removeAllChildNods = (el) => {
  while (el.hasChildNodes()) {
    el.removeChild(el.lastChild);
  };
};

searchBtn.addEventListener('click', searchHandler);

window.onload = () => {
	isFromWhere();

	// gnb를 경유해서 넘어온 경우
	if(!isFromSection) {
		// Geolocation 사용 가능여부 확인
		if (navigator.geolocation) {
		  navigator.geolocation.getCurrentPosition((position) => {
		    let lat = position.coords.latitude; // 위도
		    let lon = position.coords.longitude; // 경도
		
		    const locPosition = new kakao.maps.LatLng(lat, lon);
		    moveCenter(locPosition, map);
			
		  // 키워드로 장소 검색
		  searchPlaces(place, locPosition);
		  });
		} else {
		  const locPosition = new kakao.maps.LatLng(
		    37.57123325991645,
		    126.9911719400817
		  );
		  moveCenter(locPosition, map);
		  // 키워드로 장소 검색
		  searchPlaces(place, locPosition);
		};
	} else { // section에서 검색으로 넘어온 경우
		let temp = getParam('address');
		let searchValue = temp + ' 투썸플레이스';
		place.keywordSearch(searchValue, placeSearchCB);
		
		keyword.value = searchValue;
	};
};