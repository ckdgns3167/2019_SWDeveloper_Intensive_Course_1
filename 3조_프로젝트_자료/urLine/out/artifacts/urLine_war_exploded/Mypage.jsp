
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<%
    Object userType_o = session.getAttribute("userType");
    Object id_o = session.getAttribute("userId");
    Object profile = session.getAttribute("profile");

    Integer userType = null;
    String id = null;
    if (id_o != null) {
        id = id_o.toString();
    }
    if (userType_o != null) {
        userType = (Integer) userType_o;
    }

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
        myLevel = "Level 0 : 유급";
    } else if (1000 <= grade && grade <= 1999) {// level 1
        level_image = level_2_image;
        myLevel = "Level 1 : 훈련병";
    } else if (2000 <= grade && grade <= 2999) {// level 2
        level_image = level_3_image;
        myLevel = "Level 2 : 이등병";
    } else if (3000 <= grade && grade <= 3999) {// level 3
        level_image = level_4_image;
        myLevel = "Level 3 : 일병";
    } else if (4000 <= grade && grade <= 4999) {// level 4
        level_image = level_5_image;
        myLevel = "Level 4 : 상병";
    } else if (5000 <= grade && grade <= 5999) {// level 5
        level_image = level_6_image;
        myLevel = "Level 5 : 병장";
    }
    // 0 ~ 100이 아닌 0 ~ 999 사이의 값을 %으로 표현하는 방법을 알아내야함
    Double percent = Double.valueOf(grade % 1000); //4자리 숫자인 grade를 뒤에 세자리만 가지고 하는 일이니까 1000으로 나눈 나머지를 이용한다.
    percent = percent / 999 * 100;

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
    <link rel="stylesheet" href="./css/style.css">
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
<script src="https://www.paypal.com/sdk/js?client-id=ATd9ZdqA9Vu29VcxMm21yM7XYgq8xtqe8oS554wozgI6YkeFm7Yo7sGxuWfotowYNrL_K5uISj67R_ec&amp;components=buttons,marks">
</script>
<!-- navigation bar -->
<nav class="navbar navbar-expand-md navbar-dark bg-transparent fixed-top" style="">
    <div class="container"><a class="navbar-brand" href="#">
        <img src="./images/logo_w.png" alt="">
    </a>
        <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse"
                data-target="#navbar16">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar16">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a class="nav-link" href="./Main.jsp">메인</a></li>

                <%if (userType != null){
                    if(userType != 1){%>
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a class="nav-link" href="CreatePost.jsp">글쓰기</a></li>
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a class="nav-link" href="#paymentModal" data-toggle="modal">결제</a></li>
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a
                        class="nav-link" href="./Mypage.jsp" id="mypage">마이페이지</a></li>
                <%}}%>
                <%if (userType != null && userType == 1) {%>
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a
                        class="nav-link" href="./ManagePage.jsp" id="userManager">회원관리</a></li>
                <%}%>
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a
                        class="nav-link" href="./AboutUs.jsp">ABOUT</a></li>

            </ul>
            <%if (id == null) { %>
            <a class="btn navbar-btn ml-md-2 text-dark btn-light btn-sm" href="./Login.jsp">로그인</a>
            <%} else { %>
            <a class="btn navbar-btn ml-md-2 text-dark btn-light btn-sm" href="./Logout_process2.jsp">로그아웃</a>
            <%}%>
        </div>
    </div>
</nav>

