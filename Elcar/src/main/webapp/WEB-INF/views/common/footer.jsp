<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>
	<!-- Footer Section Begin -->
	<footer class="footer set-bg"
		data-setbg="../resources/img/footer-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4">
					<div class="footer__about">
						<div class="footer__widget">
							<h5>ELCAR</h5>
						</div>
						<p>
							엘카는 전기차 충전소 찾기 서비스와 전기차카쉐어링을 제공하는 서비스입니다. <br /> 고객센터
							02-1234-5678
						</p>
					</div>
				</div>
				<div class="col-lg-2 offset-lg-1 col-md-3"></div>
				<div class="col-lg-2 col-md-3"></div>
				<div class="col-lg-3 col-md-6">
					<div class="footer__brand">
						<h5>Infomation</h5>
						<ul>
							<li><a href="../guide" style="color: rgba(120, 120, 120);"><i
									class="fa fa-angle-right"></i> 안내</a></li>
							<li><a href="../newcharger"
								style="color: rgba(120, 120, 120);"><i
									class="fa fa-angle-right"></i> 충전소 검색</a></li>
							<form id="locationForm" action="../sharelist" method="get">
								<input type="hidden" id="lat" name="lat" /> <input
									type="hidden" id="lng" name="lng" />
								<li><a onclick="shareList()"
									style="cursor: pointer; color: rgba(120, 120, 120);"><i
										class="fa fa-angle-right"></i> 카쉐어링</a></li>
							</form>
							<li><a href="../mypage" style="color: rgba(120, 120, 120);"><i
									class="fa fa-angle-right"></i> MyPage</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="footer__copyright__text">
				<p>
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with </i> by ELCAR</a>
				</p>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<script>
		function shareList() {
			navigator.geolocation.getCurrentPosition(function(position) {
				$('#lat').val(position.coords.latitude);
				$('#lng').val(position.coords.longitude);
				document.getElementById('locationForm').submit();
			}, function(err) {
				Swal.fire({
					icon : 'warning',
					text : '위치정보 허용 하시는 것을 권장 드립니다.',
				}).then(function(isOkay) {
					$('#lat').val(37.570028);
					$('#lng').val(126.986072);
					document.getElementById('locationForm').submit();
				});
			});
		}
	</script>
	<!-- Footer Section End -->
</body>
</html>