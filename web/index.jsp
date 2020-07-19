<%-- 
    Document   : index
    Created on : 13/03/2020, 19:46:22
    Author     : mac
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Classes.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Certo ou Errado</title>
    </head>
    <body>
        <div class="jumbotron text-center">
            <% 
                Usuarios u = new Usuarios();
                ArrayList<Usuarios> lista = u.buscarTodosUsuarios();
                session.setAttribute("LISTAUSU", lista);
            %>
            <form class="form-horizontal px-5" action="perguntas.jsp" method="POST">
                <p>Selecione o seu nome na lista: </p>
                <br>
                <select class="form-control form-control-lg" name="comboNomes">
                    <% for (int i = 0; i <lista.size(); i++) { %>
                    <option value="<%= i %>"><%=lista.get(i).getNome()%></option>
                    <% } %>

                </select>
                    <br>
                    <input class="btn btn-primary btn-lg" type="submit" value="Enviar"/>
            </form>
                    
            <br>
            <br>
            Caso seu nome não esteja na lista, basta se <a href="cadastrausu.jsp">Cadastrar!</a>
        </div>
    </body>
</html>
