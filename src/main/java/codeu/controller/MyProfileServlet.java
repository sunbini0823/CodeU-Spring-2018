package codeu.controller; 

import java.io.IOException;
import java.time.Instant;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

/**
* Servlet class responsible for profile feed.
*/
public class MyProfileServlet extends HttpServlet {
	/**
  	* Store class that gives access to Users.
  	*/

    @Override
    public void init() throws ServletException {
        super.init();
    }
    
    @Override
     public void doGet(HttpServletRequest request, HttpServletResponse response)
         throws IOException, ServletException {
       request.getRequestDispatcher("/WEB-INF/view/myprofile.jsp").forward(request, response);
     }


}
