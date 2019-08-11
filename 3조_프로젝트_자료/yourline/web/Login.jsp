<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
    <link rel="stylesheet" href="./css/style.css">
    <script type="text/javascript">

        function checkValue() {
            inputForm = eval("document.loginInfo");
            if (!inputForm.id.value) {
                alert("아이디를 입력하세요");
                inputForm.id.focus();
                return false;
            }
            if (!inputForm.pw.value) {
                alert("비밀번호를 입력하세요");
                inputForm.password.focus();
                return false;
            }
        }
    </script>
</head>

<body style="background-color: #525252">
<div class="py-5 text-center">
    <div class="container-fluid">
        <div class="row" style="">
            <div class="mx-auto col-md-6 col-8 bg-white p-5 rounded">
                <h1 class="mb-5">Log in</h1>
                <form class="login-form" method="POST" action="Login_process2.jsp" name="inputForm" onsubmit="return checkValue()">
                    <div class="form-group">
                        <input type="email" class="form-control" name="id" placeholder="아이디 입력" id="form9">
                    </div>
                    <div class="form-group mb-3">
                        <input type="password" class="form-control" name="pw" placeholder="비밀번호 입력" id="form10"> <small class="form-text text-muted text-right">
                        <a href="#"> Recover password</a></small>
                    </div>
                    <input type="submit" class="btn btn-primary" value="로그인"/>
                </form>
            </div>
        </div>
    </div>
</div>
<%
    // 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
    // Login_process2.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
    String msg = request.getParameter("msg");
    if (msg != null && msg.equals("-1")) {
%>
<script>
    alert("아이디를 확인해 주세요.");
</script>
<%
} else if (msg != null && msg.equals("0")) {
%>
<script>
    alert("비밀번호를 확인해 주세요.");
</script>
<%
    }
%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
    $(window).load(function() {
        var theWindow = $(window),
            $bg = $("#bg"),
            aspectRatio = $bg.width() / $bg.height();

        function resizeBg() {
            if ((theWindow.width() / theWindow.height()) < aspectRatio) {
                $bg.removeClass().addClass('bgheight');
            } else {
                $bg.removeClass().addClass('bgwidth');
            }
        }
        theWindow.resize(resizeBg).trigger("resize");
    });
</script>
</body>

</html>