<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include.jsp" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="/bootstrap/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid" id="refreshWindow">
    <div class="row">
        <button class="btn btn-primary col-3 offset-1" onclick="add()">Add Product</button>
    </div>
    <div class="row">
        <div class="container">
            <div class="row" id="showPhones">
                <c:forEach items="${allPhones}" var="phone">
                    <div class="card col-3 " id="${phone.id}"
                         style="margin-left: 20px;margin-right: 20px;margin-top: 10px;margin-bottom: 10px">
                        <a href="/mobile_phone/detailed/${phone.id}">
                            <div class="card-body">
                                <h5 class="card-title"><c:out value="${phone.brand}"/></h5>
                                <p class="card-text phones"><c:out value="${phone.model}"/>&nbsp;<c:out
                                        value="${phone.capacity}"/>G
                                    &nbsp;<c:out value="${phone.color}"/></p>
                            </div>
                            <img class="card-img-top" src="<c:out value="${phone.photo}"/>"
                                 alt="Card image cap">
                            <div class="card-body">
                                <a href="#" class="card-text">$<c:out
                                        value="${phone.price}"/></a>
                            </div>
                            <div class="card-body">
                                <button type="button" class="btn btn-primary" onclick="update(${phone.id})">Update
                                </button>
                                <button type="button" class="btn btn-danger" style="margin-left: 40px"
                                        onclick="deleteP(${phone.id})">Delete
                                </button>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    function update(id) {
        $("#refreshWindow").load("/admin/update/" + id);
    }

    function add() {
        $("#refreshWindow").load("/admin/showAdd");
    }

    function deleteP(id) {
        $.get("/admin/delete/" + id);
        $("#" + id).hide();
    }
</script>
