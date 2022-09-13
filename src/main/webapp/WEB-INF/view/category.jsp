<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" xmlns:sec="http://www.springframework.org/security/tags">
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="menu.jsp"/>
<br>
${category.getName()}
<div class="container-fluid">
    <c:if test="${not empty products}">
        <c:forEach items="${products}" var="product">
            <div class="card-body">
                <div class="row">
                    <div class="col-1">
                        <c:forEach items="${images}" var="image">
                            <c:if test="${product.getId() == image.getProduct().getId()}">
                                <a href="/product?productId=${product.getId()}">
                                    <img style="width:100%;height:100%"
                                         src="${contextPath}/images/image_product/${image.getImagePath()}"
                                         alt="${image.getImagePath()}"></a>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="col-11">
                        <b>Модель:</b> ${product.getName()}<br>
                        <b>Описание:</b> ${product.getDescription()}<br>
                        <b>Цена:</b> ${product.getPrice()} руб.
                    </div>
                </div>
            </div>
        </c:forEach>
        <ul class="pagination pagination-sm justify-content-end">
            <li class="page-item">Количество записей на странице </li>
            <li class="page-item"><a class="page-link" href="${contextPath}/category?categoryId=${category.getId()}&pageNumber=0&pageSize=10">10</a></li>
            <li class="page-item"><a class="page-link" href="${contextPath}/category?categoryId=${category.getId()}&pageNumber=0&pageSize=15">15</a></li>
            <li class="page-item"><a class="page-link" href="${contextPath}/category?categoryId=${category.getId()}&pageNumber=0&pageSize=20">20</a></li>
            <li class="page-item"><a class="page-link" href="${contextPath}/category?categoryId=${category.getId()}&pageNumber=0&pageSize=25">25</a></li>
        </ul>

        <ul class="pagination justify-content-end">
            <c:if test="${not empty countPage}">
                <c:if test="${pageNumber == 0}">
                    <li class="page-item disabled"><a class="page-link"
                                                      href="${contextPath}/category?categoryId=${category.getId()}&pageNumber=${pageNumber - 1}&pageSize=${pageSize}">Previous</a>
                    </li>
                </c:if>
                <c:if test="${pageNumber > 0}">
                    <li class="page-item"><a class="page-link"
                                             href="${contextPath}/category?categoryId=${category.getId()}&pageNumber=${pageNumber - 1}&pageSize=${pageSize}">Previous</a>
                    </li>
                </c:if>
                <c:forEach items="${countPage}" var="page">
                    <c:if test="${(pageNumber + 1) == page}">
                        <li class="page-item active"><a class="page-link"
                                                        href="${contextPath}/category?categoryId=${category.getId()}&pageNumber=${page - 1}&pageSize=${pageSize}">${page}</a>
                        </li>
                    </c:if>
                    <c:if test="${(pageNumber + 1) != page}">
                        <li class="page-item"><a class="page-link"
                                                 href="${contextPath}/category?categoryId=${category.getId()}&pageNumber=${page - 1}&pageSize=${pageSize}">${page}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <c:if test="${countPage.size() == (pageNumber + 1)}">
                    <li class="page-item disabled"><a class="page-link"
                                                      href="${contextPath}/category?categoryId=${category.getId()}&pageNumber=${pageNumber + 1}&pageSize=${pageSize}">Next</a>
                    </li>
                </c:if>
                <c:if test="${(pageNumber + 1) < countPage.size()}">
                    <li class="page-item"><a class="page-link"
                                             href="${contextPath}/category?categoryId=${category.getId()}&pageNumber=${pageNumber + 1}&pageSize=${pageSize}">Next</a>
                    </li>
                </c:if>
            </c:if>
        </ul>
    </c:if>
</div>
<sec:authorize access="hasRole('ADMIN')">
    <div class="container-fluid">
        <div class="card" style="width:300px">
            <div class="card-body w-20 m-1">
                <form method="post" enctype="multipart/form-data" action="${contextPath}/category/import?categoryId=${category.getId()}">
                    <h6>File to upload:</h6>
                    <input type="file" name="file"><br>
                    <input type="submit" value="Upload">
                </form>
                <br>
                <h6>Download:</h6>
                <a href="${contextPath}/category/export?categoryId=${category.getId()}">
                    <input type="submit" value="Download CSV File"></a>
            </div>
        </div>
    </div>
</sec:authorize>
<jsp:include page="footer.jsp"/>
</body>
</html>
