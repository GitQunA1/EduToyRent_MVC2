/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

document.addEventListener("DOMContentLoaded", function() {
  const links = document.querySelectorAll('.content_order a');

  // Lấy URL hiện tại
  const currentURL = window.location.href;

  // Kiểm tra localStorage xem có link nào được lưu trước không, và so sánh với URL hiện tại
  const activeLink = localStorage.getItem('activeLink');

  // Nếu localStorage không có hoặc URL khác với link lưu trước đó, luôn luôn làm sáng thẻ đầu tiên
  if (!activeLink || !currentURL.includes(activeLink)) {
    links.forEach(link => link.classList.remove('active')); // Xóa class active khỏi tất cả các thẻ a
    links[0].classList.add('active'); // Luôn làm sáng thẻ đầu tiên
  } else {
    // Nếu có giá trị trong localStorage, thêm class "active" cho thẻ phù hợp với URL
    links.forEach(link => {
      if (link.getAttribute('href') === activeLink) {
        link.classList.add('active');
      } else {
        link.classList.remove('active');
      }
    });
  }

  // Lắng nghe sự kiện click trên các thẻ a
  links.forEach(link => {
    link.addEventListener('click', function() {
      // Lưu giá trị href của thẻ a được nhấn vào localStorage
      localStorage.setItem('activeLink', this.getAttribute('href'));

      // Làm sáng thẻ hiện tại và xóa sáng của các thẻ khác
      links.forEach(l => l.classList.remove('active'));
      this.classList.add('active');
    });
  });
});


