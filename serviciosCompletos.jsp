<%-- 
    Document   : serviciosCompletos
    Created on : 15/05/2025, 05:05:44 PM
    Author     : Jedi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<jsp:include page="includes/header.jsp"/>

<%
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
    }
%>

<h1>Servicios completados - Bienvenido: <%= usuario %></h1>

<!-- Enlace para volver -->
<a href="menu.jsp"><h4 style="color: white"><i>&larr; Volver al panel principal</i></h4></a>

<!-- Conexión a la base de datos -->
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
                   url="jdbc:mysql://localhost:3306/bdmantenimiento"
                   user="uescobedoxml2" password="uacm123"/>

<!-- Eliminación -->
<c:if test="${not empty param.eliminar}">
    <sql:update dataSource="${db}">
        DELETE FROM t_servicios_completos WHERE id_servicio=?;
        <sql:param value="${param.idEliminar}"/>
    </sql:update>
    <c:set var="mensaje" value="? Servicio completado eliminado correctamente."/>
</c:if>

<!-- Mostrar mensaje -->
<c:if test="${not empty mensaje}">
    <div class="alert alert-success text-center" role="alert">
        ${mensaje}
    </div>
</c:if>

<!-- Consulta de servicios completados -->
<sql:query dataSource="${db}" var="completados">
    SELECT * FROM t_servicios_completos;
</sql:query>

<!-- Tabla -->
<div class="container">
    <div class="jumbotron">
        <h2 class="text-center">Lista de servicios completados</h2>
        <table class="table table-striped table-bordered table-hover text-center">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Servicio</th>
                    <th>Teléfono</th>
                    <th>Email</th>
                    <th>Costo</th>
                    <th>Fecha</th>
                    <th>Detalles</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="s" items="${completados.rows}">
                    <tr>
                        <td>${s.id_servicio}</td>
                        <td>${s.servicio}</td>
                        <td>${s.telefono}</td>
                        <td>${s.email}</td>
                        <td>${s.costo}</td>
                        <td>${s.fecha}</td>
                        <td>${s.detalles}</td>
                        <td>${s.estado}</td>
                        <td>
                            <form method="post" style="display:inline-block">
                                <input type="hidden" name="idEliminar" value="${s.id_servicio}">
                                <input type="submit" class="btn btn-danger btn-sm" name="eliminar" value="Eliminar">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="includes/footer.jsp"/>
