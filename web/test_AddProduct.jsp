<%-- 
    Document   : test_AddProduct
    Created on : Nov 2, 2024, 9:05:16 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm Sản Phẩm</title>
    <script>
        function validateForm() {
            let name = document.forms["addProductForm"]["name"].value;
            let price = document.forms["addProductForm"]["price"].value;
            let qSell = document.forms["addProductForm"]["qSell"].value;
            let qRent = document.forms["addProductForm"]["qRent"].value;
            let age = document.forms["addProductForm"]["age"].value;
            let brand = document.forms["addProductForm"]["brand"].value;
            let origin = document.forms["addProductForm"]["origin"].value;
            let description = document.forms["addProductForm"]["description"].value;
            let category = document.forms["addProductForm"]["category"].value;
            let type = document.forms["addProductForm"]["type"].value;
            let status = document.forms["addProductForm"]["status"].value;
            let image = document.forms["addProductForm"]["image"].value;

            if (!name || !price || !qSell || !qRent || !age || !brand || !origin || !description || !category || !type || !status || !image) {
                alert("Vui lòng nhập đầy đủ thông tin!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <h2>Thêm Sản Phẩm</h2>
    <form name="addProductForm" action="MainController?action=addProduct" method="post" onsubmit="return validateForm()">
        <input type="hidden" name="action" value="addProduct">
        <label for="name">Tên sản phẩm:</label><br>
        <input type="text" name="name"><br>
        <label for="price">Giá:</label><br>
        <input type="number" step="0.01" name="price"><br>
        <label for="qSell">Số lượng bán:</label><br>
        <input type="number" name="qSell"><br>
        <label for="qRent">Số lượng cho thuê:</label><br>
        <input type="number" name="qRent"><br>
        <label for="age">Độ tuổi:</label><br>
        <input type="number" name="age"><br>
        <label for="brand">Thương hiệu:</label><br>
        <input type="text" name="brand"><br>
        <label for="origin">Xuất xứ:</label><br>
        <input type="text" name="origin"><br>
        <label for="description">Mô tả:</label><br>
        <textarea name="description"></textarea><br>
        <label for="category">Danh mục:</label><br>
        <input type="text" name="category"><br>
        <label for="type">Loại (1: Shop, 2: Cá nhân):</label><br>
        <input type="number" name="type" min="1" max="2"><br>
        <label for="status">Trạng thái:</label><br>
        <input type="text" name="status"><br>
        <label for="image">URL hình ảnh:</label><br>
        <input type="text" name="image"><br>
        <br>
        <input type="submit" value="Thêm sản phẩm">
    </form>
</body>
</html>
