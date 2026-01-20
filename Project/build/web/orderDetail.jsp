<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Hóa Đơn Quà Tặng #${orderId}</title>
        
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        
        <style>
            :root {
                --primary-pink: #ff7eb3;
                --deep-pink: #e84393;
                --romantic-red: #ff4757;
                --admin-dark: #2e1a21;
                --soft-bg: #fff0f3;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: var(--soft-bg);
            }
            
            .card-detail {
                border: none;
                border-radius: 25px;
                box-shadow: 0 15px 35px rgba(46, 26, 33, 0.1);
                overflow: hidden;
                margin-bottom: 40px;
                background: white;
            }
            
            .card-header {
                background: linear-gradient(135deg, var(--admin-dark), var(--deep-pink));
                color: white;
                padding: 30px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border: none;
            }

            .invoice-title {
                font-family: 'Dancing Script', cursive;
                font-size: 2.2rem;
                margin-bottom: 0;
            }
            
            .table thead th {
                background-color: #fffbfc;
                color: var(--deep-pink);
                font-weight: 700;
                text-transform: uppercase;
                font-size: 0.8rem;
                padding: 15px;
                border-bottom: 2px solid #ffeef2;
            }
            
            .table tbody td {
                vertical-align: middle;
                padding: 20px 15px;
                color: #444;
                border-bottom: 1px solid #fff0f3;
            }
            
            .item-thumb {
                width: 65px;
                height: 65px;
                object-fit: cover;
                border-radius: 12px;
                box-shadow: 0 4px 10px rgba(0,0,0,0.08);
                margin-right: 15px;
                border: 2px solid #fff;
            }
            
            .item-name {
                font-weight: 600;
                color: var(--admin-dark);
            }
            
            .total-price {
                color: var(--romantic-red);
                font-weight: 700;
            }
            
            .summary-section {
                background-color: #fffbfc;
                padding: 30px;
                border-top: 2px dashed #ffd1dc;
            }

            .btn-print {
                background-color: white;
                color: var(--deep-pink);
                border: none;
                border-radius: 50px;
                padding: 8px 20px;
                font-weight: 600;
                transition: 0.3s;
            }
            .btn-print:hover {
                background-color: var(--soft-bg);
                transform: scale(1.05);
            }

            .btn-back {
                color: white;
                text-decoration: none;
                font-weight: 400;
                font-size: 0.9rem;
                opacity: 0.8;
            }
            .btn-back:hover { color: white; opacity: 1; }
            
            /* Print Optimization */
            @media print {
                .no-print, .btn-back, .btn-print, .nav-link, navbar { display: none !important; }
                body { background-color: white; padding: 0; }
                .card-detail { box-shadow: none; border: 1px solid #eee; margin-top: 0; }
                .container { width: 100% !important; max-width: 100% !important; }
                .card-header { background: #000 !important; color: #000 !important; border-bottom: 2px solid #000; }
                .invoice-title, .text-white-50 { color: #000 !important; }
            }
        </style>

        <script>
            function printInvoice() {
                window.print();
            }
        </script>
    </head>
    
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="mb-3 no-print">
                        <a href="orders" class="btn-back">
                            <i class="fas fa-chevron-left me-1"></i> Quay lại danh sách đơn hàng
                        </a>
                    </div>

                    <div class="card card-detail shadow-lg">
                        
                        <div class="card-header">
                            <div>
                                <h4 class="invoice-title"><i class="fas fa-heart me-2"></i>Sweet Love Invoice</h4>
                                <span class="text-white-50 small">Mã đơn hàng: <strong>#${orderId}</strong></span>
                            </div>
                            <div class="no-print text-end">
                                <button class="btn btn-print shadow-sm" onclick="printInvoice()">
                                    <i class="fas fa-print me-2"></i>In Hóa Đơn
                                </button>
                            </div>
                        </div>
                        
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table mb-0">
                                    <thead>
                                        <tr>
                                            <th class="ps-4">Quà Tặng</th>
                                            <th class="text-center">Đơn Giá</th>
                                            <th class="text-center">Số Lượng</th>
                                            <th class="text-end pe-4">Thành Tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="subTotal" value="0" />
                                        
                                        <c:forEach items="${orderDetails}" var="detail">
                                            <tr>
                                                <td class="ps-4">
                                                    <div class="d-flex align-items-center">
                                                        <img src="${detail.productImage}" class="item-thumb" 
                                                             alt="${detail.productName}" 
                                                             onerror="this.src='https://dummyimage.com/100x100/ffcdd2/e91e63.jpg&text=Gift'">
                                                        <div>
                                                            <span class="item-name d-block">${detail.productName}</span>
                                                            <small class="text-muted">Màu sắc/Mẫu: Mặc định</small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-center text-muted">${detail.productPrice} đ</td>
                                                <td class="text-center fw-bold text-dark">${detail.quantity}</td>
                                                <td class="text-end pe-4 fw-bold text-dark">
                                                    ${detail.productPrice * detail.quantity} đ
                                                </td>
                                            </tr>
                                            
                                            <c:set var="subTotal" value="${subTotal + (detail.productPrice * detail.quantity)}" />
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <div class="summary-section">
                            <div class="row">
                                <div class="col-md-7 d-none d-md-block">
                                    <div class="p-3 border rounded-3 bg-white" style="border-color: #ffd1dc !important; border-style: dashed !important;">
                                        <h6 class="fw-bold text-muted small text-uppercase mb-2">Lời nhắn gửi yêu thương</h6>
                                        <p class="fst-italic text-muted small mb-0">
                                            "Cảm ơn bạn đã tin tưởng Sweet Love. Chúng tôi hy vọng món quà này sẽ giúp tình cảm của bạn thêm phần gắn kết và nồng cháy!"
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="d-flex justify-content-between mb-2">
                                        <span class="text-muted small">Tổng tiền hàng:</span>
                                        <span class="fw-bold small">${subTotal} đ</span>
                                    </div>
                                    <div class="d-flex justify-content-between mb-2">
                                        <span class="text-muted small">Phí dịch vụ & Gói quà:</span>
                                        <span class="text-success small fw-bold">Miễn phí</span>
                                    </div>
                                    <div class="d-flex justify-content-between mb-3">
                                        <span class="text-muted small">Voucher giảm giá:</span>
                                        <span class="text-muted small">- 0 đ</span>
                                    </div>
                                    <hr style="border-top: 1px solid #ffd1dc;">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="h6 mb-0 fw-bold" style="color: var(--admin-dark);">TỔNG THANH TOÁN:</span>
                                        <span class="h4 mb-0 total-price">${subTotal} đ</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="text-center p-4 bg-white border-top small text-muted">
                            <p class="mb-1">Cửa hàng quà tặng Sweet Love - Trao gửi chân thành</p>
                            <p class="mb-0">Website: www.sweetlove.com | Hotline: 0866.xxx.xxx</p>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>