<div class="py-5 text-center text-md-right"
     style="background-image: url(./images/mypage-bg.jpg);	background-position: right bottom;	background-size: cover;	background-repeat: repeat; background-attachment: fixed;">
    <div class="container">
        <div class="row" style="">
            <div class="mx-auto mx-md-0 col-10 col-md-9" style="">
                <h3 class="display-3 text-left font-white pt-5" style="">마이 페이지</h3>
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
                                <a class="col-md-6 mx-auto" href="#profileModal" data-toggle="modal"><img class="img-fluid d-block rounded-circle" src="<%=profile%>">
                                </a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4" style=""><h5 class="text-right">아이디</h5></div>
                                <div class="col-md-8" style=""><h6 class="text-muted" style=""><%=id%></h6></div>
                                <div class="col-md-4"><h5 class="text-right">닉네임</h5></div>
                                <div class="col-md-8"><h6 class="text-muted"><%=nickname%></h6></div>
                                <div class="col-md-4"><h5 class="text-right">포인트</h5></div>
                                <div class="col-md-8"><h6 class="text-muted"><%=point%>&nbspP</h6></div>
                                <div class="col-md-4"><h5 class="text-right">핸드폰</h5></div>
                                <div class="col-md-8"><h6 class="text-muted"><%=phone%></h6></div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 text-center mb-2">
                                    <button class="card-link btn btn-outline-primary" onclick="open_Modify_Or_Withdrawal(0)">수정하기</button>
                                    <button class="card-link btn btn-outline-warning" onclick="">환급하기</button>
                                    <button class="card-link btn btn-outline-danger" onclick="open_Modify_Or_Withdrawal(1)">탈퇴하기</button>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><b>나의 댓글</b></h5>
                            <div class="list-group" style="">
                                <a href="#" class="list-group-item list-group-item-action"> 제가 해드릴게요!! </a>
                                <a href="#" class="list-group-item list-group-item-action">네 알겠습니다.</a>
                                <a href="#" class="list-group-item list-group-item-action">감사합니다~~^^*</a>
                                <a href="#" class="list-group-item list-group-item-action">제가 해드릴 수 있어요</a>
                                <a href="#" class="list-group-item list-group-item-action mb-3">ㅇㅋㅇㅋ</a>
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
                                    <div class="col-md-12 mb-2"><img class="img-fluid d-block mx-auto"src="<%=level_image%>" width="200"></div>
                                </div>
                                <div>
                                    <h3 class="card-text text-center mb-2 text-success"><b><%=myLevel%></b></h3>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 mb-2">
                                        <div class="progress" style="height: 1.4rem;">
                                            <div class="progress-bar progress-bar-striped" role="progressbar"
                                                 style="width:<%=Math.round(percent*100)/100.0%>%; text-align: center;"><b><span style="color: black; "><%=Math.round(percent*100)/100.0%>%</span></b>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><b>작성글 보기</b></h5>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between align-items-center"> 제주시 외도동 오후 2시까지 니모메빈티지..<span class="badge badge-primary badge-pill">14</span></li>
                                <li class="list-group-item d-flex justify-content-between align-items-center"> 동호동 돈사촌 고깃집 오흐 7시에.. <span class="badge badge-primary badge-pill">2</span></li>
                                <li class="list-group-item d-flex justify-content-between align-items-center mb-3">카페델문도 카페 오후1시까지...<span class="badge badge-primary badge-pill">1</span></li>
                            </ul>
                            <div class="row">
                                <div class="col-md-12 text-center"><a href="#" class="card-link">더보기<외/a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</div>

<!-- footer -->
<div class="border-top border-light bg-black-opacity-6">
    <div class="container">
        <div class="row text-center align-items-center text-white">
            <div class="p-4 col-md-4">
                <h2 class="mb-4">Your Line</h2>
                <p>Your Line은 제주에서 더 가치있는 경험을 추구합니다. 더 이상 기다리지 마세요.</p>
            </div>
            <div class="p-4 col-md-4">
                <h2 class="mb-4">Mapsite</h2>
                <ul class="list-unstyled"> <a href="#" class="font-white">Home</a> <br> <a href="#" class="font-white">About us</a> <br> <a href="#" class="font-white">Our services</a> <br> <a href="#" class="font-white">Stories</a>
                </ul>
            </div>
            <div class="p-4 col-md-4">
                <h2 class="mb-4">Contact</h2>
                <p> <a href="#" class="font-white">
                    <i class="fa d-inline mr-3 text-muted fa-phone"></i>+082 10 1234 5678</a> </p>
                <p> <a href="#" class="font-white">
                    <i class="fa d-inline mr-3 text-muted fa-envelope-o"></i>info@yourline.com</a> </p>
                <p> <a href="#" class="font-white">
                    <i class="fa d-inline mr-3 fa-map-marker text-muted"></i>154904, 제주시, JEJU</a> </p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 mt-3">
                <p class="text-center font-white">© Copyright 2019 YourLine - All rights reserved. </p>
            </div>
        </div>
    </div>
</div>


