<%-- 
    Document   : perguntas
    Created on : 13/03/2020, 19:48:34
    Author     : mac
--%>

<%@page import="Classes.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Perguntas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perguntas!</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </head>
    <body class="text-center">   
        
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <span style="font-size: 20px; font-weight: bolder">Perguntas - Certo ou Errado&emsp;&emsp;&emsp;</span>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="index.jsp">Home<span class="sr-only">Perguntas</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="resultado.jsp">Ranking</a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Mais ações</a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" data-toggle="modal" data-target="#exampleModalCenter">Como jogar?</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" data-toggle="modal" data-target="#exampleModal">Sobre</a>
                  </div>
                </li>
              </ul>
            </div>
        </nav> 
       

        <!-- Modal de como jogar-->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Como Jogar?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <p>
                      O jogo se baseia em assinalar, com base nas perguntas da página, se a afirmação(questão) é correta ou falsa. Com isso, ao final você irá ter a exibição do ranking do jogo de acordo com os usuários que jogam!
                      Tenha um bom jogo!
                  </p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar!</button>
              </div>
            </div>
          </div>
        </div>
        
        
        <!-- Modal SOBRE -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Sobre</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <p>Atividade feita por: Thiago Moura</p>
                  <p>Professor: Renan Menechelli</p>
                  <p>Disciplina: Linguagem de Programação III</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar!</button>
              </div>
            </div>
          </div>
        </div>
        
              <% 
                ArrayList<Usuarios> listaUsu = (ArrayList<Usuarios>) session.getAttribute("LISTAUSU");
                Usuarios usu = listaUsu.get(Integer.parseInt(request.getParameter("comboNomes")));
               %> 
               
        <h1 class="text-white bg-dark">Olá, <%= usu.getNome() %></h1> 
        
        <form  action="VerificarRespostas" method="POST">
              <% Perguntas p = new Perguntas();
                ArrayList<Perguntas> perguntas = p.buscarPerguntas();
                
                session.setAttribute("Lista", perguntas);
                session.setAttribute("USUARIO", usu);
                for (int i = 0; i < perguntas.size(); i++) {
              %>
             <br>
             <p class="p-2 mb-2 bg-info text-white">Questão <%= (i+1) %> </p> <!-- ID da questão -->
             <p> <%= perguntas.get(i).getPergunta() %> </p>
             
             <label class="btn btn-secondary">
                <input type="radio" name="q<%=i%>" value="C" /> Certo 
            </label>

            <label class="btn btn-secondary">
            <input type="radio" name="q<%=i%>" value="E" /> Errado
            </label>
            <br>
            

            <% } %>
            <br>
            <br>
            <input class="shadow p-3 mb-5 bg-white rounded" type="submit" value="Enviar Respostas!" />
        </form>
    </body>
</html>
