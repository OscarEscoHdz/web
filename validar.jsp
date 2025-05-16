<%-- 
    Document   : validar
    Created on : 8 abr 2025, 3:29:25 p.m.
    Author     : Oscar Escobedo
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String usuario = request.getParameter("usuario");
    String clave = request.getParameter("clave");

    boolean valido = false;
    
    // Conectar a MySQL sin usar web.xml
    String jdbcURL = "jdbc:mysql://localhost:3306/bdmantenimiento"; //solo se cambia el nombre de la bd, en este caso es bdxml2
    String jdbcUser = "uescobedoxml2";
    String jdbcPassword = "uacm123"; // Si tienes contraseña, ponla aquí.

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUser, jdbcPassword);
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM t_administradores WHERE usuario=? AND clave=?");//Base de datos de donde se validan los usuario
        ps.setString(1, usuario);
        ps.setString(2, clave);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("usuario", usuario);
            valido = true;
        }

        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }

    if (valido) {
        response.sendRedirect("menu.jsp");
    } else {
        response.sendRedirect("login.jsp?error=true");
    }
%>
