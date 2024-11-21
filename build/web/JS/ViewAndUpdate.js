/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function increaseQuantity() {
            console.log("increaseQuantity called");
            var quantityInput = document.getElementById('quantity');
            if (quantityInput) {
                var currentValue = parseInt(quantityInput.value) || 0;
                quantityInput.value = currentValue + 1;
                console.log("New Quantity (Buy):", quantityInput.value);
            }
        }

        function decreaseQuantity() {
            console.log("decreaseQuantity called");
            var quantityInput = document.getElementById('quantity');
            if (quantityInput) {
                var currentValue = parseInt(quantityInput.value) || 0;
                if (currentValue > 1) {
                    quantityInput.value = currentValue - 1;
                    console.log("New Quantity (Buy):", quantityInput.value);
                }
            }
        }
        // Hàm tăng/giảm số lượng cho phần Thuê
        function increaseQuantityRent() {
            console.log("increaseQuantityRent called");
            var quantityInput = document.getElementById('quantityRent');
            if (quantityInput) {
                var currentValue = parseInt(quantityInput.value) || 0;
                quantityInput.value = currentValue + 1;
                console.log("New Quantity (Rent):", quantityInput.value);
            }
        }

        function decreaseQuantityRent() {
            console.log("decreaseQuantityRent called");
            var quantityInput = document.getElementById('quantityRent');
            if (quantityInput) {
                var currentValue = parseInt(quantityInput.value) || 0;
                if (currentValue > 1) {
                    quantityInput.value = currentValue - 1;
                    console.log("New Quantity (Rent):", quantityInput.value);
                }
            }
        }

        // Hàm ẩn/hiện các phần Mua và Thuê
        document.getElementById("btn_buy").addEventListener("click", function() {
            console.log("Mua button clicked");
            document.getElementById("buy_section").classList.remove("hidden");
            document.getElementById("rent_section").classList.add("hidden");
        });

        document.getElementById("btn_rent").addEventListener("click", function() {
            console.log("Thuê button clicked");
            document.getElementById("buy_section").classList.add("hidden");
            document.getElementById("rent_section").classList.remove("hidden");
        });

        // Hàm chọn thời gian thuê
        function selectDuration(button, duration) {
            console.log("Duration selected:", duration);
            document.getElementById('selectedDuration').value = duration;
            document.querySelectorAll('.duration-button').forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
        }
