// Copyright 2017 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package codeu.controller;

import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codeu.model.data.Conversation;
import codeu.model.data.Message;
import codeu.model.data.User;
import codeu.model.store.basic.ConversationStore;
import codeu.model.store.basic.MessageStore;
import codeu.model.store.basic.UserStore;

/** Servlet class responsible for the activity feed page. */
public class ActivityFeedServlet extends HttpServlet {

  /** Store class that gives access to Users. */
  private UserStore userStore;

  /** Store class that gives access to Messages. */
  private MessageStore messageStore;

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
    setMessageStore(MessageStore.getInstance());
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
   * Sets the MessageStore used by this servlet. This function provides a common setup method
   * for use by the test framework or the servlet's init() function.
   */
  void setMessageStore(MessageStore messageStore) {
    this.messageStore = messageStore;
  }

  /**
   * Sets the ConversationStore used by this servlet. This function provides a common setup method
   * for use by the test framework or the servlet's init() function.
   */
  void setConversationStore(ConversationStore conversationStore) {
    this.conversationStore = conversationStore;
  }

  /**
   * This function fires when a user navigates to the activityfeed page. It gets all of the new conversation, user,
   * and message in a day from the model and forwards to activityfeed.jsp for rendering the list.
   */
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

    List<String> conversationActivity = new ArrayList<String>();
    List<Conversation> conversationList = conversationStore.getRecentConversations();
    
    if (conversationList.isEmpty()) {
    	conversationActivity.add("No new conversation in the past day!");
    }
    else {
    	for (Conversation conversation : conversationList) {
	      LocalDateTime datetime = LocalDateTime.ofInstant(conversation.getCreationTime(), ZoneId.of("America/Los_Angeles"));
	      String time = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss ").format(datetime);

	      User creator = userStore.getUser(conversation.getOwnerId());
	      String userlink = "<a href=\"/myprofile?profile_id=" + creator.getName() + "\">" + creator.getName() + "</a>";
	      String convlink = "<a href=\"/chat/" + conversation.getTitle() + "\">" + conversation.getTitle() + "</a>";
	      conversationActivity.add(time + userlink + " created a new conversation: " + convlink);
	    }
    }
    
    

    List<String> messageActivity = new ArrayList<String>();
    List<Message> messageList = messageStore.getRecentMessages();
    
    if(messageList.isEmpty()) {
    	messageActivity.add("No message sent in the past day!");
    }
    else {
    	for (Message message : messageList) {
	      LocalDateTime datetime = LocalDateTime.ofInstant(message.getCreationTime(), ZoneId.of("America/Los_Angeles"));
	      String time = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss ").format(datetime);

	      User creator = userStore.getUser(message.getAuthorId());
	      String userlink = "<a href=\"/myprofile?profile_id=" + creator.getName() + "\">" + creator.getName() + "</a>";
	      
	      Conversation conversation = conversationStore.getConversationWithUUID(message.getConversationId());
	      String convlink = "<a href=\"/chat/" + conversation.getTitle() + "\">" + conversation.getTitle() + "</a>";

	      messageActivity.add(time + userlink + " said in " + convlink + ": \"" + message.getContent() + "\"");
	    }
    }
    

    List<String> userActivity = new ArrayList<String>();
    List<User> userList = userStore.getRecentUsers();

    if(userList.isEmpty()) {
    	userActivity.add("No user joined in the past day!");
    }
    else {
    	for (User user : userList) {
  	      LocalDateTime datetime = LocalDateTime.ofInstant(user.getCreationTime(), ZoneId.of("America/Los_Angeles"));
  	      String time = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss ").format(datetime);
  	      String userlink = "<a href=\"/myprofile?profile_id=" + user.getName() + "\">" + user.getName() + "</a>";
  	      userActivity.add(time + userlink + " joined!");
  	    }
    }
    

    request.setAttribute("conversationActivity", conversationActivity);
    request.setAttribute("messageActivity", messageActivity);
    request.setAttribute("userActivity", userActivity);
    request.getRequestDispatcher("/WEB-INF/view/activityfeed.jsp").forward(request, response);
  }


}