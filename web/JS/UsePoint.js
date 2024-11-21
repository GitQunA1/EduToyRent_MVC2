/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const originalPoints = parseFloat(document.getElementById("points").innerText.replace(/,/g, ''));

function updateTotal() {
    // Lấy giá trị từ các phần tử HTML
    const subtotal = parseFloat(document.getElementById("subtotal").innerText.replace(/,/g, ''));
    const usePoints = document.getElementById("togglePoints").checked;

    // Đặt giá trị mặc định cho phí vận chuyển và chiết khấu là 0
    const shippingFee = 0;
    const discount = 0;

    // Tính tổng ban đầu
    let total = subtotal + shippingFee - discount;

    // Biến lưu số điểm thưởng còn lại và điểm đã sử dụng
    let remainingPoints = originalPoints;
    let usedPoints = 0;

    // Trừ điểm thưởng nếu checkbox được chọn
    if (usePoints) {
        if (originalPoints >= total) {
            usedPoints = total;
            remainingPoints = originalPoints - total;
            total = 0;
        } else {
            usedPoints = originalPoints;
            total -= originalPoints;
            remainingPoints = 0;
        }
    }

    // Cập nhật giá trị hiển thị của tổng, điểm thưởng còn lại và điểm đã sử dụng
    document.getElementById("total").innerHTML = total.toLocaleString();
    document.getElementById("points").innerHTML = remainingPoints.toLocaleString();
    document.getElementById("usedPoints").value = usedPoints; // Cập nhật điểm đã sử dụng vào thẻ input ẩn
}

// Gọi hàm updateTotal khi trang được tải
window.onload = function() {
    updateTotal();
};


