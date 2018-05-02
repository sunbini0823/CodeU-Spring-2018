package codeu.controller; 


import java.io.IOException;
import java.time.Instant;
import java.util.UUID;
import java.util.*;
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
	 String[] skills = new String[]{"python", "java", "php", "c++", "c#", "perl", "angular", "react",
	 "vue", "ionic", "js", "html", "css", "nodejs"};
	 String about = request.getParameter("about");
	 
	//getting the checked checkboxes as a string
	List<String> my_skills = new ArrayList<>();
	for (String skill : skills) {
		String checked = request.getParameter(skill);
		if (checked != null && checked.equals("on")) { 
			my_skills.add(skill);
		}
	}
	String user_skills = String.join(", ", my_skills);

	if (user != null) {
		user.setPhotoURL(photo_url);
	    user.setSkills(user_skills);
	    user.setAbout(about);
	    try {
	    	userStore.updateUserPhoto(user, photo_url, user_skills, about);
		}
		    catch (Exception e) {
		    System.out.println(e);	
		    }	
	    request.getSession().setAttribute("photo_url", user.getPhotoURL());
	    request.getSession().setAttribute("user_skills", user.getSkills());
	    request.getSession().setAttribute("about", user.getAbout());
        response.sendRedirect("/myprofile");
        }
	else {  //user object not found - if not logged in, can't change the picture
		request.setAttribute("error", "Error, please login.");
        request.getRequestDispatcher("/WEB-INF/view/myprofile.jsp").forward(request, response);
	}
  }
}
