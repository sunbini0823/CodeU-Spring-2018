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

/**
* Servlet class responsible for profile feed.
*/
public class MyProfileServlet extends HttpServlet {
	/**
  	* Store class that gives access to Users.
  	*/
 	private UserStore userStore;

 @Override
 public void doGet(HttpServletRequest request, HttpServletResponse response)
     throws IOException, ServletException {

   request.getRequestDispatcher("/WEB-INF/view/myprofile.jsp").forward(request, response);
 }
  /**
  * Sets the UserStore used by this servlet. This function provides a common setup method
  * for use by the test framework or the servlet's init() function.
  */
 void setUserStore(UserStore userStore) {
   this.userStore = userStore;
 }

}
