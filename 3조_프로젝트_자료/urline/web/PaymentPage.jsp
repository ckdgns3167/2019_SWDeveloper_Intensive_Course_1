<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
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
<script src="https://www.paypal.com/sdk/js?client-id=ATd9ZdqA9Vu29VcxMm21yM7XYgq8xtqe8oS554wozgI6YkeFm7Yo7sGxuWfotowYNrL_K5uISj67R_ec&amp;components=buttons,marks"></script>
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
                <li class="nav-item"> <a class="nav-link" href="./Main.jsp">메인</a> </li>
                <li class="nav-item"> <a class="nav-link" href="#">글쓰기</a> </li>
                <li class="nav-item"> <a class="nav-link" href="#">결제</a> </li>
                <li class="nav-item"> <a class="nav-link" href="./Mypage.jsp">마이페이지</a> </li>
                <li class="nav-item"> <a class="nav-link" href="./about.jsp">ABOUT</a> </li>
            </ul>
            <a class="btn navbar-btn ml-md-2 btn-light text-dark">로그아웃</a>
        </div>
    </div>
</nav>
<div class="py-5" style="">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4" style="">
                <!-- Render the radio buttons and marks -->
                <label>
                    <input type="radio" name="payment-option" value="100" checked=""> 100 포인트 </label>
                <label>
                    <input type="radio" name="payment-option" value="300"> 300 포인트 </label>
                <label>
                    <input type="radio" name="payment-option" value="500"> 500 포인트 </label>
                <label>
                    <input type="radio" name="payment-option" value="800"> 800 포인트 </label>
                <label>
                    <input type="radio" name="payment-option" value="1000"> 1000 포인트 </label>
                <label>
                    <input type="radio" name="payment-option" value="2000"> 2000 포인트 </label>
                <div id="paypal-button-container" class="col-12">
                    <div id="zoid-paypal-buttons-66318d60ed_mdq6mja6mzm" class="paypal-buttons paypal-buttons-context-iframe paypal-buttons-label-undefined paypal-buttons-layout-vertical" style="height: 142px; transition: all 0.5s ease-in-out;">
                        <style>
                            #zoid-paypal-buttons-66318d60ed_mdq6mja6mzm {
                                position: relative;
                                display: inline-block;
                                width: 100%;
                                min-width: 200px;
                                max-width: 750px;
                                font-size: 0;
                            }

                            #zoid-paypal-buttons-66318d60ed_mdq6mja6mzm>iframe {
                                position: absolute;
                                top: 0;
                                left: 0;
                                width: 100%;
                                height: 100%;
                            }

                            #zoid-paypal-buttons-66318d60ed_mdq6mja6mzm>iframe.component-frame {
                                z-index: 100;
                            }

                            #zoid-paypal-buttons-66318d60ed_mdq6mja6mzm>iframe.prerender-frame {
                                transition: opacity .2s linear;
                                z-index: 200;
                            }

                            #zoid-paypal-buttons-66318d60ed_mdq6mja6mzm>iframe.visible {
                                opacity: 1;
                            }

                            #zoid-paypal-buttons-66318d60ed_mdq6mja6mzm>iframe.invisible {
                                opacity: 0;
                                pointer-events: none;
                            }
                        </style><iframe allowtransparency="true" title="paypal_buttons" allowpaymentrequest="allowpaymentrequest" scrolling="no" id="jsx-iframe-ba7a1d381f" class="component-frame visible" name="__zoid__paypal_buttons__eyJ1aWQiOiJ6b2lkLXBheXBhbC1idXR0b25zLTY2MzE4ZDYwZWRfbWRxNm1qYTZtem0iLCJjb250ZXh0IjoiaWZyYW1lIiwidmVyc2lvbiI6IjlfMF8yOCIsImNoaWxkRG9tYWluIjoiaHR0cHM6Ly93d3cuc2FuZGJveC5wYXlwYWwuY29tIiwicGFyZW50RG9tYWluIjoiZmlsZTovLyIsInRhZyI6InBheXBhbC1idXR0b25zIiwicGFyZW50Ijp7InR5cGUiOiJwYXJlbnQiLCJkaXN0YW5jZSI6MX0sInByb3BzIjp7InR5cGUiOiJyYXciLCJ2YWx1ZSI6IntcImNyZWF0ZU9yZGVyXCI6e1wiX190eXBlX19cIjpcImNyb3NzX2RvbWFpbl9mdW5jdGlvblwiLFwiX192YWxfX1wiOntcImlkXCI6XCJiOGIwNDUzNDM2X21kcTZtamE2bXptXCIsXCJuYW1lXCI6XCJjcmVhdGVPcmRlclwifX0sXCJvbkFwcHJvdmVcIjp7XCJfX3R5cGVfX1wiOlwiY3Jvc3NfZG9tYWluX2Z1bmN0aW9uXCIsXCJfX3ZhbF9fXCI6e1wiaWRcIjpcIjMxYWY3NDY0NWJfbWRxNm1qYTZtem1cIixcIm5hbWVcIjpcIm9uQXBwcm92ZVwifX0sXCJzdHlsZVwiOntcImxheW91dFwiOlwidmVydGljYWxcIixcImNvbG9yXCI6XCJnb2xkXCIsXCJzaGFwZVwiOlwicmVjdFwiLFwidGFnbGluZVwiOmZhbHNlfSxcImNvbXBvbmVudHNcIjpbXCJidXR0b25zXCIsXCJtYXJrc1wiXSxcImxvY2FsZVwiOntcImxhbmdcIjpcImVuXCIsXCJjb3VudHJ5XCI6XCJVU1wifSxcImdldFByZXJlbmRlckRldGFpbHNcIjp7XCJfX3R5cGVfX1wiOlwiY3Jvc3NfZG9tYWluX2Z1bmN0aW9uXCIsXCJfX3ZhbF9fXCI6e1wiaWRcIjpcIjljMTQ4YzgzZGVfbWRxNm1qYTZtem1cIixcIm5hbWVcIjpcImdldFByZXJlbmRlckRldGFpbHNcIn19LFwiZ2V0UG9wdXBCcmlkZ2VcIjp7XCJfX3R5cGVfX1wiOlwiY3Jvc3NfZG9tYWluX2Z1bmN0aW9uXCIsXCJfX3ZhbF9fXCI6e1wiaWRcIjpcIjRhNTI1N2QxMjdfbWRxNm1qYTZtem1cIixcIm5hbWVcIjpcImdldFBvcHVwQnJpZGdlXCJ9fSxcImNsaWVudElEXCI6XCJBVGQ5WmRxQTlWdTI5VmN4TW0yMXlNN1hZZ3E4eHRxZThvUzU1NHdvemdJNllrZUZtN1lvN3NHeHVXZm90b3dZTnJMX0s1dUlTajY3Ul9lY1wiLFwiZW5hYmxlVGhyZWVEb21haW5TZWN1cmVcIjpmYWxzZSxcImNvcnJlbGF0aW9uSURcIjpcIjlkOTFmMTcwZTJmNjlcIixcInNlc3Npb25JRFwiOlwiNmY2YTFhZTAzMF9tZHE2bXRnNm1kYVwiLFwiYnV0dG9uU2Vzc2lvbklEXCI6XCI2MjIxNzY1MzUzX21kcTZtamE2bXptXCIsXCJlbnZcIjpcInNhbmRib3hcIixcImZ1bmRpbmdFbGlnaWJpbGl0eVwiOntcInBheXBhbFwiOntcImVsaWdpYmxlXCI6dHJ1ZSxcInZhdWx0YWJsZVwiOnRydWV9LFwidmVubW9cIjp7XCJlbGlnaWJsZVwiOmZhbHNlLFwidmF1bHRhYmxlXCI6ZmFsc2V9LFwiaXRhdVwiOntcImVsaWdpYmxlXCI6ZmFsc2UsXCJ2YXVsdGFibGVcIjpmYWxzZX0sXCJjcmVkaXRcIjp7XCJlbGlnaWJsZVwiOmZhbHNlLFwidmF1bHRhYmxlXCI6ZmFsc2V9LFwic2VwYVwiOntcImVsaWdpYmxlXCI6ZmFsc2UsXCJ2YXVsdGFibGVcIjpmYWxzZX0sXCJpZGVhbFwiOntcImVsaWdpYmxlXCI6ZmFsc2UsXCJ2YXVsdGFibGVcIjpmYWxzZX0sXCJiYW5jb250YWN0XCI6e1wiZWxpZ2libGVcIjpmYWxzZSxcInZhdWx0YWJsZVwiOmZhbHNlfSxcImdpcm9wYXlcIjp7XCJlbGlnaWJsZVwiOmZhbHNlLFwidmF1bHRhYmxlXCI6ZmFsc2V9LFwiZXBzXCI6e1wiZWxpZ2libGVcIjpmYWxzZSxcInZhdWx0YWJsZVwiOmZhbHNlfSxcInNvZm9ydFwiOntcImVsaWdpYmxlXCI6ZmFsc2UsXCJ2YXVsdGFibGVcIjpmYWxzZX0sXCJteWJhbmtcIjp7XCJlbGlnaWJsZVwiOmZhbHNlLFwidmF1bHRhYmxlXCI6ZmFsc2V9LFwicDI0XCI6e1wiZWxpZ2libGVcIjpmYWxzZSxcInZhdWx0YWJsZVwiOmZhbHNlfSxcInppbXBsZXJcIjp7XCJlbGlnaWJsZVwiOmZhbHNlLFwidmF1bHRhYmxlXCI6ZmFsc2V9LFwid2VjaGF0cGF5XCI6e1wiZWxpZ2libGVcIjpmYWxzZSxcInZhdWx0YWJsZVwiOmZhbHNlfSxcImNhcmRcIjp7XCJlbGlnaWJsZVwiOnRydWUsXCJicmFuZGVkXCI6dHJ1ZSxcInZlbmRvcnNcIjp7XCJ2aXNhXCI6e1wiZWxpZ2libGVcIjp0cnVlLFwidmF1bHRhYmxlXCI6dHJ1ZX0sXCJtYXN0ZXJjYXJkXCI6e1wiZWxpZ2libGVcIjp0cnVlLFwidmF1bHRhYmxlXCI6dHJ1ZX0sXCJhbWV4XCI6e1wiZWxpZ2libGVcIjp0cnVlLFwidmF1bHRhYmxlXCI6dHJ1ZX0sXCJkaXNjb3ZlclwiOntcImVsaWdpYmxlXCI6ZmFsc2UsXCJ2YXVsdGFibGVcIjp0cnVlfSxcImhpcGVyXCI6e1wiZWxpZ2libGVcIjpmYWxzZSxcInZhdWx0YWJsZVwiOmZhbHNlfSxcImVsb1wiOntcImVsaWdpYmxlXCI6ZmFsc2UsXCJ2YXVsdGFibGVcIjp0cnVlfSxcImpjYlwiOntcImVsaWdpYmxlXCI6ZmFsc2UsXCJ2YXVsdGFibGVcIjp0cnVlfX19fSxcInBsYXRmb3JtXCI6XCJkZXNrdG9wXCIsXCJyZW1lbWJlcmVkXCI6W10sXCJyZW1lbWJlclwiOntcIl9fdHlwZV9fXCI6XCJjcm9zc19kb21haW5fZnVuY3Rpb25cIixcIl9fdmFsX19cIjp7XCJpZFwiOlwiMmYyNzY2N2MxOF9tZHE2bWphNm16bVwiLFwibmFtZVwiOlwicmVtZW1iZXJcIn19LFwiY3VycmVuY3lcIjpcIlVTRFwiLFwiaW50ZW50XCI6XCJjYXB0dXJlXCIsXCJjb21taXRcIjp0cnVlLFwidmF1bHRcIjpmYWxzZSxcImRpc2FibGVGdW5kaW5nXCI6W10sXCJkaXNhYmxlQ2FyZFwiOltdLFwibWVyY2hhbnRJRFwiOltdLFwiY3NwXCI6e30sXCJkZWJ1Z1wiOmZhbHNlLFwidGVzdFwiOntcImFjdGlvblwiOlwiY2hlY2tvdXRcIn19In0sImV4cG9ydHMiOiJ7XCJpbml0XCI6e1wiX190eXBlX19cIjpcImNyb3NzX2RvbWFpbl9mdW5jdGlvblwiLFwiX192YWxfX1wiOntcImlkXCI6XCJhZWM4MmE3YzU2X21kcTZtamE2bXptXCIsXCJuYW1lXCI6XCJyXCJ9fSxcImNsb3NlXCI6e1wiX190eXBlX19cIjpcImNyb3NzX2RvbWFpbl9mdW5jdGlvblwiLFwiX192YWxfX1wiOntcImlkXCI6XCI0OTRjZTc3YWExX21kcTZtamE2bXptXCIsXCJuYW1lXCI6XCJjbG9zZVwifX0sXCJjaGVja0Nsb3NlXCI6e1wiX190eXBlX19cIjpcImNyb3NzX2RvbWFpbl9mdW5jdGlvblwiLFwiX192YWxfX1wiOntcImlkXCI6XCI5MmMyODcyZjIxX21kcTZtamE2bXptXCIsXCJuYW1lXCI6XCJjaGVja0Nsb3NlXCJ9fSxcInJlc2l6ZVwiOntcIl9fdHlwZV9fXCI6XCJjcm9zc19kb21haW5fZnVuY3Rpb25cIixcIl9fdmFsX19cIjp7XCJpZFwiOlwiYjhmN2U3YzA0Yl9tZHE2bWphNm16bVwiLFwibmFtZVwiOlwicmVzaXplXCJ9fSxcIm9uRXJyb3JcIjp7XCJfX3R5cGVfX1wiOlwiY3Jvc3NfZG9tYWluX2Z1bmN0aW9uXCIsXCJfX3ZhbF9fXCI6e1wiaWRcIjpcIjg5OTgxYjMwYTFfbWRxNm1qYTZtem1cIixcIm5hbWVcIjpcInRcIn19fSJ9__" style="background-color: transparent; border: none;"></iframe>
                    </div>
                </div>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
