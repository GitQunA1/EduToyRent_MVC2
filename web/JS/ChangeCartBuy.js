/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function changeQuantity(amount, formId, quantityInputId) {
    const form = document.getElementById(formId);
    const quantityInput = document.getElementById(quantityInputId);
    let currentQuantity = parseInt(quantityInput.value);

    // Đảm bảo số lượng không giảm xuống dưới 1
    if (currentQuantity + amount > 0) {
        quantityInput.value = currentQuantity + amount;

        // Submit form ngay lập tức sau khi thay đổi số lượng
        form.submit();
    }
}



