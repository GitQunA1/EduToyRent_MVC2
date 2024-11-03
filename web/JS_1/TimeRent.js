/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function selectDuration(button, duration) {
    // Lấy tất cả các nút
    const buttons = document.querySelectorAll(".duration-button");

    // Loại bỏ lớp 'active' khỏi tất cả các nút
    buttons.forEach(btn => btn.classList.remove("active"));

    // Thêm lớp 'active' cho nút được nhấn
    button.classList.add("active");

    // Cập nhật giá trị thời gian thuê đã chọn
    document.getElementById("selectedDuration").value = duration;
}