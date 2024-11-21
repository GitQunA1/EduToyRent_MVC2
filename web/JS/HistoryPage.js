/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

document.getElementById("loginForm").onsubmit = function() {
    const redirectUrl = window.location.href; // Lấy URL của trang hiện tại
    const redirectInput = document.createElement("input");
    redirectInput.setAttribute("type", "hidden");
    redirectInput.setAttribute("name", "redirectUrl");
    redirectInput.setAttribute("value", redirectUrl);
    this.appendChild(redirectInput);
};

