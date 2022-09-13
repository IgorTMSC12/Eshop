<%@ page import="by.teachmeskills.eshop.entities.Image" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="menu.jsp"/>
<div style="text-align: center;"><h4>Корзина</h4></div>
<div class="container-fluid">
    <c:if test="${not empty cart.getProducts()}">
        <c:forEach items="${cart.getProducts()}" var="product">
            <div class="card-body">
                <div class="row">
                    <div class="col-1">
                        <c:forEach items="${images}" var="image">
                            <c:if test="${product.getId() == image.getProduct().getId()}">
                                <a href="/eshop?command=product-redirect&productId=${product.getId()}">
                                    <img style="width:100%;height:100%"
                                         src="${contextPath}/images/image_product/${image.getImagePath()}"
                                         alt="${image.getImagePath()}"></a>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="col-9">
                        <b>Модель:</b> ${product.getName()}<br>
                        <b>Описание:</b> ${product.getDescription()}<br>
                        <b>Цена:</b> ${product.getPrice()} руб.
                    </div>
                    <div class="col-1">
                        <form method="post" action="/cart/delete?productId=${product.getId()}">
                            <button type="submit" class="btn btn-secondary btn-sm"><h4>Удалить</h4></button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
        <div class="row">
            <div class="col">
                <h5>К оформлению:</h5><br>
                Количество товаров: ${cart.getProductsCount()}<br>
                Общая сумма: ${cart.getProductsPrice()} рублей.
            </div>
        </div>
        <div class="row">
            <div class="col-3 offset-9">
                <form method="post" action="/cart/create">
                    <button type="submit" class="btn btn-primary"><h4>Оформить заказ</h4></button>
                </form>
            </div>
        </div>
    </c:if>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
