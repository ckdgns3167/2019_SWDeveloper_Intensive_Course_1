<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          type="text/css">
    <link rel="stylesheet" href="css/mypage.css">
    <script type="text/javascript">
        var ctxPath = "<%=request.getContextPath()%>";
        // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
        function popUpX(width){
            return (window.screen.width / 2) - (width / 2)
        }
        function popUpY(height){
            return (window.screen.height / 2) - (height / 2)
        }
        function open_Modify_Or_Withdrawal(val) {// 마이페이지에서 정보 수정(0), 회원 탈퇴 버튼(1) 을 눌렀을 때 일이 일어나도록 하는 함수.

            if (val == "0") {//정보수정
                var url = ctxPath + "/UserInfoModify.jsp";
                open(url, "정보수정", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=310,height=180,left="+ popUpX(310) + ", top="+ popUpY(180));
            } else if (val == "1") {//회원탈퇴
                var url = ctxPath + "/UserWithdrawal.jsp";
                open(url, "탈퇴하기", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=310,height=180,left="+ popUpX(310) + ", top="+ popUpY(180));
            }
        }
        function logout(){//로그아웃 버튼을 눌럿을
            location.href=ctxPath+"/Logout_process2.jsp";
        }
    </script>
</head>

<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container"><a class="navbar-brand" href="#">
        <i class="fa d-inline fa-lg fa-stop-circle"></i>
        <b> BRAND</b>
    </a>
        <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse"
                data-target="#navbar10">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar10">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="#">Features</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Pricing</a></li>
                <li class="nav-item"><a class="nav-link" href="#">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#">FAQ</a></li>
            </ul>
            <a class="btn navbar-btn ml-md-2 btn-light text-dark">Contact us</a>
        </div>
    </div>
</nav>
<div class="py-5 text-center text-md-right"
     style="background-image: url(https://static.pingendo.com/cover-bubble-dark.svg);	background-position: right bottom;	background-size: cover;	background-repeat: repeat; background-attachment: fixed;">
    <div class="container">
        <div class="row" style="">
            <div class="mx-auto mx-md-0 col-10 col-md-9" style="">
                <h3 class="display-3 text-left" style="">마이 페이지</h3>
            </div>
        </div>
    </div>
</div>
<div class="py-5" style="">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8 px-5 border-left border-right border-light">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body" style="">
                                <h5 class="card-title"><b>프로필</b></h5>
                                <div class="row">
                                    <div class="col-md-4"><img class="img-fluid d-block rounded-circle"
                                                               src="images/profile.png"></div>
                                    <div class="col-md-8 align-self-center" style="">
                                        <div class="row mt-2">
                                            <div class="col-md-3 align-self-center px-0" style="">
                                                <h3>Id</h3>
                                            </div>
                                            <div class="col-md-9" style="">
                                                <h3 class="text-muted" style="">아이디</h3>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3 align-self-center px-0">
                                                <h3>별명</h3>
                                            </div>
                                            <div class="col-md-9">
                                                <h3 class="text-muted">닉네임</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <h5 class="text-right">Phone</h5>
                                    </div>
                                    <div class="col-md-8">
                                        <h5 class="text-muted">010-1234-5678</h5>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-center">
                                        <button class="card-link" onclick="open_Modify_Or_Withdrawal(0)">정보수정</button>
                                        <button  class="card-link text-warning" onclick="logout()">로그아웃</button>
                                        <button  class="card-link text-danger" onclick="open_Modify_Or_Withdrawal(1)">회원탈퇴</button>
                                </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><b>나의 댓글</b></h5>
                            <div class="list-group" style="">
                                <a href="#" class="list-group-item list-group-item-action"> Cras justo odio </a>
                                <a href="#" class="list-group-item list-group-item-action">Dapibus ac facilisis in</a>
                                <a href="#" class="list-group-item list-group-item-action">Morbi leo risus</a>
                                <a href="#" class="list-group-item list-group-item-action">Porta ac consectetur ac</a>
                                <a href="#" class="list-group-item list-group-item-action mb-3">Vestibulum at eros</a>
                            </div>
                            <div class="row">
                                <div class="col-md-12 text-center"><a href="#" class="card-link">더보기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6" style="">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title"><b>포인트</b></h5>
                                <div class="row">
                                    <div class="col-md-12 mb-2"><img class="img-fluid d-block mx-auto"
                                                                     src="images/grade0.png" width="200"></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <h3 contenteditable="true" class="text-right"><i class="fa fa-diamond"></i>
                                            Point</h3>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-12" style="">
                                            <h3 class="text-muted" style="">1300</h3>
                                        </div>
                                    </div>
                                </div>
                                <p class="card-text text-center mb-1">현재 회원님의 등급은</p>
                                <h3 class="card-text text-center mb-1 text-success"><b>Level 1</b></h3>
                                <p class="card-text text-center">입니다.</p>
                                <div class="row">
                                    <div class="col-md-12 mb-2">
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-striped" role="progressbar"
                                                 style="width: 50%">50%
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-center"><a href="#" class="card-link">포인트 충전</a><a
                                            href="#" class="card-link">포인트 반환</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><b>작성글 보기</b></h5>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between align-items-center"> Cras
                                    justo odio <span class="badge badge-primary badge-pill">14</span></li>
                                <li class="list-group-item d-flex justify-content-between align-items-center"> Dapibus
                                    ac facilisis in <span class="badge badge-primary badge-pill">2</span></li>
                                <li class="list-group-item d-flex justify-content-between align-items-center mb-3">
                                    Morbi leo risus <span class="badge badge-primary badge-pill">1</span></li>
                            </ul>
                            <div class="row">
                                <div class="col-md-12 text-center"><a href="#" class="card-link">더보기</a></div>
                            </div>
                        </div>
                    </div>
                </div>
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<pingendo onclick="window.open('https://pingendo.com/', '_blank')"
          style="cursor:pointer;position: fixed;bottom: 20px;right:20px;padding:4px;background-color: #00b0eb;border-radius: 8px; width:220px;display:flex;flex-direction:row;align-items:center;justify-content:center;font-size:14px;color:white">
    Made with Pingendo Free&nbsp;&nbsp;<img src="https://pingendo.com/site-assets/Pingendo_logo_big.png" class="d-block"
                                            alt="Pingendo logo" height="16"></pingendo>
</body>

</html>
</html>