</div>
<!-- footer -->
<div class="border-top border-light">
    <div class="container">
        <div class="row text-center align-items-center">
            <div class="p-4 col-md-4">
                <h2 class="mb-4">Your Line</h2>
                <p>Your Line은 제주에서 더 가치있는 경험을 추구합니다. 더 이상 기다리지 마세요.</p>
            </div>
            <div class="p-4 col-md-4">
                <h2 class="mb-4">Mapsite</h2>
                <ul class="list-unstyled"> <a href="#" class="text-dark">Home</a> <br> <a href="#" class="text-dark">About us</a> <br> <a href="#" class="text-dark">Our services</a> <br> <a href="#" class="text-dark">Stories</a>
                </ul>
            </div>
            <div class="p-4 col-md-4">
                <h2 class="mb-4">Contact</h2>
                <p> <a href="#" class="text-dark">
                    <i class="fa d-inline mr-3 text-muted fa-phone"></i>+082 10 1234 5678</a> </p>
                <p> <a href="#" class="text-dark">
                    <i class="fa d-inline mr-3 text-muted fa-envelope-o"></i>info@yourline.com</a> </p>
                <p> <a href="#" class="text-dark">
                    <i class="fa d-inline mr-3 fa-map-marker text-muted"></i>154904, 제주시, JEJU</a> </p>
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
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous" ></script>
<script src="./js/navscroll.js" ></script>
<script src="./js/upbtn.js" ></script>
<script>
var money = 1;
// Render the PayPal marks
paypal.Marks().render('#paypal-marks-container');
// Listen for changes to the radio buttons
document.querySelectorAll('input[name=payment-option]').forEach(function(el) {
    el.addEventListener('change', function(event) {
        // If PayPal is selected, show the PayPal button
        if (event.target.value === '100') {
            money = 1;
        }
        if (event.target.value === '300') {
            money = 2.9;
        }
        if (event.target.value === '500') {
            money = 4.8;
        }
        if (event.target.value === '800') {
            money = 7.6;
        }
        if (event.target.value === '1000') {
            money = 9.3;
        }
        if (event.target.value === '2000') {
            money = 18;
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
            alert(money + ' 포인트 결제가 완료되었습니다. 사용자 이름:' + details.payer.name.given_name);
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
// Hide non-PayPal button by default
document.body.querySelector('#alternate-button-container').style.display = 'none';
</script>
<pingendo onclick="window.open('https://pingendo.com/', '_blank')" style="cursor:pointer;position: fixed;bottom: 20px;right:20px;padding:4px;background-color: #00b0eb;border-radius: 8px; width:220px;display:flex;flex-direction:row;align-items:center;justify-content:center;font-size:14px;color:white">Made with Pingendo Free&nbsp;&nbsp;<img src="https://pingendo.com/site-assets/Pingendo_logo_big.png" class="d-block" alt="Pingendo logo" height="16"></pingendo>
</body>

</html>
