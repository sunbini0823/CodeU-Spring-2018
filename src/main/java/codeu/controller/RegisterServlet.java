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

//for email validation
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	    String email = request.getParameter("email");     
        String password = request.getParameter("password");
        String passwordHash = BCrypt.hashpw(password, BCrypt.gensalt());
	    String photo_url = "https://i1.wp.com/www.winhelponline.com/blog/wp-content/uploads/2017/12/user.png?resize=256%2C256&quality=100";
		String user_skills = request.getParameter("user_skills");
		String about = request.getParameter("about");
		
        //alphanumeric check
        if (!username.matches("[\\w*\\s*]*")) {
            request.setAttribute("error", "Please enter only letters, numbers, and spaces.");
            request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
            return;
        }
        // if username is empty
	    if (username.matches("")) {
            request.setAttribute("error", "Invalid username. Please enter letters/numbers/spaces.");
	    request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
	    return;
	    }
        if (userStore.isUserRegistered(username)) {
            request.setAttribute("error", "That username is already taken.");
            request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
            return;
        }
        if (!isValid(email)) {
	    request.setAttribute("error", "Invalid email address.");
	    request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
	    return;
	}  
		
        User user = new User(UUID.randomUUID(), username, passwordHash, Instant.now(), photo_url, user_skills, about);   
        userStore.addUser(user);
        
        /*Show alert message to users that they will be redirected to login page*/
        request.setAttribute("notice", "You can now login at the login page!!");
        request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
        return;
    }
    
// email validation 
    public static boolean isValid(String email) {
		String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+ "[a-zA-Z0-9_+&*-]+)*@" + "(?:[a-zA-Z0-9-]+\\.)+[a-z" + "A-Z]{2,7}$";
		Pattern pat = Pattern.compile(emailRegex);
		if (email == null)
			return false;
		return pat.matcher(email).matches();
	}
}
