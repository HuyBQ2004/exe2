<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Quản Lý Danh Mục | Admin Sweet Love</title>
        
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        
        <style>
            :root {
                --primary-pink: #ff7eb3;
                --deep-pink: #e84393;
                --romantic-red: #ff4757;
                --coral-orange: #ff9f43;
                --soft-bg: #fff0f3;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: var(--soft-bg);
                min-height: 100vh;
                padding: 40px 0;
            }
            
            .card-manager {
                border: none;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(255, 159, 67, 0.15);
                overflow: hidden;
                background: white;
            }
            
            .card-header {
                /* Gradient Coral -> Red đặc trưng cho Category */
                background: linear-gradient(to right, var(--coral-orange), var(--romantic-red));
                color: white;
                padding: 25px 30px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: none;
            }
            
            .card-header h4 {
                font-family: 'Poppins', sans-serif;
                font-weight: 700;
                margin: 0;
            }
            
            /* Table Styling */
            .table thead th {
                border-top: none;
                border-bottom: 2px solid #ffeef2;
                background-color: #fffbfc;
                color: var(--romantic-red);
                font-weight: 700;
                text-transform: uppercase;
                font-size: 0.85rem;
                padding: 20px 15px;
            }
            
            .table tbody td {
                vertical-align: middle;
                padding: 15px;
                font-size: 0.95rem;
                color: #636e72;
                border-bottom: 1px solid #fff0f3;
            }
            
            .table tbody tr:hover {
                background-color: #fffbf5; /* Màu nền cam nhạt khi hover */
            }
            
            /* Buttons */
            .btn-action {
                width: 38px;
                height: 38px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.3s;
                border: none;
                box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            }
            
            .btn-edit {
                background: linear-gradient(135deg, #ffdfba, #ffb7b2);
                color: #d35400;
            }
            
            .btn-edit:hover {
                background: linear-gradient(135deg, #ff9f43, #ff6b6b);
                color: white;
                transform: translateY(-2px);
            }

            .btn-delete {
                background: linear-gradient(135deg, #ffcdd2, #ef9a9a);
                color: #c0392b;
                margin-left: 8px;
            }
            
            .btn-delete:hover {
                background: linear-gradient(135deg, #ff4757, #e84118);
                color: white;
                transform: translateY(-2px);
            }
            
            /* Badges */
            .category-badge {
                width: 45px;
                height: 45px;
                background: linear-gradient(135deg, #fff5e6, #ffeaa7);
                color: var(--coral-orange);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.2rem;
                margin-right: 15px;
                box-shadow: 0 3px 10px rgba(255, 159, 67, 0.2);
            }

            /* Modal Styling */
            .modal-content {
                border-radius: 20px;
                border: none;
                overflow: hidden;
            }
            
            .modal-header {
                background: linear-gradient(to right, var(--coral-orange), var(--romantic-red));
                color: white;
                border-bottom: none;
                padding: 20px 30px;
            }
            
            .btn-close-white {
                filter: invert(1) grayscale(100%) brightness(200%);
            }
            
            .modal-footer {
                border-top: 1px solid #fff0f3;
                background-color: #fffbfc;
            }
            
            .btn-home {
                background: rgba(255,255,255,0.2);
                border: 1px solid rgba(255,255,255,0.4);
                color: white;
                border-radius: 50px;
                padding: 5px 15px;
                transition: all 0.3s;
            }
            
            .btn-home:hover {
                background: white;
                color: var(--coral-orange);
            }
            
            .btn-add-new {
                background: white;
                color: var(--romantic-red);
                border-radius: 50px;
                font-weight: 600;
                padding: 6px 15px;
                border: none;
                transition: all 0.3s;
            }
            
            .btn-add-new:hover {
                background: #fff0f3;
                transform: scale(1.05);
            }
        </style>

        <script>
            function back() {
                window.location.href = "home";
            }
            
            function doDelete(id) {
                if (confirm("Bạn có chắc chắn muốn xóa danh mục này? \n(Lưu ý: Các sản phẩm thuộc danh mục này có thể bị ảnh hưởng)")) {
                    window.location.href = "delete?pid=" + id;
                }
            }
        </script>
    </head>
    
    <body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="card card-manager">
                        
                        <div class="card-header">
                            <div>
                                <h4 class="mb-1"><i class="fas fa-layer-group me-2"></i>Quản Lý Danh Mục</h4>
                                <small style="opacity: 0.9; font-weight: 300;">Phân loại quà tặng</small>
                            </div>
                            <div>
                                <button class="btn btn-home btn-sm me-2" onclick="back()">
                                    <i class="fas fa-home me-1"></i> Trang Chủ
                                </button>
                                <button class="btn btn-add-new btn-sm shadow-sm" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
                                    <i class="fas fa-plus me-1"></i> Thêm Mới
                                </button>
                            </div>
                        </div>
                        
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table mb-0">
                                    <thead>
                                        <tr>
                                            <th class="ps-4">ID</th>
                                            <th>Tên Danh Mục</th>
                                            <th class="text-center">Hành Động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listCategories}" var="c">
                                            <tr>
                                                <td class="ps-4 text-muted fw-bold">#${c.cid}</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <div class="category-badge">
                                                            <c:choose>
                                                                <c:when test="${c.cid % 2 == 0}">
                                                                    <i class="fas fa-gift"></i>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="fas fa-heart"></i>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <span class="fw-bold fs-6" style="color: #444;">${c.cname}</span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="d-flex justify-content-center">
                                                        <a href="loadCategory?cid=${c.cid}" class="btn-action btn-edit" title="Chỉnh sửa">
                                                            <i class="fas fa-pen"></i>
                                                        </a>
<!--                                                        <button onclick="doDelete('{c.cid}')" class="btn-action btn-delete" title="Xóa">
                                                            <i class="fas fa-trash-alt"></i>
                                                        </button>-->
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <div class="card-footer bg-white p-3 text-end" style="border-top: 1px solid #ffeef2;">
                            <small class="text-muted">Tổng cộng: <strong style="color: var(--coral-orange);">${listCategories.size()}</strong> loại quà tặng</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content shadow-lg">
                    <form action="addcategory" method="post">
                        <div class="modal-header">
                            <h5 class="modal-title fw-bold" style="font-family: 'Poppins', sans-serif;">
                                <i class="fas fa-magic me-2"></i>Tạo Danh Mục Mới
                            </h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        
                        <div class="modal-body p-4">
                            <div class="text-center mb-4">
                                <img src="https://cdn-icons-png.flaticon.com/512/4213/4213643.png" width="80" alt="icon">
                            </div>
                            <div class="mb-2">
                                <label class="form-label fw-bold" style="color: var(--romantic-red);">Tên danh mục</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-white border-end-0" style="border-color: #ffeef2;">
                                        <i class="fas fa-tag text-warning"></i>
                                    </span>
                                    <input name="name" type="text" class="form-control border-start-0" required 
                                           placeholder="Ví dụ: Socola Valentine, Gấu bông..." style="border-color: #ffeef2; border-left: none;">
                                </div>
                            </div>
                        </div>
                        
                        <div class="modal-footer">
                            <button type="button" class="btn btn-light text-muted" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn text-white fw-bold px-4" 
                                    style="background: linear-gradient(to right, var(--coral-orange), var(--romantic-red)); border-radius: 50px;">
                                <i class="fas fa-plus me-1"></i> Lưu Lại
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>