<div id="profileModal" class="modal fade">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">프로필 변경</h5> <button type="button" class="close" data-dismiss="modal"> <span>×</span> </button>
            </div>

            <div class="row my-2">
                <div class="input-group px-4">
                    <div class="col-12">
                        <form action="UploadProfile2.jsp" method="post" class="row" enctype="multipart/form-data">
                            <input name="f_file" type="file" class="form-control border rounded">
                            <div class="col-12 pt-2 pr-0 text-right">
                            <button type="submit" class="btn btn-primary">프로필 변경</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div id="paymentModal" class="modal fade" style="">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">포인트 결제</h5> <button type="button" class="close" data-dismiss="modal"> <span>×</span> </button>
            </div>
            <div class="modal-body">
                <div class="col-md-12 px-5" style="">
                    <!-- Render the radio buttons and marks -->
                    <ul class="list-group mb-3">
                        <li class=" border-0 list-group-item d-flex justify-content-between align-items-center">100 포인트&nbsp;<label>1 USD&nbsp;<input type="radio" name="payment-option" value="100" checked=""> </label></li>
                        <li class=" border-0 list-group-item d-flex justify-content-between align-items-center">300 포인트<label>2.9 USD&nbsp;<input type="radio" name="payment-option" value="300"> </label></li>
                        <li class=" border-0 list-group-item d-flex justify-content-between align-items-center" style="">500포인트<label>4.8 USD&nbsp;<input type="radio" name="payment-option" value="500"> </label></li>
                        <li class=" border-0 list-group-item d-flex justify-content-between align-items-center">800 포인트&nbsp;<label>7.6 USD&nbsp;<input type="radio" name="payment-option" value="800"> </label></li>
                        <li class="border-0 list-group-item d-flex justify-content-between align-items-center">1000 포인트&nbsp;<label>9.4 USD&nbsp;<input type="radio" name="payment-option" value="1000"> </label></li>
                        <li class=" border-0 list-group-item d-flex justify-content-between align-items-center">2000 포인트&nbsp;<label contenteditable="true">18 USD&nbsp;<input type="radio" name="payment-option" value="2000"> </label></li>
                    </ul>
                </div>
            </div>
            <div class="modal-footer">
                <div id="paypal-button-container" class="">
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" style=""></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous" style="">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous" style=""></script>
<script src="./js/navscroll.js" style=""></script>
<script src="./js/upbtn.js" style=""></script>
<script style="">
    var money = 1;
    var point = 100;

    function ajaxGet(url, fpOK, fpFail){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.readyState==4){
                if(xhr.status == 200 ){
                    if( fpOK){
                        fpOK(xhr.responseText);
                    }
                }else{
                    if(fpFail){
                        alert("error: "+xhr.status);
                    }
                }
            }
        };
        xhr.open('GET',url,true);
        xhr.send( null );
    }

    // Render the PayPal marks
    paypal.Marks().render('#paypal-marks-container');
    // Listen for changes to the radio buttons
    document.querySelectorAll('input[name=payment-option]').forEach(function(el) {
        el.addEventListener('change', function(event) {
            // If PayPal is selected, show the PayPal button
            if (event.target.value === '100') {
                money = 1;
                point = 100;
            }
            if (event.target.value === '300') {
                money = 2.9;
                point = 300;
            }
            if (event.target.value === '500') {
                money = 4.8;
                point = 500;
            }
            if (event.target.value === '800') {
                money = 7.6;
                point = 800;
            }
            if (event.target.value === '1000') {
                money = 9.3;
                point = 1000;
            }
            if (event.target.value === '2000') {
                money = 18;
                point = 2000;
            }
        });
    });
    // Render the PayPal buttons
    paypal.Buttons({
        createOrder: function(data, actions) {
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        value: money
                    }
                }]
            });
        },
        onApprove: function(data, actions) {
            return actions.order.capture().then(function(details) {
                alert(point + ' 포인트 결제가 완료되었습니다. 사용자 이름:' + details.payer.name.given_name);

                var url = "PaymentModal2.jsp?point=" + point;
                ajaxGet(url, function (rt) {
                    alert(rt);
                    window.setTimeout($('#paymentModal').modal('hide'), 1000);
                    window.setTimeout(function () {
                        window.location.reload()
                    }, 1500);

                });
                // Call your server to save the transaction
                return fetch('/paypal-transaction-complete', {
                    method: 'post',
                    headers: {
                        'content-type': 'application/json'
                    },
                    body: JSON.stringify({
                        orderID: data.orderID
                    })
                });
            });
        }
    }).render('#paypal-button-container');
</script>
</body>

</html>
