<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <h1>Cập nhật sản phẩm</h1>
    <a href="/product">Danh sách sản phẩm</a>
    <c:if test="${message != null}">
        <p class="alert alert-success">${message}</p>
    </c:if>
    <form action="/product?action=edit&id=${product.id}" method="post">
      <div class="mb-3">
        <label for="name" class="form-label">Tên sản phẩm</label>
        <input type="text" class="form-control" value="${product.name}" name="name">
      </div>
      <div class="mb-3">
        <label for="price" class="form-label">Giá sản phẩm</label>
        <input type="text" class="form-control" value="${product.price}" name="price">
      </div>
      <div class="mb-3">
        <label for="description" class="form-label">Mô tả sản phẩm</label>
        <input type="text" class="form-control" value="${product.description}" name="description">
      </div>
      <button type="submit" class="btn btn-primary">Cập nhật sản phẩm</button>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</div>
</body>
</html>