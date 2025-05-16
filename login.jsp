<%-- 
    Document   : login
    Created on : 8 abr 2025, 2:57:04 p.m.
    Author     : Oscar Escobedo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:include page="includes/header.jsp" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Acceso al Sistema</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Fuente elegante -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: 'Roboto', sans-serif;
        }

        .login-card {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            padding: 30px;
        }

        .form-title {
            font-weight: 600;
            color: #2c3e50;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-primary {
            background-color: #2c3e50;
            border: none;
        }

        .btn-primary:hover {
            background-color: #1a242f;
        }
    </style>
</head>
<body>

    <div class="container d-flex justify-content-center mt-5">
        <div class="login-card w-100" style="max-width: 420px;">
            <h4 class="form-title text-center mb-4">Acceso de administrador</h4>

            <form action="validar.jsp" method="post">
                <div class="mb-3">
                    <label for="usuario" class="form-label">Usuario</label>
                    <input type="text" class="form-control" id="usuario" name="usuario" required>
                </div>
                <div class="mb-3">
                    <label for="clave" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="clave" name="clave" required>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Ingresar</button>
                </div>

                <c:if test="${not empty param.error}">
                    <div class="alert alert-danger mt-4 text-center" role="alert">
                        <strong>Acceso denegado:</strong><br> Usuario o contraseña incorrectos.
                    </div>
                </c:if>
            </form>
        </div>
    </div>

</body>
</html>
