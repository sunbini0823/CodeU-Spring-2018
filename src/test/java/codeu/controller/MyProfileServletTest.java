package codeu.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import codeu.model.data.Conversation;
import codeu.model.data.User;
import codeu.model.store.basic.ConversationStore;
import codeu.model.store.basic.UserStore;

public class MyProfileServletTest {
    private MyProfileServlet myprofileServlet;
    private HttpServletRequest mockRequest;
    private HttpServletResponse mockResponse;
    private RequestDispatcher mockRequestDispatcher;
    private ConversationStore mockConversationStore;
    private UserStore mockUserStore;



 @Before
 public void setup() throws IOException {
    myprofileServlet = new MyProfileServlet();
    mockRequest = Mockito.mock(HttpServletRequest.class);
    mockResponse = Mockito.mock(HttpServletResponse.class);
     
    mockRequestDispatcher = Mockito.mock(RequestDispatcher.class);
    Mockito.when(mockRequest.getRequestDispatcher("/WEB-INF/view/myprofile.jsp"))
       .thenReturn(mockRequestDispatcher);
    mockConversationStore = Mockito.mock(ConversationStore.class);
    myprofileServlet.setConversationStore(mockConversationStore);
    mockUserStore = Mockito.mock(UserStore.class);
    myprofileServlet.setUserStore(mockUserStore);
 }

 @Test
 public void testDoGet() throws IOException, ServletException {
     List<Conversation> fakeConversationList = new ArrayList<>();
     fakeConversationList.add( new Conversation(UUID.randomUUID(), UUID.randomUUID(), "test_conversation", Instant.now()));
     Mockito.when(mockConversationStore.getAllConversations()).thenReturn(fakeConversationList);
     myprofileServlet.doGet(mockRequest, mockResponse);
     
     Mockito.verify(mockRequest).setAttribute("conversations", fakeConversationList);
     Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
 }
}
