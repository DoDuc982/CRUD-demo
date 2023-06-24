<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>View</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <h1>Danh sách sản phẩm</h1>
    <a href="/product?action=create">Chi tiết sản phẩm</a>
    <form>
        <div class="mb-3">
            <label for="exampleInputEmail" class="form-label">Mã sản phẩm</label>
            <input type="text" class="form-control" id="exampleInputEmail" name="id" value="${product.id}">
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail" class="form-label">Tên sản phẩm</label>
            <input type="text" class="form-control" id="exampleInputEmail" name="name" value="${product.name}">
        </div>
        <div class="mb-3">
             <label for="exampleInputEmail" class="form-label">Giá sản phẩm</label>
             <input type="text" class="form-control" id="exampleInputEmail" name="price" value="${product.price}">
        </div>
        <div class="mb-3">
             <label for="exampleInputEmail" class="form-label">Mô tả sản phẩm</label>
             <input type="text" class="form-control" id="exampleInputEmail" name="description" value="${product.description}">
        </div>
    </form>
        <c:forEach var="product" items="${products}">
            <tbody>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.description}</td>
                <td><a href="/product?action=edit&id=${product.id}">Sửa</a></td>
                <td><a href="/product?action=delete&id=${product.id}">Xóa</a></td>
            </tbody>
        </c:forEach>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</div>
</body>
</html>