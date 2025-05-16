<%-- 
    Document   : formulario
    Created on : 11 feb 2025, 3:11:20 p.m.
    Author     : Jedi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Catálogo de Productos</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #1a1a1a;
            color: white;
        }

        .card {
            background-color: #2c2c2c;
            border: none;
            color: white;
            box-shadow: 0 0 15px cyan;
            transition: transform 0.2s;
        }

        .card:hover {
            transform: scale(1.03);
        }

        .btn-neon {
            background-color: cyan;
            color: black;
            border: none;
            transition: all 0.3s;
        }

        .btn-neon:hover {
            background-color: #00e6e6;
            color: white;
        }

        .form-container {
            background-color: #2c2c2c;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px cyan;
        }

        h2 {
            text-shadow: 0 0 15px cyan;
        }
    </style>
</head>
<body>

<!-- Sección del catálogo -->
<section class="catalogo py-5">
    <div class="container">
        <h2 class="mb-5 text-center">Conoce nuestros servicios</h2>
        <div class="row g-4">
            <!-- Producto 1 -->
            <div class="col-md-4">
                <div class="card h-100">
                    <img src="img/formateo.png" class="card-img-top" alt="Cult of the Lamb">
                    <div class="card-body">
                        <h5 class="card-title">Formateo de computadora</h5>
                        <p class="card-text">$400.00</p>
                    </div>
                    <div class="card-footer d-flex justify-content-between">
                        <a href="" class="btn btn-neon">Saber mas</a>
                        <a href="alta.jsp" class="btn btn-neon">Agendar servicio</a>
                    </div>
                </div>
            </div>

            <!-- Producto 2 -->
            <div class="col-md-4">
                <div class="card h-100">
                    <img src="img/canbioPieza.png" class="card-img-top" alt="Spider-Man 2">
                    <div class="card-body">
                        <h5 class="card-title">Cambio de pieza</h5>
                        <p class="card-text">$999.00</p>
                    </div>
                    <div class="card-footer d-flex justify-content-between">
                        <a href="" class="btn btn-neon">Saber mas</a>
                        <a href="alta.jsp" class="btn btn-neon">Agendar servicio</a>
                    </div>
                </div>
            </div>

            <!-- Producto 3 -->
            <div class="col-md-4">
                <div class="card h-100">
                    <img src="img/mantenimiento.png" class="card-img-top" alt="Dragon Ball Sparking Zero">
                    <div class="card-body">
                        <h5 class="card-title">Mantenimiento general</h5>
                        <p class="card-text">$350.00</p>
                    </div>
                    <div class="card-footer d-flex justify-content-between">
                        <a href="formateo.jsp" class="btn btn-neon">Saber mas</a>
                        <a href="alta.jsp" class="btn btn-neon">Agendar servicio</a>
                    </div>
                </div>
            </div>
            
            <!-- Producto 3 -->
            <div class="col-md-4">
                <div class="card h-100">
                    <img src="img/ensamble.jpg" class="card-img-top" alt="Dragon Ball Sparking Zero">
                    <div class="card-body">
                        <h5 class="card-title">Ensamble de PC</h5>
                        <p class="card-text">$929.00</p>
                    </div>
                    <div class="card-footer d-flex justify-content-between">
                        <a href="" class="btn btn-neon">Saber mas</a>
                        <a href="alta.jsp" class="btn btn-neon">Agendar servicio</a>
                    </div>
                </div>
            </div>
            
            <!-- Producto 3 -->
            <div class="col-md-4">
                <div class="card h-100">
                    <img src="img/desbloqueo.png" class="card-img-top" alt="Dragon Ball Sparking Zero">
                    <div class="card-body">
                        <h5 class="card-title">Desbloqueo de equipos</h5>
                        <p class="card-text">$350.00</p>
                    </div>
                    <div class="card-footer d-flex justify-content-between">
                        <a href="" class="btn btn-neon">Saber mas</a>
                        <a href="" class="btn btn-neon">Agender servicio</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>



<!-- Bootstrap JS (opcional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
