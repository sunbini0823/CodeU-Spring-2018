package codeu.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/** Servlet class responsible for the logout page. */
public class LogoutServlet extends HttpServlet {

  /**
   * This function fires when a user requests the /logout URL. It simply forwards the request to
   * logout.jsp.
   */
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
	  HttpSession session = request.getSession(false);
	  if (session!=null) {
		  session.invalidate();
	  }
	  request.getRequestDispatcher("/index.jsp").forward(request, response);
  }

}
