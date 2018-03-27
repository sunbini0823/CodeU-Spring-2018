package codeu.controller;

import java.io.IOException;
import java.time.Instant;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import codeu.model.data.User;
import codeu.model.store.basic.UserStore;


import javax.swing.JOptionPane;
//import javafx.scene.control.Alert;
//import javafx.scene.control.Alert.AlertType;
//import javafx.application.Platform;

/**
 * Servlet class responsible for user registration.
 */
public class RegisterServlet extends HttpServlet {
    
    /**
     * Store class that gives access to Users.
     */
    private UserStore userStore;
    
    /**
     * Set up state for handling registration-related requests. This method is only called when
     * running in a server, not when running in a test.
     */
    @Override
    public void init() throws ServletException {
        super.init();
        setUserStore(UserStore.getInstance());
    }
    
    /**
     * Sets the UserStore used by this servlet. This function provides a common setup method
     * for use by the test framework or the servlet's init() function.
     */
    void setUserStore(UserStore userStore) {
        this.userStore = userStore;
    }
    
    /** doGET forwards the request with response*/
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
        
        request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
    }
    
    /** doPost makes a POST request to the /register URL when user clicks submit button*/
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String passwordHash = BCrypt.hashpw(password, BCrypt.gensalt());
        
        //alphanumeric check
        if (!username.matches("[\\w*\\s*]*")) {
            request.setAttribute("error", "Please enter only letters, numbers, and spaces.");
            request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
            return;
        }
        
        if (userStore.isUserRegistered(username)) {
            request.setAttribute("error", "That username is already taken.");
            request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
            return;
        }
        
        User user = new User(UUID.randomUUID(), username, passwordHash, Instant.now());
        userStore.addUser(user);
        
        /*Show alert message to users that they will be redirected to login page*/
//        JOptionPane.showMessageDialog(null, "testing popup message");
//        showAlert("Redirecting to Login Page", "Alert Message", null);
        response.sendRedirect("/login");
    }
    
//    public void showAlert(String infoMessage, String titleBar, String headerMessage){
//        Alert alert = new Alert(AlertType.INFORMATION);
//        alert.setTitle(titleBar);
//        alert.setHeaderText(headerMessage);
//        alert.setContentText(infoMessage);
//        alert.showAndWait();
//    }
}
