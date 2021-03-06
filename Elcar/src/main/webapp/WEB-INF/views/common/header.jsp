<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
  </head>
  <body>
    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
      <div class="offcanvas__widget">
        <!--  <a href="../login" class="primary-btn">Login</a> -->
        <c:choose>
          <c:when test="${empty id}">
            <a href="../loginform" class="primary-btn">Login</a>
          </c:when>
          <c:otherwise>
            <a href="../logout" class="primary-btn">Logout</a>
          </c:otherwise>
        </c:choose>
      </div>
      <div class="offcanvas__logo">
        <a href="../"><img src="../resources/img/001.png" alt="" /></a>
      </div>
      <div id="mobile-menu-wrap"></div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
      <div class="container">
        <div class="row">
          <div class="col-lg-2">
            <div class="header__logo">
              <a href="../"><img src="../resources/img/001.png" alt="" /></a>
            </div>
          </div>
          <div class="col-lg-10">
            <div class="header__nav">
              <nav class="header__menu">
                <ul>
                  <li><a href="./">Home</a></li>
                  <li><a href="../guide">Guide</a></li>
                  <li>
                    <a href="#">About</a>
                    <ul class="dropdown">
                      <li><a href="../driver-regist">드라이버 등록</a></li>
                      <li><a href="../boardlist">커뮤니티</a></li>                  
                    </ul>
                  </li>
                  <li><a href="../newcharger">charger</a></li>
                  <li>
                    <form id="locationForm" action="../sharelist" method="get">
                      <input type="hidden" id="lat" name="lat" />
                      <input type="hidden" id="lng" name="lng" />
                      <a
                        onclick="shareList()"
                        style="cursor: pointer; color: rgba(0, 0, 0, 0.795)"
                        >sharing
                      </a>
                    </form>
                  </li>
                  <c:choose>
                    <c:when test="${empty type}"> </c:when>
                    <c:when test="${type == 1 }">
                      <li><a href="../mypage">Mypage</a></li>
                      <li>
                        <a href="#">Admin</a>
                        <ul class="dropdown">
                          <li><a href="../admin_memlist">회원관리</a></li>
                          <li>
                            <a href="../admin_driverlist">드라이버회원관리</a>
                          </li>
                          <li>
                            <a href="../admin_driversingolist"
                              >드라이버신고회원관리</a
                            >
                          </li>
                        </ul>
                      </li>
                    </c:when>
                    <c:otherwise>
                      <li><a href="../mypage">Mypage</a></li>
                    </c:otherwise>
                  </c:choose>
                </ul>
              </nav>
              <div class="header__nav__widget">
                <c:choose>
                  <c:when test="${empty id}">
                    <a href="../loginform" class="primary-btn">Login</a>
                  </c:when>
                  <c:otherwise>
                    <a href="../logout" class="primary-btn">Logout</a>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
          </div>
        </div>
        <div class="canvas__open">
          <span class="fa fa-bars"></span>
        </div>
      </div>
    </header>
    <!-- Header Section End -->
  </body>

  <script>
    function shareList2() {
      navigator.geolocation.getCurrentPosition(
        function (position) {
          $('#lat').val(position.coords.latitude);
          $('#lng').val(position.coords.longitude);
          document.getElementById('locationForm').submit();
        },
        function (err) {
          Swal.fire({
            icon: 'warning',
            text: '위치정보 허용 하시는 것을 권장 드립니다.',
          }).then(function (isOkay) {
            $('#lat').val(37.570028);
            $('#lng').val(126.986072);
            document.getElementById('locationForm').submit();
          });
        }
      );
    }
  </script>
</html>
