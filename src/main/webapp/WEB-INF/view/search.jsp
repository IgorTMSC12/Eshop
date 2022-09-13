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
<div class="container-fluid">
    <div class="row">
        <div class="col-2">
            <h4>Фильтр поиска</h4><br>
            <form method="post" action="${contextPath}/search">
                <h6>Поиск в каталоге:</h6>
                <div class="form-group">
                    <input type="text" class="form-control w-10" id="searchKey" placeholder="Поиск" name="searchKey">
                </div>
                <h6>Цена:</h6>
                <div class="form-group row">
                    <div class="col-5">
                        <input type="text" class="form-control" id="priceFrom" placeholder="От" name="priceFrom">
                    </div>
                    <div class="col-5">
                        <input type="text" class="form-control" id="priceTo" placeholder="До" name="priceTo">
                    </div>
                </div>
                <h6>Категория:</h6>
                <div class="form-group>">
                    <select class="form-control" id="categoryName" name="categoryName">
                        <option></option>
                        <option>Мобильные телефоны</option>
                        <option>Наушники</option>
                        <option>Ноутбуки</option>
                        <option>Телевизоры</option>
                        <option>Фотоаппараты</option>
                        <option>GPS Навигаторы</option>
                        <option>Фитнес браслеты</option>
                        <option>Холодильники</option>
                        <option>Стиральные машины</option>
                        <option>Роботы пылесосы</option>
                        <option>Утюги</option>
                        <option>Кондиционеры</option>
                        <option>Микроволновые печи</option>
                        <option>Автомобили</option>
                        <option>Велосипеды</option>
                        <option>Электросамокаты</option>
                    </select>
                </div>
                <br>
                <button type="submit" class="btn btn-primary">Применить</button>
            </form>
        </div>
        <div class="col-10">
            <c:if test="${not empty products}">
                <c:forEach items="${products}" var="product">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-2">
                                <c:forEach items="${images}" var="image">
                                    <c:if test="${image.getProduct().getId() == product.getId()}">
                                        <a href="/product?productId=${product.getId()}">
                                            <img style="width:79%; height:81%"
                                                 src="${contextPath}/images/image_product/${image.getImagePath()}"></a>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="col-10">
                                <h4><b>Модель:</b> ${product.getName()}<br></h4>
                                <h5><b>Описание:</b> ${product.getDescription()}<br></h5>
                                <h5><b>Цена:</b> ${product.getPrice()} руб.</h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>
<ul class="pagination pagination-sm justify-content-end">
    <li class="page-item">Количество записей на странице </li>
    <li class="page-item"><a class="page-link" href="${contextPath}/search?searchKey=${search.getSearchKey()}&priceFrom=${search.getPriceFrom()}&
categoryName=${search.getCategoryName()}&priceTo=${search.getPriceTo()}&pageNumber=0&pageSize=10">10</a></li>
    <li class="page-item"><a class="page-link" href="${contextPath}/search?searchKey=${search.getSearchKey()}&priceFrom=${search.getPriceFrom()}&
categoryName=${search.getCategoryName()}&priceTo=${search.getPriceTo()}&pageNumber=0&pageSize=15">15</a></li>
    <li class="page-item"><a class="page-link" href="${contextPath}/search?searchKey=${search.getSearchKey()}&priceFrom=${search.getPriceFrom()}&
categoryName=${search.getCategoryName()}&priceTo=${search.getPriceTo()}&pageNumber=0&pageSize=20">20</a></li>
    <li class="page-item"><a class="page-link" href="${contextPath}/search?searchKey=${search.getSearchKey()}&priceFrom=${search.getPriceFrom()}&
categoryName=${search.getCategoryName()}&priceTo=${search.getPriceTo()}&pageNumber=0&pageSize=25">25</a></li>
</ul>

<ul class="pagination justify-content-end">
    <c:if test="${not empty countPage}">
        <c:if test="${pageNumber == 0}">
            <li class="page-item disabled"><a class="page-link"
                                              href="${contextPath}/search?searchKey=${search.getSearchKey()}&priceFrom=${search.getPriceFrom()}&
categoryName=${search.getCategoryName()}&priceTo=${search.getPriceTo()}&pageNumber=${pageNumber - 1}&pageSize=${pageSize}">Previous</a>
            </li>
        </c:if>
        <c:if test="${pageNumber > 0}">
            <li class="page-item"><a class="page-link"
                                     href="${contextPath}/search?searchKey=${search.getSearchKey()}&priceFrom=${search.getPriceFrom()}&
categoryName=${search.getCategoryName()}&priceTo=${search.getPriceTo()}&pageNumber=${pageNumber - 1}&pageSize=${pageSize}">Previous</a>
            </li>
        </c:if>
        <c:forEach items="${countPage}" var="page">
            <c:if test="${(pageNumber + 1) == page}">
                <li class="page-item active"><a class="page-link"
                                                href="${contextPath}/search?searchKey=${search.getSearchKey()}&priceFrom=${search.getPriceFrom()}&
categoryName=${search.getCategoryName()}&priceTo=${search.getPriceTo()}&pageNumber=${page - 1}&pageSize=${pageSize}">${page}</a>
                </li>
            </c:if>
            <c:if test="${(pageNumber + 1) != page}">
                <li class="page-item"><a class="page-link"
                                         href="${contextPath}/search?searchKey=${search.getSearchKey()}&priceFrom=${search.getPriceFrom()}&
categoryName=${search.getCategoryName()}&priceTo=${search.getPriceTo()}&pageNumber=${page - 1}&pageSize=${pageSize}">${page}</a>
                </li>
            </c:if>
        </c:forEach>
        <c:if test="${countPage.size() == (pageNumber + 1)}">
            <li class="page-item disabled"><a class="page-link"
                                              href="${contextPath}/search?searchKey=${search.getSearchKey()}&priceFrom=${search.getPriceFrom()}&
categoryName=${search.getCategoryName()}&priceTo=${search.getPriceTo()}&pageNumber=${pageNumber + 1}&pageSize=${pageSize}">Next</a>
            </li>
        </c:if>
        <c:if test="${(pageNumber + 1) < countPage.size()}">
            <li class="page-item"><a class="page-link"
                                     href="${contextPath}/search?searchKey=${search.getSearchKey()}&priceFrom=${search.getPriceFrom()}&
categoryName=${search.getCategoryName()}&priceTo=${search.getPriceTo()}&pageNumber=${pageNumber + 1}&pageSize=${pageSize}">Next</a>
            </li>
        </c:if>
    </c:if>
</ul>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
