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

import codeu.model.data.Conversation;
import codeu.model.store.basic.ConversationStore;
import java.util.List;


/**
* Servlet class responsible for profile feed.
*/
public class MyProfileServlet extends HttpServlet {
	/**
  	* Store class that gives access to Users.
  	*/
 	private UserStore userStore;
    /** Store class that gives access to Conversations. */
    private ConversationStore conversationStore;

    /**
     * Set up state for handling conversation-related requests. This method is only called when
     * running in a server, not when running in a test.
     */
    @Override
    public void init() throws ServletException {
        super.init();
        setUserStore(UserStore.getInstance());
        setConversationStore(ConversationStore.getInstance());
    }
    /**
    * Sets the UserStore used by this servlet. This function provides a common setup method for use
    * by the test framework or the servlet's init() function.
    */
    void setUserStore(UserStore userStore) {
        this.userStore = userStore;
    }
    
    /**
    * Sets the ConversationStore used by this servlet. This function provides a common setup method
    * for use by the test framework or the servlet's init() function.
    */
    void setConversationStore(ConversationStore conversationStore) {
        this.conversationStore = conversationStore;
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
        
        String conversationTitle = username;
        
        if (conversationStore.isTitleTaken(conversationTitle)) {
            // conversation title is already taken, just go into that conversation instead of creating a new one
            response.sendRedirect("/chat/" + conversationTitle);
            return;
        }
        
        Conversation conversation =
        new Conversation(UUID.randomUUID(), user.getId(), conversationTitle, Instant.now());
        
        request.setAttribute("conversation", conversation);

        conversationStore.addConversation(conversation);
        response.sendRedirect("/chat/" + conversationTitle);
    }

}
