<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%
    Object userType_o =  session.getAttribute("userType");
    Object id_o = session.getAttribute("userId");
    Integer userType = null;
    String id = null;
    if(id_o!=null){
        id = id_o.toString();
    }
    if(userType_o!=null){
        userType = (Integer) userType_o;
    }
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Title" content="Your Line">
    <meta http-equiv="Subject" content="�ټ��� ���� ����">
    <meta http-equiv="Page-Enter" content="revealtrans(Duration=1,Transition=12)">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          type="text/css">
    <link rel="stylesheet" href="css/font2.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="http://anijs.github.io/lib/anicollection/anicollection.css">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&amp;display=swap" rel="stylesheet">
</head>

<body class="">
<!-- navigation bar -->
<nav class="navbar navbar-expand-md navbar-dark bg-transparent fixed-top">
    <div class="container"><a class="navbar-brand" href="main.html">
        <img src="./images/logo.png" alt="logo" width="175px"></a>
        <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse"
                data-target="#navbar16">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar16">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a class="nav-link" href="./Main.jsp">����</a></li>
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a class="nav-link" href="#">�۾���</a></li>
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a class="nav-link" href="./PaymentPage.jsp">����</a></li>

                    <%if (userType == null || userType == 2) { %>
                    <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a class="nav-link" href="./Mypage.jsp" id="mypage">����������</a></li>
                    <%} else if(userType != null && userType == 1){%>
                    <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a class="nav-link" href="./ManagePage.jsp" id="userManager">ȸ������</a></li>
                    <%}%>
                    <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a class="nav-link" href="./AboutUs.jsp">ABOUT</a></li>

            </ul>
            <%if(id == null){ %>
            <a class="btn navbar-btn ml-md-2 text-dark btn-sm" href="./Login.jsp">�α���</a>
            <%} else{ %>
            <a class="btn navbar-btn ml-md-2 text-dark btn-sm" href="./Logout_process2.jsp">�α׾ƿ�</a>
            <%}%>
        </div>
    </div>
</nav>
<!-- parallex -->
<div class="py-5 text-center"
     style="background-image: url(&quot;./images/parallax-bg.jpg&quot;); background-position: right bottom; background-size: cover; background-repeat: repeat; background-attachment: fixed;">
    <div class="container">
        <div class="row" style="">
            <div class="bg-white-opacity-6 mt-5 p-4 col-10 mx-auto mx-md-0 col-lg-6 rounded">
                <h1 style="">���� �ٷ� �˻��ϼ���!</h1>
                <p class="mb-4" style="">�������� �ټ��� ��ٸ��ó���? <br>YOUR LINE�� ����� �ð��� �����帳�ϴ�.</p>
                <div class="col-md-12 px-5" style="">
                    <h3 class="mb-3" style="">�˻� ���� ����</h3>
                    <form style="">
                        <div class="form-group"><label>���� �Ͻ�</label>
                            <input type="text" class="form-control border rounded" id="example1">
                            <div class="form-group mb-0"><label>���� �Ͻ�</label>
                                <input type="text" class="form-control border rounded" id="example2"></div>
                            <div class="form-group mb-0" style=""><label>���� ����</label>
                                <div class="btn-group btn-block shadow-none border rounded">
                                    <button class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> ����
                                        ����
                                    </button>
                                    <div class="dropdown-menu" x-placement="bottom-start"
                                         style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 38px, 0px);">
                                        <a class="dropdown-item" href="#">���ֵ�</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">���ֽ�</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">������</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn mt-4 btn-block btn-outline-dark p-2"><b>������ ����� �˻�</b></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- main content -->
