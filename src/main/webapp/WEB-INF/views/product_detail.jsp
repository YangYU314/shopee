<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Detail</title>
    <script src="/bootstrap/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/bootstrap/jquery.rateyo.min.css"/>
    <script src="/bootstrap/jquery.rateyo.min.js"></script>
    <script>
        $(function () {
            $(".rate").rateYo({});
        });

        function showReview() {
            $("#Review").attr("class", "nav-link active");
            $("#Description").attr("class", "nav-link");
            $("#show_description").hide();
            $("#show_review").show();
        }

        function showDescrip() {
            $("#Description").attr("class", "nav-link active");
            $("#Review").attr("class", "nav-link");
            $("#show_description").show();
            $("#show_review").hide();
        }

        function addToCart(id) {
            $.get("/cart/addToCart/" + id, function (result) {
                alert(result)
            })
        }
    </script>
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
                <a href="/login.htm" class="btn text-body">${sessionScope.username}</a>
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
            <a href="/cart/showCart">
                <img src="/images/shopping-cart1.png" class="img-fluid" style="width: 30px">
                <label class="text-white"><strong>My Cart</strong></label>
            </a>
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
</div>
<div class="container">
    <div class="row">
        <div class="col-3">
            <img alt="140x140" src="${detailedInfo.mobile.photo}" class="img-fluid"/>
        </div>
        <div class="col-8 offset-1" style="margin-top: 20px">
            <div class="container-fluid">
                <div class="row">
                    <ul class="col">
                        <c:forTokens items="${detailedInfo.abstracts}" delims=";" var="dInfo">
                            <li><h5><c:out value="${dInfo}"/></h5></li>
                        </c:forTokens>
                    </ul>
                </div>
                <div class="row">
                    <span data-rateyo-rating="${detailedInfo.avgRate}" data-rateyo-star-width="25px" class="rate col-2"
                          data-rateyo-read-only="true"></span>
                    <h6 class="col-1" style="margin-top: 3px">${detailedInfo.avgRate}</h6>
                </div>
                <div class="row" style="margin-top: 20px">
                    <h3 class="col-1 text-danger">$${detailedInfo.mobile.price}</h3>
                    <button type="button" class="btn btn-warning col-2 offset-2"
                            onclick="addToCart(${detailedInfo.mobile.id})">Add to Cart
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" id="Description" onclick="showDescrip()">Description</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="Review" onclick="showReview()">Review</a>
            </li>
        </ul>
    </div>
    <div class="row" id="show_description">
        <c:forEach items="${detailedInfo.descriptions}" var="descrip">
            <h4><c:out value="${descrip.key}"/></h4>
            <dl>
                <c:forTokens items="${descrip.value}" delims="|" var="desp">
                    <dd><c:out value="${desp}"/></dd>
                </c:forTokens>
            </dl>
        </c:forEach>
    </div>
    <div class="row" id="show_review" style="display: none">
        <div class="container-fluid">
            <div class="row">
                <h3>Reviews</h3>
            </div>
            <div class="row">
                <div class="col-5">
                    <div class="container-fluid">
                        <div class="row">
                            <h5>Rating Snapshot</h5>
                        </div>
                        <c:forEach var="i" begin="0" end="4">
                            <div class="row">
                                <div class="col-1">
                                    <span>${5-i}★</span>
                                </div>
                                <div class="col-9">
                                    <div class="progress" style="margin-top: 5px">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="20"
                                             aria-valuemin="0"
                                             aria-valuemax="${detailedInfo.rateNum}"
                                             style="width: ${detailedInfo.allRates[i]/detailedInfo.rateNum}%">${detailedInfo.allRates[i]}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-6">
                    <h5>Average Customer Ratings</h5>
                    <table>
                        <tr>
                            <td>Overall</td>
                            <td style="margin-left: 10px"><span id="overall"
                                                                data-rateyo-rating="${detailedInfo.avgRate}"
                                                                data-rateyo-star-width="18px" class="rate"
                                                                data-rateyo-read-only="true"></span></td>
                            <td style="margin-left: 10px"><h6 style="margin-top: 7px;">${detailedInfo.avgRate}</h6>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <c:forEach items="${detailedInfo.reviews}" var="review">
                <div class="row">
                    <div class="container-fluid border" style="margin-top: 20px">
                        <div class="row" style="margin-top: 20px">
                            <div class="col-2">
                        <span data-rateyo-rating="${review.rate}"
                              data-rateyo-star-width="18px" class="rate" data-rateyo-read-only="true"></span>
                            </div>
                            <div class="col-1">
                                <label>${review.username}</label>
                            </div>
                            <div class="col-3">
                                <label>${review.date}</label>
                            </div>
                        </div>
                        <div class="row">
                            <h4 class="col">${review.title}</h4>
                        </div>
                        <div class="row">
                            <p class="col">${review.content}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>




