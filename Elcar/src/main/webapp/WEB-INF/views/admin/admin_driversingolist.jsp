<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ELCAR | Hello :)</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
<!-- Nucleo Icons -->
<link href="resources/css/nucleo-icons.css" rel="stylesheet" />
<link href="resources/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<!-- Material Icons -->
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons+Round"
	rel="stylesheet">
<!-- CSS Files -->
<link id="pagestyle" href="resources/css/material-dashboard.css?v=3.0.2"
	rel="stylesheet" />
</head>
<body>
	<!-- 관리자 페이지 상단 이미지 -->
	<div class="breadcrumb-option set-bg"
		data-setbg="resources/img/breadcrumb-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Admin</h2>
						<div class="breadcrumb__links">
							<a href="./"><i class="fa fa-home"></i> Home</a> <span>관리자_드라이버신고회원관리
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 관리자_드라이버 신고 회원 관리 -->
	<div class="contact-address">
		<div class="container">
			<div class="contact__address__text">
				<form action="admin_driversingolist" method="get">
					<input type="text" id="mem_text" name="mem_text" /> <input
						type="submit" value="찾기" class="btn btn-light"
						style="padding-left: 10px; padding-right: 10px; padding-top: 6.5; padding-top: 6.5; padding-top: 6.5; padding-top: 6px; padding-bottom: 7px;" />
				</form>
				<div class="container-fluid py-4">
					<div class="row">
						<div class="col-12">
							<div class="card my-4">
								<div
									class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
									<div
										class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
										<h6 class="text-white text-capitalize ps-3">관리자_드라이버 신고
											회원 관리</h6>
									</div>
								</div>
								<c:choose>
									<c:when test="${driversingo!=null && pageInfo.listCount>0 }">
										<form action="admin_driversingolist" method="get">
											<div class="card-body px-0 pb-2">
												<div class="table-responsive p-0" style="height: 350px">
													<table class="table align-items-center mb-0"
														style="”table-layout: fixed”">
														<thead>
															<tr>
																<th
																	class="text-uppercase text-secondary 
														text-xxs font-weight-bolder opacity-7 ps-6">num</th>
																<th
																	class="text-uppercase text-secondary 
														text-xxs font-weight-bolder opacity-7 ps-1">이용내역순</th>
														<th
																	class="text-uppercase text-secondary 
														text-xxs font-weight-bolder opacity-7 ps-2">날짜</th>
																<th
																	class="text-uppercase text-secondary 
														text-xxs font-weight-bolder opacity-7 ps-2">신고유저</th>
														<th
																	class="text-uppercase text-secondary 
														text-xxs font-weight-bolder opacity-7 ps-2">마이너스유저</th>
																<th
																	class="text-uppercase text-secondary 
														text-xxs font-weight-bolder opacity-7 ps-4">종류
																</th>
																<th
																	class="text-uppercase text-secondary 
														text-xxs font-weight-bolder opacity-7 ps-1">내용</th>
																<th
																	class="text-uppercase text-secondary 
														text-xxs font-weight-bolder opacity-7 ps-2">처리</th>
																<th
																	class="text-uppercase text-secondary 
														text-xxs font-weight-bolder opacity-7 ps-2">답변</th>
																<th
																	class="text-uppercase text-secondary 
														text-xxs font-weight-bolder opacity-7 ps-2">매너포인트</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="driversingo" items="${driversingo }">
																<tr>
																	<td>
																		<div class="d-flex px-2 py-1">
																			<div
																				class="d-flex flex-column justify-content-center">
																				<h6 class="mb-0 text-sm ps-5">${driversingo.num }</h6>
																			</div>
																		</div>
																	</td>
																	<td>
																		<h6 class="mb-0 text-sm ps-0">${driversingo.history_num }</h6>
																	</td>
																	<td>
																		<h6 class="mb-0 text-sm ps-0">${driversingo.date }</h6>
																	</td>
																	<td>
																		<h6 class="mb-0 text-sm ps-0">${driversingo.singouser }</h6>
																	</td>
																	<td>
																		<h6 class="mb-0 text-sm ps-0">${driversingo.minususer }</h6>
																	</td>
																	<td>
																		<h6 class="mb-0 text-sm ps-4">${driversingo.category }</h6>
																	</td>
																	<td>
																		<h6 class="mb-0 text-sm ps-0">${driversingo.content }</h6>
																	</td>
																	<td>
																		<h6 class="mb-0 text-sm ps-0">${driversingo.status }</h6>
																	</td>
																	<td>
																		<input class="mb-0 text-sm ps-0" value="${driversingo.reply }" >
																	</td>		
																	<td><select id='driverPoint${driversingo.num }'
																		class="driverPoint">
																			<c:choose>
																				<c:when test="${driversingo.status < 2 }">
																					<option value="0" selected>마이너스 선택</option>
																					<option value="-10">-10 차감</option>
																					<option value="-20">-20 차감</option>
																					<option value="-30">-30 차감</option>
																				</c:when>
																				<c:otherwise>
																					<option value="" selected disabled>차감 완료</option>
																				</c:otherwise>
																			</c:choose>
																	</select></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</form>

										<!-- 페이징 처리  -->
										<section id="pageList" style="text-align: center;">
											<c:choose>
												<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
												<c:otherwise>
													<a
														href="admin_driversingolist?page=${pageInfo.page-1}&mem_text=${mem_text}">[이전]</a>&nbsp;
				</c:otherwise>
											</c:choose>
											<c:forEach var="i" begin="${pageInfo.startPage }"
												end="${pageInfo.endPage }">
												<c:choose>
													<c:when test="${pageInfo.page==i }">[${i }]</c:when>
													<c:otherwise>
														<a
															href="admin_driversingolist?page=${i}&mem_text=${mem_text}">[${i }]</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
												<c:otherwise>
													<a
														href="admin_driversingolist?page=${pageInfo.page+1}&mem_text=${mem_text}">[다음]</a>
												</c:otherwise>
											</c:choose>
										</section>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<!--   Core JS Files   -->
<script src="resources/js/core/popper.min.js"></script>
<script src="resources/js/core/bootstrap.min.js"></script>
<script src="resources/js/plugins/perfect-scrollbar.min.js"></script>
<script src="resources/js/plugins/smooth-scrollbar.min.js"></script>
<script>
	var win = navigator.platform.indexOf('Win') > -1;
	if (win && document.querySelector('#sidenav-scrollbar')) {
		var options = {
			damping : '0.5'
		}
		Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
	}
</script>
<script>
	// 매너포인트 차감 처리
	$(document).ready(function() {
		$('.driverPoint').on('change', function(e) {
			let driverReportNum = e.currentTarget.id.slice(11);
			console.log(driverReportNum);
			let minusPoint = e.currentTarget.value;
			console.log(minusPoint);
			$.ajax({
				url : "/admin_driverpoint",
				data : {
					"num" : driverReportNum,
					"status" : 1,
					"minusPoint" : minusPoint
				},
				dataType : "text",
				type : "Post",
				success : function(data) {
					alert(data);
				}
			})
		})
	})
</script>

</html>