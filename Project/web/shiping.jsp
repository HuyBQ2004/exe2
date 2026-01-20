<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Cập Nhật Giao Quà | Admin Sweet Love</title>
        
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        
        <style>
            :root {
                --primary-pink: #ff7eb3;
                --deep-pink: #e84393;
                --romantic-red: #ff4757;
                --shipping-green: #00b894;
                --soft-bg: #fff0f3;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: var(--soft-bg);
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0;
            }
            
            .card-shipping {
                border: none;
                border-radius: 30px;
                box-shadow: 0 15px 40px rgba(232, 67, 147, 0.1);
                overflow: hidden;
                width: 100%;
                max-width: 850px;
                background: white;
            }
            
            .card-header {
                /* Gradient từ xanh vận chuyển sang hồng tình yêu */
                background: linear-gradient(135deg, var(--shipping-green), var(--primary-pink));
                color: white;
                padding: 30px;
                position: relative;
                border: none;
            }
            
            .shipping-icon {
                font-size: 4rem;
                opacity: 0.2;
                position: absolute;
                right: 30px;
                top: 50%;
                transform: translateY(-50%);
            }
            
            .info-group {
                background-color: #fffbfc;
                padding: 25px;
                border-radius: 20px;
                border: 1px solid #ffeef2;
                height: 100%;
            }
            
            .info-label {
                font-size: 0.75rem;
                text-transform: uppercase;
                letter-spacing: 1.5px;
                color: #b2bec3;
                margin-bottom: 5px;
                font-weight: 700;
            }
            
            .info-value {
                font-size: 1.05rem;
                font-weight: 600;
                color: #444;
                margin-bottom: 20px;
                display: flex;
                align-items: center;
            }

            .info-value i {
                width: 25px;
                color: var(--primary-pink);
            }
            
            .status-section {
                padding: 20px;
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }
            
            .btn-update {
                background: linear-gradient(to right, var(--shipping-green), #00cec9);
                border: none;
                color: white;
                font-weight: 700;
                padding: 14px;
                width: 100%;
                border-radius: 50px;
                transition: all 0.3s;
                box-shadow: 0 5px 15px rgba(0, 184, 148, 0.3);
                text-transform: uppercase;
                letter-spacing: 1px;
            }
            
            .btn-update:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 20px rgba(0, 184, 148, 0.4);
                color: white;
            }
            
            .back-link {
                color: #999;
                text-decoration: none;
                font-size: 0.9rem;
                transition: 0.3s;
                font-weight: 500;
            }
            
            .back-link:hover { color: var(--deep-pink); }

            /* Trạng thái đã hoàn thành */
            .completed-box {
                text-align: center;
                padding: 40px 20px;
                border: 2px dashed var(--shipping-green);
                background-color: #f0fff4;
                border-radius: 20px;
            }
            .completed-icon {
                font-size: 3.5rem;
                color: var(--shipping-green);
                margin-bottom: 15px;
                filter: drop-shadow(0 5px 10px rgba(0, 184, 148, 0.2));
            }
            
            .form-select {
                border-radius: 15px;
                border: 1px solid #ffeef2;
                padding: 12px;
                font-weight: 600;
                color: #444;
            }
            
            .form-select:focus {
                border-color: var(--primary-pink);
                box-shadow: 0 0 0 0.25rem rgba(255, 126, 179, 0.15);
            }
        </style>
    </head>
    
    <body>
        <div class="container">
            <div class="card card-shipping shadow-lg">
                <div class="card-header">
                    <i class="fas fa-shipping-fast shipping-icon"></i>
                    <h3 class="mb-1 fw-bold" style="font-family: 'Poppins';">Hành Trình Yêu Thương</h3>
                    <p class="mb-0 opacity-75">Vận đơn: <strong>#${shipping.id}</strong></p>
                </div>
                
                <div class="card-body p-4 p-md-5">
                    <div class="row align-items-stretch">
                        <div class="col-md-6 mb-4 mb-md-0">
                            <div class="info-group shadow-sm">
                                <h5 class="mb-4 fw-bold" style="color: var(--deep-pink); font-family: 'Dancing Script'; font-size: 1.8rem;">
                                    <i class="fas fa-heart me-2"></i>Người Nhận Quà
                                </h5>
                                
                                <div class="info-label">Tên khách hàng</div>
                                <div class="info-value">
                                    <i class="fas fa-user-heart"></i> ${shipping.name}
                                </div>
                                
                                <div class="info-label">Số điện thoại</div>
                                <div class="info-value">
                                    <i class="fas fa-phone-alt"></i> ${shipping.phone}
                                </div>
                                
                                <div class="info-label">Địa chỉ giao quà</div>
                                <div class="info-value mb-0">
                                    <i class="fas fa-map-marked-alt"></i> ${shipping.address}
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="status-section">
                                
                                <c:choose>
                                    <%-- Đã giao hàng --%>
                                    <c:when test="${shipping.status == 'Shipped'}">
                                        <div class="completed-box">
                                            <div class="completed-icon pulse">
                                                <i class="fas fa-check-circle"></i>
                                            </div>
                                            <h4 class="fw-bold text-dark">Đã Giao Quà</h4>
                                            <p class="mb-3 text-muted small">Món quà đã được trao tận tay người nhận một cách trọn vẹn.</p>
                                            <span class="badge rounded-pill bg-success px-4 py-2 shadow-sm">Status: SHIPPED</span>
                                        </div>
                                    </c:when>
                                    
                                    <%-- Đang chờ giao --%>
                                    <c:otherwise>
                                        <div class="text-center mb-4">
                                            <div class="badge bg-warning text-dark px-4 py-2 mb-3 rounded-pill shadow-sm">
                                                <i class="fas fa-spinner fa-spin me-2"></i>Chờ lấy hàng: ${shipping.status}
                                            </div>
                                            <p class="text-muted small px-3">Hãy cập nhật trạng thái khi món quà bắt đầu được vận chuyển nhé!</p>
                                        </div>

                                        <form action="shipping" method="post">
                                            <input type="hidden" name="id" value="${shipping.id}">
                                            
                                            <div class="mb-4">
                                                <label class="form-label fw-bold text-dark small text-uppercase">Chuyển trạng thái sang</label>
                                                <div class="input-group">
                                                    <span class="input-group-text bg-white border-end-0" style="border-radius: 15px 0 0 15px; border-color: #ffeef2;">
                                                        <i class="fas fa-truck-loading text-primary"></i>
                                                    </span>
                                                    <select name="status" class="form-select border-start-0" style="border-color: #ffeef2;">
                                                        <option value="Pending" selected>Giữ nguyên (Pending)</option>
                                                        <option value="Shipped">Đã giao quà (Shipped)</option>
                                                    </select>
                                                </div>
                                                <div class="mt-3 p-2 bg-light rounded-3">
                                                    <small class="text-danger fst-italic">
                                                        <i class="fas fa-info-circle me-1"></i> <b>Lưu ý:</b> Trạng thái "Shipped" không thể hoàn tác.
                                                    </small>
                                                </div>
                                            </div>
                                            
                                            <button type="submit" class="btn btn-update shadow">
                                                <i class="fas fa-sync-alt me-2"></i> Lưu Cập Nhật
                                            </button>
                                        </form>
                                    </c:otherwise>
                                </c:choose>
                                
                                <div class="text-center mt-4">
                                    <a href="orders" class="back-link">
                                        <i class="fas fa-chevron-left me-1"></i> Quay lại Đơn hàng
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>