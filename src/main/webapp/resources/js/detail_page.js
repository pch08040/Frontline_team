window.addEventListener("load", function () {
    let address = document.querySelector(".address").innerText;
    console.log("hi  "+document.querySelector(".address").innerText)

    let address1 = "휴먼교육센터";
    let title = document.querySelector(".title").innerText
	
	// map();
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 2 // 지도의 확대 레벨
                };

            // 지도를 생성합니다    
            var map = new kakao.maps.Map(mapContainer, mapOption);

            // if (navigator.geolocation) {


            //     navigator.geolocation.getCurrentPosition(function (position) {

            //         var lat = position.coords.latitude,
            //             lon = position.coords.longitude;

            //         var locPosition = new kakao.maps.LatLng(lat, lon)
            //         presentPosition = locPosition;

            //         map.setCenter(locPosition);
            //         console.log(lat, lon)
            //     });

            // } else {

            //     var locPosition = new kakao.maps.LatLng(37.566826, 126.9786567)
            //     alert('현재 위치를 찾을 수 없습니다!');
            // }



            var geocoder = new kakao.maps.services.Geocoder();


            geocoder.addressSearch(address, function (result, status) {


                // 정상적으로 검색이 완료됐으면 
                if (status === kakao.maps.services.Status.OK) {

                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });

                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: `<div style="width:150px;text-align:center;padding:6px 0;">${title}</div>`
                    });
                    infowindow.open(map, marker);

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                }

                let find = document.querySelector('.findWay')
                find.addEventListener('click', function () {
                    location.href = "https://map.kakao.com/?sName=" + address1 + "&eName=" + address
                })
            })

});

