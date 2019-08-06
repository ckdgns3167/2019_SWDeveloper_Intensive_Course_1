<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="py-5 text-center bg-light">
    <div class="container">
        <div class="row">
            <div class="mx-auto col-lg-6 bg-white rounded px-5 py-3" style="">
                <h1>회원 탈퇴가 완료되었습니다.&nbsp;</h1>
                <p class="mb-4">지금까지 Your Line 서비스를 이용해주셔서 감사합니다.<br>저희는 더 나은 서비스로 고객님의 요구사항을 만족시킬 수 있도록<br>노력하겠습니다.</p>
                <button class="btn btn-primary" onclick="location.href='/Main.jsp'">메인으로 이동</button>
                <p class="small my-2">info@yourline.com 으로 고객님의 불편사항을 알려주세요<br>더 나은 서비스를 제공하는데 큰 도움이 됩니다.</p>
            </div>
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
