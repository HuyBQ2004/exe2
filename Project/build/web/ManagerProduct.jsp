<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Quản Lý Kho Quà | Admin Sweet Love</title>
        
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        
        <style>
            :root {
                --primary-pink: #ff7eb3;
                --deep-pink: #e84393;
                --romantic-red: #ff4757;
                --soft-bg: #fff0f3;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: var(--soft-bg);
                padding: 40px 0;
            }
            
            .card-manager {
                border: none;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(232, 67, 147, 0.15);
                overflow: hidden;
                background: white;
            }
            
            .card-header {
                background: linear-gradient(to right, var(--romantic-red), var(--deep-pink));
                color: white;
                padding: 20px 30px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            
            .table thead th {
                background-color: #fffbfc;
                color: var(--deep-pink);
                font-weight: 700;
                text-transform: uppercase;
                border-bottom: 2px solid #ffeef2;
                padding: 15px;
            }
            
            .table tbody td {
                vertical-align: middle;
                padding: 15px;
                color: #636e72;
                border-bottom: 1px solid #fff0f3;
            }
            
            .product-thumb {
                width: 70px;
                height: 70px;
                object-fit: cover;
                border-radius: 12px;
                border: 2px solid #fff;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }
            
            .price-tag {
                font-weight: 700;
                color: var(--romantic-red);
            }
            
            .btn-action {
                width: 35px;
                height: 35px;
                border-radius: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
                border: none;
                margin: 0 3px;
                transition: all 0.3s;
            }
            
            .btn-edit { background-color: #e3f2fd; color: #2196f3; }
            .btn-edit:hover { background-color: #2196f3; color: white; }

            .btn-delete { background-color: #ffebee; color: #f44336; }
            .btn-delete:hover { background-color: #f44336; color: white; }
            
            /* Modal */
            .modal-header { background: linear-gradient(to right, var(--primary-pink), var(--deep-pink)); color: white; }
            .img-preview-box { height: 200px; border: 2px dashed #ffb7b2; display: flex; align-items: center; justify-content: center; overflow: hidden; margin-top: 10px; }
            .img-preview-box img { width: 100%; height: 100%; object-fit: cover; }
        </style>

        <script>
            function back() { window.location.href = "home"; }
            function doDelete(id) {
                if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này?")) {
                    window.location.href = "delete?pid=" + id;
                }
            }
            function updatePreview() {
                var url = document.getElementById('imgInput').value;
                var preview = document.getElementById('imgPreview');
                preview.src = url ? url : 'https://dummyimage.com/600x400/ffcdd2/e91e63.jpg&text=No+Image';
            }
        </script>
    </head>
    
    <body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="card card-manager">
                        <div class="card-header">
                            <h4 class="mb-0 fw-bold"><i class="fas fa-gift me-2"></i>Quản Lý Kho Quà</h4>
                            <div>
                                <button class="btn btn-outline-light btn-sm me-2" onclick="back()">Trang Chủ</button>
                                <button class="btn btn-light text-danger fw-bold btn-sm" data-bs-toggle="modal" data-bs-target="#addProductModal">
                                    <i class="fas fa-plus-circle me-1"></i> Thêm Mới
                                </button>
                            </div>
                        </div>
                        
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table mb-0">
                                    <thead>
                                        <tr>
                                            <th class="ps-4">ID</th>
                                            <th>Hình Ảnh</th>
                                            <th>Tên Sản Phẩm</th>
                                            <th>Giá Bán</th>
                                            <th class="text-center">Hành Động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${products}" var="p">
                                            <tr>
                                                <td class="ps-4 fw-bold">#${p.id}</td>
                                                <td>
                                                    <img src="${p.imageUrl}" class="product-thumb" alt="${p.name}"
                                                         onerror="this.src='https://dummyimage.com/100x100/ffcdd2/e91e63.jpg&text=Error'">
                                                </td>
                                                <td class="fw-bold text-dark">${p.name}</td>
                                                <td class="price-tag">${p.price} đ</td>
                                                <td>
                                                    <div class="d-flex justify-content-center">
                                                        <a href="load?pid=${p.id}" class="btn-action btn-edit" title="Sửa">
                                                            <i class="fas fa-pen"></i>
                                                        </a>
                                                        <button onclick="doDelete(${p.id})" class="btn-action btn-delete" title="Xóa">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="addProductModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">
                            <h5 class="modal-title fw-bold">Thêm Quà Tặng Mới</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body p-4">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label fw-bold">Tên sản phẩm</label>
                                        <input name="name" type="text" class="form-control" required>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label fw-bold">Giá bán</label>
                                            <input name="price" type="number" step="0.01" class="form-control" required>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label fw-bold">Danh mục</label>
                                            <select name="category" class="form-select">
                                                <c:forEach items="${listCategories}" var="o">
                                                    <option value="${o.cid}">${o.cname}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label fw-bold">Tiêu đề (Title)</label>
                                        <textarea name="title" class="form-control" rows="2" required></textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label fw-bold">Link Ảnh</label>
                                        <input name="image" id="imgInput" type="text" class="form-control" oninput="updatePreview()" required>
                                    </div>
                                    <div class="img-preview-box">
                                        <img id="imgPreview" src="https://dummyimage.com/600x400/ffcdd2/e91e63.jpg&text=No+Image">
                                    </div>
                                </div>
                                <div class="col-12 mb-3">
                                    <label class="form-label fw-bold">Mô tả</label>
                                    <textarea name="description" class="form-control" rows="3" required></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-danger fw-bold">Lưu Sản Phẩm</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>