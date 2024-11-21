/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const btnBuy = document.getElementById("btn_buy");
const btnRent = document.getElementById("btn_rent");
const buySection = document.getElementById("buy_section");
const rentSection = document.getElementById("rent_section");

// Function to activate buy button
function activateBuy() {
    btnBuy.classList.add("active");
    btnRent.classList.remove("active");
    buySection.style.display = "block";
    rentSection.style.display = "none";
}

// Function to activate rent button
function activateRent() {
    btnRent.classList.add("active");
    btnBuy.classList.remove("active");
    rentSection.style.display = "block";
    buySection.style.display = "none";
}

// Add event listeners to buttons
btnBuy.addEventListener("click", activateBuy);
btnRent.addEventListener("click", activateRent);

// Show the buy section by default when the page loads
window.onload = activateBuy;
