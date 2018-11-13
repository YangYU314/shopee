<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include.jsp" %>
<html>
<head>
    <title>Shopee</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="/bootstrap/jquery-3.3.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
</head>
<body>
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
                <input id="searchText" type="text" class="form-control" placeholder="Search Items">
                <div class="input-group-append">
                    <span class="input-group-text" onclick="search()">
                        <img src="/images/search.png" class="img-fluid" style="height: 20px; width: 20px">
                    </span>
                </div>
            </div>
        </div>
        <div class="col-1" style="margin-top: 55px;margin-left: 20px">
            <a href="/cart/showCart">
                <img src="/images/shopping-cart1.png" class="img-fluid" style="width: 30px">
                <label class="text-white"><strong>My Cart</strong></label>
            </a>
        </div>
    </div>
    <div class="row" id="category">
        <table class="table table-striped col-2 offset-1">
            <thead>
            <tr>
                <th scope="col" style="background-color: #ff925a">Category</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td onmouseenter="showComputerOptions()" onmouseleave="hideComputerOptions()">Computers & Tablets</td>
            </tr>
            <tr>
                <td>TVs</td>
            </tr>
            <tr>
                <td>Headphones,Speakers & Audio</td>
            </tr>

            <tr>
                <td>Cameras</td>
            </tr>
            <tr>
                <td onmouseenter="showMobileOptions()" onmouseleave="hideMobileOptions()">Mobile Phones</td>
            </tr>
            <tr>
                <td>Health,Fitness & Wearables</td>
            </tr>
            <tr>
                <td>Connected Home</td>
            </tr>
            </tbody>
        </table>
        <div id="carouselExampleIndicators" class="carousel slide col-8" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" style="height: 41%">
                <div class="carousel-item active">
                    <img class="d-block w-100 img-fluid" style="height: 100%" src="/images/1.png" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="/images/2.png" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="/images/3.png" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</div>
<div class="container-fluid" id="shows">
    <div class="row offset-1 offset-2">
        <c:forEach items="${bestSellers}" var="mobilePhone">
            <div class="card col-2"
                 style="margin-left: 20px;margin-right: 20px;margin-top: 10px;margin-bottom: 10px">
                <a href="/mobile_phone/detailed/${mobilePhone.id}">
                    <div class="card-body">
                        <h5 class="card-title"><c:out value="${mobilePhone.brand}"/></h5>
                        <p class="card-text phones"><c:out value="${mobilePhone.model}"/>&nbsp;<c:out
                                value="${mobilePhone.capacity}"/>G
                            &nbsp;<c:out value="${mobilePhone.color}"/></p>
                    </div>
                    <img class="card-img-top" src="<c:out value="${mobilePhone.photo}"/>"
                         alt="Card image cap">
                    <div class="card-body">
                        <label class="card-text">$<c:out
                                value="${mobilePhone.price}"/></label>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>
<div id="mobiles" style="position: absolute;left: 25%;top: 25.1%;display: none" onmouseenter="showMobileOptions()"
     onmouseleave="hideMobileOptions()">
    <ul class="list-group">
        <li class="list-group-item"><strong>Apple iphone</strong></li>
        <li class="list-group-item"><a href="/mobile_phone/apple/iPhone XS">Apple iPhone XS</a></li>
        <li class="list-group-item"><a href="/mobile_phone/apple/iPhone XS MAX">Apple iPhone XS MAX</a></li>
        <li class="list-group-item"><a href="#">Apple iPhone X</a></li>
        <li class="list-group-item">Apple iPhone 8 / 8 Plus</li>
    </ul>
</div>
</body>
</html>

<script>
    function showComputerOptions() {
        $("#computers").show();
    }

    function hideComputerOptions() {
        $("#computers").hide();
    }

    function showMobileOptions() {
        $("#mobiles").show();
    }

    function hideMobileOptions() {
        $("#mobiles").hide();
    }

    // function search() {
    //     $("#category").hide();
    //     var key=$("#searchText").val()
    //     $("#shows").load("/mobile_phone/find/"+key)
    // }
</script>
