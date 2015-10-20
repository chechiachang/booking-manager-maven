<%-- 
    Document   : newmail
    Created on : Oct 12, 2015, 11:00:29 AM
    Author     : davidchang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Angular Mail</title>
        <script src="assets/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
        <script src="assets/bootstrap-3.3.5-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="assets/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <script src="assets/angular-1.4.7/js/angular.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-10">
                    <table>
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody ng-init="emails = [
    { from: 'John', subject: 'I love angular', date: 'Jan 1' },
                            { from: 'Jack', subject: 'Angular and I are just friends', date: 'Feb 15' },
                            { from: 'Ember', subject: 'I hate you Angular!', date: 'Dec 8' }
                            ]">
                            <tr ng-repeat="email in emails">
                                <td></td>
                                <td></td>   
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
