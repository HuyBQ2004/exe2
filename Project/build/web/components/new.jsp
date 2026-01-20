<%-- 
    Document   : new
    Created on : Oct 30, 2024, 3:54:49 PM
    Author     : phuoc
    Theme      : Love & Sweetness
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sản Phẩm Mới | Sweet Love</title>
        <style>
            /* CSS riêng cho phần sản phẩm mới để đồng bộ với theme tình yêu */
            .section-love-title {
                font-family: 'Pacifico', cursive;
                color: #e84393;
                font-size: 2.5rem;
                margin-bottom: 40px;
            }
            
            .card-love {
                border: none;
                border-radius: 20px;
                box-shadow: 0 10px 20px rgba(255, 126, 179, 0.15);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                overflow: hidden;
            }
            
            .card-love:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 30px rgba(232, 67, 147, 0.2);
            }
            
            .card-love img {
                height: 250px;
                object-fit: cover;
                border-bottom: 1px solid #fff0f3;
            }
            
            .price-love {
                color: #ff4757;
                font-weight: 700;
                font-size: 1.1rem;
            }
            
            .btn-love-outline {
                border: 2px solid #ff7eb3;
                color: #ff7eb3;
                border-radius: 50px;
                font-weight: 600;
                padding: 8px 20px;
                transition: all 0.3s;
            }
            
            .btn-love-outline:hover {
                background: linear-gradient(45deg, #ff7eb3, #e84393);
                color: white;
                border-color: transparent;
                transform: scale(1.05);
            }

            .star-love {
                color: #fdcb6e;
            }
        </style>
    </head>
    <body>
        <c:if test="${p1 != null}">
        <section class="py-5" style="background-color: #fffbfc;">
            <div class="container px-4 px-lg-5 mt-5">
                
                <h2 class="section-love-title text-center">
                    <i class="fas fa-heart me-2"></i>Món Quà Mới Nhất
                </h2>
                
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                    <c:forEach items="${p1}" var="L">
                        <div class="col mb-5">
                            <div class="card h-100 card-love">
                                <a href="detail?productId=${L.id}">
                                    <img class="card-img-top" src="${L.imageUrl}" alt="${L.name}" 
                                         onerror="this.src='https://dummyimage.com/450x300/ffcdd2/e91e63.jpg&text=Sweet+Gift';"/>
                                </a>
                                
                                <div class="card-body p-4 text-center">
                                    <h5 class="fw-bolder mb-2" style="color: #2d3436;">${L.name}</h5>
                                    
                                    <div class="d-flex justify-content-center small star-love mb-2">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    
                                    <div class="price-love">
                                        ${L.price} VND
                                    </div>
                                </div>
                                
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent text-center">
                                    <a class="btn btn-love-outline mt-auto" href="add-to-cart?productId=${L.id}">
                                        <i class="fas fa-cart-plus me-1"></i> Thêm vào giỏ
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </section>
        </c:if>
    </body>
</html>