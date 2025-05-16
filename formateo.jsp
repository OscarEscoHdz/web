<%-- 
    Document   : formateo
    Created on : 13/05/2025, 11:56:45 AM
    Author     : Jedi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="includes/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mantenimiento Preventivo</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #1a1a1a;
            color: white;
        }

        h1, h2 {
            text-shadow: 0 0 15px cyan;
        }

        .descripcion {
            font-size: 18px;
            margin-bottom: 30px;
            text-align: center;
        }

        .item {
            background-color: #2c2c2c;
            border-radius: 10px;
            box-shadow: 0 0 15px cyan;
            margin-bottom: 30px;
            padding: 20px;
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.8s ease-out;
        }

        .item.visible {
            opacity: 1;
            transform: translateY(0);
        }

        .item img {
            max-width: 100%;
            border-radius: 10px;
            box-shadow: 0 0 10px cyan;
        }

        .item-title {
            color: cyan;
            font-weight: bold;
            font-size: 20px;
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

        .btn-container {
            text-align: center;
            margin-top: 40px;
        }

        @media (max-width: 768px) {
            .item .row {
                flex-direction: column;
            }

            .item img {
                margin-bottom: 15px;
            }
        }
    </style>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const items = document.querySelectorAll(".item");
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add("visible");
                    }
                });
            }, {
                threshold: 0.2
            });

            items.forEach(item => observer.observe(item));
        });
    </script>
</head>
<body>

<div class="container py-5">
    <h1 class="text-center mb-4">Importancia del Mantenimiento Preventivo</h1>
    <p class="descripcion">
        El mantenimiento preventivo prolonga la vida útil del equipo, mejora su rendimiento y evita fallos. Aquí te mostramos algunas tareas clave:
    </p>

    <!-- Elemento 1 -->
    <div class="item">
        <div class="row align-items-center">
            <div class="col-md-4 text-center">
                <img src="img/pasta.png" alt="Cambio de pasta térmica">
            </div>
            <div class="col-md-8">
                <div class="item-title">Cambio de pasta térmica</div>
                <p>
                    Mantiene el procesador en una temperatura adecuada. Una pasta vieja puede causar sobrecalentamiento y dañar el hardware.
                </p>
            </div>
        </div>
    </div>

    <!-- Elemento 2 -->
    <div class="item">
        <div class="row align-items-center">
            <div class="col-md-4 text-center">
                <img src="img/temporales.png" alt="Borrado de archivos temporales">
            </div>
            <div class="col-md-8">
                <div class="item-title">Borrado de archivos temporales</div>
                <p>
                    Elimina archivos innecesarios, libera espacio en el disco y acelera el sistema. Es fundamental para mantener un rendimiento óptimo.
                </p>
            </div>
        </div>
    </div>

    <!-- Elemento 3 -->
    <div class="item">
        <div class="row align-items-center">
            <div class="col-md-4 text-center">
                <img src="img/sectores.png" alt="Revisión de sectores del disco duro">
            </div>
            <div class="col-md-8">
                <div class="item-title">Revisión de sectores del disco duro</div>
                <p>
                    Permite detectar y aislar sectores defectuosos. Esto previene pérdidas de datos y mejora la estabilidad del sistema.
                </p>
            </div>
        </div>
    </div>

    <!-- Botón final -->
    <div class="btn-container">
        <a href="alta.jsp" class="btn btn-neon btn-lg">Agendar servicio</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
