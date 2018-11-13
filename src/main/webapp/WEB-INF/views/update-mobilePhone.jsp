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
    <script src="http://malsup.github.com/jquery.form.js"></script>
</head>
<body>
<div class="container">
    <div class="row border" style="margin-top: 10px;padding: 15px">
        <div class="container-fluid">
            <div class="row">
                <h2>Brand</h2>
            </div>
            <div class="row col-11">
                <input id="newBrand" type="text" class="form-control" aria-label="Sizing example input"
                       aria-describedby="inputGroup-sizing-lg" value="${mobileInfo.brand}"/>
            </div>
        </div>
    </div>
    <div class="row border" style="margin-top: 10px;padding: 15px">
        <div class="container-fluid">
            <div class="row">
                <h2>Model</h2>
            </div>
            <div class="row col-11">
                <input id="newModel" type="text" class="form-control" aria-label="Sizing example input"
                       aria-describedby="inputGroup-sizing-lg" value="${mobileInfo.model}"/>
            </div>
        </div>
    </div>
    <div class="row border" style="margin-top: 10px;padding: 15px">
        <div class="container-fluid">
            <div class="row">
                <h2>Capacity</h2>
            </div>
            <div class="row col-11">
                <div class="input-group mb-3">
                    <input id="newCapacity" type="text" class="form-control" aria-label="Sizing example input"
                           aria-describedby="inputGroup-sizing-lg" value="${mobileInfo.capacity}"/>
                    <div class="input-group-append">
                        <span class="input-group-text" id="basic-addon2">G</span>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="row border" style="margin-top: 10px;padding: 15px">
        <div class="container-fluid">
            <div class="row">
                <h2>Color</h2>
            </div>
            <div class="row col-11">
                <input id="newColor" type="text" class="form-control" aria-label="Sizing example input"
                       aria-describedby="inputGroup-sizing-lg" value="${mobileInfo.color}"/>
            </div>
        </div>
    </div>
    <div class="row border" style="margin-top: 10px;padding: 15px">
        <div class="container-fluid">
            <div class="row">
                <h2>Image</h2>
            </div>
            <form id="imgUploader" enctype="multipart/form-data" action="/fileUpload" method="post">
                <div class="row">
                    <div class="col-8">
                        <input type="file" name="image">
                    </div>
                    <div class="col-2">
                        <button class="btn btn-primary btn-block" type="button" onclick="submitImg()">Upload</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="row border" style="margin-top: 10px;padding: 15px">
        <div class="container-fluid">
            <div class="row">
                <h2>Price</h2>
            </div>
            <div class="row col-11">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">$</span>
                    </div>
                    <input id="newPrice" type="text" class="form-control" aria-label="Sizing example input"
                           aria-describedby="inputGroup-sizing-lg" value="${mobileInfo.price}"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row border" style="margin-top: 10px;padding: 15px">
        <div class="container-fluid">
            <div class="row">
                <h2>Abstracts</h2>
            </div>
            <div class="row">
                <textarea class="form-control col-11" id="newAbstracts"
                          style="height: 80px">${mobileInfo.abstracts}</textarea>
            </div>
        </div>
    </div>
    <div class="row border" style="margin-top: 10px;padding: 15px">
        <div class="container-fluid">
            <div class="row">
                <h2>Description</h2>
            </div>
            <div class="row">
                <textarea class="form-control col-11" id="newDescriptions"
                          style="height: 80px">${mobileInfo.description}</textarea>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top: 30px">
        <div class="col-3">
            <button type="button" class="btn btn-primary btn-lg btn-block" onclick="update(${mobileInfo.id})">Update
            </button>
        </div>
    </div>
</div>
</body>
</html>

<script>
    var imgUrl = null;

    function submitImg() {
        $("#imgUploader").ajaxSubmit(function (data) {
            imgUrl = "/images/" + data;
        });
    }

    function update(id) {
        var brand = $("#newBrand").val();
        var model = $("#newModel").val();
        var capacity = $("#newCapacity").val();
        var color = $("#newColor").val();
        var price = $("#newPrice").val();
        var abstracts = $("#newAbstracts").html();
        var description = $("#newDescriptions").html();
        var photo = imgUrl;
        $.post("/admin/updating/" + id, {
            brand: brand,
            model: model,
            capacity: capacity,
            color: color,
            price: price,
            abstracts: abstracts,
            description: description,
            photo: photo
        }, function (data) {
            alert(data)
        })
    }
</script>
