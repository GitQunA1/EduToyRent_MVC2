/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var genreListVisible = false; // Biến để kiểm tra trạng thái hiển thị của danh sách thể loại
var eagListVisible = false; // Biến để kiểm tra trạng thái hiển thị của danh sách độ tuổi

// --- Sự kiện click vào nút "Chọn thể loại đồ chơi" ---
document.getElementById("showGenresBtn").addEventListener("click", function(event) {
    event.stopPropagation();
    var genreList = document.getElementById("genreList");
    var eagList = document.getElementById("AgeList");

    // Hiển thị danh sách thể loại và ẩn danh sách độ tuổi
    genreList.style.display = genreListVisible ? "none" : "block";
    eagList.style.display = "none"; // Ẩn danh sách độ tuổi nếu đang mở
    genreListVisible = !genreListVisible;
    eagListVisible = false; // Đảm bảo trạng thái danh sách độ tuổi là ẩn
});

// --- Sự kiện click vào nút "Chọn độ tuổi" ---
document.getElementById("showByeEag").addEventListener("click", function(event) {
    event.stopPropagation();
    var genreList = document.getElementById("genreList");
    var eagList = document.getElementById("AgeList");

    // Hiển thị danh sách độ tuổi và ẩn danh sách thể loại
    eagList.style.display = eagListVisible ? "none" : "block";
    genreList.style.display = "none"; // Ẩn danh sách thể loại nếu đang mở
    eagListVisible = !eagListVisible;
    genreListVisible = false; // Đảm bảo trạng thái danh sách thể loại là ẩn
});

// Ẩn danh sách khi click bất kỳ nơi nào trên màn hình
document.addEventListener("click", function(event) {
    var genreList = document.getElementById("genreList");
    var eagList = document.getElementById("AgeList");

    // Kiểm tra xem có danh sách nào đang hiển thị không và ẩn nó nếu click ra ngoài
    if (genreListVisible && event.target !== genreList && !genreList.contains(event.target)) {
        genreList.style.display = "none";
        genreListVisible = false;
    }
    if (eagListVisible && event.target !== eagList && !eagList.contains(event.target)) {
        eagList.style.display = "none";
        eagListVisible = false;
    }
});

// Ẩn danh sách khi người dùng chọn một thể loại hoặc độ tuổi
var genreLinks = document.querySelectorAll(".genre-list a");
for (var i = 0; i < genreLinks.length; i++) {
    genreLinks[i].addEventListener("click", function(event) {
        event.stopPropagation();
        document.getElementById("genreList").style.display = "none";
        genreListVisible = false;
    });
}

var eagLinks = document.querySelectorAll(".Eag-list a");
for (var i = 0; i < eagLinks.length; i++) {
    eagLinks[i].addEventListener("click", function(event) {
        event.stopPropagation();
        document.getElementById("eagList").style.display = "none";
        eagListVisible = false;
    });
}

