<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/views/include.jsp" %>
<html>
<head>
    <title>Log In</title>
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
    <div class="row">
        <div class="container">
            <div class="row" style="margin-top: 50px">
                <div class="col-1">
                    <img src="/images/shopee-logo.png" class="img-fluid"/>
                </div>
                <div class="col-2" style="padding-left: 0">
                    <h2 style="margin-top: 12%; color: #f1582c">Shopee</h2>
                </div>
                <div class="col-1 offset-8">
                    <a href="/home-buyer.htm" class="btn" style="margin-top: 30%; color: #f1582c">Home</a>
                </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-8">
                    <img src="/images/login-photo.png" class="img-fluid">
                </div>
                <div class="col-4">
                    <form action="/account/login.action" method="POST">
                        <table class="table table-borderless bg-light">
                            <tr>
                                <th class="text-center" colspan="2"><label>Sign in</label></th>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <label for="username">Username</label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <img src="/images/user-icon.png" class="img-fluid"
                                             style="height: 20px; width: 20px">
                                    </span>
                                        </div>
                                        <input type="text" class="form-control" placeholder="Your Username"
                                               id="username"
                                               name="username">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <label for="passowrd">Password</label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <img src="/images/pwd-icon.png" class="img-fluid"
                                             style="height: 20px; width: 20px">
                                    </span>
                                        </div>
                                        <input type="password" class="form-control" placeholder="Your Password"
                                               id="passowrd"
                                               name="password">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="height:100px;padding-top: 90px">
                                    <%--<a href="#">Forgot your password?</a>--%>
                                </td>
                                <td style="height:100px;padding-top: 90px">
                                    <a href="#" data-toggle="modal" data-target="#signUp">
                                        Sign Up
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="height:50px;padding-top: 35px">
                                    <button type="submit" class="btn btn-primary btn-block">Log in</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="modal fade" id="signUp" tabindex="-1" role="dialog" aria-labelledby="signUp" aria-hidden="true">
    <form id="signUpForm" action="/account/signUp.action" method="POST">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Sign Up</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table table-borderless bg-light">
                        <tr>
                            <td>
                                <label for="username_signUp">Username</label>
                                <input type="text" class="form-control" placeholder="Your Username" id="username_signUp"
                                       name="username_signUp"
                                       onblur="checkIsExist()" required/>
                                <label class="text-danger" id="username-warn"
                                       style="display: none;margin-bottom: 0;padding-bottom: 0">Username already
                                    exist!</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="password_signUp">Password</label>
                                <input type="password" class="form-control"
                                       placeholder="6-20 characters"
                                       id="password_signUp" name="password_signUp" onblur="validatePassword()"
                                       required/>
                                <label class="text-danger" id="password-warn1"
                                       style="display: none;margin-bottom: 0;padding-bottom: 0">Please enter a valid
                                    password!<br>
                                    Password should only contains 6-20 English letters and numbers!
                                </label>
                            </td>
                        </tr>
                        <td>
                            <label for="password_confirm">Re-enter Password</label>
                            <input type="password" class="form-control"
                                   placeholder="Re-enter password"
                                   id="password_confirm" onblur="confirmPassword()" required/>
                            <label class="text-danger" id="password-warn2"
                                   style="display: none;margin-bottom: 0;padding-bottom: 0">Password must match!
                            </label>
                        </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="email">Email Address</label>
                                <input type="text" class="form-control"
                                       placeholder="Your Username" id="email" name="email" onblur="checkEmail()"
                                       required/>
                                <label class="text-danger" id="email-warn"
                                       style="display: none;margin-bottom: 0;padding-bottom: 0">Please enter validate
                                    Email Address!
                                </label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" onsubmit="return submit()">Submit</button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>

<script>
    var validate = false;

    function checkIsExist() {
        var username = $.trim($("#username_signUp").val());
        var usernameWarn = $("#username-warn");
        $.post("/account/checkUsername.action", {username: username}, function (data) {
            if (data == "exist") {
                usernameWarn.show();
                validate = false;
            } else {
                usernameWarn.hide();
                validate = true;
            }
        });
    }

    function validatePassword() {
        var passwordWarn1 = $("#password-warn1");
        reg = /^[\@A-Za-z0-9]{6,20}$/;
        if (!reg.test($("#password_signUp").val())) {
            passwordWarn1.show();
            validate = false;
        } else {
            passwordWarn1.hide();
            validate = true;
        }
    }

    function confirmPassword() {
        var password1 = $("#password_signUp").val();
        var password2 = $("#password_confirm").val();
        if (password1 != password2) {
            $("#password-warn2").show();
            validate = false
        } else {
            $("#password-warn2").hide();
            validate = true
        }
    }

    function checkEmail() {
        var emailWarn = $("#email-warn");
        var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
        if (!reg.test($("#email").val())) {
            emailWarn.show();
            validate = false;
        } else {
            emailWarn.hide();
            validate = true;
        }
    }

    function submit() {
        return validate;
    }

</script>