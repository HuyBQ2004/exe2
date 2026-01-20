<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Cập Nhật Tài Khoản | Admin Sweet Love</title>
        
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
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            
            .card-account {
                border: none;
                border-radius: 20px;
                box-shadow: 0 15px 35px rgba(232, 67, 147, 0.15);
                overflow: hidden;
                width: 100%;
                max-width: 650px;
                background: white;
            }
            
            .card-header {
                background: linear-gradient(to right, #2e1a21, #e84393); /* Gradient từ tối sang hồng đậm */
                color: white;
                padding: 25px;
                text-align: center;
                border-bottom: none;
            }
            
            .card-header h4 {
                font-weight: 700;
                letter-spacing: 1px;
                margin: 0;
            }

            .form-label {
                font-weight: 600;
                color: var(--deep-pink);
                font-size: 0.95rem;
                margin-bottom: 8px;
            }
            
            /* Style cho input readonly (không sửa được) */
            .form-control[readonly] {
                background-color: #f8f9fa;
                border: 1px solid #e9ecef;
                color: #636e72;
                font-size: 0.9rem;
                border-radius: 12px;
            }
            
            /* Style riêng cho input Active (cần sửa) */
            .input-editable {
                border: 2px dashed var(--primary-pink) !important;
                background-color: #fffbfc !important;
                font-weight: bold;
                color: var(--romantic-red) !important;
                border-radius: 12px;
                padding: 10px 15px;
            }
            
            .input-editable:focus {
                box-shadow: 0 0 0 0.2rem rgba(255, 126, 179, 0.25);
                border-color: var(--deep-pink) !important;
                border-style: solid !important;
            }
            
            .btn-save {
                background: linear-gradient(to right, var(--primary-pink), var(--deep-pink));
                border: none;
                padding: 12px 30px;
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
            
            .btn-back {
                border-radius: 50px;
                padding: 12px 25px;
                border: 1px solid #ced4da;
                color: #636e72;
                text-decoration: none;
                background: white;
                transition: all 0.3s;
            }
            
            .btn-back:hover {
                background-color: #f1f2f6;
                color: #2d3436;
            }

            .info-badge {
                background-color: #ffeef2;
                color: var(--deep-pink);
                padding: 5px 10px;
                border-radius: 8px;
                font-size: 0.8rem;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        
        <div class="card card-account">
            <div class="card-header">
                <h4><i class="fas fa-user-edit me-2"></i>Quản Lý Thành Viên</h4>
                <p class="mb-0 small text-white-50" style="font-family: 'Dancing Script'; font-size: 1.2rem;">Chăm sóc khách hàng tận tâm</p>
            </div>
            
            <div class="card-body p-4 p-md-5">
                <form action="EditAccount" method="post">
                    
                    <div class="row mb-4">
                        <div class="col-md-3 mb-3 mb-md-0">
                            <label class="form-label">User ID</label>
                            <input value="${account.uid}" name="id" type="text" class="form-control text-center" readonly>
                        </div>
                        <div class="col-md-9">
                            <label class="form-label">Tên đăng nhập</label>
                            <div class="input-group">
                                <span class="input-group-text border-0 bg-light rounded-start" style="border-radius: 12px 0 0 12px;"><i class="fas fa-user text-muted"></i></span>
                                <input value="${account.user}" name="user" type="text" class="form-control" readonly>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-6 mb-3 mb-md-0">
                            <label class="form-label">Mật khẩu hiện tại</label>
                            <div class="input-group">
                                <span class="input-group-text border-0 bg-light rounded-start" style="border-radius: 12px 0 0 12px;"><i class="fas fa-key text-muted"></i></span>
                                <input value="${account.pass}" name="pass" type="text" class="form-control" readonly>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <label class="form-label mb-0">Quyền bán hàng</label>
                                <span class="info-badge">Read-only</span>
                            </div>
                            <input value="${account.isSell == 1 ? 'Admin / Seller' : 'Khách hàng'}" type="text" class="form-control" readonly>
                            <input type="hidden" name="issell" value="${account.isSell}">
                        </div>
                    </div>

                    <hr class="my-4" style="background-color: #ffeef2; opacity: 1;">

                    <div class="mb-4 bg-white p-3 rounded shadow-sm" style="border-left: 5px solid var(--romantic-red);">
                        <label class="form-label text-danger d-flex align-items-center">
                            <i class="fas fa-toggle-on me-2"></i> Trạng thái hoạt động (Active)
                        </label>
                        <input value="${account.active}" name="active" type="number" min="0" max="1" class="form-control input-editable text-center fs-5" required>
                        <div class="d-flex justify-content-between mt-2 px-1">
                            <small class="text-muted"><i class="fas fa-info-circle me-1"></i>0: Khóa tài khoản</small>
                            <small class="text-success"><i class="fas fa-check-circle me-1"></i>1: Đang hoạt động</small>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <a href="managerAccount" class="btn btn-back">
                            <i class="fas fa-arrow-left me-1"></i> Quay lại
                        </a>
                        <button type="submit" class="btn btn-save">
                            <i class="fas fa-save me-2"></i>Lưu Cập Nhật
                        </button>
                    </div>
                    
                </form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>