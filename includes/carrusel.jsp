<%-- 
    Document   : carrusel
    Created on : 13 feb 2025, 10:07:41 a.m.
    Author     : Jedi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Formulario Neón</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome (Íconos de redes sociales) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"> 
    <style>
        
         /* Fondo general y tipografía */
    body {
        background-color: #080808; /* Se mantiene un solo color de fondo */
        color: white;
        font-family: Arial, sans-serif;
    }

    /* Navbar */
    .navbar {
        background-color: black;
        box-shadow: 0 0 15px cyan;
    }

    .navbar-brand, .nav-link {
        color: red !important;
        text-shadow: 0 0 8px cyan;
        transition: all 0.3s ease-in-out;
    }

    .nav-link:hover {
        color: white !important;
        text-shadow: 0 0 15px cyan;
        transform: scale(1.1);
    }

    .navbar-toggler {
        border: 2px solid cyan;
        box-shadow: 0 0 10px cyan;
    }

    .navbar-toggler-icon {
        filter: drop-shadow(0 0 5px cyan);
    }

    /* Carrusel */
    .carousel-container {
        max-width: 800px;
        margin: 50px auto;
        box-shadow: 0 0 20px cyan;
        border-radius: 10px;
        overflow: hidden;
    }

    .carousel-item img {
        width: 100%;
        border-radius: 10px;
        box-shadow: 0 0 15px cyan;
        transition: transform 0.5s ease-in-out;
    }

    .carousel-item.active img {
        transform: scale(1.05);
    }

    .carousel-control-prev,
    .carousel-control-next {
        filter: drop-shadow(0 0 10px cyan);
    }

    .carousel-control-prev:hover,
    .carousel-control-next:hover {
        filter: drop-shadow(0 0 20px cyan);
    }

    .carousel-indicators [data-bs-target] {
        background-color: cyan;
        box-shadow: 0 0 8px cyan;
    }

    .carousel-indicators .active {
        background-color: white;
        box-shadow: 0 0 12px cyan;
    }

    /* Formulario */
    .form-container {
        background-color: rgba(0, 0, 0, 0.8);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 255, 255, 0.8);
        max-width: 400px;
        margin: auto;
        text-align: center;
    }

    .form-label {
        text-shadow: 0 0 10px cyan;
    }

    .form-control {
        background-color: transparent;
        border: 2px solid cyan;
        color: white;
        box-shadow: 0 0 10px cyan;
    }

    .form-control:focus {
        border-color: #00ffff;
        box-shadow: 0 0 15px cyan;
    }

    /* Botón reutilizable */
    .btn-neon {
        background: transparent;
        border: 2px solid cyan;
        color: cyan;
        font-weight: bold;
        box-shadow: 0 0 15px cyan;
        transition: 0.3s;
        padding: 10px 20px;
        border-radius: 5px;
    }

    .btn-neon:hover {
        background: cyan;
        color: black;
        box-shadow: 0 0 25px cyan;
    }

    /* Catálogo de productos */
    .catalogo {
        padding: 50px 0;
        text-align: center;
    }

    .producto {
        background-color: rgba(0, 0, 0, 0.8);
        border-radius: 10px;
        box-shadow: 0 0 15px cyan;
        padding: 20px;
        transition: transform 0.3s ease-in-out, box-shadow 0.3s;
    }

    .producto:hover {
        transform: scale(1.05);
        box-shadow: 0 0 25px cyan;
    }

    .producto img {
        width: 100%;
        border-radius: 10px;
        box-shadow: 0 0 10px cyan;
    }

    /* Redes sociales */
    .social-bar {
        position: fixed;
        top: 50%;
        left: 10px;
        transform: translateY(-50%);
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    .social-bar a {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        text-decoration: none;
        font-size: 24px;
        color: white;
        box-shadow: 0 0 10px cyan;
        transition: all 0.3s ease-in-out;
    }

    .social-bar a:hover {
        transform: scale(1.2);
        box-shadow: 0 0 20px cyan;
    }

    /* Colores personalizados para redes sociales */
    .facebook { background-color: #1877f2; box-shadow: 0 0 10px #1877f2; }
    .twitter { background-color: #1da1f2; box-shadow: 0 0 10px #1da1f2; }
    .instagram { background: linear-gradient(45deg, #f09433, #e6683c, #dc2743, #cc2366, #bc1888); box-shadow: 0 0 10px #dc2743; }
    .whatsapp { background-color: #25d366; box-shadow: 0 0 10px #25d366; }
    .youtube { background-color: #ff0000; box-shadow: 0 0 10px #ff0000; }

    /* Footer */
    .footer-neon {
        background-color: black;
        color: cyan;
        text-align: center;
        padding: 20px;
        box-shadow: 0 0 20px cyan;
    }

    .footer-neon h2, .footer-neon p {
        text-shadow: 0 0 10px cyan;
    }

    .footer-neon a {
        color: cyan;
        text-decoration: none;
        font-weight: bold;
        text-shadow: 0 0 8px cyan;
        transition: all 0.3s ease-in-out;
    }

    .footer-neon a:hover {
        color: white;
        text-shadow: 0 0 15px cyan;
        transform: scale(1.1);
</style>

</head>

<!-- Carrusel con efecto neón -->
 <div id="carouselNeon" class="carousel slide carousel-container" data-bs-ride="carousel">
    <!-- Indicadores -->
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselNeon" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#carouselNeon" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#carouselNeon" data-bs-slide-to="2"></button>
    </div>

    <!-- Imágenes del carrusel -->
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="img/god.jpg" class="d-block w-100" alt="Imagen 1">
        </div>
        <div class="carousel-item">
            <img src="img/ratchet.jpg" class="d-block w-100" alt="Imagen 2">
        </div>
        <div class="carousel-item">
            <img src="img/call.png" class="d-block w-100" alt="Imagen 3">
        </div>
    </div>

    <!-- Controles de navegación -->
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselNeon" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselNeon" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>
    <!-- Controles de navegación -->
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselNeon" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselNeon" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>

