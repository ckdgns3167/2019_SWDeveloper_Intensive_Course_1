<%@ page import="com.urline.dao.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer postNo = Util.parseInt(request.getParameter("postNo"));
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
    <link rel="stylesheet" href="./css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" style=""></script>
    <script src="./bower_components/markdown-it/dist/markdown-it.js"></script>
    <script src="./bower_components/to-mark/dist/to-mark.js"></script>
    <script src="./bower_components/tui-code-snippet/dist/tui-code-snippet.js"></script>
    <script src="./bower_components/codemirror/lib/codemirror.js"></script>
    <script src="./bower_components/highlightjs/highlight.pack.js"></script>
    <script src="./bower_components/squire-rte/build/squire-raw.js"></script>
    <link rel="stylesheet" href="./bower_components/codemirror/lib/codemirror.css">
    <link rel="stylesheet" href="./bower_components/highlightjs/styles/github.css">
    <link rel="stylesheet" href="./css/lib/bootstrap-datetimepicker.min.css">

    <script>
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        var title = getParameterByName("title");
        var requestTime = getParameterByName("requestTime");
        var endTime = getParameterByName("endTime");
        var contents = getParameterByName("contents");
        var hopefulPoint = getParameterByName("hopefulPoint");

    </script>
    <title>Document</title>
</head>

<body>
<script src="https://www.paypal.com/sdk/js?client-id=ATd9ZdqA9Vu29VcxMm21yM7XYgq8xtqe8oS554wozgI6YkeFm7Yo7sGxuWfotowYNrL_K5uISj67R_ec&amp;components=buttons,marks">
</script>
<!-- navigation bar -->
<nav class="navbar navbar-expand-md navbar-dark" style="background-color: #1E1E1E !important;">
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

<div>
    <form method="POST" action="UpdatePost2.jsp?postNo=<%=postNo%>" autocomplete="off" style="">
        <div class="container">
            <div class="row">
                <div class="col-10 mx-auto" style="">
                    <h1>글 수정</h1>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group row"><label class="col-2">제목:</label>
                                <div class="col-10"><input id="title" type="text" name="title" class="form-control border col-12 rounded"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row" style="">
                <div class="col-md-5 ml-auto" style="">
                    <div class="form-group" style="">
                        <div><label>시작 일시</label><input type="text" name="start" class="form-control border rounded" id="example1"></div>
                        <div><label style="">지역선택</label>
                            <select name="region" class="custom-select" id="inlineFormCustomSelect">
                                <option selected value="1">지역선택...</option>
                                <option value="2">제주시</option>
                                <option value="3">서귀포</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 mr-auto" style="">
                    <div class="form-group" style="">
                        <div><label>종료 일시</label><input type="text" name="end" class="form-control border rounded" id="example2"></div>
                        <div><label>포인트</label><input type="text" name="point" id="point" class="form-control border rounded"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-10 mx-auto" style="">
                    <h1><label>내용</label></h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="col-md-12" style="">
                <div id="editSection" class="col-8 col-md-8 mx-auto"></div>
            </div>
        </div>
        <!-- tui-editor input -->
        <input type="text" name="contents" id="contents" hidden="">
        <!-- tui-editor view -->
        <div class="code-html">
            <script src="./bower_components/tui-editor/dist/tui-editor-Editor.js"></script>
            <link rel="stylesheet" href="./bower_components/tui-editor/dist/tui-editor.css">
            <link rel="stylesheet" href="./bower_components/tui-editor/dist/tui-editor-contents.css">
        </div>
        <script class="code-js"> var editor = new tui.Editor({
            el: document.querySelector('#editSection'),
            initialValue: contents,
            initialEditType: 'markdown',
            previewStyle: 'vertical',
            height: '500px'
        });
        </script>
        <div class="col-8 mx-auto text-right pr-4 py-2">
            <button type="submit" id="form-submit" class="btn btn-primary ml-auto">글 수정</button><a class="btn ml-3 border-warning border" href="./Main.jsp">취소</a>
        </div>
    </form>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous" style="">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous" style=""></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.21.0/moment.min.js" type="text/javascript"></script>
<script src="./js/lib/bootstrap-datetimepicker.min.js"></script>
<script src="./js/navscroll.js" style=""></script>
<script src="./js/upbtn.js" style=""></script>
<script>
    var formSubmitButton = document.querySelector("#form-submit");
    formSubmitButton.addEventListener('click', function() {
        var contents = document.querySelector("#contents");
        contents.value = editor.getMarkdown(); //markdown 저장
        // contents.value = editor.getHtml(); //html 저장
        // alert(contents.value);
    });

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

    document.getElementById("example1").value = requestTime;
    console.log(requestTime);
    document.getElementById("example2").value = endTime;
    document.getElementById("title").value = title;
    document.getElementById("point").value = hopefulPoint;

</script>
</body>

</html>