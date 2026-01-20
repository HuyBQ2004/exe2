<%-- Document : navBarComponent Refactored : Love Store Theme --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<style>
    /* CSS Riêng cho Navbar Love Theme */
    .navbar-love {
        background-color: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        box-shadow: 0 4px 20px rgba(232, 67, 147, 0.1);
        padding: 12px 0;
        border-bottom: 1px solid #ffeef2;
    }

    .navbar-brand-text {
        font-family: 'Pacifico', cursive; /* Font chữ bay bổng giống Header */
        font-size: 1.8rem;
        background: linear-gradient(to right, #ff7eb3, #ff4757);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        text-shadow: 2px 2px 4px rgba(255, 182, 193, 0.3);
    }

    .nav-link {
        color: #636e72 !important;
        font-weight: 600;
        margin: 0 8px;
        transition: all 0.3s ease;
        position: relative;
    }

    .nav-link:hover,
    .nav-link.active {
        color: #e84393 !important;
    }
    
    /* Hiệu ứng gạch chân khi hover */
    .nav-link::after {
        content: '';
        position: absolute;
        width: 0;
        height: 2px;
        bottom: 0;
        left: 0;
        background-color: #e84393;
        transition: width 0.3s;
    }
    
    .nav-link:hover::after {
        width: 100%;
    }

    /* Search Bar Styling */
    .search-group {
        position: relative;
        box-shadow: 0 4px 10px rgba(255, 126, 179, 0.15);
        border-radius: 50px;
    }

    .search-input {
        border-radius: 50px 0 0 50px !important;
        border: 2px solid #ffeef2;
        border-right: none;
        padding-left: 20px;
        background-color: #fff;
        color: #e84393;
    }
    
    .search-input::placeholder {
        color: #ffb7b2;
        font-size: 0.9rem;
    }

    .search-input:focus {
        box-shadow: none;
        border-color: #ff7eb3;
        background-color: #fff0f3;
    }

    .search-btn {
        border-radius: 0 50px 50px 0 !important;
        background: linear-gradient(to right, #ff7eb3, #e84393);
        color: white;
        border: none;
        padding: 0 20px;
        transition: all 0.3s;
    }

    .search-btn:hover {
        background: linear-gradient(to right, #e84393, #ff4757);
        color: white;
    }

    /* Cart Button */
    .btn-cart {
        color: #e84393;
        border: 2px solid #ffeef2;
        border-radius: 50px;
        font-weight: 600;
        transition: all 0.3s;
        background-color: white;
    }

    .btn-cart:hover {
        background-color: #ffeef2;
        color: #ff4757;
        border-color: #ff7eb3;
    }

    .cart-badge {
        background-color: #ff4757;
        color: white;
        font-size: 0.75rem;
        transform: translate(5px, -5px);
    }

    /* Auth Buttons */
    .btn-auth {
        background-color: #ff4757;
        color: white;
        border-radius: 50px;
        padding: 8px 25px;
        font-weight: 600;
        box-shadow: 0 4px 10px rgba(255, 71, 87, 0.3);
        transition: all 0.3s;
        border: none;
    }

    .btn-auth:hover {
        background-color: #e84118;
        color: white;
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(255, 71, 87, 0.4);
    }
    
    /* Dropdown customization */
    .dropdown-item:hover {
        background-color: #ffeef2;
        color: #e84393;
    }
</style>

<script>
    function login() {
        window.location.href = "login";
    }
    function logout() {
        window.location.href = "logout";
    }
</script>

<nav class="navbar navbar-expand-lg navbar-light navbar-love sticky-top">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand navbar-brand-text" href="home">
            <i class="fas fa-heart text-danger mr-2" style="font-size: 1.5rem;"></i>L'amour
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item">
                    <a class="nav-link" href="home">Trang chủ</a>
                </li>
                

                <c:if test="${sessionScope.acc.isAdmin == 1}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user-shield text-warning"></i> Quản Trị
                        </a>
                        <div class="dropdown-menu shadow-sm border-0" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="managerAccount"><i class="fas fa-users-cog mr-2"></i>Tài khoản</a>
                            <a class="dropdown-item" href="managerCategory"><i class="fas fa-tags mr-2"></i>Danh mục</a>
                            <a class="dropdown-item" href="manager"><i class="fas fa-gift mr-2"></i>Sản phẩm</a>
                            <a class="dropdown-item" href="orders"><i class="fas fa-clipboard-list mr-2"></i>Đơn hàng</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="statistic"><i class="fas fa-chart-line mr-2"></i>Thống kê</a>
                        </div>
                    </li>
                </c:if>
            </ul>

            <form action="search" class="d-flex mx-auto search-group col-12 col-lg-5 my-2 my-lg-0">
                <input value="${key}" class="form-control search-input" type="search"
                    placeholder="Tìm món quà tặng người thương..." aria-label="Search" name="keyword" />
                <button class="btn search-btn" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>

            <div class="d-flex align-items-center my-2 ml-lg-3">
                <c:if test="${sessionScope.acc.isAdmin != 1}">
                    <a class="btn btn-cart mr-3 position-relative" href="carts">
                        <i class="fas fa-shopping-bag me-1"></i>
                        <span class="d-none d-md-inline">Giỏ</span>
                        <span class="badge cart-badge rounded-circle">${sessionScope.carts.size()}</span>
                    </a>
                </c:if>

                <c:choose>
                    <c:when test="${sessionScope.acc == null}">
                        <button class="btn btn-auth ms-lg-2" onclick="login()">
                            <i class="fas fa-heart mr-1"></i> Đăng nhập
                        </button>
                    </c:when>
                    <c:otherwise>
                        <div class="dropdown">
                            <button class="btn btn-auth dropdown-toggle ms-lg-2" type="button" id="userMenu"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-user-circle mr-1"></i> ${sessionScope.acc.user}
                            </button>
                            <div class="dropdown-menu dropdown-menu-right shadow border-0" aria-labelledby="userMenu">
                                <a class="dropdown-item" href="#"><i class="fas fa-user mr-2"></i>Hồ sơ</a>
                                <div class="dropdown-divider"></div>
                                <button class="dropdown-item text-danger" onclick="logout()">
                                    <i class="fas fa-sign-out-alt mr-2"></i>Đăng xuất
                                </button>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>