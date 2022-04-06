<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>ELCAR | Hello :)</title>
    <style>
      section {
        width: 100%;
        height: 2600px;
        display: table;
      }
      div.frame {
        width: 80%;
        height: 100%;
        margin: 0 auto;
        display: table;
      }

      div.top_frame {
        width: 100%;
		height: 850px;
        margin-bottom: 50px;
        text-align: center;
      }
      div.top_title {
        width: 80%;
        height: 150px;
        text-align: center;
        margin: 0 auto;
      }
      div.top_text {
        width: 500px;
        height: 600px;
        text-align: center;
        margin: 0 auto;
      }
      div.top_bottom {
        width: 70%;
        height: 40px;
        margin: 0 auto;
      }
      div.center_frame {
        width: 100%;
        height: 34%;
        margin: 0 auto;
		display: flex;
      }
      div.center_map {
        width: 100%;
        height: 100%;
        
      }
      div.bottom {
        margin-top: 50px;
        width: 100%;
        height: 100px;
        text-align: center;
      }
      input.text {
        margin-top: 15px;
        width: 500px;
        height: 40px;
        font-size: 15px;
        border: 0;
        border-radius: 15px;
        outline: none;
        padding-left: 10px;
        background-color: rgb(233, 233, 233);
      }
      textarea {
        width: 1000px;
        height: 300px;
        font-size: 15px;
        border: 0;
        border-radius: 15px;
        outline: none;
        padding-left: 10px;
        background-color: rgb(233, 233, 233);
        resize: none;
      }
    </style>
  </head>

  <body onload="initTmap();">
    <!-- Breadcrumb End -->

    <div
      class="breadcrumb-option set-bg"
      data-setbg="resources/img/breadcrumb-bg.jpg"
    >
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <div class="breadcrumb__text">
              <h2>Car sharing</h2>
              <div class="breadcrumb__links">
                <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                <span>카 쉐어링</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Breadcrumb Begin -->
    <form action="sincheonginfo" method="get">
    <section>
      <div class="frame">
        <div class="top_title" style="margin-top: 30px"><h1>날 태워</h1></div>
        <div class="top_frame">
          <div class="top_text">
            <h4 style="float: left">매칭상태</h4>
            <input
              type="text"
              class="text_custom text"
              name=""
              value="${status}"
              readonly
            >
			<br /><br />
            <h4 style="float: left">닉네임</h4>
            <input
              type="text"
              class="text_custom text"
              name=""
              value="${sincheong.nickname}"
              readonly
            >
			<br /><br />
      <h4 style="float: left">날짜 시간</h4>
            <input
              type="text"
              id="datepicker"
              class="text_custom text"
              value="${date}"
              name="date"
              readonly
            />
			<br /><br />
            <h4 style="float: left">성별</h4>
            <input
              type="text"
              class="text_custom text"
              name=""
              value="${gender}"
              readonly
            />
			<br /><br />
            <h4 style="float: left">인원수</h4>
            <input
              type="text"
              class="text_custom text"
              name="person"
              value="${sincheong.person}"
              readonly
            />
			<br /><br />
            <h4 style="float: left">출발지</h4>
            <input
              type="text"
              class="text_custom text"
              id="searchKeyword1"
              name="start_name"
              value="${sincheong.start_name}"
              readonly
            />
            <input
              type="text"
              id="startlat"
              name="start_lat"
              value="${sincheong.start_lat}"
              style="display: none"
            />
            <input
              type="text"
              id="startlon"
              name="start_long"
              value="${sincheong.start_long}"
              style="display: none"
            />
 
			<br /><br />
            <h4 style="float: left">도착지</h4>
            <input
              type="text"
              class="text_custom text"
              id="searchKeyword2"
              name="goal_name"
              value="${sincheong.goal_name}"
              readonly
            />
            <input
              type="text"
              id="endlat"
              name="goal_lat"
              value="${sincheong.goal_lat}"
              style="display: none"
            />
            <input
              type="text"
              id="endlon"
              name="goal_long"
              value="${sincheong.goal_long}"
              style="display: none"
            />
			<br /><br />
          </div>

          <div class="top_bottom" style="margin-top: 100px">
            <br id="map_wrap" class="map_wrap">
            </div>
          </div>
          <p id="result" style="display: none"></p>
          <p id="resultTotal" style="text-align: center;"></p>
      
        <div class="center_frame">
			<div class="center_addr">
				<div class="map_act_btn_wrap clear_box"></div>
				<div>
				  <div class="rst_wrap">
					<div class="rst mCustomScrollbar">
					  <ul id="searchResult" name="searchResult">
					  </ul>
					</div>
				  </div>
				</div>
			  </div>
          <div class="center_map">
            <div style="float: left">
              <select id="selectLevel" style="margin: 0 auto">
                <option value="0" selected="selected">교통최적+추천</option>
                <option value="1">교통최적+무료우선</option>
                <option value="2">교통최적+최소시간</option>
                <option value="4">교통최적+고속도로우선</option>
                <option value="10">최단거리+유/무료</option>
                <option value="19">교통최적+어린이보호구역 회피</option>
              </select>
            </div>
            <div style="float: left">
              <select id="year" style="margin: 0 auto; display: inline">
                <option value="Y" selected="selected">
                  교통정보 표출 옵션
                </option>
                <option value="Y">Y</option>
                <option value="N">N</option>
              </select>
            </div>
            <button
              type="button"
              id="btn_select"
              class="btn btn-danger"
              style="float: right; width: 100px"
            >
              길찾기
            </button>
            <div class="map_act_btn_wrap clear_box;"></div>
            <div class="clear"></div>
            <div id="map_div"></div>
          </div>
        </div>
        <div class="bottom">
			<h4>요청사항</h4></br>	  
          <textarea
            class="text_custom text"
            name="request"
          >${sincheong.request}</textarea
          ><br /><br />
          <input
            type="submit"
            value="날 태워"
            class="btn btn-danger"
            style="width: 100px"
          />
		  <div class="map_act_btn_wrap clear_box"></div>
        </div>
      </div>
    </section>
      </form>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxdc2cafff3e344431b237973ca1c8c1a2"></script>
    <script type="text/javascript">
      var map, marker;
      var markerArr = [];
      var markerInfo;
      //출발지,도착지 마커
      var marker_s, marker_e, marker_p;
      //경로그림정보
      var drawInfoArr = [];
      var drawInfoArr2 = [];

      var chktraffic = [];
      var resultdrawArr = [];
      var resultMarkerArr = [];
     
      console.log(('#startlon'));
      function initTmap() {
            navigator.geolocation.getCurrentPosition(function (pos) {
              map = new Tmapv2.Map('map_div', {
                center: new Tmapv2.LatLng(
                  pos.coords.latitude,
                  pos.coords.longitude
                ),
                width: '100%',
                height: '85%',
                zoom: 15,
                zoomControl: true,
                scrollwheel: true,
              });
              map.addListener('click', onClick);
            }, function (err) {
            map = new Tmapv2.Map('map_div', {
              center: new Tmapv2.LatLng(37.570028, 126.986072),
              width: '100%',
              height: '85%',
              zoom: 15,
              zoomControl: true,
              scrollwheel: true,
            });
            map.addListener('click', onClick);
          }
            );
         
        // 1. 지도 띄우기

        //2. POI 통합 검색 API 요청

        // 3. 경로탐색 API 사용요청
        $('#btn_select').click(function () {
          //기존 맵에 있던 정보들 초기화
          resettingMap();

          var searchOption = $('#selectLevel').val();

          var trafficInfochk = $('#year').val();

          var PTbounds = new Tmapv2.LatLngBounds();

          //JSON TYPE EDIT [S]
          $.ajax({
            type: 'POST',
            url: 'https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result',
            async: false,
            data: {
              appKey: 'l7xxdc2cafff3e344431b237973ca1c8c1a2',
              startX: $('#startlon').val(),
              startY: $('#startlat').val(),
              endX: $('#endlon').val(),
              endY: $('#endlat').val(),
              reqCoordType: 'WGS84GEO',
              resCoordType: 'EPSG3857',
              searchOption: searchOption,
              trafficInfo: trafficInfochk,
            },
            success: function (response) {
              var resultData = response.features;

              var tDistance =
                '총 거리 : ' +
                (resultData[0].properties.totalDistance / 1000).toFixed(1) +
                'km,';
              var tTime =
                ' 총 시간 : ' +
                (resultData[0].properties.totalTime / 60).toFixed(0) +
                '분,';
              var tFare =
                ' 톨게이트 요금 : ' +
                resultData[0].properties.totalFare +
                '원,';

              $('#resultTotal').text(tDistance + tTime + tFare);

              //교통정보 표출 옵션값을 체크
              if (trafficInfochk == 'Y') {
                for (var i in resultData) {
                  //for문 [S]
                  var geometry = resultData[i].geometry;
                  var properties = resultData[i].properties;

                  if (geometry.type == 'LineString') {
                    //교통 정보도 담음
                    chktraffic.push(geometry.traffic);
                    var sectionInfos = [];
                    var trafficArr = geometry.traffic;

                    for (var j in geometry.coordinates) {
                      // 경로들의 결과값들을 포인트 객체로 변환
                      var latlng = new Tmapv2.Point(
                        geometry.coordinates[j][0],
                        geometry.coordinates[j][1]
                      );
                      // 포인트 객체를 받아 좌표값으로 변환
                      var convertPoint =
                        new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlng);

                      sectionInfos.push(convertPoint);
                      PTbounds.extend(convertPoint);
                    }
                    drawLine(sectionInfos, trafficArr);
                    map.fitBounds(PTbounds);
                  } else {
                    var markerImg = '';
                    var pType = '';

                    if (properties.pointType == 'S') {
                      //출발지 마커
                      markerImg =
                        'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png';
                      pType = 'S';
                    } else if (properties.pointType == 'E') {
                      //도착지 마커
                      markerImg =
                        'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png';
                      pType = 'E';
                    } else {
                      //각 포인트 마커
                      markerImg = 'http://topopen.tmap.co.kr/imgs/point.png';
                      pType = 'P';
                    }

                    // 경로들의 결과값들을 포인트 객체로 변환
                    var latlon = new Tmapv2.Point(
                      geometry.coordinates[0],
                      geometry.coordinates[1]
                    );
                    // 포인트 객체를 받아 좌표값으로 다시 변환
                    var convertPoint =
                      new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlon);

                    var routeInfoObj = {
                      markerImage: markerImg,
                      lng: convertPoint._lng,
                      lat: convertPoint._lat,
                      pointType: pType,
                    };
                    // 마커 추가
                    addMarkers(routeInfoObj);
                  }
                } //for문 [E]
              } else {
                for (var i in resultData) {
                  //for문 [S]
                  var geometry = resultData[i].geometry;
                  var properties = resultData[i].properties;

                  if (geometry.type == 'LineString') {
                    for (var j in geometry.coordinates) {
                      // 경로들의 결과값들을 포인트 객체로 변환
                      var latlng = new Tmapv2.Point(
                        geometry.coordinates[j][0],
                        geometry.coordinates[j][1]
                      );
                      // 포인트 객체를 받아 좌표값으로 변환
                      var convertPoint =
                        new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlng);
                      // 포인트객체의 정보로 좌표값 변환 객체로 저장
                      var convertChange = new Tmapv2.LatLng(
                        convertPoint._lat,
                        convertPoint._lng
                      );
                      // 배열에 담기
                      drawInfoArr.push(convertChange);
                      PTbounds.extend(convertChange);
                    }
                    drawLine(drawInfoArr, '0');
                    map.fitBounds(PTbounds);
                  } else {
                    var markerImg = '';
                    var pType = '';

                    if (properties.pointType == 'S') {
                      //출발지 마커
                      markerImg =
                        'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png';
                      pType = 'S';
                    } else if (properties.pointType == 'E') {
                      //도착지 마커
                      markerImg =
                        'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png';
                      pType = 'E';
                    } else {
                      //각 포인트 마커
                      markerImg = 'http://topopen.tmap.co.kr/imgs/point.png';
                      pType = 'P';
                    }

                    // 경로들의 결과값들을 포인트 객체로 변환
                    var latlon = new Tmapv2.Point(
                      geometry.coordinates[0],
                      geometry.coordinates[1]
                    );
                    // 포인트 객체를 받아 좌표값으로 다시 변환
                    var convertPoint =
                      new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlon);

                    var routeInfoObj = {
                      markerImage: markerImg,
                      lng: convertPoint._lng,
                      lat: convertPoint._lat,
                      pointType: pType,
                    };

                    // Marker 추가
                    addMarkers(routeInfoObj);
                  }
                } //for문 [E]
              }
            },
            error: function (request, status, error) {
              console.log(
                'code:' +
                  request.status +
                  '\n' +
                  'message:' +
                  request.responseText +
                  '\n' +
                  'error:' +
                  error
              );
            },
          });
          //JSON TYPE EDIT [E]
        });
      }

      function addComma(num) {
        var regexp = /\B(?=(\d{3})+(?!\d))/g;
        return num.toString().replace(regexp, ',');
      }

      //마커 생성하기
      function addMarkers(infoObj) {
        var size = new Tmapv2.Size(24, 38); //아이콘 크기 설정합니다.

        if (infoObj.pointType == 'P') {
          //포인트점일때는 아이콘 크기를 줄입니다.
          size = new Tmapv2.Size(8, 8);
        }

        marker_p = new Tmapv2.Marker({
          position: new Tmapv2.LatLng(infoObj.lat, infoObj.lng),
          icon: infoObj.markerImage,
          iconSize: size,
          map: map,
        });

        resultMarkerArr.push(marker_p);
      }

      //라인그리기
      function drawLine(arrPoint, traffic) {
        var polyline_;

        if (chktraffic.length != 0) {
          // 교통정보 혼잡도를 체크
          // strokeColor는 교통 정보상황에 다라서 변화
          // traffic :  0-정보없음, 1-원활, 2-서행, 3-지체, 4-정체  (black, green, yellow, orange, red)

          var lineColor = '';

          if (traffic != '0') {
            if (traffic.length == 0) {
              //length가 0인것은 교통정보가 없으므로 검은색으로 표시

              lineColor = '#06050D';
              //라인그리기[S]
              polyline_ = new Tmapv2.Polyline({
                path: arrPoint,
                strokeColor: lineColor,
                strokeWeight: 6,
                map: map,
              });
              resultdrawArr.push(polyline_);
              //라인그리기[E]
            } else {
              //교통정보가 있음

              if (traffic[0][0] != 0) {
                //교통정보 시작인덱스가 0이 아닌경우
                var trafficObject = '';
                var tInfo = [];

                for (var z = 0; z < traffic.length; z++) {
                  trafficObject = {
                    startIndex: traffic[z][0],
                    endIndex: traffic[z][1],
                    trafficIndex: traffic[z][2],
                  };
                  tInfo.push(trafficObject);
                }

                var noInfomationPoint = [];

                for (var p = 0; p < tInfo[0].startIndex; p++) {
                  noInfomationPoint.push(arrPoint[p]);
                }

                //라인그리기[S]
                polyline_ = new Tmapv2.Polyline({
                  path: noInfomationPoint,
                  strokeColor: '#06050D',
                  strokeWeight: 6,
                  map: map,
                });
                //라인그리기[E]
                resultdrawArr.push(polyline_);

                for (var x = 0; x < tInfo.length; x++) {
                  var sectionPoint = []; //구간선언

                  for (
                    var y = tInfo[x].startIndex;
                    y <= tInfo[x].endIndex;
                    y++
                  ) {
                    sectionPoint.push(arrPoint[y]);
                  }

                  if (tInfo[x].trafficIndex == 0) {
                    lineColor = '#06050D';
                  } else if (tInfo[x].trafficIndex == 1) {
                    lineColor = '#61AB25';
                  } else if (tInfo[x].trafficIndex == 2) {
                    lineColor = '#FFFF00';
                  } else if (tInfo[x].trafficIndex == 3) {
                    lineColor = '#E87506';
                  } else if (tInfo[x].trafficIndex == 4) {
                    lineColor = '#D61125';
                  }

                  //라인그리기[S]
                  polyline_ = new Tmapv2.Polyline({
                    path: sectionPoint,
                    strokeColor: lineColor,
                    strokeWeight: 6,
                    map: map,
                  });
                  //라인그리기[E]
                  resultdrawArr.push(polyline_);
                }
              } else {
                //0부터 시작하는 경우

                var trafficObject = '';
                var tInfo = [];

                for (var z = 0; z < traffic.length; z++) {
                  trafficObject = {
                    startIndex: traffic[z][0],
                    endIndex: traffic[z][1],
                    trafficIndex: traffic[z][2],
                  };
                  tInfo.push(trafficObject);
                }

                for (var x = 0; x < tInfo.length; x++) {
                  var sectionPoint = []; //구간선언

                  for (
                    var y = tInfo[x].startIndex;
                    y <= tInfo[x].endIndex;
                    y++
                  ) {
                    sectionPoint.push(arrPoint[y]);
                  }

                  if (tInfo[x].trafficIndex == 0) {
                    lineColor = '#06050D';
                  } else if (tInfo[x].trafficIndex == 1) {
                    lineColor = '#61AB25';
                  } else if (tInfo[x].trafficIndex == 2) {
                    lineColor = '#FFFF00';
                  } else if (tInfo[x].trafficIndex == 3) {
                    lineColor = '#E87506';
                  } else if (tInfo[x].trafficIndex == 4) {
                    lineColor = '#D61125';
                  }

                  //라인그리기[S]
                  polyline_ = new Tmapv2.Polyline({
                    path: sectionPoint,
                    strokeColor: lineColor,
                    strokeWeight: 6,
                    map: map,
                  });
                  //라인그리기[E]
                  resultdrawArr.push(polyline_);
                }
              }
            }
          } else {
          }
        } else {
          polyline_ = new Tmapv2.Polyline({
            path: arrPoint,
            strokeColor: '#DD0000',
            strokeWeight: 6,
            map: map,
          });
          resultdrawArr.push(polyline_);
        }
      }

      //초기화 기능
      function resettingMap() {
        //기존마커는 삭제
        marker_s.setMap(null);
        marker_e.setMap(null);

        if (resultMarkerArr.length > 0) {
          for (var i = 0; i < resultMarkerArr.length; i++) {
            resultMarkerArr[i].setMap(null);
          }
        }

        if (resultdrawArr.length > 0) {
          for (var i = 0; i < resultdrawArr.length; i++) {
            resultdrawArr[i].setMap(null);
          }
        }

        chktraffic = [];
        drawInfoArr = [];
        resultMarkerArr = [];
        resultdrawArr = [];
      }

      function start_search(lat, lon, name) {
        alert(lat + '/' + lon + '/' + name);
        $('#searchKeyword1').val(name);
        $('#startlat').attr('value', lat);
        $('#startlon').attr('value', lon);

        if (marker_s != null) {
          marker_s.setMap(null);
        }

        marker_s = new Tmapv2.Marker({
          position: new Tmapv2.LatLng(lat, lon),
          icon: 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png',
          iconSize: new Tmapv2.Size(24, 38),
          map: map,
        });

        if (markerArr.length > 0) {
          for (var i in markerArr) {
            markerArr[i].setMap(null);
          }
        }
      }

      function end_search(lat, lon, name) {
        alert(lat + '/' + lon + '/' + name);
        $('#searchKeyword2').val(name);
        $('#endlat').attr('value', lat);
        $('#endlon').attr('value', lon);

        if (marker_e != null) {
          marker_e.setMap(null);
        }

        marker_e = new Tmapv2.Marker({
          position: new Tmapv2.LatLng(lat, lon),
          icon: 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png',
          iconSize: new Tmapv2.Size(24, 38),
          map: map,
        });
        if (markerArr.length > 0) {
          for (var i in markerArr) {
            markerArr[i].setMap(null);
          }
        }
      }

      function click_start() {
        status = $('#start').val();
        alert('출발지를 설정합니다.');
        console.log(status);
      }

      function click_end() {
        status = $('#end').val();
        alert('도착지를 설정합니다.');
      }

      function onClick(e) {
        if (status == $('#start').val()) {
          console.log(status);
          // 클릭한 위치에 새로 마커를 찍기 위해 이전에 있던 마커들을 제거
          if (marker_s != null) {
            marker_s.setMap(null);
          }

          lonlat = e.latLng;
          $('#startlat').attr('value', lonlat.lat());
          $('#startlon').attr('value', lonlat.lng());
          //Marker 객체 생성.
          marker_s = new Tmapv2.Marker({
            position: new Tmapv2.LatLng(lonlat.lat(), lonlat.lng()),
            icon: 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png',
            iconSize: new Tmapv2.Size(24, 38),
            map: map,
          });
          console.log(lonlat.lat());
          console.log(lonlat.lng());
          reverseGeo(lonlat.lng(), lonlat.lat());
        } else {
          console.log(status);
          // 클릭한 위치에 새로 마커를 찍기 위해 이전에 있던 마커들을 제거
          if (marker_e != null) {
            marker_e.setMap(null);
          }
          lonlat = e.latLng;
          $('#endlat').attr('value', lonlat.lat());
          $('#endlon').attr('value', lonlat.lng());
          //Marker 객체 생성.
          marker_e = new Tmapv2.Marker({
            position: new Tmapv2.LatLng(lonlat.lat(), lonlat.lng()),
            icon: 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png',
            iconSize: new Tmapv2.Size(24, 38),
            map: map,
          });
          reverseGeo(lonlat.lng(), lonlat.lat());
        }
      }

      function reverseGeo(lon, lat) {
        $.ajax({
          method: 'GET',
          url: 'https://apis.openapi.sk.com/tmap/geo/reversegeocoding?version=1&format=json&callback=result',
          async: false,
          data: {
            appKey: 'l7xxdc2cafff3e344431b237973ca1c8c1a2',
            coordType: 'WGS84GEO',
            addressType: 'A10',
            lon: lon,
            lat: lat,
          },
          success: function (response) {
            // 3. json에서 주소 파싱
            var arrResult = response.addressInfo;

            //법정동 마지막 문자
            var lastLegal = arrResult.legalDong.charAt(
              arrResult.legalDong.length - 1
            );

            // 새주소
            newRoadAddr = arrResult.city_do + ' ' + arrResult.gu_gun + ' ';

            if (
              arrResult.eup_myun == '' &&
              (lastLegal == '읍' || lastLegal == '면')
            ) {
              //읍면
              newRoadAddr += arrResult.legalDong;
            } else {
              newRoadAddr += arrResult.eup_myun;
            }
            newRoadAddr +=
              ' ' + arrResult.roadName + ' ' + arrResult.buildingIndex;

            // 새주소 법정동& 건물명 체크
            if (
              arrResult.legalDong != '' &&
              lastLegal != '읍' &&
              lastLegal != '면'
            ) {
              //법정동과 읍면이 같은 경우

              if (arrResult.buildingName != '') {
                //빌딩명 존재하는 경우
                newRoadAddr +=
                  ' (' +
                  arrResult.legalDong +
                  ', ' +
                  arrResult.buildingName +
                  ') ';
              } else {
                newRoadAddr += ' (' + arrResult.legalDong + ')';
              }
            } else if (arrResult.buildingName != '') {
              //빌딩명만 존재하는 경우
              newRoadAddr += ' (' + arrResult.buildingName + ') ';
            }

            result = newRoadAddr;

            var resultDiv = document.getElementById('result');
            if (status == $('#start').val()) {
              //출발지 주소
              document.getElementById('searchKeyword1').value = result;
            } else {
              //도착지 주소
              document.getElementById('searchKeyword2').value = result;
            }
            resultDiv.innerHTML = result;
            console.log(result);
          },
          error: function (request, status, error) {
            console.log(
              'code:' +
                request.status +
                '\n' +
                'message:' +
                request.responseText +
                '\n' +
                'error:' +
                error
            );
          },
        });
      }
    </script>
</body>
</html>