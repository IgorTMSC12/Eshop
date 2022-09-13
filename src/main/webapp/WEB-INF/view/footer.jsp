<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<footer class="text-center text-lg-start bg-light text-muted">
    <section class="">
        <div class="container text-center text-md-start mt-5">
            <div class="row mt-3">
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">
                        ПОПУЛЯРНЫЕ КАТЕГОРИИ
                    </h6>
                    <p>
                        <a href="/category?categoryId=1" class="text-reset">Мобильные телефоны</a>
                    </p>
                    <p>
                        <a href="/category?categoryId=3" class="text-reset">Ноутбуки</a>
                    </p>
                    <p>
                        <a href="/category?categoryId=8" class="text-reset">Холодильники</a>
                    </p>
                    <p>
                        <a href="/category?categoryId=14" class="text-reset">Автомобили</a>
                    </p>
                </div>
                <div class="col-md-4 col-lg-2 col-xl-2 mx-auto mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">
                        ПОЛЕЗНЫЕ ССЫЛКИ
                    </h6>
                    <p>
                        <a href="/home" class="text-reset">Главная</a>
                    </p>
                    <p>
                        <a href="/cabinet" class="text-reset">Личный кабинет</a>
                    </p>
                    <p>
                        <a href="/search" class="text-reset">Поиск товаров</a>
                    </p>
                </div>
                <div class="col-md-5 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">Контакты</h6>
                    <p><i class="fas fa-home me-3"></i> Беларусь, Минск</p>
                    <p>
                        <i class="fas fa-envelope me-3"></i>
                        eshop@gmail.com
                    </p>
                    <p><i class="fas fa-phone me-3"></i> +37529-555-55-55</p>
                    <p><i class="fas fa-print me-3"></i> +37544-555-55-55</p>
                </div>
            </div>
        </div>
    </section>
    <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
        © 2022 Copyright:
        <a class="text-reset fw-bold" href="https://mdbootstrap.com/">Eshop.by</a>
    </div>
</footer>
</body>
</html>