<div class="py-3" style="background-color: #ffffff">
    <div class="container-fluid">
        <div class="row">
            <!-- profile -->
            <div class="col-md-3 border-4 border-right" style=""><img class="img-fluid p-1" src="./images/sion.jpg"
                                                                      style="">
                <ul class="list-group">
                    <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"> �г��� :
                        si_Off <i class="fa fa-list text-muted fa-lg"></i></li>
                    <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"> ����Ʈ : 3892p
                        <i class="fa fa-pie-chart text-muted fa-lg"></i></li>
                    <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"><i
                            class="fa fa-cog text-muted fa-lg"></i></li>
                    <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"> LOG OUT <i
                            class="fa fa-sign-out text-muted fa-lg"></i></li>
                </ul>
            </div>
            <!-- content -->
            <div class="col-md-6 border-left border-right border-light" style="">
                <div id="hinged" class="card mb-3">
                    <div class="card-header">
                        <div style="display: inline-block; margin-top: 8px">�������屹 4��(����:2 ���:2) �ټ��� ��Ź�帱�Կ�!!</div>
                        <a id="hinge" class="btn btn-primary float-right"
                           style="background-color: #ffffff; display: inline-block"><i
                                class="fa fa-minus fa-fw fa-1x py-1"></i></a>
                    </div>
                    <div class="card-body p-2 mt-0">
                        <div class="row">
                            <div class="col-md-2"><img class="img-fluid rounded-circle"
                                                       src="https://static.pingendo.com/img-placeholder-3.svg"
                                                       width="100"></div>
                            <div class="col-md-2 px-0 align-self-center">
                                <div class="col-md-12">
                                    <h4 class="">�ڹ���</h4>
                                    <h8 class="">19.08.06</h8>
                                </div>
                            </div>
                            <div class="col-md-8 align-self-center">
                                <div class="col-md-12">
                                    <p class="mb-0">���� �������� ��ȣ���� ��ġ�ϰ� �ִµ� �ִٰ� ���� 5�� 30���� ����Ļ� �Ϸ� ���ſ���~~ �׷� �ִٰ�
                                        �˰ڽ��ϴ�. </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-muted text-right"> 2 days ago</div>
                </div>
                <!-- ���� ���� -->
            </div>
            <!-- plus content -->
            <div class="col-md-3 border-0 border-left-0" style="">
                <div class="carousel slide" data-ride="carousel" id="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item"><img class="d-block img-fluid w-100" src="./images/bd.jpg">
                            <div class="carousel-caption">
                                <h5 class="m-0"></h5>
                                <p></p>
                            </div>
                        </div>
                        <div class="carousel-item"><img class="d-block img-fluid w-100" src="./images/jm.jpg">
                            <div class="carousel-caption">
                                <h5 class="m-0"></h5>
                                <p></p>
                            </div>
                        </div>
                        <div class="carousel-item active"><img class="d-block img-fluid w-100" src="./images/wj.jpg">
                            <div class="carousel-caption">
                                <h5 class="m-0"></h5>
                                <p></p>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev"> <span
                            class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span> </a> <a
                        class="carousel-control-next" href="#carousel" role="button" data-slide="next"> <span
                        class="carousel-control-next-icon"></span> <span class="sr-only">Next</span> </a>
                </div>
                <!-- list-->
                <ul class="list-group">
                    <li class="list-group-item d-flex justify-content-between align-items-center"> Cras justo odio <span
                            class="badge badge-primary badge-pill">14</span></li>
                    <li class="list-group-item d-flex justify-content-between align-items-center"> Dapibus ac facilisis
                        in <span class="badge badge-primary badge-pill">2</span></li>
                    <li class="list-group-item d-flex justify-content-between align-items-center"> Morbi leo risus <span
                            class="badge badge-primary badge-pill">1</span></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- footer -->
<div class="border-top border-light" style="background-color: #a0e4ff">
    <div class="container text-dark">
        <div class="row text-center align-items-center">
            <div class="p-4 col-md-4">
                <h2 class="mb-4 text-white">Your Line</h2>
                <p>Your Line�� ���ֿ��� �� ��ġ�ִ� ������ �߱��մϴ�. �� �̻� ��ٸ��� ������.</p>
            </div>
            <div class="p-4 col-md-4">
                <h2 class="mb-4 text-white">Mapsite</h2>
                <ul class="list-unstyled"><a href="#" class="text-dark">Home</a> <br> <a href="#" class="text-dark">About
                    us</a> <br> <a href="#" class="text-dark">Our services</a> <br> <a href="#" class="text-dark">Stories</a>
                </ul>
            </div>
            <div class="p-4 col-md-4">
                <h2 class="mb-4 text-white">Contact</h2>
                <p><a href="#" class="text-dark">
                    <i class="fa d-inline mr-3 text-muted fa-phone"></i>+082 10 1234 5678</a></p>
                <p><a href="#" class="text-dark">
                    <i class="fa d-inline mr-3 text-muted fa-envelope-o"></i>info@yourline.com</a></p>
                <p><a href="#" class="text-dark">
                    <i class="fa d-inline mr-3 fa-map-marker text-muted"></i>154904, ���ֽ�, JEJU</a></p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 mt-3">
                <p class="text-center">? Copyright 2019 YourLine - All rights reserved. </p>
            </div>
        </div>
    </div>
</div>
<!-- fixed button -->
<!-- modal -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
integrity = "sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin = "anonymous" style =
"" &gt;
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.21.0/moment.min.js" type="text/javascript"></script>
<script src="./js/bootstrap-datetimepicker.min.js"></script>
<script>
    $('#exampleModal').on('show.bs.modal', function(event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var recipient = button.data('whatever') // Extract info from data-* attributes
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other method instead.
    var modal = $(this)
    modal.find('.modal-title').text('New message to ' + recipient)
    modal.find('.modal-body input').val(recipient)
    })

    function checkScroll() {
    var startY = $('.navbar').height() * 2; //The point where the navbar changes in px
    if ($(window).scrollTop() > startY) {
    $('.navbar').addClass("scrolled");
    } else {
    $('.navbar').removeClass("scrolled");
    }
    }
    if ($('.navbar').length > 0) {
    $(window).on("scroll load resize", function() {
    checkScroll();
    });
    }
    // Date Time Picker
    $(function() {
    $('#example1').datetimepicker({
    minDate: new Date()
    });
    $('#example2').datetimepicker({
    useCurrent: false //Important! See issue #1075
    });
    $("#example1").on("dp.change", function(e) {
    $('#example2').data("DateTimePicker").minDate(e.date);
    });
    $("#example2").on("dp.change", function(e) {
    $('#example1').data("DateTimePicker").maxDate(e.date);
    });
    });
    $(document).ready(function() {
    $(window).scroll(function() {
    if ($(this).scrollTop() > 200) {
    $('#link-to-top').fadeIn();
    } else {
    $('#link-to-top').fadeOut();
    }
    });
    $('#link-to-top').click(function() {
    $('html, body').animate({
    scrollTop: 0
    }, 400);
    return false;
    });
    });
    $('#hinge').click(function() {
    $('#hinged').addClass("hinge");
    });
</script>

</body>
< /html>