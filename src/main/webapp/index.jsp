<%@page import="com.emergentes.modelo.Libro"%>
<%@page import="com.emergentes.modelo.GestorLibros"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("agenda")==null){
        GestorLibros objeto1=new GestorLibros();
        
        objeto1.insertarLibro(new Libro(1,"Un dia como hoy","Rojas","Se trata de un pequeño resumen","Fisico"));
        objeto1.insertarLibro(new Libro(2,"Las Torrez","Juan Lopes","Esto es un pequeño resumen","Magnetico"));
        objeto1.insertarLibro(new Libro(3,"La naranja Mecanica","Rodrigo Rojas","Se trata de un pequeño resumen","Fisico"));
        
        session.setAttribute("agenda", objeto1);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Pag</title>
    </head>
    <body>
        <h1>Lista de Tareas</h1>
        <a href="Controller?op=nuevo">Nuevo</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Titulo</th>
                <th>Autor</th>
                <th>Resumen</th>
                <th>Medio</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
            <tr>
                <td>${item.id}</td>
                <td>${item.titulo}</td>
                <td>${item.autor}</td>
                <td>${item.resumen}</td>
                <td>${item.medio}</td>
                <td><a href="Controller?op=modificar&id=${item.id}">Modificar</a></td>
                <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a></td>
                
                
            </tr>
            </c:forEach>
            
        </table>
    </body>
</html>
