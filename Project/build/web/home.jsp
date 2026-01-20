<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="Love Store - Quà tặng yêu thương" />
        <meta name="author" content="" />
        <title>Sweet Love - Thế Giới Quà Tặng</title>
        
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600;700&family=Pacifico&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

        <style>
            :root {
                --primary-pink: #ff7eb3;
                --deep-pink: #e84393;
                --romantic-red: #ff4757;
                --soft-bg: #fff0f3;
                --text-color: #636e72;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: var(--soft-bg);
                background-image: url("https://www.transparenttextures.com/patterns/hearts.png"); /* Pattern tim mờ */
            }
            
            /* Banner Hero Section */
            .hero-banner {
                /* Ảnh nền lãng mạn */
                background: linear-gradient(rgba(232, 67, 147, 0.3), rgba(0, 0, 0, 0.4)), url('https://images.unsplash.com/photo-1518199266791-5375a83190b7?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80');
                background-size: cover;
                background-position: center;
                height: 420px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                margin-bottom: 40px;
                border-radius: 0 0 50px 50px; /* Bo tròn mềm mại hơn */
                box-shadow: 0 10px 30px rgba(255, 126, 179, 0.3);
            }
            
            .hero-text h1 {
                font-family: 'Pacifico', cursive; /* Font chữ bay bổng */
                font-size: 4rem;
                font-weight: 400;
                text-shadow: 3px 3px 6px rgba(0,0,0,0.3);
                color: #fff;
            }
            
            .hero-text .lead {
                font-size: 1.5rem;
                font-weight: 300;
                font-family: 'Dancing Script', cursive;
            }

            /* Section Titles */
            h3 {
                font-family: 'Dancing Script', cursive;
                font-weight: 700;
                font-size: 2.5rem;
                color: var(--deep-pink);
                margin-bottom: 25px;
                border-left: none;
                text-align: center;
                position: relative;
                padding-bottom: 10px;
            }
            
            /* Gạch chân trang trí dưới tiêu đề */
            h3::after {
                content: '♥';
                display: block;
                font-size: 1.5rem;
                color: var(--primary-pink);
                margin-top: 5px;
            }

            /* Category Sidebar */
            .category_block .list-group-item {
                border: 1px solid rgba(255, 126, 179, 0.2);
                margin-bottom: 8px;
                border-radius: 25px !important;
                transition: all 0.3s;
                background-color: white;
                color: var(--text-color);
                font-weight: 500;
            }
            
            .category_block .list-group-item:hover {
                background-color: #ffeef2;
                color: var(--deep-pink);
                padding-left: 25px; /* Hiệu ứng trượt nhẹ */
            }
            
            .category_block .list-group-item.active {
                background: linear-gradient(45deg, var(--primary-pink), var(--deep-pink));
                color: white;
                border: none;
                box-shadow: 0 4px 10px rgba(232, 67, 147, 0.3);
            }
            
            .category_block a {
                text-decoration: none;
                color: inherit;
                display: block;
                width: 100%;
            }

            /* Product Card */
            .card {
                border: none;
                border-radius: 20px;
                box-shadow: 0 5px 15px rgba(255, 182, 193, 0.3); /* Bóng màu hồng nhạt */
                transition: transform 0.4s ease, box-shadow 0.4s ease;
                overflow: hidden;
                background: white;
            }
            
            .card:hover {
                transform: translateY(-8px);
                box-shadow: 0 15px 25px rgba(232, 67, 147, 0.25);
            }
            
            .card-img-top {
                height: 220px;
                object-fit: cover;
                transition: transform 0.5s;
            }
            
            .card:hover .card-img-top {
                transform: scale(1.05); /* Zoom ảnh nhẹ khi hover */
            }
            
            .product-name {
                font-weight: 700;
                font-size: 1.2rem;
                color: #444;
                margin-bottom: 5px;
            }
            
            .product-price {
                color: var(--romantic-red);
                font-weight: 700;
                font-size: 1.3rem;
                font-family: 'Poppins', sans-serif;
            }
            
            .text-warning {
                color: #fdcb6e !important; /* Màu sao vàng */
            }

            /* Buttons */
            .btn-add-cart {
                background: linear-gradient(to right, var(--primary-pink), var(--deep-pink));
                color: white;
                border: none;
                border-radius: 50px;
                padding: 10px 25px;
                font-weight: 600;
                transition: all 0.3s;
                box-shadow: 0 4px 10px rgba(232, 67, 147, 0.4);
            }
            
            .btn-add-cart:hover {
                background: linear-gradient(to right, var(--deep-pink), var(--romantic-red));
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 6px 15px rgba(232, 67, 147, 0.5);
            }

            /* Pagination */
            .pagination .page-link {
                color: var(--deep-pink);
                border-radius: 50%;
                margin: 0 5px;
                border: 1px solid #ffeef2;
                width: 40px;
                height: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: 600;
            }
            
            .pagination .page-item.active .page-link {
                background-color: var(--deep-pink);
                border-color: var(--deep-pink);
                color: white;
                box-shadow: 0 4px 8px rgba(232, 67, 147, 0.3);
            }
            
            /* Extra Sections */
            .bg-highlight {
                background-color: #fff;
                background-image: linear-gradient(to top, #fad0c4 0%, #ffd1ff 100%);
                border-radius: 30px;
            }
        </style>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    
    <body>
        
        <%@include file="components/navBarComponent.jsp" %>
        
        <header class="hero-banner">
            <div class="hero-text text-center">
                <h1><i class="fa-solid fa-heart mr-3" style="color: #ffdde1;"></i>L'amour</h1>
                <p class="lead">Trao gửi yêu thương - Lưu giữ khoảnh khắc</p>
            </div>
        </header>

        <section class="py-3">
            <div class="container px-4 px-lg-5">
                <div class="row">
                    <div class="col-md-3 mb-5">
                        <h3>Bộ Sưu Tập</h3>
                        <ul class="list-group category_block shadow-sm">
                            <c:forEach items="${listCategories}" var="C">
                                <li class="list-group-item ${tag == C.cid ? 'active' : ''}">
                                    <a href="category?categoryId=${C.cid}">
                                        <i class="fas fa-gift mr-2"></i>${C.cname}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="col-md-9">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="m-0" style="text-align: left; border: none;">Món Quà Yêu Thương</h3>
                        </div>
                        
                        <c:choose>
                            <c:when test="${listProducts == null || listProducts.size() == 0}">
                                <div class="alert alert-danger text-center shadow-sm" style="border-radius: 20px;" role="alert">
                                    <i class="fas fa-heart-broken mr-2"></i> Chưa tìm thấy món quà phù hợp!
                                </div>
                            </c:when>
                            <c:otherwise>
                                <nav aria-label="Page navigation" class="d-flex justify-content-end mb-4">
                                    <ul class="pagination">
                                        <li class="page-item ${page <= 1 ? 'disabled' : ''}">
                                            <a class="page-link shadow-sm" href="home?page=${page-1}"><i class="fas fa-chevron-left"></i></a>
                                        </li>
                                        <c:forEach begin="1" end="${totalPage}" var="i">
                                            <li class="page-item ${i == page ? 'active' : ''}">
                                                <a class="page-link shadow-sm" href="home?page=${i}">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item ${page >= totalPage ? 'disabled' : ''}">
                                            <a class="page-link shadow-sm" href="home?page=${page+1}"><i class="fas fa-chevron-right"></i></a>
                                        </li>
                                    </ul>
                                </nav>
                            </c:otherwise>
                        </c:choose>

                        <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-md-2 row-cols-xl-3 justify-content-center">
                            <c:forEach items="${listProducts}" var="P">
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <div style="position: absolute; top: 10px; right: 10px; z-index: 10; background: rgba(255,255,255,0.8); border-radius: 50%; padding: 5px 8px; color: #ff4757;">
                                            <i class="far fa-heart"></i>
                                        </div>
                                        
                                        <a href="detail?productId=${P.id}" style="overflow: hidden;">
                                            <img class="card-img-top" src="${P.imageUrl}" alt="${P.name}" 
                                                 onerror="this.src='https://dummyimage.com/450x300/ffcdd2/e91e63.jpg&text=Gift+For+You';"/>
                                        </a>
                                        
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <h5 class="product-name" title="${P.name}">${P.name}</h5>
                                                
                                                <div class="d-flex justify-content-center small text-warning mb-2">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                                
                                                <div class="product-price">
                                                    ${P.price} đ
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center">
                                                <a class="btn btn-add-cart w-100" href="add-to-cart?productId=${P.id}">
                                                    <i class="fas fa-heart mr-2"></i>Tặng Ngay
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <c:if test="${p != null}">
            <section class="py-5 bg-highlight">
                <div class="container px-4 px-lg-5 mt-5">
                    <h2 class="fw-bolder mb-4 text-center" style="font-family: 'Pacifico', cursive; color: #d63031; font-size: 3rem;">
                        <i class="fas fa-kiss-wink-heart mr-2"></i>Gợi Ý Ngọt Ngào
                    </h2>
                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                        <c:forEach items="${p}" var="L">
                            <div class="col mb-5">
                                <div class="card h-100 border-0 shadow">
                                    <a href="detail?productId=${L.id}">
                                        <img class="card-img-top" src="${L.imageUrl}" alt="..." 
                                             style="border-radius: 20px 20px 0 0;"
                                             onerror="this.src='https://dummyimage.com/450x300/ffcdd2/e91e63.jpg&text=Lovely+Gift';"/>
                                    </a>
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <h5 class="product-name" style="font-size: 1rem;">${L.name}</h5>
                                            <div class="product-price" style="font-size: 1.1rem;">${L.price} đ</div>
                                        </div>
                                    </div>
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center">
                                            <a class="btn btn-outline-danger w-100 rounded-pill" href="add-to-cart?productId=${L.id}">
                                                Xem ngay
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </c:if>

        <%@include file="components/new.jsp"%>  
        <%@include file="components/footerComponent.jsp" %>
    </body>
</html>