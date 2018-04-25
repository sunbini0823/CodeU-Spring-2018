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

  /** Store class that gives access to Users. */
  private UserStore userStore;

  /**
   * Set up state for handling login-related requests. This method is only called when running in a
   * server, not when running in a test.
   */
  @Override
  public void init() throws ServletException {
    super.init();
    setUserStore(UserStore.getInstance());
  }

  /**
   * Sets the UserStore used by this servlet. This function provides a common setup method for use
   * by the test framework or the servlet's init() function.
   */
  void setUserStore(UserStore userStore) {
    this.userStore = userStore;
  }
	
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
   throws IOException, ServletException {
       request.getRequestDispatcher("/WEB-INF/view/myprofile.jsp").forward(request, response);
  }
	
  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
      String username = (String) request.getSession().getAttribute("user");
      User user = userStore.getUser(username);
      String photo_url = request.getParameter("photo_url");

      if (user != null) {
	  user.setPhotoURL(photo_url);
	  try {
	       userStore.updateUserPhoto(user, photo_url);
	      }
	  catch (Exception e) {
	       System.out.println(e);	
	      }	
	  request.getSession().setAttribute("photo_url", user.getPhotoURL());
          response.sendRedirect("/myprofile");
      }
      else {  //user object not found - if not logged in, can't change the picture
      request.setAttribute("error", "Error, please login.");
      request.getRequestDispatcher("/WEB-INF/view/myprofile.jsp").forward(request, response);
  }
 }
}
