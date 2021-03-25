const listEl = document.getElementById('placesList');
const menuEl = document.getElementById('menu_wrap');
const fragment = document.createDocumentFragment();
// 지도를 표시할 div
const container = document.querySelector('#map');
const keyword = document.querySelector('#keyword');

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
  // let keyword = document.getElementById('keyword').value ?? '투썸플레이스';
  keyword.value = addrName + ' 투썸플레이스';
  if (!keyword.value.replace(/^\s+|\s+$/g, '')) {
    alert('검색어를 입력해주세요');
    return;
  }

  // 장소검색 객체를 통해 키워드로 장소검색 요청
  places.keywordSearch(keyword.value, placeSearchCB, {
    x: coords.getLng(),
    y: coords.getLat(),
	radius: 1000,
	sort: kakao.maps.services.SortBy.DISTANCE,
	useMapBounds: true
  });
};

// 검색 결과 목록, 마커 클릭시 장소명을 표출할 인포윈도우
const infoWindow = new kakao.maps.InfoWindow({ zIndex: 1 });

// 검색 결과 목록, 마커를 표출하는 함수
const displayPlaces = (places) => {
  // const bounds = new kakao.maps.LatLngBounds();

  // 검색결과 목록에 추가된 항목들을 제거
  removeAllChildNods(listEl);

  // 지도에 표시되고 있는 마커 제거
  removeMarkers();

  places.map((place, i) => {
    // 마커 생성 후 지도에 표시
    const placePosition = new kakao.maps.LatLng(place.y, place.x);
    const marker = addMarker(placePosition, i);
    // 검색 결과 항목 Element 생성
    const itemEl = getListItem(i, place);

    // 검색된 장소 기준 지도 범위 재설정
    // bounds.extend(placePosition);

    // 마커, 검색결과 mouseover&out event
    ((marker, title) => {
      kakao.maps.event.addListener(marker, 'mouseover', () => {
        displayInfoWindow(marker, title);
      });
      kakao.maps.event.addListener(marker, 'mouseout', () => {
        infoWindow.close();
      });
    })(marker, place.place_name);

    fragment.appendChild(itemEl);
  });

  // 검색결과 항목을 목록 Element로 추가
  listEl.appendChild(fragment);
  menuEl.scrollTop = 0;

  // 검색된 장소 위치 기준으로 지도 범위 재설정
  // map.setBounds(bounds);
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
  }

  itemStr += `<span class="tel">${places.phone}</span></div>`;

  el.innerHTML = itemStr;
  el.className = 'item';

  return el;
};

// 마커를 담을 빈 배열
let markers = [];

// 마커를 생성하고 지도에 표시하는 함수
const addMarker = (position, idx) => {
  // 마커 이미지
  const imageSrc =
    'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png';
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

  // 현재위치 중심좌표 구하기
  let coords = map.getCenter();

  // 마커의 position 구하기
  const c2 = position;
  
  // 현재 중심좌표와 마커의 직선거리 계산
  const poly = new kakao.maps.Polyline({
	path: [coords, c2]
  });
  const dist = poly.getLength();

  if(dist < 1000) {
	marker.setMap(map);
    markers.push(marker);
  } else {
	marker.setMap(null);
  }

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
  }

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
    }

    fragment.appendChild(el);
  }
  paginationEl.appendChild(fragment);
};

// 검색결과 목록, 마커 click event
const displayInfoWindow = (marker, title) => {
  let content = `<div style="padding:5px;z-index:1;">${title}</div>`;

  infoWindow.setContent(content);
  infoWindow.open(map, marker);
};

// 검색결과 목록의 자식 Element를 제거
const removeAllChildNods = (el) => {
  while (el.hasChildNodes()) {
    el.removeChild(el.lastChild);
  }
};


window.onload = () => {
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
	}
	
	// 중심좌표 바뀔때마다 실행되는 event
	kakao.maps.event.addListener(map, 'dragend', () => {
	  // const level = map.getLevel();
	  // 현재위치 중심좌표 구하기
	  let coords = map.getCenter();
	
	  searchAddrFromCoords(coords.getLng(), coords.getLat(), getAddressName);
	
	  // 키워드로 장소 검색
	  searchPlaces(place, coords);
	});
}