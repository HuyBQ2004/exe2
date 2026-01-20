<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>${product.name} | Sweet Love</title>
        
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Pacifico&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
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
                background-image: url("https://www.transparenttextures.com/patterns/hearts.png");
            }

            /* Breadcrumb */
            .breadcrumb-section {
                background-color: white;
                padding: 15px 0;
                margin-bottom: 30px;
                box-shadow: 0 2px 10px rgba(232, 67, 147, 0.05);
                border-radius: 0 0 20px 20px;
            }
            .breadcrumb a {
                color: #b2bec3;
                text-decoration: none;
                transition: 0.3s;
            }
            .breadcrumb a:hover { color: var(--deep-pink); }
            .breadcrumb-item.active { color: var(--deep-pink); font-weight: 600; }

            /* Product Main Section */
            .product-detail-card {
                background: white;
                border-radius: 30px;
                padding: 40px;
                box-shadow: 0 15px 40px rgba(232, 67, 147, 0.1);
                border: 1px solid #ffeef2;
            }

            .main-img-container {
                border-radius: 20px;
                overflow: hidden;
                box-shadow: 0 10px 25px rgba(0,0,0,0.08);
                background: #f8f9fa;
                border: 5px solid #fffbfc;
            }

            .main-img {
                width: 100%;
                height: 450px;
                object-fit: cover;
                transition: transform 0.8s ease;
            }

            .main-img:hover {
                transform: scale(1.08);
            }

            .product-title {
                font-family: 'Dancing Script', cursive;
                font-weight: 700;
                color: #2d3436;
                margin-bottom: 15px;
                font-size: 3.5rem;
            }

            .product-price {
                font-size: 2.5rem;
                font-weight: 700;
                color: var(--romantic-red);
                margin-bottom: 25px;
                text-shadow: 1px 1px 2px rgba(255, 71, 87, 0.1);
            }

            .product-desc {
                color: #636e72;
                line-height: 1.8;
                font-size: 1.05rem;
                margin-bottom: 35px;
                padding-left: 15px;
                border-left: 3px solid var(--primary-pink);
            }

            .btn-add-cart-lg {
                background: linear-gradient(45deg, var(--primary-pink), var(--deep-pink));
                color: white;
                border: none;
                padding: 18px 50px;
                border-radius: 50px;
                font-size: 1.2rem;
                font-weight: 600;
                transition: all 0.4s;
                text-transform: uppercase;
                letter-spacing: 1px;
                box-shadow: 0 8px 20px rgba(232, 67, 147, 0.3);
                width: 100%;
                text-align: center;
                text-decoration: none;
            }

            .btn-add-cart-lg:hover {
                transform: translateY(-5px);
                box-shadow: 0 12px 25px rgba(232, 67, 147, 0.5);
                color: white;
                background: linear-gradient(45deg, var(--deep-pink), var(--romantic-red));
            }

            /* Related Products */
            .related-card {
                border: none;
                border-radius: 20px;
                box-shadow: 0 8px 20px rgba(255, 182, 193, 0.2);
                transition: all 0.3s ease;
                overflow: hidden;
                background: white;
            }

            .related-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 30px rgba(232, 67, 147, 0.2);
            }

            .related-img {
                height: 220px;
                object-fit: cover;
                width: 100%;
            }
            
            .related-title {
                font-size: 1.1rem;
                font-weight: 600;
                color: #444;
            }
            
            .related-price {
                color: var(--romantic-red);
                font-weight: 700;
                font-size: 1.1rem;
            }

            .section-title {
                font-family: 'Pacifico', cursive;
                margin-bottom: 40px;
                color: var(--deep-pink);
                text-align: center;
                position: relative;
            }
            
            .section-title::after {
                content: '❤';
                display: block;
                font-size: 1.2rem;
                color: var(--primary-pink);
                margin-top: 10px;
            }

            .badge-love {
                background-color: #ffeef2;
                color: var(--deep-pink);
                border: 1px solid #ffd1dc;
            }
        </style>
    </head>
    <body>
        <%@include file="components/navBarComponent.jsp" %>

        <div class="breadcrumb-section">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                        <li class="breadcrumb-item"><a href="#">Bộ sưu tập</a></li>
                        <li class="breadcrumb-item active" aria-current="page">${product.name}</li>
                    </ol>
                </nav>
            </div>
        </div>

        <section class="py-3">
            <div class="container">
                <div class="product-detail-card">
                    <div class="row align-items-center">
                        <div class="col-md-6 mb-4 mb-md-0">
                            <div class="main-img-container">
                                <img class="main-img" src="${product.imageUrl}" alt="${product.name}" 
                                     onerror="this.src='https://dummyimage.com/600x600/ffcdd2/e91e63.jpg&text=Sweet+Gift'"/>
                            </div>
                        </div>
                        
                        <div class="col-md-6 ps-md-5">
                            <div class="badge badge-love mb-2 px-3 py-2 rounded-pill fw-bold">
                                <i class="fas fa-heart me-1"></i> Sweet Love Store
                            </div>
                            <div class="small text-muted mb-2">Mã quà tặng: #${product.id}</div>
                            
                            <h1 class="product-title">${product.name}</h1>
                            
                            <div class="mb-3 text-warning">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <span class="text-muted small ms-2">(Lựa chọn hàng đầu cho các cặp đôi)</span>
                            </div>

                            <div class="product-price">
                                ${product.price} đ
                            </div>

                            <div class="product-desc">
                                ${product.description}
                                <br><br>
                                <i class="fas fa-gift me-2 text-danger"></i> <strong>Ý nghĩa món quà:</strong> 
                                Mang đến sự bất ngờ và niềm hạnh phúc trọn vẹn cho người nhận. Từng chi tiết đều được chăm chút bằng tất cả sự chân thành.
                            </div>

                            <div class="mb-4">
                                <a href="add-to-cart?productId=${product.id}" class="btn-add-cart-lg">
                                    <i class="fas fa-heart me-2"></i>Tặng món quà này ngay
                                </a>
                            </div>
                            
                            <div class="row mt-4 g-3">
                                <div class="col-6">
                                    <div class="d-flex align-items-center small text-muted">
                                        <i class="fas fa-shipping-fast text-danger me-2 fs-5"></i>
                                        <span>Giao quà nhanh bí mật</span>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="d-flex align-items-center small text-muted">
                                        <i class="fas fa-ribbon text-danger me-2 fs-5"></i>
                                        <span>Miễn phí gói quà lãng mạn</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5 mt-5" style="background-color: #fffbfc;">
            <div class="container">
                <h2 class="section-title">Những món quà ngọt ngào khác</h2>
                
                <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach items="${listLast}" var="L">
                        <div class="col mb-5">
                            <div class="card h-100 related-card">
                                <div style="position: absolute; top: 10px; right: 10px; z-index: 10; background: rgba(255,255,255,0.8); border-radius: 50%; padding: 5px 8px; color: #ff4757;">
                                    <i class="far fa-heart"></i>
                                </div>
                                <a href="detail?productId=${L.id}">
                                    <img class="related-img card-img-top" src="${L.imageUrl}" alt="${L.name}" 
                                         onerror="this.src='https://dummyimage.com/450x300/ffcdd2/e91e63.jpg&text=Lovely+Gift'"/>
                                </a>
                                <div class="card-body p-4 text-center">
                                    <h5 class="related-title text-truncate">${L.name}</h5>
                                    <div class="related-price mt-2">
                                        ${L.price} đ
                                    </div>
                                </div>
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center">
                                        <a class="btn btn-outline-danger btn-sm rounded-pill w-100 fw-bold" href="detail?productId=${L.id}">
                                            Xem chi tiết
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        <%@include file="components/footerComponent.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>