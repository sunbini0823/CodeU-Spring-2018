package codeu.controller;
import codeu.model.data.User;
import codeu.model.store.basic.UserStore;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import org.junit.Assert;
import org.junit.Test;

public class RegisterServletTest {

 private RegisterServlet registerServlet;
 private HttpServletRequest mockRequest;
 private HttpServletResponse mockResponse;
 private RequestDispatcher mockRequestDispatcher;

 @Before
 public void setup() throws IOException {
   registerServlet = new RegisterServlet();
   mockRequest = Mockito.mock(HttpServletRequest.class);
   mockResponse = Mockito.mock(HttpServletResponse.class);
   mockRequestDispatcher = Mockito.mock(RequestDispatcher.class);
   Mockito.when(mockRequest.getRequestDispatcher("/WEB-INF/view/register.jsp"))
       .thenReturn(mockRequestDispatcher); }

 @Test
 public void testDoGet() throws IOException, ServletException {
   registerServlet.doGet(mockRequest, mockResponse);

   Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
 }
 
 @Test
 public void testDoPost_ExistingUser() throws IOException, ServletException {
	Mockito.when(mockRequest.getParameter("username")).thenReturn("test username");
	
	UserStore mockUserStore = Mockito.mock(UserStore.class);
    Mockito.when(mockUserStore.isUserRegistered("test username")).thenReturn(true);
    registerServlet.setUserStore(mockUserStore);

    registerServlet.doPost(mockRequest, mockResponse);

    Mockito.verify(mockRequest).setAttribute("error", "That username is already taken.");
    Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
  }
  
 @Test
 public void testDoPost_EmptyUsername() {
	String testEmail = "user@.invalid.com";
	String testEmail2 = "user@valid.com";

	RegisterServlet emailTest = new RegisterServlet();
	boolean result = emailTest.isValid(testEmail);
	boolean result2 = emailTest.isValid(testEmail2);

	Assert.assertEquals(false, result);
	Assert.assertEquals(true, result2);
 }
  
}
