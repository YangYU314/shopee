<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include.jsp" %>
<html>
<head>
    <title>Mobile Phone</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="/bootstrap/jquery-3.3.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row bg-light">
        <div class="col-3 offset-1" style="padding-top: 5px;padding-bottom: 5px">
            <img style="width: 30px" class="img-fluid" src="/images/trumpet.png">
            <label>Good News!</label>
        </div>
        <div class="col-2 offset-6">
            <a href="/home-buyer.htm" class="btn text-body">Home</a>
            <a href="/login.htm" class="btn text-body">Log In</a>
        </div>
    </div>
    <div class="row" style="background-color: #ff5521">
        <div class="col-2 offset-1">
            <img src="/images/shopee-logo1.jpg" class="img-fluid"/>
        </div>
        <div class="col-6" style="margin-top: 50px">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search Items">
                <div class="input-group-append">
                    <span class="input-group-text">
                        <img src="/images/search.png" class="img-fluid" style="height: 20px; width: 20px">
                    </span>
                </div>
            </div>
        </div>
        <div class="col-1" style="margin-top: 55px;margin-left: 20px">
            <img src="/images/shopping-cart1.png" class="img-fluid" style="width: 30px">
            <label class="text-white"><strong>My Cart</strong></label>
        </div>
    </div>
    <div class="row">
        <div class="container">
            <div class="row bg-light">
                <h4 class="col" style="margin-top: 10px">Order</h4>
            </div>
            <div class="row" style="margin-top: 10px">
                <h3>1 &nbsp; Delivery &nbsp; address</h3>
            </div>
            <div class="row border">
                <table class="table table-borderless">
                    <tbody>
                    <tr>
                        <td style="width: 20%"><label>Full &nbsp; Name</label></td>
                        <td><input class="form-control" type="text" placeholder="Receiver Name" name="receiver"
                                   id="receiver"></td>
                    </tr>
                    <tr>
                        <td><label>Phone &nbsp; Number</label></td>
                        <td><input class="form-control" type="text" placeholder="Receiver Phone Number" name="phone"
                                   id="phone">
                        </td>
                    </tr>
                    <tr>
                        <td><label>Street &nbsp; Address</label></td>
                        <td><input class="form-control" type="text" placeholder="Receiver Street Name" name="street"
                                   id="street">
                        </td>
                    </tr>
                    <tr>
                        <td><label>City &nbsp; / &nbsp; Suburb &nbsp; / &nbsp; Town</label></td>
                        <td><input class="form-control" type="text" placeholder="Address" name="address1" id="city">
                        </td>
                    </tr>
                    <tr>
                        <td><label>State &nbsp; / &nbsp; Territory</label></td>
                        <td><input class="form-control" type="text" placeholder="Address" name="address2" id="state">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="row" style="margin-top: 10px">
                <h3>2 &nbsp; Delivery &nbsp; Time</h3>
            </div>
            <div class="row border">
                <table class="table table-borderless">
                    <tbody>
                    <tr>
                        <td>
                            <div class="custom-control custom-radio">
                                <input type="radio" id="customRadio1" name="dTime" class="custom-control-input"
                                       value="Unlimited">
                                <label class="custom-control-label" for="customRadio1">Unlimited : Monday -
                                    Sunday</label>
                            </div>
                        </td>
                        <td>
                            <div class="custom-control custom-radio">
                                <input type="radio" id="customRadio2" name="dTime" class="custom-control-input"
                                       value="Weekdays">
                                <label class="custom-control-label" for="customRadio2">Weekdays : Monday -
                                    Friday</label>
                            </div>
                        </td>
                        <td>
                            <div class="custom-control custom-radio">
                                <input type="radio" id="customRadio3" name="dTime" class="custom-control-input"
                                       value="Weekends">
                                <label class="custom-control-label" for="customRadio3">Weekends : Saturday -
                                    Sunday</label>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="row" style="margin-top: 10px">
                <h3>3 &nbsp; Payment &nbsp; Method</h3>
            </div>
            <div class="row border">
                <table class="table table-borderless">
                    <thead>
                    <tr>
                        <th><h4>Your credit cards</h4></th>
                        <th><h4>Name on card</h4></th>
                        <th><h4>Expiry date</h4></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <div class="custom-control custom-radio">
                                <input type="radio" id="masterCard" name="dTime" class="custom-control-input"
                                       value="masterCard">
                                <label class="custom-control-label" for="customRadio1">MasterCard ending in 1234</label>
                            </div>
                        </td>
                        <td>
                            <label>Yvan Wong</label>
                        </td>
                        <td>
                            <label>10/2021</label>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="row" style="margin-top: 10px">
                <h3>4 &nbsp; Items</h3>
            </div>
            <div class="row">
                <div class="container-fluid border">
                    <c:forEach var="i" begin="1" end="${checkoutInfo.totalPhones}">
                        <div class="row">
                            <div class="col-2">
                                <img src="${checkoutInfo.mobiles[i-1].photo}" class="img-fluid">
                            </div>
                            <div class="col-3">
                                <label style="margin-top: 20px"><strong>${checkoutInfo.mobiles[i-1].brand}</strong></label>
                                <input type="text" class="ids" value="${checkoutInfo.mobiles[i-1].id}"
                                       style="display: none">
                                <p style="margin-top: 10px">${checkoutInfo.mobiles[i-1].model}</p>
                                <p style="margin-top: 10px">${checkoutInfo.mobiles[i-1].capacity}G</p>
                            </div>
                            <div class="col-1 offset-3">
                                <label style="margin-top:60px">Qty:<span
                                        class="qtys">${checkoutInfo.qtys[i-1]}</span></label>
                            </div>
                            <div class="col-1 offset-1">
                                <p style="margin-top:56px">$${checkoutInfo.mobiles[i-1].price}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="row" style="margin-top: 20px">
                <div class="col-5 offset-7">
                    <table class="table border" style="margin-left: 15px">
                        <thead>
                        <tr>
                            <td colspan="2"><strong>ORDER SUMMARY</strong></td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Item Qty</td>
                            <td>${checkoutInfo.totalItems}</td>
                        </tr>
                        <tr>
                            <td>Total Due (Inc GST)</td>
                            <td>$${checkoutInfo.totalPrice}</td>
                        </tr>
                        <tr>
                            <td>Delivery</td>
                            <td>$0</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-1 offset-10">
                    <button type="button" class="btn btn-warning" style="margin-top: 50px" onclick="placeOrder()">Place
                        Your Order
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script>
    function placeOrder() {
        var price =${checkoutInfo.totalPrice};
        var street = $("#street").val();
        var delivery = $('input:radio:checked').val();
        var receiver = $("#receiver").val();
        var phone = $("#phone").val();
        var city = $("#city").val();
        var state = $("#state").val();
        var idTags = $(".ids")
        var qtyTags = $(".qtys")
        var idList = [];
        var qtyList = [];
        for (var i = 0; i < idTags.length; i++) {
            idList.push(idTags[i].value)
        }
        for (var i = 0; i < qtyTags.length; i++) {
            qtyList.push(qtyTags[i].innerText)
        }
        $("#show").load("/order/placeOrder",
            {
                price: price,
                street: street,
                delivery: delivery,
                receiver: receiver,
                phone: phone,
                city: city,
                state: state,
                ids: idList,
                qtys: qtyList
            })
    }
</script>