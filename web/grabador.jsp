<%-- 
    Document   : grabador
    Created on : Oct 16, 2017, 12:14:23 PM
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grabador</title>
    </head>

    <body>
        <%! 
            private javax.sql.DataSource ds;
            public void jspInit(){
                try{
                    //super.init(config);
                    javax.naming.InitialContext cxt = new javax.naming.InitialContext();
                    if (cxt == null){
                        throw new Exception("No tenemos contexto!");
                    }
                    this.ds = (javax.sql.DataSource) cxt.lookup("java:/comp/env/jdbc/derby");

                    if (this.ds == null){
                        throw new Exception("No encuentro el DataSource!");
                    }
                }catch (javax.naming.NamingException ex){
                    java.util.logging.Logger.getLogger("grabador").log(java.util.logging.Level.SEVERE, null, ex); //ServerTest.class.getName
                }catch (Exception ex){
                    java.util.logging.Logger.getLogger("grabador").log(java.util.logging.Level.SEVERE, null, ex);
                }
            }
        %>
        
        <h1>Registro exitoso</h1>
        <%
            //Esto es dentro del service()
            clasesDB.Usuario usuario = new clasesDB.Usuario();
            usuario.setId_usuario(0);
            usuario.setNick_usuario(request.getParameter("user"));
            usuario.setContrasenia(request.getParameter("pass"));
            String name = request.getParameter("name") + " " + request.getParameter("plastname") + request.getParameter("mlastname");
            usuario.setNombre_usuario(name);
            usuario.setCorreo(request.getParameter("mail"));
            usuario.setFacebook(request.getParameter("fb"));
            usuario.setEdad(Integer.parseInt(request.getParameter("old")));
            
            Pimplementation.UsuarioImp UserDAO = new Pimplementation.UsuarioImp();
            System.out.println("TOQUE "+ds);
            UserDAO.setConexion(ds.getConnection());
            UserDAO.registro(usuario);
        %>
    </body>
</html>
