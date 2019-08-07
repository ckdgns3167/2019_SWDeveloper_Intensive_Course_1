<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<%
    String id = session.getAttribute("userId").toString();
    String nickname = session.getAttribute("userNickname").toString();
    String phone = session.getAttribute("userPhone").toString();
    phone = phone.substring(0, 3) + "-" + phone.substring(3, 7) + "-" + phone.substring(7, 11);
    Integer point = (Integer) session.getAttribute("userPoint");
    Integer grade = (Integer) session.getAttribute("userGrade");

    String level_1_image = "images/grade0.png";
    String level_2_image = "images/grade1.png";
    String level_3_image = "images/grade2.png";
    String level_4_image = "images/grade3.png";
    String level_5_image = "images/grade4.png";
    String level_6_image = "images/grade5.png";
    String level_image = null;
    String myLevel = null;
    if (0 <= grade && grade <= 999) {//unRank
        level_image = level_1_image;
        myLevel = "Level 0 : 인턴";
    } else if (1000 <= grade && grade <= 1999) {// level 1
        level_image = level_2_image;
        myLevel = "Level 1 : 사원";
    } else if (2000 <= grade && grade <= 2999) {// level 2
        level_image = level_3_image;
        myLevel = "Level 2 : 대리";
    } else if (3000 <= grade && grade <= 3999) {// level 3
        level_image = level_4_image;
        myLevel = "Level 3 : 과장";
    } else if (4000 <= grade && grade <= 4999) {// level 4
        level_image = level_5_image;
        myLevel = "Level 4 : 차장";
    } else if (5000 <= grade && grade <= 5999) {// level 5
        level_image = level_6_image;
        myLevel = "Level 5 : 부장";
    }
    // 0 ~ 100이 아닌 0 ~ 999 사이의 값을 %으로 표현하는 방법을 알아내야함
    Integer percent = grade % 1000; //4자리 숫자인 grade를 뒤에 세자리만 가지고 하는 일이니까 1000으로 나눈 나머지를 이용한다.
    percent = percent / 999 * 100;


%>
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
        function popUpX(width) {
            return (window.screen.width / 2) - (width / 2)
        }

        function popUpY(height) {
            return (window.screen.height / 2) - (height / 2)
        }

        function open_Modify_Or_Withdrawal(val) {// 마이페이지에서 정보 수정(0), 회원 탈퇴 버튼(1) 을 눌렀을 때 일이 일어나도록 하는 함수.

            if (val == "0") {//수정하기
                console.log("수정하기");
                var url = ctxPath + "/UserInfoModify.jsp";
                open(url, "수정하기", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=180,left=" + popUpX(500) + ", top=" + popUpY(300));
            } else if (val == "1") {//탈퇴하기
                console.log("탈퇴하기");
                var url = ctxPath + "/UserWithdrawal.jsp";
                open(url, "탈퇴하기", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=180,left=" + popUpX(500) + ", top=" + popUpY(300));
            }
        }

        function logout() {//로그아웃 버튼을 눌럿을 때
            location.href = ctxPath + "/Logout_process2.jsp";
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
                                <div class="col-md-4"><img class="img-fluid d-block rounded-circle" src="images/profile.png"></div>
                            </div>
                            <div class="row">
                                <div class="col-md-4" style="">
                                    <h5 class="text-right">아이디</h5>
                                </div>
                                <div class="col-md-8" style="">
                                    <h6 class="text-muted" style=""><%=id%>
                                    </h6>
                                </div>
                                <div class="col-md-4">
                                    <h5 class="text-right">닉네임</h5>
                                </div>
                                <div class="col-md-8">
                                    <h6 class="text-muted"><%=nickname%>
                                    </h6>
                                </div>
                                <div class="col-md-4">
                                    <h5 class="text-right">포인트</h5>
                                </div>
                                <div class="col-md-8">
                                    <h6 class="text-muted"><%=point%>
                                    </h6>
                                </div>
                                <div class="col-md-4">
                                    <h5 class="text-right">핸드폰</h5>
                                </div>
                                <div class="col-md-8">
                                    <h6 class="text-muted"><%=phone%>
                                    </h6>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <button class="card-link" onclick="open_Modify_Or_Withdrawal(0)">수정하기</button>
                                    <button class="card-link text-warning" onclick="">환급하기</button>
                                    <button class="card-link text-danger" onclick="open_Modify_Or_Withdrawal(1)">탈퇴하기</button>
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
                                <h5 class="card-title"><b>나의 등급</b></h5>
                                <div class="row">
                                    <div class="col-md-12 mb-2"><img class="img-fluid d-block mx-auto"
                                                                     src="<%=level_image%>" width="200"></div>
                                    <!---------------------------------------------------------->
                                </div>
                                <div>
                                    <h3 class="card-text text-center mb-1 text-success"><b><%=myLevel%>
                                    </b></h3>
                                    <!---------------------------------------------------------->
                                </div>
                                <div class="row">
                                    <div class="col-md-12 mb-2">
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-striped" role="progressbar"
                                                 style="width: <%=percent%>%"><%=percent%>%
                                                <!---------------------------------------------------------->
                                            </div>
                                        </div>
                                    </div>
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