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
      data-setbg="../resources/img/breadcrumb-bg.jpg"
    >
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <div class="breadcrumb__text">
              <h2>Car sharing</h2>
              <div class="breadcrumb__links">
                <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                <span>??? ?????????</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Breadcrumb Begin -->
    <form action="/sinchengmodify/${num}" method="post">
    <section>
      <div class="frame">
        <div class="top_title" style="margin-top: 30px"><h1>??? ??????!</h1></div>
        <div class="top_frame">
          <div class="top_text">
            <h4 style="float: left">?????????</h4>
            <input
              type="text"
              class="text_custom text"
              name=""
              value="${nickname}"
              readonly
            >
			<br /><br />
      <h4 style="float: left">?????? ??????</h4>
            <input
              type="text"
              id="datepicker"
              class="text_custom text"
              value="${date}"
              name="date"
            />
			<br /><br />
            <h4 style="float: left">??????</h4>
            <input
              type="text"
              class="text_custom text"
              name=""
              value=${gender}
              readonly
            />
			<br /><br />
            <h4 style="float: left">?????????</h4>
            <input
              type="number" min="1"
              class="text_custom text"
              name="person"
              id="person"
              value="${sincheng.person}"
              
            />
			<br /><br />
            <h4 style="float: left">????????? ??????</h4>
            <input
              type="text"
              class="text_custom text"
              id="searchKeyword1"
              name="start_name"
              value="${sincheng.start_name}"
              placeholder="????????? ??????"
            />
            <input
              type="text"
              id="startlat"
              name="start_lat"
              value="${sincheng.start_lat}"
              style="display: none"
            />
            <input
              type="text"
              id="startlon"
              name="start_long"
              value="${sincheng.start_long}"
              style="display: none"
            />
			<br />
            <button
              type="button"
              id="btn_select_start"
              class="btn btn-danger searchbtn"
              style="float: left; margin-top: 10px"
            >
              ??????</button
            >
			<br /><br /><br />
            <h4 style="float: left">????????? ??????</h4>
            <input
              type="text"
              class="text_custom text"
              id="searchKeyword2"
              name="goal_name"
              placeholder="????????? ??????"
              value="${sincheng.goal_name}"
            />
            <input
              type="text"
              id="endlat"
              name="goal_lat"
              value="${sincheng.goal_lat}"
              style="display: none"
            />
            <input
              type="text"
              id="endlon"
              name="goal_long"
              value="${sincheng.goal_long}"
              style="display: none"
            />
            <button
              type="button"
              id="btn_select_end"
              class="btn btn-danger searchbtn"
              style="float: left; margin-top: 10px"
            >
              ??????</button
            >
			<br /><br />
          </div>
          <div class="top_bottom" style="margin-top: 100px">
            <br id="map_wrap" class="map_wrap">
              <h4>???????????? ??????</h4></br>	  
              <input
                type="button"
                value="????????? ????????????"
                id="start"
                onclick="click_start()"
                class="btn btn-danger"
              />
              <input
                type="button"
                value="????????? ????????????"
                id="end"
                onclick="click_end()"
                class="btn btn-danger"
              />
            </div>
          </div>
          <p id="result" style="display: none"></p>
          <p id="resultTotal" style="text-align: center;"></p>
      
        <div class="center_frame">
			<div class="center_addr">
        <h2 id="searchAdd" style="margin-bottom: 30px; text-align: center;">????????????</h2>
				<div class="map_act_btn_wrap clear_box"></div>
				<div>
				  <div class="rst_wrap">
					<div class="rst mCustomScrollbar">
					  <ul id="searchResult" name="searchResult">
						<!-- <li>????????????</li> -->
					  </ul>
					</div>
				  </div>
				</div>
			  </div>
          <div class="center_map">
            <div style="float: left">
              <select id="selectLevel" style="margin: 0 auto">
                <option value="0" selected="selected">????????????+??????</option>
                <option value="1">????????????+????????????</option>
                <option value="2">????????????+????????????</option>
                <option value="4">????????????+??????????????????</option>
                <option value="10">????????????+???/??????</option>
                <option value="19">????????????+????????????????????? ??????</option>
              </select>
            </div>
            <div style="float: left">
              <select id="year" style="margin: 0 auto; display: inline">
                <option value="Y" selected="selected">
                  ???????????? ?????? ??????
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
              ?????????
            </button>
            <div class="map_act_btn_wrap clear_box;"></div>
            <div class="clear"></div>
            <div id="map_div"></div>
          </div>
        </div>
        <div class="bottom">
			<h4>????????????</h4></br>	  
          <textarea
            class="text_custom text"
            name="request"
          >${sincheng.request}</textarea
          ><br /><br />
          <input
            type="button"
            value="????????????"
            class="btn btn-danger"
            style="width: 100px"
            onclick="click_insert()"
          />
          <input hidden type="submit" id="submit"> 
		  <div class="map_act_btn_wrap clear_box"></div>
        </div>
      </div>
    </section>
      </form>
    <!-- <script src="./jquery-3.1.1.min.js"></script> ??? ????????? ?????? jquery -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <!-- Air datepicker css -->
    <!-- ?????? ???????????? -->
    
    <link href="../resources/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
    <script src="../resources/js/datepicker.js"></script> <!-- Air datepicker js -->
    <script src="../resources/js/datepicker.ko.js"></script> <!-- ?????? ?????? ????????? ?????? ????????? -->
    <script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxdc2cafff3e344431b237973ca1c8c1a2"></script>
    <script type="text/javascript">
      var map, marker;
      var markerArr = [];
      var markerInfo;
      //?????????,????????? ??????
      var marker_s, marker_e, marker_p;
      //??????????????????
      var drawInfoArr = [];
      var drawInfoArr2 = [];
      var chktraffic = [];
      var resultdrawArr = [];
      var resultMarkerArr = [];
      
      let start_lat = "${sincheng.start_lat}";
      let start_lon = "${sincheng.start_long}";
      let goal_lat = "${sincheng.goal_lat}";
      let goal_lon = "${sincheng.goal_long}";

      function click_insert() {
        if(document.getElementById("datepicker").value===""){
          Swal.fire({
            icon:'error',
            title:'?????? ??????',
            text:'????????? ??????????????????.',
          })
        } else if(document.getElementById("person").value===""){
          Swal.fire({
            icon:'error',
            title:'?????? ??????',
            text:'???????????? ??????????????????.',
          }) 
        } else if(document.getElementById("person").value<1){
          Swal.fire({
            icon:'error',
            title:'?????? ??????',
            text:'0?????? ??? ????????? ???????????????',
          }) 
        } 
        else if(document.getElementById("searchKeyword1").value===""){
          Swal.fire({
            icon:'error',
            title:'?????? ??????',
            text:'???????????? ??????????????????.',
          })
        } else if(document.getElementById("searchKeyword2").value===""){
          Swal.fire({
            icon:'error',
            title:'?????? ??????',
            text:'???????????? ??????????????????.',
          })
        } else {
        Swal.fire({
            icon:'success',
            title:"?????? ??????",
            text:'????????? ?????? ???????????????.',
          }).then(function(isOkay){
            document.getElementById("submit").click();
            })  
          }
      }
      $("#datepicker").datepicker({
    	language: 'ko',
      timepicker: true,
    timeFormat: "hh:ii"
    }); 
      var status = '????????? ????????????';
      function initTmap() {
				// 1. ?????? ?????????
        $('#searchAdd').hide();
				map = new Tmapv2.Map("map_div", {
					center : new Tmapv2.LatLng(37.49241689559544, 127.03171389453507),
					width : "100%",
					height : "85%",
					zoom : 11,
					zoomControl : true,
					scrollwheel : true
				});
		    map.addListener('click', onClick);
				// 2. ??????, ?????? ????????????
				// ??????
				marker_s = new Tmapv2.Marker(
						{
							position : new Tmapv2.LatLng(start_lat,
              start_lon),
							icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
							iconSize : new Tmapv2.Size(24, 38),
							map : map
						});
		
				//??????
				marker_e = new Tmapv2.Marker(
						{
							position : new Tmapv2.LatLng(goal_lat,
              goal_lon),
							icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
							iconSize : new Tmapv2.Size(24, 38),
							map : map
						});		
            
		
    //?????? ?????? ?????? ????????? ?????????
    resettingMap();

    var searchOption = $("#selectLevel").val();

    var trafficInfochk = $("#year").val();

    var PTbounds = new Tmapv2.LatLngBounds();

    //JSON TYPE EDIT [S]
    $
        .ajax({
          type : "POST",
          url : "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result",
          async : false,
          data : {
            "appKey" : "l7xxdc2cafff3e344431b237973ca1c8c1a2",
            "startX" : start_lon,
            "startY" : start_lat,
            "endX" : goal_lon,
            "endY" : goal_lat,
            "reqCoordType" : "WGS84GEO",
            "resCoordType" : "EPSG3857",
            "searchOption" : searchOption,
            "trafficInfo" : trafficInfochk
          },
          success : function(response) {

            var resultData = response.features;

            var tDistance =  '??? ?????? : ' +
                (resultData[0].properties.totalDistance / 1000).toFixed(1) +
                'km,';
              var tTime =
                ' ??? ?????? : ' +
                (resultData[0].properties.totalTime / 60).toFixed(0) +
                '???,';
              var tFare =
                ' ???????????? ?????? : ' +
                resultData[0].properties.totalFare +
                '???,';
           

            $("#resultTotal").text(
                tDistance + tTime + tFare);

            //???????????? ?????? ???????????? ??????
            if (trafficInfochk == "Y") {
              for ( var i in resultData) { //for??? [S]
                var geometry = resultData[i].geometry;
                var properties = resultData[i].properties;

                if (geometry.type == "LineString") {
                  //?????? ????????? ??????
                  chktraffic
                      .push(geometry.traffic);
                  var sectionInfos = [];
                  var trafficArr = geometry.traffic;

                  for ( var j in geometry.coordinates) {
                    // ???????????? ??????????????? ????????? ????????? ?????? 
                    var latlng = new Tmapv2.Point(
                        geometry.coordinates[j][0],
                        geometry.coordinates[j][1]);
                    // ????????? ????????? ?????? ??????????????? ??????
                    var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
                        latlng);
                    sectionInfos.push(convertPoint);
                    PTbounds.extend(convertPoint);
                  }
                  drawLine(sectionInfos,
                      trafficArr);
                      map.fitBounds(PTbounds);
                } else {

                  var markerImg = "";
                  var pType = "";

                  if (properties.pointType == "S") { //????????? ??????
                    markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
                    pType = "S";
                  } else if (properties.pointType == "E") { //????????? ??????
                    markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
                    pType = "E";
                  } else { //??? ????????? ??????
                    markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
                    pType = "P"
                  }

                  // ???????????? ??????????????? ????????? ????????? ?????? 
                  var latlon = new Tmapv2.Point(
                      geometry.coordinates[0],
                      geometry.coordinates[1]);
                  // ????????? ????????? ?????? ??????????????? ?????? ??????
                  var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
                      latlon);

                  var routeInfoObj = {
                    markerImage : markerImg,
                    lng : convertPoint._lng,
                    lat : convertPoint._lat,
                    pointType : pType
                  };
                  // ?????? ??????
                  addMarkers(routeInfoObj);
                }
              }//for??? [E]

            } else {

              for ( var i in resultData) { //for??? [S]
                var geometry = resultData[i].geometry;
                var properties = resultData[i].properties;

                if (geometry.type == "LineString") {
                  for ( var j in geometry.coordinates) {
                    // ???????????? ??????????????? ????????? ????????? ?????? 
                    var latlng = new Tmapv2.Point(
                        geometry.coordinates[j][0],
                        geometry.coordinates[j][1]);
                    // ????????? ????????? ?????? ??????????????? ??????
                    var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
                        latlng);
                    // ?????????????????? ????????? ????????? ?????? ????????? ??????
                    var convertChange = new Tmapv2.LatLng(
                        convertPoint._lat,
                        convertPoint._lng);
                    // ????????? ??????
                    drawInfoArr
                        .push(convertChange);
                  }
                  drawLine(drawInfoArr,
                      "0");
                } else {

                  var markerImg = "";
                  var pType = "";

                  if (properties.pointType == "S") { //????????? ??????
                    markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
                    pType = "S";
                  } else if (properties.pointType == "E") { //????????? ??????
                    markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
                    pType = "E";
                  } else { //??? ????????? ??????
                    markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
                    pType = "P"
                  }

                  // ???????????? ??????????????? ????????? ????????? ?????? 
                  var latlon = new Tmapv2.Point(
                      geometry.coordinates[0],
                      geometry.coordinates[1]);
                  // ????????? ????????? ?????? ??????????????? ?????? ??????
                  var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
                      latlon);

                  var routeInfoObj = {
                    markerImage : markerImg,
                    lng : convertPoint._lng,
                    lat : convertPoint._lat,
                    pointType : pType
                  };

                  // Marker ??????
                  addMarkers(routeInfoObj);
                }
              }//for??? [E]
            }
          },
          error : function(request, status, error) {
            console.log("code:"
                + request.status + "\n"
                + "message:"
                + request.responseText
                + "\n" + "error:" + error);
          }
        });
        //2. POI ?????? ?????? API ??????
        
        $('#btn_select_start').click(function () {
          if(document.getElementById("searchKeyword1").value===""){
          Swal.fire({
            icon:'error',
            title:'????????? ??????',
            text:'???????????? ??????????????????.',
          })
        } else{
          //?????? ????????? 

          map.resize(($('section').outerWidth()*0.8)*0.75,694);
          $('#searchAdd').show();
			$('.center_map').css({
				"width": "75%"
			})
			$('.center_addr').css({
				"width": "25%"
			})
      
          var searchKeyword = $('#searchKeyword1').val();
          $.ajax({
            method: 'GET',
            url: 'https://apis.openapi.sk.com/tmap/pois?version=1&format=json&callback=result',
            async: false,
            data: {
              appKey: 'l7xxdc2cafff3e344431b237973ca1c8c1a2',
              searchKeyword: searchKeyword,
              resCoordType: 'EPSG3857',
              reqCoordType: 'WGS84GEO',
              count: 10,
            },
            success: function (response) {
              var resultpoisData = response.searchPoiInfo.pois.poi;

              // ?????? ??????, ?????? ??????
              if (markerArr.length > 0) {
                for (var i in markerArr) {
                  markerArr[i].setMap(null);
                }
              }
              var innerHtml = ''; // Search Reulsts ????????? ?????? ?????? ??????
              var positionBounds = new Tmapv2.LatLngBounds(); //?????? ????????? ?????? ?????? ?????? LatLngBounds?????? ??????
              for (var k in resultpoisData) {
                var noorLat = Number(resultpoisData[k].noorLat);
                var noorLon = Number(resultpoisData[k].noorLon);
                var name = resultpoisData[k].name;

                var pointCng = new Tmapv2.Point(noorLon, noorLat);
                var projectionCng =
                  new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(pointCng);

                var lat = projectionCng._lat;
                var lon = projectionCng._lng;

                var markerPosition = new Tmapv2.LatLng(lat, lon);


                marker = new Tmapv2.Marker({
                  position: markerPosition,
                  icon: 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_a.png',
                  icon:
                    'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_' +
                    k +
                    '.png',
                  iconSize: new Tmapv2.Size(24, 38),
                  title: name,
                  map: map,
                });

                innerHtml +=
                "<img src='http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_" +
                    k +
                    ".png' style='vertical-align:middle;'/><span>"+
                    name +
                    '</span><span>' +
                    '<button type = button class = "btn btn-danger\" style="float:right; margin-right:30px" id= end' +
                    k +
                    ' onclick="start_search(' +
                    lat +
                    ',' +
                    lon +
                    ",'" +
                    name +
                    '\')">??????</button></span><br/><br/>';

                markerArr.push(marker);
                positionBounds.extend(markerPosition); // LatLngBounds??? ?????? ??????
              }

              $('#searchResult').html(innerHtml); //searchResult ????????? ??????
              map.panToBounds(positionBounds); // ????????? bounds??? ???????????? ???????????????
              map.zoomOut();
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
        });
        
        $('#btn_select_end').click(function () {
          if(document.getElementById("searchKeyword2").value===""){
          Swal.fire({
            icon:'error',
            title:'????????? ??????',
            text:'???????????? ??????????????????.',
          })
        } else {
          map.resize(($('section').outerWidth()*0.8)*0.75,694);
          $('#searchAdd').show();
			$('.center_map').css({
				"width": "75%"
			})
			$('.center_addr').css({
				"width": "25%"
			})
          var searchKeyword = $('#searchKeyword2').val();
          $.ajax({
            method: 'GET',
            url: 'https://apis.openapi.sk.com/tmap/pois?version=1&format=json&callback=result',
            async: false,
            data: {
              appKey: 'l7xxdc2cafff3e344431b237973ca1c8c1a2',
              searchKeyword: searchKeyword,
              resCoordType: 'EPSG3857',
              reqCoordType: 'WGS84GEO',
              count: 10,
            },
            success: function (response) {
              var resultpoisData = response.searchPoiInfo.pois.poi;

              // ?????? ??????, ?????? ??????
              if (markerArr.length > 0) {
                for (var i in markerArr) {
                  markerArr[i].setMap(null);
                }
              }
              var innerHtml = ''; // Search Reulsts ????????? ?????? ?????? ??????
              var positionBounds = new Tmapv2.LatLngBounds(); //?????? ????????? ?????? ?????? ?????? LatLngBounds?????? ??????

              for (var k in resultpoisData) {
                var noorLat = Number(resultpoisData[k].noorLat);
                var noorLon = Number(resultpoisData[k].noorLon);
                var name = resultpoisData[k].name;

                var pointCng = new Tmapv2.Point(noorLon, noorLat);
                var projectionCng =
                  new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(pointCng);

                var lat = projectionCng._lat;
                var lon = projectionCng._lng;

                var markerPosition = new Tmapv2.LatLng(lat, lon);

                marker = new Tmapv2.Marker({
                  position: markerPosition,
                  //icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_a.png",
                  icon:
                    'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_' +
                    k +
                    '.png',
                  iconSize: new Tmapv2.Size(24, 38),
                  title: name,
                  map: map,
                });

                innerHtml +=
                    "<img src='http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_" +
                    k +
                    ".png' style='vertical-align:middle;'/><span>"+
                    name +
                    '</span><span>' +
                    '<button type = button class = "btn btn-danger\" style="float:right; margin-right:30px" id= end' +
                    k +
                    ' onclick="end_search(' +
                    lat +
                    ',' +
                    lon +
                    ",'" +
                    name +
                    '\')">??????</button></span><br/><br/>';

                markerArr.push(marker);
                positionBounds.extend(markerPosition); // LatLngBounds??? ?????? ??????
              }

              $('#searchResult').html(innerHtml); //searchResult ????????? ??????
              map.panToBounds(positionBounds); // ????????? bounds??? ???????????? ???????????????
              map.zoomOut();
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
        });

        // 3. ???????????? API ????????????
        $('#btn_select').click(function () {
          //?????? ?????? ?????? ????????? ?????????
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
                '??? ?????? : ' +
                (resultData[0].properties.totalDistance / 1000).toFixed(1) +
                'km,';
              var tTime =
                ' ??? ?????? : ' +
                (resultData[0].properties.totalTime / 60).toFixed(0) +
                '???,';
              var tFare =
                ' ???????????? ?????? : ' +
                resultData[0].properties.totalFare +
                '???,';

              $('#resultTotal').text(tDistance + tTime + tFare);

              //???????????? ?????? ???????????? ??????
              if (trafficInfochk == 'Y') {
                for (var i in resultData) {
                  //for??? [S]
                  var geometry = resultData[i].geometry;
                  var properties = resultData[i].properties;

                  if (geometry.type == 'LineString') {
                    //?????? ????????? ??????
                    chktraffic.push(geometry.traffic);
                    var sectionInfos = [];
                    var trafficArr = geometry.traffic;

                    for (var j in geometry.coordinates) {
                      // ???????????? ??????????????? ????????? ????????? ??????
                      var latlng = new Tmapv2.Point(
                        geometry.coordinates[j][0],
                        geometry.coordinates[j][1]
                      );
                      // ????????? ????????? ?????? ??????????????? ??????
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
                      //????????? ??????
                      markerImg =
                        'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png';
                      pType = 'S';
                    } else if (properties.pointType == 'E') {
                      //????????? ??????
                      markerImg =
                        'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png';
                      pType = 'E';
                    } else {
                      //??? ????????? ??????
                      markerImg = 'http://topopen.tmap.co.kr/imgs/point.png';
                      pType = 'P';
                    }

                    // ???????????? ??????????????? ????????? ????????? ??????
                    var latlon = new Tmapv2.Point(
                      geometry.coordinates[0],
                      geometry.coordinates[1]
                    );
                    // ????????? ????????? ?????? ??????????????? ?????? ??????
                    var convertPoint =
                      new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlon);

                    var routeInfoObj = {
                      markerImage: markerImg,
                      lng: convertPoint._lng,
                      lat: convertPoint._lat,
                      pointType: pType,
                    };
                    // ?????? ??????
                    addMarkers(routeInfoObj);
                  }
                } //for??? [E]
              } else {
                for (var i in resultData) {
                  //for??? [S]
                  var geometry = resultData[i].geometry;
                  var properties = resultData[i].properties;

                  if (geometry.type == 'LineString') {
                    for (var j in geometry.coordinates) {
                      // ???????????? ??????????????? ????????? ????????? ??????
                      var latlng = new Tmapv2.Point(
                        geometry.coordinates[j][0],
                        geometry.coordinates[j][1]
                      );
                      // ????????? ????????? ?????? ??????????????? ??????
                      var convertPoint =
                        new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlng);
                      // ?????????????????? ????????? ????????? ?????? ????????? ??????
                      var convertChange = new Tmapv2.LatLng(
                        convertPoint._lat,
                        convertPoint._lng
                      );
                      // ????????? ??????
                      drawInfoArr.push(convertChange);
                      PTbounds.extend(convertChange);
                    }
                    drawLine(drawInfoArr, '0');
                    map.fitBounds(PTbounds);
                  } else {
                    var markerImg = '';
                    var pType = '';

                    if (properties.pointType == 'S') {
                      //????????? ??????
                      markerImg =
                        'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png';
                      pType = 'S';
                    } else if (properties.pointType == 'E') {
                      //????????? ??????
                      markerImg =
                        'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png';
                      pType = 'E';
                    } else {
                      //??? ????????? ??????
                      markerImg = 'http://topopen.tmap.co.kr/imgs/point.png';
                      pType = 'P';
                    }

                    // ???????????? ??????????????? ????????? ????????? ??????
                    var latlon = new Tmapv2.Point(
                      geometry.coordinates[0],
                      geometry.coordinates[1]
                    );
                    // ????????? ????????? ?????? ??????????????? ?????? ??????
                    var convertPoint =
                      new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlon);

                    var routeInfoObj = {
                      markerImage: markerImg,
                      lng: convertPoint._lng,
                      lat: convertPoint._lat,
                      pointType: pType,
                    };

                    // Marker ??????
                    addMarkers(routeInfoObj);
                  }
                } //for??? [E]
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

      //?????? ????????????
      function addMarkers(infoObj) {
        var size = new Tmapv2.Size(24, 38); //????????? ?????? ???????????????.

        if (infoObj.pointType == 'P') {
          //????????????????????? ????????? ????????? ????????????.
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

      //???????????????
      function drawLine(arrPoint, traffic) {
        var polyline_;

        if (chktraffic.length != 0) {
          // ???????????? ???????????? ??????
          // strokeColor??? ?????? ??????????????? ????????? ??????
          // traffic :  0-????????????, 1-??????, 2-??????, 3-??????, 4-??????  (black, green, yellow, orange, red)

          var lineColor = '';

          if (traffic != '0') {
            if (traffic.length == 0) {
              //length??? 0????????? ??????????????? ???????????? ??????????????? ??????

              lineColor = '#06050D';
              //???????????????[S]
              polyline_ = new Tmapv2.Polyline({
                path: arrPoint,
                strokeColor: lineColor,
                strokeWeight: 6,
                map: map,
              });
              resultdrawArr.push(polyline_);
              //???????????????[E]
            } else {
              //??????????????? ??????

              if (traffic[0][0] != 0) {
                //???????????? ?????????????????? 0??? ????????????
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

                //???????????????[S]
                polyline_ = new Tmapv2.Polyline({
                  path: noInfomationPoint,
                  strokeColor: '#06050D',
                  strokeWeight: 6,
                  map: map,
                });
                //???????????????[E]
                resultdrawArr.push(polyline_);

                for (var x = 0; x < tInfo.length; x++) {
                  var sectionPoint = []; //????????????

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

                  //???????????????[S]
                  polyline_ = new Tmapv2.Polyline({
                    path: sectionPoint,
                    strokeColor: lineColor,
                    strokeWeight: 6,
                    map: map,
                  });
                  //???????????????[E]
                  resultdrawArr.push(polyline_);
                }
              } else {
                //0?????? ???????????? ??????

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
                  var sectionPoint = []; //????????????

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

                  //???????????????[S]
                  polyline_ = new Tmapv2.Polyline({
                    path: sectionPoint,
                    strokeColor: lineColor,
                    strokeWeight: 6,
                    map: map,
                  });
                  //???????????????[E]
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

      //????????? ??????
      function resettingMap() {
        //??????????????? ??????
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
        Swal.fire({
            icon:'success',
            title:"????????? ??????",
            text:'???????????? ???????????????.',
          })
        console.log(status);
      }

      function click_end() {
        status = $('#end').val();
        Swal.fire({
            icon:'success',
            title:"????????? ??????",
            text:'???????????? ???????????????.',
          })
      }

      function onClick(e) {
        if (status == $('#start').val()) {
          console.log(status);
          // ????????? ????????? ?????? ????????? ?????? ?????? ????????? ?????? ???????????? ??????
          if (marker_s != null) {
            marker_s.setMap(null);
          }

          lonlat = e.latLng;
          $('#startlat').attr('value', lonlat.lat());
          $('#startlon').attr('value', lonlat.lng());
          //Marker ?????? ??????.
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
          // ????????? ????????? ?????? ????????? ?????? ?????? ????????? ?????? ???????????? ??????
          if (marker_e != null) {
            marker_e.setMap(null);
          }
          lonlat = e.latLng;
          $('#endlat').attr('value', lonlat.lat());
          $('#endlon').attr('value', lonlat.lng());
          //Marker ?????? ??????.
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
            // 3. json?????? ?????? ??????
            var arrResult = response.addressInfo;

            //????????? ????????? ??????
            var lastLegal = arrResult.legalDong.charAt(
              arrResult.legalDong.length - 1
            );

            // ?????????
            newRoadAddr = arrResult.city_do + ' ' + arrResult.gu_gun + ' ';

            if (
              arrResult.eup_myun == '' &&
              (lastLegal == '???' || lastLegal == '???')
            ) {
              //??????
              newRoadAddr += arrResult.legalDong;
            } else {
              newRoadAddr += arrResult.eup_myun;
            }
            newRoadAddr +=
              ' ' + arrResult.roadName + ' ' + arrResult.buildingIndex;

            // ????????? ?????????& ????????? ??????
            if (
              arrResult.legalDong != '' &&
              lastLegal != '???' &&
              lastLegal != '???'
            ) {
              //???????????? ????????? ?????? ??????

              if (arrResult.buildingName != '') {
                //????????? ???????????? ??????
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
              //???????????? ???????????? ??????
              newRoadAddr += ' (' + arrResult.buildingName + ') ';
            }

            result = newRoadAddr;

            var resultDiv = document.getElementById('result');
            if (status == $('#start').val()) {
              //????????? ??????
              document.getElementById('searchKeyword1').value = result;
            } else {
              //????????? ??????
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
      $("datepicker").datepicker({
        language:'ko'
      });
    </script>
  </body>
</html>
