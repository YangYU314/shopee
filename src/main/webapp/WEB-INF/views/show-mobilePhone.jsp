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
    <script>

    </script>
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
    <div class="row" style="background-color: #e9ecef;height: 50px">
        <nav aria-label="breadcrumb" class="offset-1">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item" aria-current="page"><a href="#">Phones</a></li>
                <li class="breadcrumb-item active" aria-current="page">iPhone XS / XS Max</li>
            </ol>
        </nav>
    </div>
    <div class="row">
        <div class="col-2 offset-1">
            <table class="table table-borderless">
                <thead>
                <tr>
                    <th scope="col">Filters</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">Price</th>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="slider-range"></div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">Color</th>
                </tr>
                <c:forEach items="${resources.colors}" var="color">
                <tr>
                    <td>
                        <div class="form-check">
                            <input class="form-check-input colors" type="checkbox" value="${color}" id="${color}"
                                   onclick="filter()">
                            <label class="form-check-label" for="${color}" onclick="filter()">
                                    ${color}
                            </label>
                        </div>
                    </td>
                </tr>
                </c:forEach>
                <tr>
                    <th scope="row">Capacity</th>
                </tr>
                <c:forEach items="${resources.capacities}" var="capacity">
                <tr>
                    <td>
                        <div class="form-check">
                            <input class="form-check-input capacities" type="checkbox" value="${capacity}"
                                   id="${capacity}" onclick="filter()">
                            <label class="form-check-label" for="${capacity}" onclick="filter()">
                                    ${capacity}
                            </label>
                        </div>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col">
            <div class="container">
                <div class="row" style="margin-bottom: 10px">
                    <div class="col-3 offset-1">
                        <select class="custom-select" id="inputGroupSelect01">
                            <option selected>Choose...</option>
                            <option value="1">Price: Low → High</option>
                            <option value="2">Price: High → Low</option>
                        </select>
                    </div>
                </div>
                <div class="row" id="showPhones">
                    <c:set var="isDoing" value="true"/>
                    <c:forEach var="i" begin="0" end="${resources.number}">
                        <c:if test="${isDoing}">
                            <div class="card col-3 "
                                 style="margin-left: 20px;margin-right: 20px;margin-top: 10px;margin-bottom: 10px">
                                <a href="/mobile_phone/detailed/${resources.mobilePhones[i].id}">
                                    <div class="card-body">
                                        <h5 class="card-title"><c:out value="${resources.mobilePhones[i].brand}"/></h5>
                                        <p class="card-text phones"><c:out value="${resources.mobilePhones[i].model}"/>&nbsp;<c:out
                                                value="${resources.mobilePhones[i].capacity}"/>G
                                            &nbsp;<c:out value="${resources.mobilePhones[i].color}"/></p>
                                    </div>
                                    <img class="card-img-top" src="<c:out value="${resources.mobilePhones[i].photo}"/>"
                                         alt="Card image cap">
                                    <div class="card-body">
                                        <a href="#" class="card-text">$<c:out
                                                value="${resources.mobilePhones[i].price}"/></a>
                                    </div>
                                </a>
                            </div>
                        </c:if>
                        <%--<c:if test="${i eq 3}">--%>
                        <%--<c:set var="isDoing" value="false"/>--%>
                        <%--</c:if>--%>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script>
    $(function () {
        $("#slider-range").slider({
            range: true,
            min: ${resources.lowestPrice},
            max: ${resources.highestPrice},
            values: [${resources.lowestPrice}, ${resources.highestPrice}],
            slide: function (event, ui) {
                $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
            }
        });
        $("#amount").val("$" + $("#slider-range").slider("values", 0) +
            " - $" + $("#slider-range").slider("values", 1));
    });

    var colorOptions = $(".colors");
    var capacityOptions = $(".capacities");
    var prices;

    $("#slider-range").on("slidestop", function () {
        prices = $("#slider-range").slider("option", "values");
        var colors = new Array();
        var capacities = new Array();
        for (var i = 0; i < colorOptions.length; i++) {
            if (colorOptions[i].checked) {
                colors.push(colorOptions[i].value)
            }
        }
        for (var i = 0; i < capacityOptions.length; i++) {
            if (capacityOptions[i].checked) {
                capacities.push(capacityOptions[i].value)
            }
        }
        console.log(colors);
        console.log(capacities);
        if (colors.length > 0 && capacities.length > 0) {
            $('#showPhones').load("/mobile_phone/refreshAll", {
                "model": "${resources.model}",
                "colors": colors,
                "capacities": capacities,
                "prices": prices
            });
        }
        if (colors.length > 0 && capacities.length == 0) {
            $('#showPhones').load("/mobile_phone/refreshColors", {
                "model": "${resources.model}",
                "colors": colors,
                "prices": prices
            });
        }
        if (colors.length == 0 && capacities.length > 0) {
            $('#showPhones').load("/mobile_phone/refreshCapacities", {
                "model": "${resources.model}",
                "capacities": capacities,
                "prices": prices
            });
        }
        if (colors.length == 0 && capacities.length == 0) {
            $('#showPhones').load("/mobile_phone/refreshPrice", {
                "model": "${resources.model}",
                "prices": prices
            });
        }
    });

    function filter() {
        prices = $("#slider-range").slider("option", "values");
        colors = new Array();
        capacities = new Array();
        for (var i = 0; i < colorOptions.length; i++) {
            if (colorOptions[i].checked) {
                colors.push(colorOptions[i].value)
            }
        }
        for (var i = 0; i < capacityOptions.length; i++) {
            if (capacityOptions[i].checked) {
                capacities.push(capacityOptions[i].value)
            }
        }
        if (colors.length > 0 && capacities.length > 0) {
            $('#showPhones').load("/mobile_phone/refreshAll", {
                "model": "${resources.model}",
                "colors": colors,
                "capacities": capacities,
                "prices": prices
            });
        }
        if (colors.length > 0 && capacities.length == 0) {
            $('#showPhones').load("/mobile_phone/refreshColors", {
                "model": "${resources.model}",
                "colors": colors,
                "prices": prices
            });
        }
        if (colors.length == 0 && capacities.length > 0) {
            $('#showPhones').load("/mobile_phone/refreshCapacities", {
                "model": "${resources.model}",
                "capacities": capacities,
                "prices": prices
            });
        }
        if (colors.length == 0 && capacities.length == 0) {
            $('#showPhones').load("/mobile_phone/refreshPrice", {
                "model": "${resources.model}",
                "prices": prices
            });
        }
    }
</script>
