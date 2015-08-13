<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : user
    Created on : May 5, 2015, 4:05:26 PM
    Author     : davidchang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>個人設定</title>
        <!-- JQuery -->
        <script src="js/jquery-1.11.2.min.js"></script>
        <!-- bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap.theme.min.css">
        <!-- jquery form-validator -->
        <script src="js/form-validator/jquery.form-validator.min.js"></script>
        <!-- Custom -->
        <link rel="stylesheet" href="css/index.css">
        <style>
            .border{
                border: solid 3px blue;
                border-radius: 10px;
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="border">
                            <h3>${userInfo.name}, 您好</h3>
                        <br/>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="input-group">
                                    <div class="input-group-addon">ID</div>
                                    <input class="form-control input-lg" value="${userInfo.id}">
                                </div></div>
                            <div class="col-lg-8">
                                <div class="input-group">
                                    <div class="input-group-addon">使用者名稱</div>
                                    <input class="form-control input-lg" value="${userInfo.name}">
                                </div>
                            </div></div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="input-group">
                                    <div class="input-group-addon">電子郵件</div>
                                    <input class="form-control input-lg" value="${userInfo.email}">
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="input-group">
                                    <div class="input-group-addon">備註</div>
                                    <input class="form-control input-lg" value="${userInfo.description}">
                                </div>
                            </div>
                        </div>
                    </div><!-- border -->
                    <div class="border">
                        <form method="post" action="EditUserPasswordAction">
                            <h5>修改密碼</h5>
                            <br/>
                            <div class="input-group">
                                <input class="form-control" name="password" placeholder="請輸入新密碼"
                                       data-validation="strength" data-validation-strength="1" data-validation-error-msg="密碼強度太低">
                            </div>
                            <br/>
                            <div class="input-group">
                                <input class="form-control" name="confirmPassword" placeholder=" 請重複輸入密碼"
                                       data-validation="confirmation" data-validation-confirm="password" data-validation-error-msg=" 請再次輸入密碼">
                            </div>
                            <br/>
                            <button class="btn btn-primary" disabled>修改密碼</button>
                        </form>
                    </div><!-- border -->
                </div><!-- col-lg-6 -->
                <div class="col-lg-6">

                    <form>
                    </form>
                </div><!-- col-lg-6 -->
            </div>
        </div>
    </body>
</html>
