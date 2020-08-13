<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include.jsp" %>
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
    <div class="col-6 align-self-center">
        <div class="input-group">
            <input id="searchText" type="text" class="form-control" placeholder="Search Items">
            <div class="input-group-append">
                    <span class="input-group-text" onclick="search()">
                        <img src="/images/search.png" class="img-fluid" style="height: 20px; width: 20px">
                    </span>
            </div>
        </div>
    </div>
    <div class="col-2 align-self-center" style="margin-left: 20px">
        <a id="cart" class="btn" href="/cart/showCart">
            <img src="/images/shopping-cart1.png" class="img-fluid" style="width: 30px">
            <label class="text-white"><strong>My Cart</strong></label>
        </a>
    </div>
</div>

<script>
    function search() {
        // $('#searchText').val()
        // $.ajax({
        //     type:"get",
        //     url:"/mobile_phone/find/"+$('#searchText').val()
        //     // success:function(msg){
        //     // if (msg) {//根据返回值进行跳转
        //     //     window.location.href = '你的跳转的目标地址';
        //     // }
        // })
        window.location.replace("/mobile_phone/find/"+$('#searchText').val());
    }
</script>
