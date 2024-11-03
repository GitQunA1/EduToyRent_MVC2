/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function setRentTime(caid, days) {
    const timeRentInput = document.getElementById(`txtTimeRent${caid}`);
    timeRentInput.value = days;

    // Gửi form ngay sau khi thay đổi thời gian thuê
    const form = document.getElementById(`updateFormRent${caid}`);
    form.submit();

    // Nổi bật nút thời gian thuê
    const buttons = form.querySelectorAll(".rent-time-btn");
    buttons.forEach(button => {
        button.classList.toggle("active", button.innerText.includes(`${days} ngày`));
    });
}
