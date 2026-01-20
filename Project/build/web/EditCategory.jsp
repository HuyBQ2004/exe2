<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Sửa Danh Mục | Admin Sweet Love</title>
        
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Pacifico&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        
        <style>
            :root {
                --primary-pink: #ff7eb3;
                --deep-pink: #e84393;
                --romantic-red: #ff4757;
                --coral-orange: #ff9f43;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: #fff0f3;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            
            .card-category {
                border: none;
                border-radius: 20px;
                box-shadow: 0 15px 35px rgba(255, 126, 179, 0.2);
                overflow: hidden;
                width: 100%;
                max-width: 500px;
                background: white;
            }
            
            .card-header {
                /* Gradient khác biệt một chút: Coral -> Pink */
                background: linear-gradient(to right, var(--romantic-red), var(--coral-orange));
                color: white;
                padding: 30px 20px;
                text-align: center;
                border-bottom: none;
                position: relative;
                overflow: hidden;
            }
            
            /* Hiệu ứng bóng mờ trang trí header */
            .card-header::before {
                content: '\f02b'; /* Icon tags */
                font-family: "Font Awesome 5 Free";
                font-weight: 900;
                position: absolute;
                top: -10px;
                left: -10px;
                font-size: 6rem;
                color: rgba(255,255,255,0.15);
                transform: rotate(-20deg);
            }
            
            .card-header h4 {
                font-family: 'Pacifico', cursive;
                font-size: 2rem;
                margin: 0;
                position: relative;
                z-index: 1;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
            }

            .form-label {
                font-weight: 600;
                color: var(--deep-pink);
                margin-bottom: 8px;
            }
            
            .form-control {
                border-radius: 12px;
                border: 1px solid #ffeef2;
                padding: 12px 15px;
                background-color: #fffbfc;
            }

            .form-control:focus {
                border-color: var(--coral-orange);
                box-shadow: 0 0 0 0.2rem rgba(255, 159, 67, 0.25);
                background-color: white;
            }
            
            .btn-save {
                background: linear-gradient(to right, var(--romantic-red), var(--coral-orange));
                border: none;
                padding: 12px 30px;
                font-weight: 600;
                border-radius: 50px;
                transition: all 0.3s;
                color: white;
                box-shadow: 0 4px 10px rgba(255, 107, 107, 0.3);
            }
            
            .btn-save:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 15px rgba(255, 107, 107, 0.4);
                color: white;
                background: linear-gradient(to right, var(--coral-orange), var(--romantic-red));
            }
            
            .btn-back {
                border-radius: 50px;
                padding: 12px 25px;
                border: 2px solid #ffeef2;
                color: #636e72;
                text-decoration: none;
                background: white;
                transition: all 0.3s;
                font-weight: 600;
            }
            
            .btn-back:hover {
                background-color: #ffeef2;
                color: var(--romantic-red);
            }
        </style>
    </head>
    <body>
        
        <div class="card card-category">
            <div class="card-header">
                <h4>Chỉnh Sửa Danh Mục</h4>
                <p class="mb-0 text-white-50 small" style="font-family: 'Poppins'; letter-spacing: 1px;">MANAGEMENT</p>
            </div>
            
            <div class="card-body p-4 p-md-5">
                <form action="EditCategory" method="post">
                    
                    <div class="mb-4">
                        <label class="form-label">Mã Danh Mục (ID)</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-0 rounded-start" style="border-radius: 12px 0 0 12px;">
                                <i class="fas fa-fingerprint text-muted"></i>
                            </span>
                            <input value="${category.cid}" name="id" type="text" class="form-control bg-light text-muted" readonly style="border-left: 0;">
                        </div>
                    </div>

                    <div class="mb-5">
                        <label class="form-label">Tên Danh Mục</label>
                        <div class="input-group shadow-sm" style="border-radius: 12px;">
                            <span class="input-group-text bg-white border-end-0 rounded-start" style="border-color: #ffeef2; border-radius: 12px 0 0 12px;">
                                <i class="fas fa-tag text-danger"></i>
                            </span>
                            <input value="${category.cname}" name="name" type="text" class="form-control border-start-0" required placeholder="Nhập tên danh mục..." style="border-radius: 0 12px 12px 0;">
                        </div>
                        <div class="form-text mt-2 text-muted fst-italic ms-1">
                            <i class="fas fa-lightbulb text-warning me-1"></i>Ví dụ: Quà sinh nhật, Valentine, Hoa sáp...
                        </div>
                    </div>

                    <div class="d-flex justify-content-between align-items-center">
                        <a href="managerCategory" class="btn btn-back">
                            <i class="fas fa-arrow-left me-1"></i> Quay lại
                        </a>
                        <button type="submit" class="btn btn-save">
                            <i class="fas fa-check me-2"></i>Lưu Thay Đổi
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>