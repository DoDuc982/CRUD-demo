<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <h1>Danh sách sản phẩm</h1>
    <a href="/product?action=create">Tạo mới sản phẩm</a>
    <table class="table table-dark table-striped-columns table-hover">
        <thead class="table-dark">
            <th scope="col">Mã sản phẩm</th>
            <th scope="col">Tên sản phẩm</th>
            <th scope="col">Giá sản phẩm</th>
            <th scope="col">Mô tả</th>
        </thead>
        <c:forEach var="product" items="${products}">
            <tbody>
                <td>${product.id}</td>
                <td><a href="/product?action=view&id=${product.id}">${product.name}</a></td>
                <td>${product.price}</td>
                <td>${product.description}</td>
                <td>
                    <a class="btn btn-info" href="/product?action=edit&id=${product.id}">Sửa
                        <i class="fas fa-edit"></i>
                    </a>
                </td>
                <td>
                    <a class="btn btn-danger" href="/product?action=delete&id=${product.id}">Xóa
                        <i class="fas fa-edit"> </i>
                    </a>
                </td>
            </tbody>
        </c:forEach>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</div>
</body>
</html>