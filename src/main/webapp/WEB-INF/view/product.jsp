<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="../../resources/script.js"></script>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="menu.jsp"/>
<br>
<div class="container-fluid">
    <div class="row">
        <div class="col-2">
            <img style="width:100%; height:100%"
                 src="${contextPath}/images/image_product/${image.getImagePath()}">
        </div>
        <div class="col-10">
            <h4><b>Модель:</b> ${product.getName()}<br></h4>
            <h5><b>Описание:</b> ${product.getDescription()}<br></h5>
            <h5><b>Цена:</b> ${product.getPrice()} руб.</h5>
        </div>
    </div>
    <div class="row">
        <div class="col-2 offset-10">
            <form method="post" action="/cart/add?productId=${product.getId()}">
                <button type="submit" onclick="productAddToShoppingCart()"><h4>Купить</h4></button>
            </form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
