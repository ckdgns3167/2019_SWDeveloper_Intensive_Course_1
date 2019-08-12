<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
    <link rel="stylesheet" href="./css/style.css">
    <title>Document</title>
</head>

<body>
<script src="https://www.paypal.com/sdk/js?client-id=ATd9ZdqA9Vu29VcxMm21yM7XYgq8xtqe8oS554wozgI6YkeFm7Yo7sGxuWfotowYNrL_K5uISj67R_ec&amp;components=buttons,marks">
</script>
<!-- navigation bar -->
<nav class="navbar navbar-expand-md navbar-dark bg-transparent fixed-top" style="">
    <div class="container"> <a class="navbar-brand" href="#">
        <i class="fa d-inline fa-lg fa-stop-circle"></i>
        <b>YOUR LINE</b>
    </a> <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse" data-target="#navbar16">
        <span class="navbar-toggler-icon"></span>
    </button>
        <div class="collapse navbar-collapse" id="navbar16">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"> <a class="nav-link" href="./main.html">메인</a> </li>
                <li class="nav-item"> <a class="nav-link" href="#">글쓰기</a> </li>
                <li class="nav-item"> <a class="nav-link" href="#paymentModal" data-toggle="modal">결제</a> </li>
                <li class="nav-item"> <a class="nav-link" href="./mypage.html">마이페이지</a> </li>
                <li class="nav-item"> <a class="nav-link" href="./about.html">ABOUT</a> </li>
            </ul>
            <a class="btn navbar-btn ml-md-2 btn-light text-dark">로그아웃</a>
        </div>
    </div>
</nav>
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
                    window.setTimeout($('#paymentModal').modal('hide'), 3000);
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