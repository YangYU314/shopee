<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include.jsp" %>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
      integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="/bootstrap/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<link rel="stylesheet" href="/bootstrap/jquery.rateyo.min.css"/>
<script src="/bootstrap/jquery.rateyo.min.js"></script>
<html>
<head>
    <title>Profile</title>
</head>
<body>
<div class="container-fluid">
    <div class="row bg-light" \>
        <div class="col-3 offset-1" style="padding-top: 5px;padding-bottom: 5px">
            <img style="width: 30px" class="img-fluid" src="/images/trumpet.png">
            <label>Good News!</label>
        </div>
        <div class="col-8 text-right">
            <a href="/home-buyer.htm" class="btn text-body">Home</a>
            <a href="" class="btn text-body">${username}</a>
            <a href="/home-buyer.htm" class="btn text-body">Log Out</a>
        </div>
    </div>
    <div class="row" style="background-color: #ff5521">
        <div class="col-12 offset-1">
            <img src="/images/shopee-logo1.jpg" class="img-fluid" style="height: 125px; width: 240px"/>
        </div>
    </div>
    <div class="row" style="background-color:#cce5ff">
        <div class="col-12 offset-1">
            <h3>Hi, ${username}</h3>
        </div>
    </div>
    <div class="row">
        <table class="table table-striped col-2 offset-1">
            <thead>
            <tr>
                <th scope="col" style="background-color: #ff5521">Personal Management</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td onclick="showOrders()">Orders</td>
            </tr>
            <tr>
                <td onclick="showSettings()">Personal Details Settings</td>
            </tr>
            </tbody>
        </table>
        <div class="col-6" id="showWindow">
            <div class="container-fluid" id="show_setting">
                <div class="row" style="margin-top: 50px; margin-bottom: 50px">
                    <form class="form-horizontal col" role="form" id="setting"
                          action="/account/updateUserSetting.action"
                          method="POST">
                        <div class="form-group">
                            <label for="inputUsername" class="col-sm-2 control-label">Username</label>
                            <div class="col-sm-10">
                                <input id="username_signUp"
                                       name="username_signUp" type="text" class="form-control" id="inputUsername"
                                       value=${sessionScope.username} placeholder=${sessionScope.username} />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                                <input id="password_signUp" name="password_signUp" type="password" class="form-control"
                                       value=${sessionScope.password} placeholder=${sessionScope.password} />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-4 control-label">Confirm Password</label>
                            <div class="col-sm-10">
                                <input id="password_confirm" type="password" class="form-control"
                                       value=${sessionScope.password} placeholder=${sessionScope.password} />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input id="email" name="email" type="email" class="form-control" id="inputEmail"
                                       value=${sessionScope.email} placeholder=${sessionScope.email} />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary">Save</button>
                                <button href="/home-buyer.htm" class="btn btn-primary" style="margin-left: 30px;">
                                    Cancel
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div id="show_orders" style="display: none">
                <div class="container-fluid">
                    <c:forEach items="${order_bodies}" var="order">
                        <div class="row">
                            <div class="container-fluid border" style="margin-top: 20px">
                                <div class="row" style="margin-top: 20px">
                                    <div class="col-1">
                                        <label>${order.id}</label>
                                    </div>
                                    <div class="col-3">
                                        <label>${order.date}</label>
                                    </div>
                                    <div class="col-2">
                                        <p class="col">$${order.price}</p>
                                    </div>
                                    <div class="row">
                                        <button type="button" class="btn btn-primary" onclick="showItems(${order.id})">
                                            view
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>

<script>
    function showOrders() {
        $("#show_orders").show();
        $("#show_setting").hide();
    }

    function showSettings() {
        $("#show_orders").hide();
        $("#show_setting").show();
    }

    function showItems(id) {
        $("#showWindow").load("/order/showItems/" + id)
    }
</script>
