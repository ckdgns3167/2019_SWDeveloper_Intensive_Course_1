<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
<script src="https://www.paypal.com/sdk/js?client-id=ATd9ZdqA9Vu29VcxMm21yM7XYgq8xtqe8oS554wozgI6YkeFm7Yo7sGxuWfotowYNrL_K5uISj67R_ec&amp;components=buttons,marks">
</script>
<!-- navigation bar -->
<nav class="navbar navbar-expand-md navbar-dark bg-transparent fixed-top" style="background-color: #1E1E1E !important;">
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
            <a class="btn navbar-btn ml-md-2 text-dark btn-light btn-sm" href="./SignUp.jsp">회원가입</a>
            <a class="btn navbar-btn ml-md-2 text-dark btn-light btn-sm" href="./Login.jsp">로그인</a>
            <%} else { %>
            <a class="btn navbar-btn ml-md-2 text-dark btn-light btn-sm" href="./Logout_process2.jsp">로그아웃</a>
            <%}%>
        </div>
    </div>
</nav>
<div class="py-5 text-center" style="">
    <div class="container">
        <div class="row">
            <div class="mx-auto col-md-12 mt-5">
                <h1 class="mb-3">웹 소개</h1>
            </div>
        </div>
        <div class="row" style="">
            <div class="col-lg-1 col-1 p-4" style=""></div>
            <div class="col-lg-10 col-10 p-4" style="">
                <span>제주 내에서 대기열이 생기는 지역 주변의 사람과&nbsp;<br>제주 관광을 보다 원활하게 즐기고 싶은 사람들을&nbsp;이어 줌으로써&nbsp;<br>여행자들의 낭비되는 시간을 감소시켜 주는 서비스입니다.<br>주된 기능으로는 구매자가 사이트에서 현금화가 가능한 포인트를 구매하여&nbsp;<br>이 포인트를 사용해 게시판에 대기해줄 사람을 찾고,&nbsp;대기해줄 사람이 답글을 달아&nbsp;<br>&nbsp;그를 통해 거래를 완료하여 게시글에 사용된 포인트를 대기해줄 사람에게 지불합니다.&nbsp;<br>결과적으로 일정 포인트 이상을 적립한 대기자는 그를 현금화하여 사용 할 수 있게 됩니다..</span>
            </div>
            <div class="col-lg-1 col-1 p-4"></div>
        </div>
        <div class="row d-flex justify-content-center">
        </div>
    </div>
</div>
<div class="py-5 text-center border-top border-bottom" style="">
    <div class="container">
        <div class="row">
            <div class="mx-auto col-md-12" style="">
                <h1 class="mb-3">포인트 제도</h1>
            </div>
        </div>
        <div class="row" style="">
            <div class="col-lg-6"> <img src="images/Point.png" style="" class="col-12 mt-5">
            </div>
            <div class="col-lg-6 col-1 p-4" style="">
                <span> 포인트 제도를 통해 구매자의 <b>신뢰</b>를 더 확실히 얻을 수 있습니다.&nbsp;<br>&nbsp;예약 구매 형식으로 포인트를 통해 거래하며<br>&nbsp;Helper가 정해진 약속시간에 나타나지 않고&nbsp;<br>Buyer가 Helper를 게시판을 통해 구하고 약속을 취소하거나,&nbsp;<br>&nbsp;서비스만 이용하고 금액을 지불하지 않을 경우 등을 제외하고&nbsp;<br>Helper의 지원 횟수, 거래 완료 시의 평가를 통해 등급을 올려주고<br>&nbsp;이 등급을 통해 수수료를 차등 적용하여<br>&nbsp;더 나은, 더 자주 서비스를 제공하는 이들에게 <b>인센티브</b>가 주어 집니다 </span>
            </div>
        </div>
        <div class="row d-flex justify-content-center">
        </div>
    </div>
</div>
<div class="py-5 text-center">
    <div class="container">
        <div class="row">
            <div class="mx-auto col-md-12" style="">
                <h1 class="mb-3">레벨</h1>
            </div>
        </div>
        <div class="row" style="">
            <div class="col-lg-1.5" style=""> <img class="img-fluid d-block mb-3 mx-auto rounded-circle" src="images/grade0.png" width="130">
                <h4><b>Level 0</b></h4>
            </div>
            <div class="col-lg-0.5"><img class="img-fluid d-block rounded-circle my-4 mb-3" src="images/back.png" width="70">
            </div>
            <div class="col-lg-1.5" style=""> <img class="img-fluid d-block mb-3 mx-auto rounded-circle" src="images/grade1.png" width="130">
                <h4><b>Level 1</b></h4>
            </div>
            <div class="col-lg-0.5"><img class="img-fluid d-block rounded-circle mb-3 my-4" src="images/back.png" width="70">
            </div>
            <div class="col-lg-1.5" style=""> <img class="img-fluid d-block mb-3 mx-auto rounded-circle" src="images/grade2.png" width="130">
                <h4><b>Level 2</b></h4>
            </div>
            <div class="col-lg-0.5"><img class="img-fluid d-block rounded-circle mb-3 my-4" src="images/back.png" width="70">
            </div>
            <div class="col-lg-1.5" style=""> <img class="img-fluid d-block mb-3 mx-auto rounded-circle" src="images/grade3.png" width="130">
                <h4> <b>Level 3</b></h4>
            </div>
            <div class="col-lg-0.5"><img class="img-fluid d-block rounded-circle my-4 mb-3" src="images/back.png" width="70">
            </div>
            <div class="col-lg-1.5" style=""> <img class="img-fluid d-block mb-3 mx-auto rounded-circle" src="images/grade4.png" width="130">
                <h4> <b>Level 4</b></h4>
            </div>
            <div class="col-lg-0.5"><img class="img-fluid d-block rounded-circle mx-auto mb-3 my-4" src="images/back.png" width="70">
            </div>
            <div class="col-lg-1.5" style=""> <img class="img-fluid d-block mb-3 mx-auto rounded-circle" src="images/grade5.png" width="130">
                <h4> <b>Level 5</b></h4>
            </div>
            <div class="col-lg-0.5">
            </div>
        </div>
        <div class="row d-flex justify-content-center">
        </div>
    </div>
