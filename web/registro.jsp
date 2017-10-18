<%-- 
    Document   : registro
    Created on : Oct 16, 2017, 11:29:48 AM
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <meta charset="UTF-8">
          <title>Registro</title>
          <!--Links css-->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
          <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900'>
          <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Montserrat:400,700'>
          <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
          <link rel="stylesheet" href="/ProjectGames/css/style.css">
    </head>

    <body>
        <div class="container">
            <div class="info">
                <p><%= new java.util.Date()%></p>
                <h1>Juegos Planet</h1>
            </div>
        </div>
        <div class="form">
            <div class="thumbnail"><img src="assets/jugador128.png"/></div>
            <form class="login-form" action="grabador.jsp" method="POST">
              <input type="text" name="user" placeholder="Nick_name"/>
              <input type="text" name="pass" placeholder="Contraseña"/>
              <input type="text" name="rpass" placeholder="Repetir Contraseña"/>
              <input type="text" name="name" placeholder="Nombre"/>
              <input type="text" name="plastname" placeholder="Primer apellido"/>
              <input type="text" name="mlastname" placeholder="Segundo apellido"/>
              <input type="mail" name="mail" placeholder="Correo"/>
              <input type="text" name="fb" placeholder="Facebook"/>
              <input type="number" name="old" value="0"/>
              <div style="display:inline-block;vertical-align: middle;">
                <button  type="submit" style="width: 70%;">Aceptar</button>
                <button  type="reset" style="width: 20%;padding: 0px;margin: 0 0 0;background: #FFFFFF;"><img width="100%"height="100%" src="assets/reload.svg"/></button>
              </div>
              <p class="message">¿Ya estás registrado? <a href="PageLogin.html">Ingresar</a></p>
            </form>
        </div>
        <!--JS-->
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script  src="http://localhost:8080/ProjectGames/js/index.js"></script>
    </body>
</html>
