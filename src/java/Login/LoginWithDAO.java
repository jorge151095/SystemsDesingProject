/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

import Pimplementation.UsuarioImp;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author jorge
 */
@WebServlet(name = "LoginWithDAO", urlPatterns = {"/LoginWithDAO"})
public class LoginWithDAO extends HttpServlet {
    private DataSource ds;
    
    @Override
    public void init(ServletConfig config)throws ServletException{
        try{
            super.init(config);
            InitialContext cxt = new InitialContext();
            if (cxt == null){
                throw new Exception("No tenemos contexto!");
            }
            this.ds = (DataSource) cxt.lookup("java:/comp/env/jdbc/derby");
            
            if (this.ds == null){
                throw new Exception("No encuentro el DataSource!");
            }
        }catch (NamingException ex){
            Logger.getLogger(LoginWithDAO.class.getName()).log(Level.SEVERE, null, ex); //ServerTest.class.getName
        }catch (Exception ex){
            Logger.getLogger(LoginWithDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String User = request.getParameter("User");
            String Pass = request.getParameter("Pass");
            
            UsuarioImp UserDAO = new UsuarioImp();
            UserDAO.setConexion(ds.getConnection());
            boolean result = UserDAO.login(User, Pass);
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginWithDAO</title>");
            out.println("</head>");
            out.println("<body>");
            if (result == true){
                out.println("<h1>Bienvenido</h1>");
            }else{
                response.sendRedirect("PageLogin.html");
            }
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException ex) {
            Logger.getLogger(LoginWithDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
