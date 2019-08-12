<%@ page import="com.urline.dao.UserDAO" %>
<%@ page import="com.urline.vo.UserVO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<%
    Object userType_o = session.getAttribute("userType");
    Object id_o = session.getAttribute("userId");

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          type="text/css">
    <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
    <link rel="stylesheet" href="./css/style.css">
    <script>
        // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
        function popUpX(width){
            return (window.screen.width / 2) - (width / 2)
        }
        function popUpY(height){
            return (window.screen.height / 2) - (height / 2)
        }
        var ctxPath = "<%=request.getContextPath()%>";
        function userUpdate(userNo,userId) {
            var url = ctxPath + "/UpdateManager.jsp?userNo="+userNo +"&userId="+userId;
            open(url, "update", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=275,left="+ popUpX(500) + ", top="+ popUpY(360));
        }
        function userDelete(userNo,userId) {
            var url = ctxPath + "/DeleteManager.jsp?userNo="+userNo +"&userId="+userId;
            open(url, "delete", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=140,left="+ popUpX(500) + ", top="+ popUpY(360));
        }
    </script>
</head>
<body>
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

                <%if (userType != null && userType == 1) {%>
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a
                        class="nav-link" href="./ManagePage.jsp" id="userManager">회원관리</a></li>
                <%}%>
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a
                        class="nav-link" href="./AboutUs.jsp">ABOUT</a></li>

            </ul>
            <%if (id == null) { %>
            <a class="btn navbar-btn ml-md-2 text-dark btn-sm" href="./Login.jsp">로그인</a>
            <%} else { %>
            <a class="btn navbar-btn ml-md-2 text-dark btn-sm" href="./Logout_process2.jsp">로그아웃</a>
            <%}%>
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
                        <table class="table table-striped" style="margin-left: auto;margin-right: auto;">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">아이디</th>
                                <th scope="col">이름</th>
                                <th scope="col">닉네임</th>
                                <th scope="col">핸드폰</th>
                                <th scope="col">성별</th>
                                <th scope="col">포인트</th>
                                <th scope="col">등급</th>
                                <th scope="col"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                UserDAO dao = UserDAO.getInstance();
                                List<UserVO> userList= dao.selectAllUser("SELECT * FROM usert WHERE userNo != 0");
                                int i = 1;
                                String phone = null;
                                String gradeName = null;
                                for(UserVO  vo: userList){
                                    String sex_s= null;
                                    if(vo.getSex()==1){
                                        sex_s = "남자";
                                    }else{
                                        sex_s = "여자";
                                    }
                                    phone = vo.getPhone().substring(0,3) + "-" + vo.getPhone().substring(3,7) + "-" + vo.getPhone().substring(7,11);
                                    Integer grade = vo.getGrade();
                                    if (0 <= grade && grade <= 999) {//unRank
                                        gradeName = "L0.인턴";
                                    } else if (1000 <= grade && grade <= 1999) {// level 1
                                        gradeName = "L1.사원";
                                    } else if (2000 <= grade && grade <= 2999) {// level 2
                                        gradeName = "L2.대리";
                                    } else if (3000 <= grade && grade <= 3999) {// level 3
                                        gradeName = "L3.과장";
                                    } else if (4000 <= grade && grade <= 4999) {// level 4
                                        gradeName = "L4.차장";
                                    } else if (5000 <= grade && grade <= 5999) {// level 5
                                        gradeName = "L5.부장";
                                    }
                                    %>
                                    <tr>
                                        <th scope="row"><%=i++%></th>
                                        <td><%=vo.getId()%></td>
                                        <td><%=vo.getName()%></td>
                                        <td><%=vo.getNickname()%></td>
                                        <td><%=phone%></td>
                                        <td><%=sex_s%></td>
                                        <td><%=vo.getPoint()%>&nbspP</td>
                                        <td><%=gradeName%>:<%=vo.getGrade()%>점</td>
                                        <td>
                                            <div class="btn-group" style="">
                                                <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">관리</button>
                                                <div class="dropdown-menu">
                                                    <a class="dropdown-item" onclick="userUpdate(<%=vo.getUserNo()%>,'<%=vo.getId()%>')">정보 수정</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" onclick="userDelete(<%=vo.getUserNo()%>,'<%=vo.getId()%>')">회원 삭제</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                }
                            %>

                            </tbody>
                        </table>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="./js/navscroll.js"></script>
    <script src="./js/upbtn.js"></script>
</body>
</html>
