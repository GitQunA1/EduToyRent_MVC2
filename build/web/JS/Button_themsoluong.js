/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function toggleInput(pid) {
    const input = document.getElementById(`quantityInput-${pid}`);
    const saveBtn = document.getElementById(`saveBtn-${pid}`);
    if (input.style.display === "none") {
        input.style.display = "inline";
        saveBtn.style.display = "inline";
    } else {
        input.style.display = "none";
        saveBtn.style.display = "none";
    }
}

function updateQuantity(pid) {
    const quantity = document.getElementById(`quantityInput-${pid}`).value;
    if (quantity) { // Kiểm tra nếu người dùng đã nhập số lượng
        // Gửi request đến MainController để cập nhật số lượng bán cho sản phẩm với pid
        window.location.href = `MainController?action=UpdateQuantity&pid=${pid}&quantity=${quantity}`;
    } else {
        alert("Vui lòng nhập số lượng hợp lệ!");
    }
}




