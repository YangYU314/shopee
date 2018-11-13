<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include.jsp" %>
<html>
<head>
    <title>Mobile Phone</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="/bootstrap/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
    <script>
        function checkout() {
            var totalPrice = $("#totalPrice").html();
            var qtys = $(".qty");
            var qtyList = [];
            for (var i = 0; i < qtys.length; i++) {
                qtyList.push(qtys[i].value)
            }
            var itemIds = $(".ids");
            var itemIdList = [];
            for (var i = 0; i < itemIds.length; i++) {
                itemIdList.push(itemIds[i].value)
            }
            $("#show").load("/order/checkOut", {
                "totalPrice": totalPrice,
                "qtys": qtyList,
                "itmeIds": itemIdList
            })
        }

        function refresh() {
            var qtys = $(".qty");
            var qtyList = [];
            for (var i = 0; i < qtys.length; i++) {
                qtyList.push(qtys[i].value)
            }
            var prices = $(".price")
            var priceList = [];
            for (var i = 0; i < prices.length; i++) {
                priceList.push(prices[i].value)
            }
            var totalPrice = 0;
            for (var i = 0; i < priceList.length; i++) {
                totalPrice += (priceList[i] * qtyList[i])
            }
            $("#totalPrice").html(totalPrice);
        }

        function plus(i, item_id) {
            var text = "#" + i;
            var qty = $(text).val();
            qty++;
            $(text).val(qty);
            $.post("/cart/changeQty", {item_id: item_id, qty: qty});
            refresh()
        }

        function minus(i, item_id) {
            var text = "#" + i;
            var qty = $(text).val();
            if (qty > 1) {
                qty--;
                $(text).val(qty)
            }
            $.post("/cart/changeQty", {item_id: item_id, qty: qty});
            refresh()
        }

        function remove(item_id) {
            $("#i").hide();
            $.post("/cart/remove/" + item_id);

        }
    </script>
</head>
<body id="show">
<div class="container-fluid">
    <div class="row bg-light">
        <div class="col-3 offset-1" style="padding-top: 5px;padding-bottom: 5px">
            <img style="width: 30px" class="img-fluid" src="/images/trumpet.png">
            <label>Good News!</label>
        </div>
        <c:if test="${!empty username}">
            <div class="col-2 offset-6">
                <a href="/home-buyer.htm" class="btn text-body">Home</a>
                <a href="/account/setting" class="btn text-body">${sessionScope.username}</a>
                <a href="/account/signOut.action" class="btn text-body">Sign Out</a>
            </div>
        </c:if>
        <c:if test="${empty username}">
            <div class="col-2 offset-6">
                <a href="/home-buyer.htm" class="btn text-body">Home</a>
                <a href="/login.htm" class="btn text-body">Log In</a>
            </div>
        </c:if>
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
                <h4 class="col" style="margin-top: 10px">Cart</h4>
            </div>
            <c:forEach var="i" begin="1" end="${items.totalNumber}">
                <div class="row border" id="i">
                    <div class="col-2">
                        <img src="${items.mobiles[i-1].photo}" class="img-fluid">
                    </div>
                    <div class="col-3">
                        <label style="margin-top: 20px"><strong>${items.mobiles[i-1].brand}</strong></label>
                        <input type="text" class="ids" value="${items.mobiles[i-1].id}" style="display: none">
                        <p style="margin-top: 10px">${items.mobiles[i-1].model}</p>
                        <p style="margin-top: 10px">${items.mobiles[i-1].capacity}G</p>
                    </div>
                    <div class="col-1 offset-2">
                        <button type="button" class="btn btn-primary" style="margin-top: 50px"
                                onclick="remove(${items.mobiles[i-1].id})">Remove
                        </button>
                    </div>
                    <div class="col-1 offset-1">
                        <label style="margin-top:18px">Qty:</label>
                        <table>
                            <tr>
                                <td colspan="2"><input type="text" id="${i}" value="${items.qtys[i-1]}"
                                                       class="form-control qty"
                                                       onkeyup="value=value.replace(/[^\d]/g,'')">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="button" class="btn btn-light"
                                            onclick="plus(${i},${items.mobiles[i-1].id})">+
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-light"
                                            onclick="minus(${i},${items.mobiles[i-1].id})">-
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-1 offset-1">
                        <p style="margin-top:56px">$${items.mobiles[i-1].price}</p>
                        <input class="price" value="${items.mobiles[i-1].price}" style="display: none">
                    </div>
                </div>
            </c:forEach>
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
                            <td>Total Due (Inc GST)</td>
                            <td>$<span id="totalPrice">${items.totalPrice}</span>
                                <input type="text" style="display: none" value="${items.totalPrice}" id="totalValue">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-1 offset-10">
                    <button type="button" class="btn btn-primary" style="margin-top: 50px" onclick="checkout()">Check
                        Out
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>