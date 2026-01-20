<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Quản Lý Tài Khoản | Admin Sweet Love</title>
        
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
                min-height: 100vh;
                padding: 40px 0;
            }
            
            .card-manager {
                border: none;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(232, 67, 147, 0.1);
                overflow: hidden;
                background: white;
            }
            
            .card-header {
                background: linear-gradient(to right, var(--deep-pink), var(--romantic-red));
                color: white;
                padding: 25px 30px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: none;
            }
            
            .card-header h4 {
                font-weight: 700;
                margin: 0;
                font-family: 'Poppins', sans-serif;
            }
            
            /* Table Styling */
            .table {
                margin-bottom: 0;
            }
            
            .table thead th {
                border-top: none;
                border-bottom: 2px solid #ffeef2;
                background-color: #fffbfc;
                color: var(--deep-pink);
                font-weight: 700;
                text-transform: uppercase;
                font-size: 0.85rem;
                padding: 20px 15px;
                letter-spacing: 0.5px;
            }
            
            .table tbody td {
                vertical-align: middle;
                padding: 20px 15px;
                font-size: 0.95rem;
                color: #636e72;
                border-bottom: 1px solid #fff0f3;
            }
            
            .table tbody tr:hover {
                background-color: #fff5f7;
            }
            
            /* Avatar Styling */
            .user-avatar {
                width: 45px;
                height: 45px;
                background: linear-gradient(135deg, #ffeef2, #ffcdd2);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                color: var(--romantic-red);
                margin-right: 15px;
                font-size: 1.2rem;
                box-shadow: 0 3px 10px rgba(255, 126, 179, 0.2);
            }
            
            /* Badge Styling */
            .role-badge {
                padding: 8px 15px;
                border-radius: 30px;
                font-size: 0.75rem;
                font-weight: 600;
                letter-spacing: 0.5px;
            }
            
            .badge-seller {
                background-color: #ffeef2;
                color: var(--deep-pink);
                border: 1px solid var(--primary-pink);
            }
            
            .badge-buyer {
                background-color: #f1f2f6;
                color: #636e72;
            }
            
            /* Active Status */
            .status-dot {
                height: 10px;
                width: 10px;
                background-color: #bbb;
                border-radius: 50%;
                display: inline-block;
                margin-right: 5px;
            }
            
            .status-active { background-color: #2ed573; box-shadow: 0 0 5px #2ed573; }
            .status-locked { background-color: #ff4757; }
            
            /* Action Button */
            .btn-edit {
                color: white;
                background: linear-gradient(to right, var(--primary-pink), var(--deep-pink));
                border: none;
                width: 40px;
                height: 40px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.3s;
                box-shadow: 0 4px 10px rgba(232, 67, 147, 0.2);
            }
            
            .btn-edit:hover {
                background: linear-gradient(to right, var(--deep-pink), var(--romantic-red));
                color: white;
                transform: translateY(-3px) rotate(15deg);
                box-shadow: 0 6px 15px rgba(232, 67, 147, 0.3);
            }
            
            .pass-mask {
                font-family: 'Courier New', monospace;
                color: #b2bec3;
                letter-spacing: 2px;
            }

            .btn-home {
                background: rgba(255,255,255,0.2);
                border: 1px solid rgba(255,255,255,0.4);
                color: white;
                border-radius: 50px;
                padding: 5px 15px;
                transition: all 0.3s;
            }
            
            .btn-home:hover {
                background: white;
                color: var(--romantic-red);
            }
        </style>

        <script>
            function back() {
                window.location.href = "home";
            }
        </script>
    </head>
    
    <body>
        <div class="container">
            <div class="card card-manager">
                <div class="card-header">
                    <div>
                        <h4 class="mb-1"><i class="fas fa-users-cog me-2"></i>Quản Lý Tài Khoản</h4>
                        <small style="opacity: 0.8; font-weight: 300;">Danh sách thành viên Sweet Love</small>
                    </div>
                    <button class="btn btn-home btn-sm" onclick="back()">
                        <i class="fas fa-home me-1"></i> Trang Chủ
                    </button>
                </div>
                
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="ps-4">Thành Viên</th>
                                    <th>Mật Khẩu</th>
                                    <th>Vai Trò</th>
                                    <th>Trạng Thái</th>
                                    <th class="text-center">Tùy Chọn</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${accounts}" var="p">
                                    <tr>
                                        <td class="ps-4">
                                            <div class="d-flex align-items-center">
                                                <div class="user-avatar">
                                                    <i class="fas fa-heart"></i>
                                                </div>
                                                <div>
                                                    <div class="fw-bold" style="color: #444;">${p.user}</div>
                                                    <small class="text-muted">ID: #${p.uid}</small>
                                                </div>
                                            </div>
                                        </td>
                                        
                                        <td><span class="pass-mask">•••••••</span></td>
                                        
                                        <td>
                                            <c:choose>
                                                <c:when test="${p.isSell == 1}">
                                                    <span class="role-badge badge-seller">
                                                        <i class="fas fa-crown me-1"></i>Seller / Admin
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="role-badge badge-buyer">
                                                        <i class="fas fa-user me-1"></i>Khách hàng
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        
                                        <td>
                                            <c:choose>
                                                <c:when test="${p.active}">
                                                    <div class="d-flex align-items-center text-success fw-bold" style="font-size: 0.9rem;">
                                                        <span class="status-dot status-active"></span> Active
                                                    </div>
                                                </c:when>    
                                                <c:otherwise>
                                                    <div class="d-flex align-items-center text-danger fw-bold" style="font-size: 0.9rem;">
                                                        <span class="status-dot status-locked"></span> Locked
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        
                                        <td class="text-center">
                                            <a href="loadAccount?pid=${p.uid}" class="btn-edit mx-auto" title="Chỉnh sửa tài khoản">
                                                <i class="fas fa-pencil-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="card-footer bg-white p-3 text-end" style="border-top: 1px solid #ffeef2;">
                    <small class="text-muted">Tổng cộng: <strong style="color: var(--romantic-red);">${accounts.size()}</strong> tài khoản</small>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>