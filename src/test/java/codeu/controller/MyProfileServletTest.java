package codeu.controller;
import codeu.model.data.User;
import codeu.model.store.basic.UserStore;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import codeu.model.data.Conversation;
import codeu.model.store.basic.ConversationStore;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class MyProfileServletTest {

 private MyProfileServlet myprofileServlet;
 private HttpServletRequest mockRequest;
 private HttpSession mockSession;
 private HttpServletResponse mockResponse;
 private RequestDispatcher mockRequestDispatcher;
 private UserStore mockUserStore;



 @Before
 public void setup() throws IOException {
   myprofileServlet = new MyProfileServlet();
   mockRequest = Mockito.mock(HttpServletRequest.class);
   mockResponse = Mockito.mock(HttpServletResponse.class);
   mockRequestDispatcher = Mockito.mock(RequestDispatcher.class);
   Mockito.when(mockRequest.getRequestDispatcher("/WEB-INF/view/myprofile.jsp"))
       .thenReturn(mockRequestDispatcher); }

 @Test
 public void testDoGet() throws IOException, ServletException {
     myprofileServlet.doGet(mockRequest, mockResponse);
     Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);

 }
 
 @Test
 public void testDoPost() throws IOException, ServletException {
   HttpSession mockSession = Mockito.mock(HttpSession.class);
   Mockito.when(mockRequest.getSession()).thenReturn(mockSession);
   Mockito.when(mockSession.getAttribute("user")).thenReturn("test_username");
   Mockito.when(mockRequest.getParameter("photo_url")).thenReturn("test_photo_url");
   Mockito.when(mockRequest.getParameter("user_skills")).thenReturn("test_user_skills");
   Mockito.when(mockRequest.getParameter("about")).thenReturn("test about");

   UserStore mockUserStore = Mockito.mock(UserStore.class);
   myprofileServlet.setUserStore(mockUserStore);
   
   User mockUser = Mockito.mock(User.class);
   Mockito.when(mockUserStore.getUser("test_username")).thenReturn(mockUser);
   myprofileServlet.doPost(mockRequest, mockResponse);

   if (mockUser != null){
     String photo_url = "http://via.placeholder.com/350x150";
     Mockito.verify(mockSession).setAttribute("photo_url", null);
     Mockito.verify(mockResponse).sendRedirect("/myprofile?profile_id=test_username");

   }
   else {
     Mockito.verify(mockRequest).setAttribute("error", "Error, please login.");
     Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
   }
   
 }
 
 
}
