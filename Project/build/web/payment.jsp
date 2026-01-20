<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <title>Thanh Toán Đơn Hàng | Sweet Love</title>

            <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
            <link
                href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Poppins:wght@300;400;600;700&display=swap"
                rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

            <style>
                :root {
                    --primary-pink: #ff7eb3;
                    --deep-pink: #e84393;
                    --romantic-red: #ff4757;
                    --soft-bg: #fff0f3;
                    --momo-color: #a50064;
                }

                body {
                    font-family: 'Poppins', sans-serif;
                    background-color: var(--soft-bg);
                }

                .payment-card {
                    background: white;
                    border: none;
                    border-radius: 30px;
                    box-shadow: 0 15px 40px rgba(232, 67, 147, 0.1);
                    overflow: hidden;
                }

                .payment-header {
                    background: linear-gradient(135deg, #ff7eb3 0%, #e84393 100%);
                    color: white;
                    padding: 40px 20px;
                    text-align: center;
                }

                .payment-header h2 {
                    font-family: 'Dancing Script', cursive;
                    font-size: 2.5rem;
                    margin-bottom: 10px;
                }

                .amount-box {
                    background: rgba(255, 255, 255, 0.2);
                    display: inline-block;
                    padding: 10px 30px;
                    border-radius: 50px;
                    font-weight: 700;
                    font-size: 1.5rem;
                    margin-top: 15px;
                    backdrop-filter: blur(5px);
                    border: 1px solid rgba(255, 255, 255, 0.3);
                }

                .payment-tabs {
                    border: none;
                    justify-content: center;
                    padding: 20px;
                    background: #fff;
                }

                .nav-link {
                    border: 2px solid #f8f9fa !important;
                    border-radius: 15px !important;
                    margin: 0 10px;
                    color: #666;
                    font-weight: 600;
                    transition: all 0.3s;
                    padding: 12px 25px;
                }

                .nav-link.active {
                    background-color: white !important;
                    border-color: var(--deep-pink) !important;
                    color: var(--deep-pink) !important;
                    box-shadow: 0 5px 15px rgba(232, 67, 147, 0.1);
                }

                .momo-tab.active {
                    border-color: var(--momo-color) !important;
                    color: var(--momo-color) !important;
                }

                .qr-container {
                    max-width: 350px;
                    margin: 0 auto;
                    padding: 20px;
                    border: 1px solid #eee;
                    border-radius: 20px;
                    text-align: center;
                }

                .qr-img {
                    width: 100%;
                    border-radius: 10px;
                }

                .payment-info {
                    background: #fdf2f5;
                    border-radius: 20px;
                    padding: 20px;
                    margin-top: 20px;
                }

                .info-item {
                    display: flex;
                    justify-content: space-between;
                    margin-bottom: 10px;
                    font-size: 0.95rem;
                }

                .info-label {
                    color: #888;
                }

                .info-value {
                    font-weight: 700;
                    color: #444;
                }

                .status-checking {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin-top: 30px;
                    color: var(--deep-pink);
                    font-weight: 600;
                }

                /* Loading Spinner */
                .spinner-heart {
                    display: inline-block;
                    width: 20px;
                    height: 20px;
                    background-color: var(--romantic-red);
                    margin: 0 5px;
                    border-radius: 50%;
                    animation: pulse 1s infinite alternate;
                }

                @keyframes pulse {
                    from {
                        transform: scale(0.8);
                        opacity: 0.5;
                    }

                    to {
                        transform: scale(1.2);
                        opacity: 1;
                    }
                }

                .btn-success-sim {
                    display: none;
                    /* Auto redirect but keep button for backup */
                    background: #2ecc71;
                    color: white;
                    border: none;
                    padding: 15px 30px;
                    border-radius: 50px;
                    font-weight: 700;
                    width: 100%;
                    margin-top: 20px;
                    transition: all 0.3s;
                }

                .btn-success-sim:hover {
                    background: #27ae60;
                    transform: translateY(-2px);
                }
            </style>
        </head>

        <body>
            <%@include file="components/navBarComponent.jsp" %>

                <div class="container py-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-6">
                            <div class="payment-card">
                                <div class="payment-header">
                                    <h2>Gửi Trọn Yêu Thương</h2>
                                    <p class="mb-0">Vui lòng quét mã để hoàn tất món quà của bạn</p>
                                    <div class="amount-box">
                                        <span id="totalMoney">${totalPrice}</span> đ
                                    </div>
                                </div>

                                <ul class="nav nav-tabs payment-tabs" id="paymentTabs" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="bank-tab" data-bs-toggle="tab"
                                            data-bs-target="#bank" type="button" role="tab">
                                            <i class="fas fa-university me-2"></i>Ngân Hàng
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link momo-tab" id="momo-tab" data-bs-toggle="tab"
                                            data-bs-target="#momo" type="button" role="tab">
                                            <i class="fas fa-wallet me-2"></i>Ví MoMo
                                        </button>
                                    </li>
                                </ul>

                                <div class="tab-content p-4" id="paymentContent">
                                    <!-- Bank Payment -->
                                    <div class="tab-pane fade show active" id="bank" role="tabpanel">
                                        <div class="qr-container">
                                            <img src="assets/img/qr-payment.png" alt="Bank QR" class="qr-img"
                                                onerror="this.src='https://api.vietqr.io/image/970423-75569888888-vRovXN8.jpg?accountName=NGUYEN%20THAI%20DUONG&amount=${totalPrice}'">
                                            <div class="mt-3">
                                                <p class="small text-muted mb-0">TPBank - NGUYEN THAI DUONG</p>
                                                <p class="fw-bold mb-0">7556 9888 888</p>
                                            </div>
                                        </div>
                                        <div class="payment-info">
                                            <div class="info-item">
                                                <span class="info-label">Ngân hàng:</span>
                                                <span class="info-value">TPBank</span>
                                            </div>
                                            <div class="info-item">
                                                <span class="info-label">Chủ tài khoản:</span>
                                                <span class="info-value">NGUYEN THAI DUONG</span>
                                            </div>
                                            <div class="info-item">
                                                <span class="info-label">Nội dung:</span>
                                                <span class="info-value">Thanh toan don hang ${orderId}</span>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- MoMo Payment -->
                                    <div class="tab-pane fade" id="momo" role="tabpanel">
                                        <div class="qr-container border-danger">
                                            <img src="https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=2|99|07556988888|NGUYEN%20THAI%20DUONG|0|0|0|${totalPrice}|Thanh%20toan%20don%20hang"
                                                alt="MoMo QR" class="qr-img">
                                            <div class="mt-3">
                                                <p class="small text-muted mb-0"
                                                    style="color: var(--momo-color) !important;">MoMo - NGUYEN THAI
                                                    DUONG</p>
                                                <p class="fw-bold mb-0">07556988888</p>
                                            </div>
                                        </div>
                                        <div class="payment-info border-danger" style="background: #fff0f6;">
                                            <div class="info-item">
                                                <span class="info-label">Ví điện tử:</span>
                                                <span class="info-value" style="color: var(--momo-color);">MoMo</span>
                                            </div>
                                            <div class="info-item">
                                                <span class="info-label">Số điện thoại:</span>
                                                <span class="info-value">07556988888</span>
                                            </div>
                                            <div class="info-item">
                                                <span class="info-label">Chủ tài khoản:</span>
                                                <span class="info-value">NGUYEN THAI DUONG</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="px-4 pb-5 text-center">
                                    <div class="status-checking">
                                        <span class="spinner-heart"></span>
                                        <span class="spinner-heart" style="animation-delay: 0.2s"></span>
                                        <span class="spinner-heart" style="animation-delay: 0.4s"></span>
                                        <span class="ms-3" id="status-text">Đang chờ bạn quét mã...</span>
                                    </div>

                                    <button onclick="window.location.href='thank?orderId=${orderId}'"
                                        class="btn-success-sim" id="btn-done">
                                        <i class="fas fa-check-circle me-2"></i> Xác nhận đã chuyển khoản
                                    </button>

                                    <p class="small text-muted mt-4">
                                        <i class="fas fa-info-circle me-1"></i>Hệ thống sẽ tự động cập nhật sau khi nhận
                                        được tiền.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%@include file="components/footerComponent.jsp" %>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
                    <script>
                        // Simulate the automatic detection of payment
                        setTimeout(function () {
                            document.getElementById('status-text').innerText = "Đã nhận được thông tin giao dịch!";
                            document.getElementById('status-text').style.color = "#2ecc71";
                        }, 5000);

                        setTimeout(function () {
                            document.getElementById('status-text').innerText = "Thanh toán thành công! Đang chuyển hướng...";
                            // Small delay to let user see the success message
                            setTimeout(function () {
                                window.location.href = "thank?orderId=${orderId}";
                            }, 2000);
                        }, 8000);

                        // Show button after 12 seconds in case auto redirect fails
                        setTimeout(function () {
                            document.getElementById('btn-done').style.display = 'block';
                        }, 12000);
                    </script>
        </body>

        </html>