<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%
    String userid = session.getAttribute("userId").toString();
    String userNickname = session.getAttribute("userNickname").toString();
    String userType = session.getAttribute("userType").toString();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          type="text/css">
    <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
<!-- navigation bar -->
    <nav class="navbar navbar-expand-md navbar-dark bg-transparent fixed-top scrolled" style="">
        <div class="container"><a class="navbar-brand" href="#">
            <i class="fa d-inline fa-lg fa-stop-circle"></i>
            <b>YOUR LINE</b>
        </a>
            <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse"
                    data-target="#navbar16">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbar16">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="./Main.jsp">메인</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">글쓰기</a></li>
                    <li class="nav-item"><a class="nav-link" href="./PaymentPage.jsp">결제</a></li>
                    <li class="nav-item"><a class="nav-link" href="./Mypage.jsp">마이페이지</a></li>
                    <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a class="nav-link" href="./ManagePage.jsp" id="userManager">회원관리</a></li>
                    <li class="nav-item"><a class="nav-link" href="./AboutUs.jsp">AboutUs</a></li>
                </ul>
                <a class="btn navbar-btn ml-md-2 btn-light text-dark">로그아웃</a>
            </div>
        </div>
    </nav>
    <div class="py-5 text-center text-md-right"
         style="background-image: url(https://static.pingendo.com/cover-bubble-dark.svg);	background-position: right bottom;	background-size: cover;	background-repeat: repeat; background-attachment: fixed;">
        <div class="container">
            <div class="row" style="">
                <div class="mx-auto mx-md-0 col-10 col-md-9" style="">
                    <h3 class="display-3 text-left" style="">관리자 페이지</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="py-5" style="">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8" style="">
                    <div class="col-12">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">아이디</th>
                                <th scope="col">닉네임</th>
                                <th scope="col">핸드폰번호</th>
                                <th scope="col">성별</th>
                                <th scope="col">보유 포인트</th>
                                <th scope="col">등급</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td style="">@mdo</td>
                                <td style="">
                                    <div class="btn-group" style="">
                                        <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">관리</button>
                                        <div class="dropdown-menu"><a class="dropdown-item" href="#">정보 수정</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">회원 삭제</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#" style="">상세 정보</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                                <td>@fat</td>
                                <td>@fat</td>
                                <td>@fat</td>
                                <td>
                                    <div class="btn-group">
                                        <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">관리</button>
                                        <div class="dropdown-menu"><a class="dropdown-item" href="#">정보 수정</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">회원 삭제</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#" style="">상세 정보</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                                <td>@twitter</td>
                                <td>@twitter</td>
                                <td>@twitter</td>
                                <td contenteditable="true">
                                    <div class="btn-group">
                                        <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">관리</button>
                                        <div class="dropdown-menu"><a class="dropdown-item" href="#">정보 수정</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">회원 삭제</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#" style="">상세 정보</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="d-flex justify-content-end"><a class="btn btn-link mr-3" href="#">사용자 생성</a></div>
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>
    </div>
    <div class="border-top border-light">
        <div class="container">
            <div class="row text-center align-items-center">
                <div class="p-4 col-md-4">
                    <h2 class="mb-4">Your Line</h2>
                    <p>Your Line은 제주에서 더 가치있는 경험을 추구합니다. 더 이상 기다리지 마세요.</p>
                </div>
                <div class="p-4 col-md-4">
                    <h2 class="mb-4">Mapsite</h2>
                    <ul class="list-unstyled"><a href="#" class="text-dark">Home</a> <br> <a href="#" class="text-dark">About
                        us</a> <br> <a href="#" class="text-dark">Our services</a> <br> <a href="#" class="text-dark">Stories</a>
                    </ul>
                </div>
                <div class="p-4 col-md-4">
                    <h2 class="mb-4">Contact</h2>
                    <p><a href="#" class="text-dark">
                        <i class="fa d-inline mr-3 text-muted fa-phone"></i>+082 10 1234 5678</a></p>
                    <p><a href="#" class="text-dark">
                        <i class="fa d-inline mr-3 text-muted fa-envelope-o"></i>info@yourline.com</a></p>
                    <p><a href="#" class="text-dark">
                        <i class="fa d-inline mr-3 fa-map-marker text-muted"></i>154904, 제주시, JEJU</a></p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 mt-3">
                    <p class="text-center">© Copyright 2019 YourLine - All rights reserved. </p>
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="./js/navscroll.js"></script>
    <script src="./js/upbtn.js"></script>
</body>
</html>
