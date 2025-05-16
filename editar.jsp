<%-- 
    Document   : editar
    Created on : 3 abr 2025, 3:37:51 p.m.
    Author     : Jedi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<jsp:include page="includes/header.jsp" />

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
                   url="jdbc:mysql://localhost:3306/bdmantenimiento"
                   user="uescobedoxml2" password="uacm123"/>

<!-- Obtener datos del servicio a editar -->
<sql:query var="servicio" dataSource="${db}">
    SELECT * FROM t_servicios WHERE id_servicio = ?;
    <sql:param value="${param.id}" />
</sql:query>

<c:if test="${not empty servicio.rows}">
    <c:set var="s" value="${servicio.rows[0]}" />
</c:if>

<html>
<head>
    <title>Editar Servicio</title>
    <meta charset="UTF-8">
</head>
<body>
    <center>
        <h1>Editar Servicio</h1>

        <!-- Si se ha enviado la edición -->
        <c:if test="${param.actualizar != null}">
            <sql:update dataSource="${db}">
                UPDATE t_servicios 
                SET servicio=?, telefono=?, email=?, costo=?, fecha=?, detalles=?, estado=?
                WHERE id_servicio=?;
                <sql:param value="${param.servicio}" />
                <sql:param value="${param.telefono}" />
                <sql:param value="${param.email}" />
                <sql:param value="${param.costo}" />
                <sql:param value="${param.fecha}" />
                <sql:param value="${param.detalles}" />
                <sql:param value="${param.estado}" />
                <sql:param value="${param.id}" />
            </sql:update>
            <p style="color: lime;"><strong>Servicio actualizado correctamente.</strong></p>
        </c:if>

        <!-- Formulario con datos cargados -->
        <form method="post">
            <input type="hidden" name="id" value="${param.id}">

            <label>Servicio:</label><br>
            <input type="text" name="servicio" value="${s.servicio}" required><br><br>

            <label>Teléfono:</label><br>
            <input type="tel" name="telefono" pattern="[0-9]{10}" value="${s.telefono}" required><br><br>

            <label>Email:</label><br>
            <input type="email" name="email" value="${s.email}" required><br><br>

            <label>Costo:</label><br>
            <input type="number" name="costo" step="0.01" value="${s.costo}" required><br><br>

            <label>Fecha:</label><br>
            <input type="date" name="fecha" value="${s.fecha}" required><br><br>

            <label>Detalles del servicio:</label><br>
            <textarea name="detalles" rows="4" cols="40" required>${s.detalles}</textarea><br><br>

            <label>Estado:</label><br>
            <select name="estado" required>
                <option value="Pendiente" ${s.estado == 'Pendiente' ? 'selected' : ''}>Pendiente</option>
                <option value="En proceso" ${s.estado == 'En proceso' ? 'selected' : ''}>En proceso</option>
                <option value="Realizado" ${s.estado == 'Realizado' ? 'selected' : ''}>Realizado</option>
            </select><br><br>

            <input type="submit" name="actualizar" value="Actualizar Servicio">
        </form>
    </center>
</body>
</html>
