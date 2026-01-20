<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Chỉnh Sửa Quà Tặng | Admin Sweet Love</title>
        
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        
        <style>
            :root {
                --primary-pink: #ff7eb3;
                --deep-pink: #e84393;
                --romantic-red: #ff4757;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: #fff0f3; /* Nền hồng nhạt */
            }
            
            .card-edit {
                border: none;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(232, 67, 147, 0.15);
                overflow: hidden;
                background: white;
            }
            
            .card-header {
                background: linear-gradient(to right, var(--primary-pink), var(--romantic-red));
                color: white;
                padding: 25px;
                text-align: center;
                border-bottom: none;
            }
            
            .card-header h3 {
                font-family: 'Poppins', sans-serif; /* Dùng Poppins cho tiêu đề admin cho rõ ràng */
                font-weight: 700;
                letter-spacing: 1px;
            }

            .form-label {
                font-weight: 600;
                color: var(--deep-pink);
                margin-bottom: 8px;
            }
            
            .form-control, .form-select {
                border-radius: 12px;
                border: 1px solid #ffeef2;
                background-color: #fffbfc;
                padding: 10px 15px;
            }

            .form-control:focus, .form-select:focus {
                border-color: var(--primary-pink);
                box-shadow: 0 0 0 0.2rem rgba(255, 126, 179, 0.25);
                background-color: white;
            }
            
            .btn-save {
                background: linear-gradient(to right, var(--primary-pink), var(--deep-pink));
                border: none;
                padding: 12px 35px;
                font-weight: 600;
                border-radius: 50px;
                transition: all 0.3s;
                color: white;
                box-shadow: 0 4px 10px rgba(232, 67, 147, 0.3);
            }
            
            .btn-save:hover {
                background: linear-gradient(to right, var(--deep-pink), var(--romantic-red));
                transform: translateY(-2px);
                box-shadow: 0 6px 15px rgba(232, 67, 147, 0.4);
                color: white;
            }
            
            .btn-cancel {
                border-radius: 50px;
                padding: 12px 25px;
                border: 1px solid #ced4da;
            }

            .img-preview-box {
                width: 100%;
                height: 280px;
                border: 2px dashed #ffb7b2;
                border-radius: 15px;
                display: flex;
                align-items: center;
                justify-content: center;
                overflow: hidden;
                margin-top: 10px;
                background-color: #fff5f7;
                position: relative;
            }
            
            .img-preview-box::after {
                content: 'Preview Ảnh';
                position: absolute;
                color: #ffb7b2;
                z-index: 0;
            }
            
            .img-preview-box img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                z-index: 1; /* Đè lên chữ Preview */
                position: relative;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5 mb-5">
            <div class="row justify-content-center">
                <div class="col-md-10 col-lg-8">
                    <div class="card card-edit">
                        <div class="card-header">
                            <h3 class="mb-0"><i class="fas fa-edit me-2"></i>Cập Nhật Sản Phẩm</h3>
                        </div>
                        <div class="card-body p-4 p-md-5">
                            <form action="edit" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Mã sản phẩm (ID)</label>
                                            <input value="${product.id}" name="id" type="text" class="form-control bg-light text-muted" readonly>
                                        </div>
                                        
                                        <div class="mb-3">
                                            <label class="form-label">Tên quà tặng</label>
                                            <input value="${product.name}" name="name" type="text" class="form-control" required placeholder="Ví dụ: Bó hoa hồng sáp...">
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label">Giá bán (VNĐ)</label>
                                                <div class="input-group">
                                                    <input value="${product.price}" name="price" type="number" step="0.01" class="form-control" required>
                                                    <span class="input-group-text bg-white border-left-0" style="border-radius: 0 12px 12px 0; border-color: #ffeef2;">đ</span>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label">Danh mục</label>
                                                <select name="category" class="form-select">
                                                    <c:forEach items="${listCategories}" var="o">
                                                        <option ${(product.categoryId == o.cid) ? "selected" : ""} value="${o.cid}">${o.cname}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Tiêu đề ngắn</label>
                                            <textarea name="title" class="form-control" rows="3" required placeholder="Mô tả ngắn gọn để hiển thị trên thẻ...">${product.tiltle}</textarea>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Link Hình ảnh</label>
                                            <div class="input-group">
                                                <span class="input-group-text bg-white" style="border-radius: 12px 0 0 12px; border-color: #ffeef2;"><i class="fas fa-link text-muted"></i></span>
                                                <input value="${product.imageUrl}" name="image" id="imgInput" type="text" class="form-control" oninput="updatePreview()" required placeholder="https://..." style="border-radius: 0 12px 12px 0;">
                                            </div>
                                        </div>
                                        
                                        <div class="mb-3">
                                            <div class="img-preview-box">
                                                <img id="imgPreview" src="${product.imageUrl}" 
                                                     onerror="this.src='https://dummyimage.com/600x400/ffcdd2/e91e63.jpg&text=No+Image'">
                                            </div>
                                            <div class="text-center mt-2 small text-muted">
                                                <i class="fas fa-info-circle me-1"></i>Hình ảnh xem trước
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-12 mb-4">
                                        <label class="form-label">Mô tả chi tiết sản phẩm</label>
                                        <textarea name="description" class="form-control" rows="5" required placeholder="Viết những lời giới thiệu ngọt ngào về sản phẩm này...">${product.description}</textarea>
                                    </div>
                                </div>
                                
                                <div class="d-flex justify-content-end gap-3 align-items-center mt-3 border-top pt-4">
                                    <a href="manager" class="btn btn-cancel text-muted text-decoration-none">
                                        <i class="fas fa-arrow-left me-1"></i> Quay lại
                                    </a>
                                    <button type="submit" class="btn btn-save px-5">
                                        <i class="fas fa-check-circle me-2"></i> Lưu Thay Đổi
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function updatePreview() {
                var url = document.getElementById('imgInput').value;
                var preview = document.getElementById('imgPreview');
                if(url) {
                    preview.src = url;
                } else {
                    // Placeholder ảnh hồng nếu trống
                    preview.src = 'https://dummyimage.com/600x400/ffcdd2/e91e63.jpg&text=No+Image';
                }
            }
        </script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>