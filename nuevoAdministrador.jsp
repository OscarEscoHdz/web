<%-- 
    Document   : nuevoAdministrador
    Created on : 15/05/2025, 03:28:07 PM
    Author     : Jedi
--%>

<!-- Conexión a la base de datos -->
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
                   url="jdbc:mysql://localhost:3306/bdmantenimiento"
                   user="uescobedoxml2" password="uacm123"/>

<!-- Consulta a la tabla t_servicios -->
<sql:query dataSource="${db}" var="usuarios">
    SELECT * FROM t_servicios;
</sql:query>
