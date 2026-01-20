<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Giỏ Quà Yêu Thương | Sweet Love</title>
        
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        
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
            }
            
            /* Header Style */
            .cart-header {
                background: white;
                padding: 40px 0;
                margin-bottom: 30px;
                box-shadow: 0 4px 15px rgba(232, 67, 147, 0.1);
                border-radius: 0 0 40px 40px;
            }

            .cart-header h2 {
                font-family: 'Dancing Script', cursive;
                font-size: 3rem;
                color: var(--deep-pink);
            }
            
            /* Table Style */
            .table-shopping-cart {
                background: white;
                border-radius: 20px;
                overflow: hidden;
                box-shadow: 0 10px 30px rgba(232, 67, 147, 0.05);
                border: none;
            }
            
            .table-shopping-cart thead th {
                border: none;
                background-color: #fffbfc;
                color: var(--deep-pink);
                padding: 20px 15px;
                font-weight: 700;
                text-transform: uppercase;
                font-size: 0.85rem;
                letter-spacing: 1px;
            }
            
            .table-shopping-cart tbody td {
                vertical-align: middle;
                padding: 25px 15px;
                border-bottom: 1px solid #fff0f3;
            }
            
            .item-img {
                width: 90px;
                height: 90px;
                object-fit: cover;
                border-radius: 15px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.08);
                border: 2px solid white;
            }
            
            /* Quantity Control */
            .qty-container {
                display: flex;
                align-items: center;
                border: 2px solid #ffeef2;
                border-radius: 50px;
                padding: 5px;
                width: 110px;
                background: #fffbfc;
            }
            
            .qty-btn {
                width: 28px;
                height: 28px;
                border-radius: 50%;
                border: none;
                background-color: white;
                color: var(--deep-pink);
                font-weight: bold;
                transition: all 0.3s;
                display: flex;
                align-items: center;
                justify-content: center;
                box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            }
            
            .qty-btn:hover {
                background-color: var(--romantic-red);
                color: white;
                transform: scale(1.1);
            }
            
            .qty-input {
                border: none;
                width: 35px;
                text-align: center;
                font-weight: 700;
                background: transparent;
                color: #444;
            }
            
            .qty-input:focus { outline: none; }
            
            /* Summary Card */
            .summary-card {
                background: white;
                border-radius: 20px;
                padding: 30px;
                box-shadow: 0 10px 30px rgba(232, 67, 147, 0.1);
                border-top: 5px solid var(--primary-pink);
            }
            
            .btn-checkout {
                background: linear-gradient(to right, var(--primary-pink), var(--deep-pink));
                color: white;
                border: none;
                padding: 15px;
                border-radius: 50px;
                font-weight: 700;
                width: 100%;
                transition: all 0.4s;
                text-transform: uppercase;
                letter-spacing: 1px;
                box-shadow: 0 5px 15px rgba(232, 67, 147, 0.3);
            }
            
            .btn-checkout:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 20px rgba(232, 67, 147, 0.4);
                background: linear-gradient(to right, var(--deep-pink), var(--romantic-red));
                color: white;
            }

            .btn-continue {
                color: var(--deep-pink);
                text-decoration: none;
                font-weight: 600;
                display: inline-flex;
                align-items: center;
                transition: all 0.3s;
            }
            
            .btn-continue:hover { 
                color: var(--romantic-red);
                transform: translateX(-5px);
            }
            
            .empty-cart-icon {
                font-size: 6rem;
                background: linear-gradient(to bottom, #ffd1dc, #ff7eb3);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                margin-bottom: 20px;
            }

            .price-total {
                color: var(--romantic-red);
                font-weight: 700;
                font-size: 1.2rem;
            }
        </style>
    </head>
    <body>
        
        <%@include file="components/navBarComponent.jsp" %>
        
        <div class="cart-header text-center">
            <h2 class="fw-bold mb-0">
                <i class="fas fa-heart text-danger me-2"></i>Giỏ Quà Yêu Thương
            </h2>
            <c:if test="${sessionScope.carts != null && sessionScope.carts.size() > 0}">
                <p class="text-muted mt-2">Bạn đang chuẩn bị ${sessionScope.carts.size()} món quà bất ngờ</p>
            </c:if>
        </div>

        <section class="py-3" style="min-height: 60vh;">
            <div class="container">
                
                <c:if test="${mess != null}">
                    <div class="alert alert-danger alert-dismissible fade show shadow-sm border-0" style="border-radius: 15px;" role="alert">
                        <i class="fas fa-heart-broken me-2"></i> <b>${mess}</b>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <c:choose>
                    <%-- TRƯỜNG HỢP GIỎ HÀNG TRỐNG --%>
                    <c:when test="${sessionScope.carts == null || sessionScope.carts.size() == 0}">
                        <div class="text-center py-5">
                            <div class="empty-cart-icon">
                                <i class="fas fa-gift"></i>
                            </div>
                            <h3 class="fw-bold text-muted">Giỏ quà đang trống trải...</h3>
                            <p class="mb-4 text-muted">Hãy chọn một món quà thật ý nghĩa cho người ấy nhé!</p>
                            <a href="home" class="btn btn-checkout w-auto px-5">
                                <i class="fas fa-magic me-2"></i>Khám Phá Quà Tặng
                            </a>
                        </div>
                    </c:when>

                    <%-- TRƯỜNG HỢP CÓ SẢN PHẨM --%>
                    <c:otherwise>
                        <form action="update-quantity" method="get" id="cartForm">
                            <div class="row">
                                <div class="col-lg-8 mb-4">
                                    <div class="table-responsive table-shopping-cart">
                                        <table class="table mb-0">
                                            <thead>
                                                <tr>
                                                    <th style="width: 45%">Món quà</th>
                                                    <th style="width: 15%">Giá</th>
                                                    <th style="width: 20%">Số lượng</th>
                                                    <th style="width: 20%" class="text-end">Tổng</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="allQuantitiesValid" value="true" scope="session" />
                                                <c:forEach items="${carts}" var="C">
                                                    <input type="hidden" name="productId" value="${C.value.product.id}"/>
                                                    <tr>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <img src="${C.value.product.imageUrl}" class="item-img me-3" 
                                                                     onerror="this.src='https://dummyimage.com/100x100/ffcdd2/e91e63.jpg&text=Lovely+Gift'">
                                                                <div>
                                                                    <h6 class="mb-1 fw-bold" style="color: #444;">${C.value.product.name}</h6>
                                                                    <a href="delete-cart?productId=${C.value.product.id}" class="text-muted small text-decoration-none hover-danger">
                                                                        <i class="far fa-trash-alt me-1"></i>Bỏ khỏi giỏ
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="text-muted small">${C.value.product.price} đ</td>
                                                        <td>
                                                            <div class="qty-container">
                                                                <button type="button" class="qty-btn" onclick="updateQty(this, -1)"><i class="fas fa-minus"></i></button>
                                                                <input type="number" name="quantity" class="qty-input" 
                                                                       value="${C.value.quantity}" min="1" 
                                                                       onchange="validateAndSubmit(this)">
                                                                <button type="button" class="qty-btn" onclick="updateQty(this, 1)"><i class="fas fa-plus"></i></button>
                                                            </div>
                                                        </td>
                                                        <td class="text-end fw-bold price-total">
                                                            ${C.value.product.price * C.value.quantity} đ
                                                        </td>
                                                    </tr>
                                                    <c:if test="${C.value.quantity <= 0}">
                                                        <c:set var="allQuantitiesValid" value="false" scope="session"/>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    <div class="mt-4">
                                        <a href="home" class="btn-continue">
                                            <i class="fas fa-heart me-2"></i>Tiếp tục chọn quà
                                        </a>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="summary-card">
                                        <h5 class="fw-bold mb-4" style="color: #444;">Đơn Hàng Tình Yêu</h5>
                                        
                                        <div class="d-flex justify-content-between mb-3">
                                            <span class="text-muted">Tổng quà tặng:</span>
                                            <span class="fw-bold">${totalMoney} đ</span>
                                        </div>
                                        <div class="d-flex justify-content-between mb-3">
                                            <span class="text-muted">Gói quà lãng mạn:</span>
                                            <span class="text-success fw-bold">Miễn phí</span>
                                        </div>
                                        <hr style="border-color: #ffeef2;">
                                        <div class="d-flex justify-content-between mb-4">
                                            <span class="fw-bold fs-5" style="color: #444;">Thành tiền:</span>
                                            <span class="fw-bold fs-4" style="color: var(--romantic-red);">${totalMoney} đ</span>
                                        </div>

                                        <c:if test="${sessionScope.allQuantitiesValid}">
                                            <a href="checkout" class="btn btn-checkout d-block text-center text-decoration-none">
                                                Gửi Yêu Thương Ngay
                                            </a>
                                        </c:if>
                                        <c:if test="${!sessionScope.allQuantitiesValid}">
                                            <button disabled class="btn btn-secondary w-100 rounded-pill">Vui lòng kiểm tra số lượng</button>
                                        </c:if>
                                        
                                        <div class="mt-4 text-center small text-muted">
                                            <p><i class="fas fa-truck-moving me-2"></i>Giao quà bí mật & nhanh chóng</p>
                                            <i class="fas fa-lock me-1"></i> Thanh toán an toàn 100%
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
        
        <%@include file="components/footerComponent.jsp" %>
        
        <script>
            function validateAndSubmit(input) {
                if (input.value <= 0) {
                    alert("Số lượng món quà phải từ 1 trở lên nhé!");
                    input.value = 1;
                }
                document.getElementById('cartForm').submit();
            }

            function updateQty(btn, change) {
                var container = btn.parentElement;
                var input = container.querySelector('.qty-input');
                var currentVal = parseInt(input.value);
                var newVal = currentVal + change;

                if (newVal >= 1) {
                    input.value = newVal;
                    document.getElementById('cartForm').submit();
                }
            }
        </script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>