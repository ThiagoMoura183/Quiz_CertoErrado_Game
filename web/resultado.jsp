<%-- 
    Document   : resultado
    Created on : 13/03/2020, 20:01:35
    Author     : mac
--%>

<%@page import="Classes.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultados</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </head>
    <body  class="text-center">
        <% Usuarios u = (Usuarios) session.getAttribute("USUARIO"); 
            String classificacao = u.listarClassificacao();
        %>
        <h1 class="text-white bg-dark">Classificação</h1>
        <p class="font-weight-bold">
           Nome:  <%= u.getNome() %>
           <br>
           Posição: <%= u.buscarPosicao(u.getID()) %>
        </p>
        
        <h2 class="text-white bg-dark">Ranking Geral</h2>
        <p class="font-weight-bold">Posição | Nome | Pontuação</p>
        <p clas><%= classificacao %></p>
        
        <br>
        <br>
        <a class="font-weight-bold shadow p-3 mb-5 bg-white rounded" href="index.jsp " >Responder Novamente</a>
    </body>
</html>
