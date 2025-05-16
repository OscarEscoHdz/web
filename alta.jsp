<%-- 
    Document   : alta
    Created on : 1 abr 2025, 3:11:45 p.m.
    Author     : Oscar Escobedo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<jsp:include page="includes/header.jsp"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Servicios</title>
    </head>
    <body>
        <center>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
                           url="jdbc:mysql://localhost:3306/bdmantenimiento"
                           user="uescobedoxml2" password="uacm123"/>

        <h1>Formulario de registro de Servicios</h1>

        <c:if test="${param.registrar != null}">
            <sql:update dataSource="${db}">
                INSERT INTO t_servicios (servicio, telefono, email, costo, fecha, detalles, estado)
                VALUES (?, ?, ?, ?, ?, ?, ?)
                <sql:param value="${param.servicio}" />
                <sql:param value="${param.telefono}" />
                <sql:param value="${param.email}" />
                <sql:param value="${param.costo}" />
                <sql:param value="${param.fecha}" />
                <sql:param value="${param.detalles}" />
                <sql:param value="Pendiente" />
            </sql:update>
            <c:set var="mensaje" value="Servicio registrado con exito en breve un tecnico se comunicara con usted." />
        </c:if>

        <form method="post">
            <label>Servicio:</label>
            <select name="servicio" id="servicio" onchange="actualizarCosto()" required>
                <option value="">Seleccione una opción</option>
                <option value="Formateo">Formateo</option>
                <option value="Mantenimiento">Mantenimiento</option>
                <option value="Cambio de piezas">Cambio de piezas</option>
            </select><br>

            <label>Teléfono:</label>
            <input type="tel" name="telefono" pattern="[0-9]{10}" required /><br>

            <label>Email:</label>
            <input type="email" name="email" required /><br>

            <label>Costo:</label>
            <input type="number" name="costo" id="costo" readonly required /><br>

            <label>Fecha (yyyy-mm-dd):</label>
            <input type="date" name="fecha" required /><br>

            <label>Detalles:</label>
            <textarea name="detalles" required></textarea><br>

            <input type="submit" name="registrar" value="Registrar Servicio" class="btn btn-primary"/>
        </form>

        <c:if test="${not empty mensaje}">
            <p style="color: #25d366;">${mensaje}</p>
        </c:if>

        <a href="index.jsp"><h2><i>Menu principal</i></h2></a>

        <script>
            function actualizarCosto() {
                const servicio = document.getElementById("servicio").value;
                const costo = document.getElementById("costo");

                switch (servicio) {
                    case "Formateo":
                        costo.value = 500;
                        break;
                    case "Mantenimiento":
                        costo.value = 700;
                        break;
                    case "Cambio de piezas":
                        costo.value = 1200;
                        break;
                    default:
                        costo.value = "";
                }
            }
        </script>
        </center>
    </body>
</html>

<jsp:include page="includes/footer.jsp"/>
