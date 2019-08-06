<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          type="text/css">
    <link rel="stylesheet"
          href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
    <title>Your Line 회원가입</title>

</head>
<body>
<div class="py-5 text-center" style="">
    <div class="container">
        <div class="row">
            <div class="mx-auto col-lg-6 col-10" style="">
                <h1>YOUR LINE</h1>
                <p class="mb-3">회원가입</p>
                <form class="text-left" method="POST" action="SignUp_process2.jsp" onsubmit="return pwCheck()"
                      name="userInfo">
                    <div class="form-group">
                        <label for="name">이&nbsp&nbsp&nbsp름</label> <input type="text"
                                                                           name="name" class="form-control" id="name"
                                                                           onchange="nameConditionCheck()">
                    </div>
                    <div class="form-group">
                        <label for="nickname">닉네임</label> <input type="text"
                                                                 name="nickname" class="form-control" id="nickname"
                                                                 onchange="nicknameConditionCheck()">
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="id">아이디</label>
                                <input type="text" name="id" class="form-control" id="id" onchange="idConditionCheck()">
                                <input type="button" name="confirm_id" value="중복확인"
                                       OnClick="openConfirmid(this.form)"
                                       class="pull-right btn btn-outline-success"
                                       style="margin-top: 10px;"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12" style="">
                            <div class="form-group">
                                <label for="phone">핸드폰</label> <input type="text" name="phone"
                                                                      class="form-control" id="phone"
                                                                      onchange="phoneConditionCheck()">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sex">성&nbsp&nbsp&nbsp별</label>
                        <div class="input-group mb-3" id="sex">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <input type="radio" name="sex" checked="checked" value="1"
                                           aria-label="Checkbox for following text input"><label
                                        class="form-check-label">남성</label>
                                </div>
                                <div class="input-group-text">
                                    <input type="radio" name="sex" value="2"
                                           aria-label="Checkbox for following text input"><label
                                        class="form-check-label">여성</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="pw">비밀번호</label> <input type="password" id="pw"
                                                                    name="pw" class="form-control" id="pw">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="rePw">비밀번호 확인</label> <input type="password" id="rePw"
                                                                         name="rePw" class="form-control" id="rePw">
                            </div>
                        </div>
                        <input type="submit" value="가입하기" id="joinBtn"
                               class="pull-right btn btn-outline-success"
                               style="margin-top: 10px;" disabled='disabled'>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
            integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
            crossorigin="anonymous"></script>
    <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>

    <script type="text/javascript">
        // 입력해야 할 입력란이 뭔가 쓰여져있고 그게 조건을 충족하는지에 대한 여부를 기록하는 배열.
        var check = [false, false, false, false];
        var pw = document.getElementById("pw");

        // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
        function popUpX(width){
            return (window.screen.width / 2) - (width / 2)
        }
        function popUpY(height){
            return (window.screen.height / 2) - (height / 2)
        }
        // 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
        function regularExCheck(re, e, msg) {
            if (re.test(e.value)) return true;
            alert(msg);
            e.value = "";
            return false;
        }

        function pwCheck() {
            if (!regularExCheck(/^[a-zA-Z0-9]{8,20}$/, pw, "알맞은 형식의 비밀번호를 입력하세요.\n( 8자리 이상...최대 20, 문자 + 숫자")) {
                return false;
            }
            if (document.userInfo.pw.value != document.userInfo.rePw.value) {
                alert("비밀번호를 동일하게 입력하세요.");
                document.userInfo.pw.value = "";
                document.userInfo.rePw.value = "";
                return false;
            }
            return true;
        }

        function openConfirmid(inputid) {
            if (inputid.id.value == "") {
                alert("중복확인에러: 아이디를 입력하세요.");
                return;
            }
            var ctxPath = "<%=request.getContextPath()%>";
            var url = ctxPath + "/ConfirmId.jsp?id=" + inputid.id.value;
            open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=310,height=180,left="+ popUpX(310) + ", top="+ popUpY(180));
        }

        //각 입력란의 조건을 검사하는 함수...
        function idConditionCheck() {
            if (regularExCheck(/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/, document.getElementById("id"), "잘못된 형식의 ID입니다.")) {
                check[0] = true;
            } else {
                check[0] = false;
                document.userInfo.id.value = "";
            }
            inputConditionCheck();
        }

        function nameConditionCheck() {
            if (regularExCheck(/^[가-힝]{2,}$/, document.getElementById("name"), "한글만 입력하세요.(2글자 이상)")) {
                check[1] = true;
            } else {
                check[1] = false;
                document.userInfo.name.value = "";
            }
            inputConditionCheck();
        }

        function nicknameConditionCheck() {
            if (regularExCheck(/^[가-힝]{2,}$/, document.getElementById("nickname"), "한글만 입력하세요.(2글자 이상)")) {
                check[2] = true;
            } else {
                check[2] = false;
            }
            inputConditionCheck();
        }

        function phoneConditionCheck() {
            if (regularExCheck(/^\d{3}\d{3,4}\d{4}$/, document.getElementById("phone"), "핸드폰 번호를 입력하세요.\n예)01012341234")) {
                check[3] = true;
            } else {
                check[3] = false;
                document.userInfo.phone.value = "";
            }
            inputConditionCheck();
        }

        function inputConditionCheck() {
            for (var i = 0; i < check.length; i++) {
                if (check[i] == false) {
                    document.getElementById("joinBtn").disabled = true;
                    break;
                } else if (i == 3 && check[i] == true) {//모두 true이면 조건 완료한 상황이니까 가입하기 버튼 활성화시켜주자.
                    joinBtnActibation();
                } else {
                    continue;//true면 다음꺼 확인
                }
            }
        }

        function joinBtnActibation() {
            document.getElementById("joinBtn").disabled = false;
        }
    </script>
</div>
</body>

</html>