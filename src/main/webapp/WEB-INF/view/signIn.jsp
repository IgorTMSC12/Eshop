<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bootstrap 4 Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-8 offset-md-4">
            <h2>Login</h2>
            <p>Please, enter your credentials</p>
            <form method="post" action="/login" class="needs-validation" novalidate>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" class="form-control w-25" id="email" placeholder="Enter email" name="email"
                           required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="text" class="form-control w-25" id="password" placeholder="Enter password" name="password"
                           required>
                </div>
                <button type="submit" class="btn btn-primary">Войти</button>
            </form>
            <form method="get" action="/registration">
                <button type="submit" class="btn btn-primary">Зарегистрироваться</button>
            </form>
        </div>
    </div>
</div>
<script>
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            var forms = document.getElementsByClassName('needs-validation');
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false)
    })(); 
</script>
</body>
</html>