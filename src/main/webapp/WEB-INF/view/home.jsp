<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" xmlns:sec="http://www.springframework.org/security/tags">
<head>
    <title>Categories</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="menu.jsp"/>
<h2><p class="text-center">Popular categories</p></h2>

<div class="container-fluid">
    <c:if test="${not empty categories}">
        <div class="row">
            <c:forEach items="${categories}" var="category">
                <div class="card w-25" type="category">
                    <div class="card-body">
                        <a>${category.getName()}</a><br>
                        <c:forEach items="${imagesCategories}" var="imageCategory">
                            <c:if test="${category.getId() == imageCategory.getCategory().getId()}">
                                <a href="/category?categoryId=${category.getId()}">
                                    <img class="card-img" style="width:150px;height:120px"
                                         src="${contextPath}/images/image_categories/${imageCategory.getImagePath()}"
                                         alt="Card image"></a>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </c:forEach>
        </div>
        <ul class="pagination pagination-sm justify-content-end">
            <li class="page-item">Количество записей на странице </li>
            <li class="page-item"><a class="page-link" href="${contextPath}/home?pageNumber=0&pageSize=4">4</a></li>
            <li class="page-item"><a class="page-link" href="${contextPath}/home?pageNumber=0&pageSize=8">8</a></li>
            <li class="page-item"><a class="page-link" href="${contextPath}/home?pageNumber=0&pageSize=12">12</a></li>
            <li class="page-item"><a class="page-link" href="${contextPath}/home?pageNumber=0&pageSize=16">16</a></li>
        </ul>

        <ul class="pagination justify-content-end">
            <c:if test="${not empty countPage}">
                <c:if test="${pageNumber == 0}">
                    <li class="page-item disabled"><a class="page-link"
                                                      href="${contextPath}/home?pageNumber=${pageNumber - 1}&pageSize=${pageSize}">Previous</a>
                    </li>
                </c:if>
                <c:if test="${pageNumber > 0}">
                    <li class="page-item"><a class="page-link"
                                             href="${contextPath}/home?pageNumber=${pageNumber - 1}&pageSize=${pageSize}">Previous</a>
                    </li>
                </c:if>
                <c:forEach items="${countPage}" var="page">
                    <c:if test="${(pageNumber + 1) == page}">
                        <li class="page-item active"><a class="page-link"
                                                        href="${contextPath}/home?pageNumber=${page - 1}&pageSize=${pageSize}">${page}</a>
                        </li>
                    </c:if>
                    <c:if test="${(pageNumber + 1) != page}">
                        <li class="page-item"><a class="page-link"
                                                 href="${contextPath}/home?pageNumber=${page - 1}&pageSize=${pageSize}">${page}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <c:if test="${countPage.size() == (pageNumber + 1)}">
                    <li class="page-item disabled"><a class="page-link"
                                                      href="${contextPath}/home?pageNumber=${pageNumber + 1}&pageSize=${pageSize}">Next</a>
                    </li>
                </c:if>
                <c:if test="${(pageNumber + 1) < countPage.size()}">
                    <li class="page-item"><a class="page-link"
                                             href="${contextPath}/home?pageNumber=${pageNumber + 1}&pageSize=${pageSize}">Next</a>
                    </li>
                </c:if>
            </c:if>
        </ul>
    </c:if>
</div>
<br>
<sec:authorize access="hasRole('ADMIN')">
    <div class="container-fluid">
        <div class="card" style="width:300px">
            <div class="card-body w-20 m-1">
                <form method="post" enctype="multipart/form-data" action="${contextPath}/home/import">
                    <h6>File to upload:</h6>
                    <input type="file" name="file"><br>
                    <input type="submit" value="Upload">
                </form>
                <br>
                <h6>Download:</h6>
                <a href="${contextPath}/home/export">
                    <input type="submit" value="Download CSV File"></a>
            </div>
        </div>
    </div>
</sec:authorize>
<jsp:include page="footer.jsp"/>
</body>
</html>