</div>
<div class="py-5 text-center">
    <div class="container">
        <div class="row">
            <div class="mx-auto col-md-12">
                <h1 class="mb-3">팀원 소개</h1>
            </div>
        </div>
        <div class="row" style="">
            <div class="col-lg-1 col-1 p-4" style=""></div>
            <div class="col-lg-2 p-4"> <img class="img-fluid d-block mb-3 mx-auto rounded-circle" src="images/진수민.jpg" width="150">
                <h4>진수민</h4>
                <p class="mb-0">제주대</p>
            </div>
            <div class="col-lg-2 p-4"> <img class="img-fluid d-block mb-3 mx-auto rounded-circle" src="images/정창훈.jpg" width="150">
                <h4> <b>정창훈</b></h4>
                <p class="mb-0">충남대</p>
            </div>
            <div class="col-lg-2 p-4"> <img class="img-fluid d-block mb-3 mx-auto rounded-circle" src="images/유시온.jpg" width="150">
                <h4> <b>유시온</b></h4>
                <p class="mb-0">대덕소프트웨어&nbsp;<br>마이스터<br>&nbsp;고등학교</p>
            </div>
            <div class="col-lg-2 p-4"> <img class="img-fluid d-block mb-3 mx-auto rounded-circle" src="images/박민준.jpg" width="150">
                <h4> <b>박민준</b></h4>
                <p class="mb-0">삼육대</p>
            </div>
            <div class="col-lg-2 p-4"> <img class="img-fluid d-block mb-3 mx-auto rounded-circle" src="images/오지수.jpg" width="150">
                <h4> <b>오지수</b></h4>
                <p class="mb-0">삼육대</p>
            </div>
            <div class="col-lg-1 col-1 p-4"></div>
        </div>
        <div class="row d-flex justify-content-center">
        </div>
    </div>
</div>
<!--sli -->
<div class="py-5" style="">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="carousel slide pointer-event" data-ride="carousel" id="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item"> <img class="d-block img-fluid w-50" src="./images/단체사진.jpg" style="margin-left:25%; height: 400px;">
                        </div>
                        <div class="carousel-item active"> <img class="d-block img-fluid w-50" src="./images/sw 개발자.png" style="margin-left:25%; height : 400px">
                        </div>
                        <div class="carousel-item"> <img class="d-block img-fluid w-50" src="./images/단체사진2.jpg" style="margin-left:25%;  height : 400px">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span> </a> <a class="carousel-control-next" href="#carousel" role="button" data-slide="next"> <span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span> </a>
                </div>
            </div>
        </div>
        <div class="row">
        </div>
    </div>
</div>
<!--yourline 설명문-->
<div class="py-5 text-center">
    <div class="container">
        <div class="row">
            <div class="mx-auto col-md-8">
                <h1 style="">Your Line</h1>
                <p class="mb-4"> 아직까지 줄서서 기다리시나요? YOUR LINE이 당신의 시간을 만들어드립니다.</p>
                <div class="row text-muted">
                    <div class="col-md-2 col-4 p-2"> <i class="d-block fa fa-angellist fa-3x "></i> </div>
                    <div class="col-md-2 col-4 p-2"> <i class="d-block fa fa-cc-visa fa-3x "></i> </div>
                    <div class="col-md-2 col-4 p-2"> <i class="d-block fa fa-empire fa-3x"></i> </div>
                    <div class="col-md-2 col-4 p-2"> <i class="d-block fa fa-paypal fa-3x "></i> </div>
                    <div class="col-md-2 col-4 p-2"> <i class="d-block fa fa-rebel fa-3x "></i> </div>
                    <div class="col-md-2 col-4 p-2"> <i class="d-block fa fa-first-order fa-3x"></i> </div>
                </div>
            </div>
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
<!-- fixed button -->
<div class="">
    <div class="container-fluid fixed-bottom" style="">
        <div class="row">
            <div class="col-md-12 ml-atuo">
                <a id="link-to-top" href="#" class="btn btn-primary float-right mb-3 mr-3" style="display: none;"><i class="fa fa-arrow-up" aria-hidden="true"></i></a>
            </div>
        </div>
    </div>
</div>

<!--payment modal-->
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous" style=""></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.21.0/moment.min.js" type="text/javascript"></script>
<script src="./js/lib/bootstrap-datetimepicker.min.js"></script>
<script src="./js/navscroll.js"></script>
<script src="./js/upbtn.js"></script>
<script>
    // Date Time Picker
    $(function() {
        $('#example1').datetimepicker({
            format : 'DD/MM/YYYY HH:mm',
            minDate: new Date()
        });
        $('#example2').datetimepicker({
            format : 'DD/MM/YYYY HH:mm',
            useCurrent: false //Important! See issue #1075
        });
        $("#example1").on("dp.change", function(e) {
            $('#example2').data("DateTimePicker").minDate(e.date);
        });
        $("#example2").on("dp.change", function(e) {
            $('#example1').data("DateTimePicker").maxDate(e.date);
        });
    });
    $('#hinge').click(function() {
        $('#hinged').addClass("hinge");
    });

    //payment
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
