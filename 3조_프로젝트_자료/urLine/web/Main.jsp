<%@ page import="com.urline.dao.PostingDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.urline.vo.PostingVO" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.urline.dao.CommentDAO" %>
<%@ page import="com.urline.vo.CommentVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%
    Object userType_o = session.getAttribute("userType");
    Object id_o = session.getAttribute("userId");
    Object profile = session.getAttribute("profile");

    String searchStart = request.getParameter("search_start");
    String searchEnd = request.getParameter("search_end");
    String searchRegion = request.getParameter("search_region");

    Integer userType = null;
    String id = null;
    if (id_o != null) {
        id = id_o.toString();
    }
    if (userType_o != null) {
        userType = (Integer) userType_o;
    }
    List<PostingVO> list = new ArrayList<>();
    PostingDAO dao = PostingDAO.getInstance();


    CommentDAO commentDAO = CommentDAO.getInstance();
    List<CommentVO> coli = new ArrayList<>();

    try {
        coli = commentDAO.selectAllComment("select * from postt inner join commentt on postt.postno = commentt.postedno");
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (searchStart == null) {
        try {
            list = dao.selectAllPosting("select * from postt inner join usert on postt.id = usert.id order by postt.postno desc");
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        try {
            list = dao.selectAllPosting("select * from postt inner join usert on postt.id = usert.id where (requesttime between '" + searchStart + "' and '" + searchEnd + "') and (endtime between '" + searchStart + "' and '" + searchEnd + "') and (region = '" + searchRegion + "')order by postt.postno desc");

        } catch (Exception e) {
            e.printStackTrace();
        }
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
    <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/lib/bootstrap-datetimepicker.min.css">
    <script>
        var postedNo;
    </script>

</head>

<body class="">
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
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a
                        class="nav-link" href="./Main.jsp">����</a></li>

                <%
                    if (userType != null) {
                        if (userType != 1) {
                %>
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a
                        class="nav-link" href="CreatePost.jsp">�۾���</a></li>
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a
                        class="nav-link" href="#paymentModal" data-toggle="modal">����</a></li>
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a
                        class="nav-link" href="./Mypage.jsp" id="mypage">����������</a></li>
                <%
                        }
                    }
                %>
                <%if (userType != null && userType == 1) {%>
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a
                        class="nav-link" href="./ManagePage.jsp" id="userManager">ȸ������</a></li>
                <%}%>
                <li class="nav-item" style="font-size: 1.8em; font-family: 'Black Han Sans', sans-serif;"><a
                        class="nav-link" href="./AboutUs.jsp">ABOUT</a></li>

            </ul>
            <%if (id == null) { %>
            <a class="btn navbar-btn ml-md-2 text-dark btn-light btn-sm" href="./SignUp.jsp">ȸ������</a>
            <a class="btn navbar-btn ml-md-2 text-dark btn-light btn-sm" href="./Login.jsp">�α���</a>
            <%} else { %>
            <a class="btn navbar-btn ml-md-2 text-dark btn-light btn-sm" href="./Logout_process2.jsp">�α׾ƿ�</a>
            <%}%>
        </div>
    </div>
</nav>
<!-- parallex -->
<div class="py-5 text-center"
     style="background-image: url(&quot;./images/parallax-bg.jpg&quot;); background-position: right bottom; background-size: cover; background-repeat: repeat; background-attachment: fixed;">
    <div class="container">
        <div class="row">
            <div class="bg-white-opacity-6 mt-4 mb-5 p-4 col-10 mx-auto mx-md-0 col-lg-6 rounded">
                <h1 style="">���� �ٷ� �˻��ϼ���!</h1>
                <p class="mb-4" style="">�������� �ټ��� ��ٸ��ó���? <br>YOUR LINE�� ����� �ð��� �����帳�ϴ�.</p>
                <div class="col-md-12 px-5" style="">
                    <h3 class="mb-3" style="">�˻� ���� ����</h3>
                    <form action="./Main.jsp" autocomplete="off" style="">
                        <div class="form-group"><label>���� �Ͻ�</label>
                            <input name="search_start" type="text" class="form-control border rounded" id="example1">
                            <div class="form-group mb-0"><label>���� �Ͻ�</label>
                                <input name="search_end" type="text" class="form-control border rounded" id="example2">
                            </div>
                            <div class="form-group mb-0" style=""><label>���� ����</label>
                                <select name="search_region" class="custom-select" id="inlineFormCustomSelect">
                                    <option selected>��������...</option>
                                    <option value="1">���ֽ�</option>
                                    <option value="2">������</option>
                                </select>
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
            <div class="col-md-3 border-4 border-right" style="">
                <% if (userType != null) {%>
                <img class="img-fluid d-block rounded-circle p-5" src="<%=profile.toString()%>" style="">
                <ul class="list-group">
                    <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"> �ۼ��� ���� <i
                            class="fa fa-list text-muted fa-lg"></i></li>
                    <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"> ANALYTICS
                        <i class="fa fa-pie-chart text-muted fa-lg"></i></li>
                    <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"> ���������� <i
                            class="fa fa-cog text-muted fa-lg"></i></li>
                    <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"> LOG OUT <i
                            class="fa fa-sign-out text-muted fa-lg"></i></li>
                </ul>
                </ul>
                <%}%>
            </div>
            <!-- content -->
            <div class="col-md-6 border-left border-right border-light" style="">

                <%
                    for (PostingVO postingVO : list) {
                        Integer postNo = postingVO.getPostNo();
                        String title = postingVO.getTitle();
                        String posted_id = postingVO.getId();
                        String posted_nick = postingVO.getNickName();
                        Integer region = postingVO.getRegion();
                        String contents = postingVO.getContents();
                        String postingDate = postingVO.getPostingDate();
                        Integer state = postingVO.getState();
                        Integer hopefulPoint = postingVO.getB_hopefulPoint();
                        String requestTime = postingVO.getRequestTime();
                        String endTime = postingVO.getHowMuch();
                        Integer grade = postingVO.getGrade();
                        String postied_profile = postingVO.getProfile();


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
                            myLevel = "Level 0 : ����";
                        } else if (1000 <= grade && grade <= 1999) {// level 1
                            level_image = level_2_image;
                            myLevel = "Level 1 : �Ʒú�";
                        } else if (2000 <= grade && grade <= 2999) {// level 2
                            level_image = level_3_image;
                            myLevel = "Level 2 : �̵";
                        } else if (3000 <= grade && grade <= 3999) {// level 3
                            level_image = level_4_image;
                            myLevel = "Level 3 : �Ϻ�";
                        } else if (4000 <= grade && grade <= 4999) {// level 4
                            level_image = level_5_image;
                            myLevel = "Level 4 : ��";
                        } else if (5000 <= grade && grade <= 5999) {// level 5
                            level_image = level_6_image;
                            myLevel = "Level 5 : ����";
                        }



                        for (CommentVO cvo : coli) {
                            String cvoContents = cvo.getContents();
                            String cvoPhone = cvo.getPhoneNo();
                            String cvoUserNo = cvo.getUserNo();
                            Integer cvoHopeP = cvo.getH_hopefulPoint();
                            Integer cvoPostNo = cvo.getPostNo();

                            System.out.println(cvoContents);
                            System.out.println(cvoPhone);
                            System.out.println(cvoUserNo);
                            System.out.println(cvoHopeP);
                            System.out.println(cvoPostNo);

                    if (cvoPostNo == postNo){
                %><h3 class="float-left">��</h3>
                <div class="row border rounded p-2 mx-2">
                    <div class="col-6"><b>������ �̸���</b> : <%=cvoUserNo%></div>
                    <div class="col-6"><b>���� ����</b> : <%=cvoContents%></div>
                    <div class="col-6"><b>����ó</b> : <%=cvoPhone%></div>
                    <div class="col-6"><b>�䱸 ����Ʈ</b> : <%=cvoHopeP%></div>
                </div>
                <%
                        }

                    }
                %>

                <div id="hinged" class="card mb-3">
                    <div class="card-header text-right"><span
                            class="text-primary float-left"><b><%=hopefulPoint%> Point</b></span>
                        <%
                            if (Objects.equals(id, posted_id)) {%>
                        <span class=""><a class="text-warning"
                                          href="./UpdatePost.jsp?title=<%=title%>&requestTime=<%=requestTime%>&endTime=<%=endTime%>&contents=<%=contents%>&hopefulPoint=<%=hopefulPoint%>&postNo=<%=postNo%>">����</a><a
                                class="text-danger ml-2" href="./DeletePost.jsp?postNo=<%=postNo%>">����</a></span>
                        <%}%>
                    </div>
                    <div class="card-body">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-6 text-center p-0" style=""><img
                                                        class="img-fluid rounded-circle" src="<%=postied_profile%>"
                                                        width="100">
                                                </div>
                                                <div class="col-md-6 pr-1" style="">
                                                    <h4 class=""><%=posted_nick%>
                                                    </h4>
                                                    <img src="<%=level_image%>" width="40px"
                                                         style="margin-left: -50px; margin-top: 12px">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-9 align-middle">
                                            <h3 class=""><%=title%>
                                            </h3>
                                            <span class="text-muted">��� �ð� : <%=requestTime%> ~ <%=endTime%></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer d-flex text-muted text-left"><span
                            class="align-self-center mr-auto">�ۼ��� : <%=postingDate%></span><%if (userType != null && !id.equals(posted_id)) { %><a
                            class="btn btn-outline-primary" href="#replyModal" data-toggle="modal"
                            onclick="$('#postNo').val(<%=postNo%>)">�����ϱ�</a><%}%></div>
                </div>
                <%
                }%>
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
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between align-items-center"> ���峪����
                                    <span
                                            class="badge badge-primary badge-pill">7</span></li>
                                <li class="list-group-item d-flex justify-content-between align-items-center"> ���� ���ֽ�
                                    ��õ�� �Դ�13�� 1 <span class="badge badge-primary badge-pill">2</span></li>
                                <li class="list-group-item d-flex justify-content-between align-items-center"> ���ð� : ���
                                    30�� <span
                                            class="badge badge-primary badge-pill">5</span></li>
                            </ul>
                        </div>
                        <div class="carousel-item"><img class="d-block img-fluid w-100" src="./images/jm.jpg">
                            <div class="carousel-caption">
                                <h5 class="m-0"></h5>
                                <p></p>
                            </div>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between align-items-center"> �ڸű���
                                    <span
                                            class="badge badge-primary badge-pill">14</span></li>
                                <li class="list-group-item d-flex justify-content-between align-items-center"> ���� ���ֽ�
                                    �Ｚ�� 67 <span class="badge badge-primary badge-pill">23</span></li>
                                <li class="list-group-item d-flex justify-content-between align-items-center"> ���ð� : ���
                                    35�� <span
                                            class="badge badge-primary badge-pill">9</span></li>
                            </ul>
                        </div>
                        <div class="carousel-item active"><img class="d-block img-fluid w-100" src="./images/wj.jpg">
                            <div class="carousel-caption">
                                <h5 class="m-0"></h5>
                                <p></p>
                            </div>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between align-items-center"> �������屹
                                    <span
                                            class="badge badge-primary badge-pill">54</span></li>
                                <li class="list-group-item d-flex justify-content-between align-items-center"> ���� ���ֽ�
                                    ����� 11 <span class="badge badge-primary badge-pill">17</span></li>
                                <li class="list-group-item d-flex justify-content-between align-items-center"> ���ð� : ���
                                    40�� <span
                                            class="badge badge-primary badge-pill">16</span></li>
                            </ul>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev"> <span
                            class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span> </a> <a
                        class="carousel-control-next" href="#carousel" role="button" data-slide="next"> <span
                        class="carousel-control-next-icon"></span> <span class="sr-only">Next</span> </a>
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
                <p>Your Line�� ���ֿ��� �� ��ġ�ִ� ������ �߱��մϴ�. �� �̻� ��ٸ��� ������.</p>
            </div>
            <div class="p-4 col-md-4">
                <h2 class="mb-4">Mapsite</h2>
                <ul class="list-unstyled"><a href="#" class="font-white">Home</a> <br> <a href="#" class="font-white">About
                    us</a> <br> <a href="#" class="font-white">Our services</a> <br> <a href="#" class="font-white">Stories</a>
                </ul>
            </div>
            <div class="p-4 col-md-4">
                <h2 class="mb-4">Contact</h2>
                <p><a href="#" class="font-white">
                    <i class="fa d-inline mr-3 text-muted fa-phone"></i>+082 10 1234 5678</a></p>
                <p><a href="#" class="font-white">
                    <i class="fa d-inline mr-3 text-muted fa-envelope-o"></i>info@yourline.com</a></p>
                <p><a href="#" class="font-white">
                    <i class="fa d-inline mr-3 fa-map-marker text-muted"></i>154904, ���ֽ�, JEJU</a></p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 mt-3">
                <p class="text-center font-white">? Copyright 2019 YourLine - All rights reserved. </p>
            </div>
        </div>
    </div>
</div>
<!-- fixed button -->
<div class="">
    <div class="container-fluid fixed-bottom" style="">
        <div class="row">
            <div class="col-md-12 ml-atuo">
                <a id="link-to-top" href="#" class="btn btn-primary float-right mb-3 mr-3" style="display: none;"><i
                        class="fa fa-arrow-up" aria-hidden="true"></i></a>
            </div>
        </div>
    </div>
</div>

<!--payment modal-->
<div id="paymentModal" class="modal fade" style="">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">����Ʈ ����</h5>
                <button type="button" class="close" data-dismiss="modal"><span>��</span></button>
            </div>
            <div class="modal-body">
                <div class="col-md-12 px-5" style="">
                    <!-- Render the radio buttons and marks -->
                    <ul class="list-group mb-3">
                        <li class=" border-0 list-group-item d-flex justify-content-between align-items-center">100 ����Ʈ&nbsp;<label>1
                            USD&nbsp;<input type="radio" name="payment-option" value="100" checked=""> </label></li>
                        <li class=" border-0 list-group-item d-flex justify-content-between align-items-center">300
                            ����Ʈ<label>2.9 USD&nbsp;<input type="radio" name="payment-option" value="300"> </label></li>
                        <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"
                            style="">500����Ʈ<label>4.8 USD&nbsp;<input type="radio" name="payment-option" value="500">
                        </label></li>
                        <li class=" border-0 list-group-item d-flex justify-content-between align-items-center">800 ����Ʈ&nbsp;<label>7.6
                            USD&nbsp;<input type="radio" name="payment-option" value="800"> </label></li>
                        <li class="border-0 list-group-item d-flex justify-content-between align-items-center">1000 ����Ʈ&nbsp;<label>9.4
                            USD&nbsp;<input type="radio" name="payment-option" value="1000"> </label></li>
                        <li class=" border-0 list-group-item d-flex justify-content-between align-items-center">2000 ����Ʈ&nbsp;<label
                                contenteditable="true">18 USD&nbsp;<input type="radio" name="payment-option"
                                                                          value="2000"> </label></li>
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

<%-- ���� --%>
<div id="replyModal" class="modal fade">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">���� �ϱ�</h5>
                <button type="button" class="close" data-dismiss="modal"><span>��</span></button>
            </div>
            <div class="modal-body">
                <form action="./CreateComment2.jsp" method="post">
                    <p>������ ���� �ϴ��� ���� �ۼ��� �ֽʽÿ�.</p>
                    <input id="postNo" type="text" name="postNo">
                    <div class="row">
                        <div class="col-md-6"><label>�䱸 ����Ʈ</label><input autocomplete="off" name="point" type="text"
                                                                          class="form-control border rounded">
                        </div>
                        <div class="col-md-6"><label>����ó</label><input autocomplete="off" name="phone" type="text"
                                                                       class="form-control border rounded"></div>

                    </div>
                    <label>�ڸ�Ʈ</label><input autocomplete="off" name="comment" type="text" class="form-control border rounded">
                    <div class="col-12 pt-2 text-right pr-0">
                        <button type="submit" class="btn btn-primary">�����ϱ�</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">���</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"
        style=""></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.21.0/moment.min.js" type="text/javascript"></script>
<script src="./js/lib/bootstrap-datetimepicker.min.js"></script>
<script src="./js/navscroll.js"></script>
<script src="./js/upbtn.js"></script>
<script>
    // Date Time Picker
    $(function () {
        $('#example1').datetimepicker({
            format: 'DD/MM/YYYY HH:mm',
            minDate: new Date()
        });
        $('#example2').datetimepicker({
            format: 'DD/MM/YYYY HH:mm',
            useCurrent: false //Important! See issue #1075
        });
        $("#example1").on("dp.change", function (e) {
            $('#example2').data("DateTimePicker").minDate(e.date);
        });
        $("#example2").on("dp.change", function (e) {
            $('#example1').data("DateTimePicker").maxDate(e.date);
        });
    });
    $('#hinge').click(function () {
        $('#hinged').addClass("hinge");
    });

    //payment
    var money = 1;
    var point = 100;

    function ajaxGet(url, fpOK, fpFail) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    if (fpOK) {
                        fpOK(xhr.responseText);
                    }
                } else {
                    if (fpFail) {
                        alert("error: " + xhr.status);
                    }
                }
            }
        };
        xhr.open('GET', url, true);
        xhr.send(null);
    }

    // Render the PayPal marks
    paypal.Marks().render('#paypal-marks-container');
    // Listen for changes to the radio buttons
    document.querySelectorAll('input[name=payment-option]').forEach(function (el) {
        el.addEventListener('change', function (event) {
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
        createOrder: function (data, actions) {
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        value: money
                    }
                }]
            });
        },
        onApprove: function (data, actions) {
            return actions.order.capture().then(function (details) {
                alert(point + ' ����Ʈ ������ �Ϸ�Ǿ����ϴ�. ����� �̸�:' + details.payer.name.given_name);

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

</body>
</html>