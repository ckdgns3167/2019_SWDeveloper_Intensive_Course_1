<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
<title>메인 화면</title>

<script type="text/javascript">
    var ctxPath = "<%=request.getContextPath()%>";
	// 로그아웃 담당 JSP로 이동
	function logoutPro() {
		location.href = ctxPath + "/Logout_process2.jsp";
	}
</script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
</head>

<body style="background-color: #e9e9e9; background-position: top left; background-size: 100%;">
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container">
			<a class="navbar-brand text-primary" href="#"> <i
				class="fa d-inline fa-lg fa-circle-o"></i> <b> BRAND</b>
			</a>
			<button class="navbar-toggler navbar-toggler-right border-0"
				type="button" data-toggle="collapse" data-target="#navbar5">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbar5">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="Main.jsp">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="#">결제</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="Mypage.jsp">마이페이지</a></li>
				</ul>
				<a class="btn btn-outline-primary navbar-btn ml-md-2">로그인</a>
			</div>
		</div>
	</nav>
	<div class="content mx-auto"
		style="font-weight: bold; text-align: center; background-color: #ffffff; background-color: rgba(255, 255, 255, 0.5); width: 80%;">

		<div class="py-5">

			<div class="container">
				<!--카드 하나 -->
				<div class="row">
					<div class="col-md-4" style="">
						<div class="btn-group">
							<button class="btn btn-sucess dropdown-toggle"
								data-toggle="dropdown">지역선택</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#">제주시</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">서귀포시</a>
							</div>
						</div>
					</div>
					<div class="col-md-8 " style="">
						<div class="card bg-light mb-3">
							<div class="card-header">게시글 제목</div>
							<div class="card-body" style="">
								<div class="table-responsive" style="">
									<table class="table table-striped table-borderless">
										<thead>
											<tr>
												<th scope="col" class="w-25"><span
													style="font-weight: normal;">날짜</span></th>
												<th scope="col"><span style="font-weight: 400;">19.
														07. 15(월)</span></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>시간</td>
												<td>13 : 00</td>
											</tr>
											<tr>
												<td>장소</td>
												<td>함덕해수욕장 / 델문도</td>
											</tr>
											<tr></tr>
										</tbody>
									</table>
								</div>
							</div>
							<button type="button" class="btn btn-outline-info"
								data-toggle="modal" data-target="#exampleModalScrollable">
								자세히 보기</button>
							<div class="modal fade" id="exampleModalScrollable" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalScrollableTitle"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-scrollable"
									role="document"
									style="max-width: 100%; width: auto; display: table;">
									<div class="modal-content">
										<div class="modal-body">
											<div class="container">
												<div class="row">
													<div class="col-md-12">
														<div class="card text-center">
															<div class="card-header">게시글 제목</div>
															<div class="card-body">
																<div class="table-responsive">
																	<table class="table table-striped table-borderless">
																		<thead>
																			<tr>
																				<th scope="col" class="w-25"><span
																					style="font-weight: 400;">작성일</span></th>
																				<th scope="col"><span
																					style="font-weight: normal;">19. 06. 22 (토)</span></th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td>약속 날짜</td>
																				<td>19. 07. 31 (수)</td>
																			</tr>
																			<tr>
																				<td>제안 포인트</td>
																				<td>4000</td>
																			</tr>
																			<tr>
																				<td>약속내용</td>
																				<td>델문도 까페에서 자리 맡아주세요! 13시에 도착하겠습니다</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<br>
																<hr>
																<p style="text-align: left;">댓글 달기</p>
																<div class="container">
																	<table class="table table-bordered">
																		<thead>
																		</thead>
																		<tbody>
																			<tr>
																				<th>제목</th>
																				<td><textarea cols="50"
																						placeholder="제목을 입력하세요. " name="content"
																						class="border-0"></textarea></td>
																			</tr>
																			<tr>
																				<th>원하는 포인트</th>
																				<td><textarea cols="50"
																						placeholder="포인트를 입력하세요. " name="content"
																						class="border-0"></textarea></td>
																			</tr>
																			<tr>
																				<th>내용</th>
																				<td><textarea cols="50"
																						placeholder="내용을 입력하세요. " name="content"
																						class="border-0"></textarea></td>
																			</tr>
																		</tbody>
																	</table>
																	<input type="button" value="등록" onclick="sendData()"
																		class="pull-right btn btn-outline-success">
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-info"
												data-dismiss="modal">선택</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>


		</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous" style=""></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous" style=""></script>
</body>

</html>