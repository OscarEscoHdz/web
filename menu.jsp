<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<jsp:include page="includes/header.jsp"/>

<%
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
    }
%>

<h1>Bienvenido: <%= usuario %> </h1>

<!-- Enlaces -->
<a href="alta.jsp"><h4 style="color: white"><i>Registrar nuevo servicio</i></h4></a>
<a href="rptVenta.jsp"><h4 style="color: white">Registro de servicios en PDF</h4></a>
<a href=".jsp"><h4 style="color: white">Registrar nuevo administrador</h4></a>
<a href="serviciosCompletos.jsp"><h4 style="color: white">Ver servicios completados</h4></a>
<a href="loguot.jsp"><h4 style="color: white">Cerrar sesión</h4></a>

<!-- Conexión a la base de datos -->
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
                   url="jdbc:mysql://localhost:3306/bdmantenimiento"
                   user="uescobedoxml2" password="uacm123"/>

<!-- Consulta a la tabla t_servicios -->
<sql:query dataSource="${db}" var="usuarios">
    SELECT * FROM t_servicios;
</sql:query>

<!-- Eliminación de servicios -->
<c:if test="${not empty param.eliminar}">
    <sql:update dataSource="${db}">
        DELETE FROM t_servicios WHERE id_servicio=?;
        <sql:param value="${param.idEliminar}"/>
    </sql:update>
    <c:set var="mensaje" value="Servicio eliminado correctamente."/>
</c:if>

<!-- Completar servicio (mover a t_servicios_completos) -->
<c:if test="${not empty param.completar}">
    <sql:query dataSource="${db}" var="servicio">
        SELECT * FROM t_servicios WHERE id_servicio = ?;
        <sql:param value="${param.idCompletar}"/>
    </sql:query>

    <c:choose>
        <c:when test="${not empty servicio.rows and servicio.rows[0].estado == 'Realizado'}">
            <sql:update dataSource="${db}">
                INSERT INTO t_servicios_completos 
                (id_servicio, servicio, telefono, email, costo, fecha, detalles, estado)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?);
                <sql:param value="${servicio.rows[0].id_servicio}"/>
                <sql:param value="${servicio.rows[0].servicio}"/>
                <sql:param value="${servicio.rows[0].telefono}"/>
                <sql:param value="${servicio.rows[0].email}"/>
                <sql:param value="${servicio.rows[0].costo}"/>
                <sql:param value="${servicio.rows[0].fecha}"/>
                <sql:param value="${servicio.rows[0].detalles}"/>
                <sql:param value="${servicio.rows[0].estado}"/>
            </sql:update>

            <sql:update dataSource="${db}">
                DELETE FROM t_servicios WHERE id_servicio = ?;
                <sql:param value="${param.idCompletar}"/>
            </sql:update>

            <c:set var="mensajeOK" value="? Servicio completado y movido exitosamente."/>
        </c:when>
        <c:otherwise>
            <c:set var="mensajeError" value="?? El servicio aún no se ha completado. Estado diferente de 'Realizado'."/>
        </c:otherwise>
    </c:choose>
</c:if>

<!-- Mensajes de resultado -->
<c:if test="${not empty mensajeOK}">
    <div class="alert alert-success text-center" role="alert">
        ${mensajeOK}
    </div>
</c:if>
<c:if test="${not empty mensajeError}">
    <div class="alert alert-warning text-center" role="alert">
        ${mensajeError}
    </div>
</c:if>
<c:if test="${not empty mensaje}">
    <div class="alert alert-danger text-center" role="alert">
        ${mensaje}
    </div>
</c:if>

<!-- Tabla de servicios -->
<div class="container">
    <div class="jumbotron">
        <table class="table table-striped table-bordered table-hover text-center">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Servicio</th>
                    <th>Costo</th>
                    <th>Teléfono</th>
                    <th>Correo electrónico</th>
                    <th>Detalles</th>
                    <th>Fecha de servicio</th>
                    <th>Estatus</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${usuarios.rows}">     
                    <tr>
                        <td>${user.id_servicio}</td>
                        <td>${user.servicio}</td>
                        <td>${user.costo}</td>
                        <td>${user.telefono}</td>
                        <td>${user.email}</td>
                        <td>${user.detalles}</td>
                        <td>${user.fecha}</td>
                        <td>${user.estado}</td>
                        <td>
                            <!-- Botón Eliminar -->
                            <form method="post" style="display:inline-block">
                                <input type="hidden" name="idEliminar" value="${user.id_servicio}">
                                <input type="submit" class="btn btn-danger btn-sm" name="eliminar" value="Eliminar">
                            </form>

                            <!-- Botón Editar -->
                            <form action="editar.jsp" method="get" style="display:inline-block">
                                <input type="hidden" name="id" value="${user.id_servicio}">
                                <input type="submit" class="btn btn-warning btn-sm" value="Editar">
                            </form>

                            <!-- Botón Completar -->
                            <form method="post" style="display:inline-block">
                                <input type="hidden" name="idCompletar" value="${user.id_servicio}">
                                <input type="submit" class="btn btn-success btn-sm" name="completar" value="Completar">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="includes/footer.jsp"/>
