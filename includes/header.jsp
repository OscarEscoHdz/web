<%-- 
    Document   : header
    Created on : 6 feb 2025, 3:23:50 p.m.
    Author     : Jedi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Servicio de Mantenimiento - JSP XML2 Escobedo</title>

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="img/logoicono.png">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Estilos personalizados -->
    <style>
        body {
            background-color: #0f0f1a;
            color: #e0e0e0;
            font-family: 'Orbitron', sans-serif;
        }

        .jumbotron {
            background: linear-gradient(135deg, #1a1a2e, #16213e);
            color: #00ffff;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 0 25px rgba(0, 255, 255, 0.2);
            margin-top: 40px;
        }

        .jumbotron h1 {
            font-size: 2.5rem;
            text-shadow: 0 0 10px #00ffff;
        }

        .logo-img {
            border: 2px solid #00ffff;
            border-radius: 50%;
            box-shadow: 0 0 20px #00ffff;
        }

        .navbar {
            background-color: #1a1a2e;
        }

        .navbar-brand, .nav-link {
            color: #00ffff !important;
        }

        .nav-link:hover {
            text-shadow: 0 0 10px #00ffff;
        }
    </style>
</head>
<body>


<!-- Barra de navegación opcional-->
<nav class="navbar navbar-expand-lg mb-4">
    <div class="container">
        <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-screwdriver-wrench"></i> Mantenimiento JEDI Technologi</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Elementos colapsables -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <% 
                // Verificar si el usuario está en sesión (esto depende de cómo manejas las sesiones)
                String nombreUsuario = (String) session.getAttribute("nombreUsuario");
                if (nombreUsuario == null) { 
                %>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Iniciar sesión</a>
                    </li>
                <% } else { %>
                    <li class="nav-item">
                        <span class="nav-link"><i class="fa-solid fa-user"></i> <%= nombreUsuario %></span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="loguot.jsp"><i class="fa-solid fa-right-from-bracket"></i> Cerrar sesión</a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>


    <!-- Cabecera principal -->
    <div class="container">
        <div class="jumbotron text-center">
            <h1 class="mb-3">Servicio de Mantenimiento de Equipos de Cómputo</h1>
            <img src="img/spidy.jpg" alt="Logo" class="logo-img" width="150" height="150">
        </div>
    </div>
    

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
