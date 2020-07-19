<%-- 
    Document   : cadastrausu
    Created on : 13/03/2020, 19:51:32
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
        <title>Cadastro de Usuários</title>
    </head>
    <body>        
        <a href="index.jsp" class="badge badge-light">Home</a>
        <h1 class="jumbotron text-center"> Cadastro de Usuários</h1>
        <div style="width: 80%;height:16%;margin-top:1%;margin-left: 10%;position:absolute;" class="text-center">
            <form class="form-horizontal" action="InserirUsu" method="POST">
                <span style="font-size: 18px">ID:</span> <input class="form-control text-left" type="text" name="txtID" value="" size="7" autofocus required/>
                <span style="font-size: 18px">Nome:</span> <input class="form-control" type="text" name="txtNome" value="" size="30" />
                <br>
                <input class="btn btn-primary btn-block " type="submit" value="Cadastrar!" />
            </form>
            <br>
            <br>
            <%
                        if(null!=request.getAttribute("errorMessage")) {
            %>
            <div class="alert alert-danger" role="alert">
             <%       
                            out.println(request.getAttribute("errorMessage"));
                        }
            %>
                    
             </div>
        </div>
    </body>
</html>
