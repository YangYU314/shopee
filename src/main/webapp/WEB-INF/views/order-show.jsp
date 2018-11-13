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
    <div class="row">
        <div class="container">
            <div class="row bg-light">
                <h4 class="col" style="margin-top: 10px">Order</h4>
            </div>
            <div class="row" style="margin-top: 10px">
                <h3>1 &nbsp; Delivery &nbsp; address</h3>
            </div>
            <div class="row border">
                <table class="table">
                    <tbody>
                    <tr>
                        <td style="width: 40%"><label>Full &nbsp; Name:</label></td>
                        <td><label>${checkoutInfo.order.receiver}</label></td>
                    </tr>
                    <tr>
                        <td><label>Phone &nbsp; Number:</label></td>
                        <td>
                        <td><label>${checkoutInfo.order.phone}</label></td>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Street &nbsp; Address:</label></td>
                        <td>
                        <td><label>${checkoutInfo.order.street}</label></td>
                        </td>
                    </tr>
                    <tr>
                        <td><label>City &nbsp; / &nbsp; Suburb &nbsp; / &nbsp; Town:</label></td>
                        <td>
                        <td><label>${checkoutInfo.order.city}</label></td>
                        </td>
                    </tr>
                    <tr>
                        <td><label>State &nbsp; / &nbsp; Territory:</label></td>
                        <td>
                        <td><label>${checkoutInfo.order.state}</label></td>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="row" style="margin-top: 10px">
                <h3>2 &nbsp; Delivery &nbsp; Time</h3>
            </div>
            <div class="row border">
                <label>${checkoutInfo.order.delivery_time}</label>
            </div>
            <div class="row" style="margin-top: 10px">
                <h3>3 &nbsp; Items</h3>
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
                                        class="qtys">${checkoutInfo.items[i-1].qty}</span></label>
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
                            <td>${checkoutInfo.totalPhones}</td>
                        </tr>
                        <tr>
                            <td>Total Due (Inc GST)</td>
                            <td>$${checkoutInfo.order.price}</td>
                        </tr>
                        <tr>
                            <td>Delivery</td>
                            <td>$0</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>