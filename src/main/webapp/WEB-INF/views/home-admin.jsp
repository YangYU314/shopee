<html>
<head>
    <title>My Account</title>
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
        function showAllItems() {
            $("#showWindow").load("/admin/manageItems");
            $("#show_setting").hide();
            $("#showWindow").show()
        }

        function showSettings() {
            $("#show_setting").show();
            $("#showWindow").hide()
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
        <div class="col-2 offset-6">
            <a href="/home-buyer.htm" class="btn text-body">Home</a>
            <a href="/home-admin" class="btn text-body">${sessionScope.username}</a>
            <a href="/account/signOut.action" class="btn text-body">Sign Out</a>
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
    <div class="row">
        <table class="table table-striped col-2 offset-1">
            <thead>
            <tr>
                <th scope="col" style="background-color: #ff5521">Resource Management</th>
            </tr>
            </thead>
            <tbody>
            <tr onclick="showAllItems()">
                <td>Items</td>
            </tr>
            <tr onclick="showSettings()">
                <td>Personal Details Settings</td>
            </tr>
            </tbody>
        </table>
        <div id="showWindow" class="col">

        </div>
        <div class="col" id="show_setting" style="display: none">
            <div class="container-fluid">
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
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>