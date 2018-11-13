<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
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
        </c:forEach>
    </div>
</div>
</body>
</html>
