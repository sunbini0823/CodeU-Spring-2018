<%--
  Copyright 2017 Google Inc.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%
Conversation conversation = (Conversation) request.getAttribute("conversation");
List<Message> messages = (List<Message>) request.getAttribute("messages");
%>

<!DOCTYPE html>
<html>
<head>
  <title><%= conversation.getTitle() %></title>
  <link rel="stylesheet" href="/css/main.css" type="text/css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

  <style>
    #chat {
      background-color: white;
      height: 500px;
      overflow-y: scroll
    }
	#chat a {
	  color: black;
	}
	#chat a:hover {
	  color: #00b300;
	}
  </style>

  <script>
    // scroll the chat div to the bottom
    function scrollChat() {
      var chatDiv = document.getElementById('chat');
      chatDiv.scrollTop = chatDiv.scrollHeight;
    };
  </script>
</head>
<body onload="scrollChat()">

  <nav class="navbar navbar-expand-lg navbar-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar"
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
	<% if(request.getSession().getAttribute("user") != null){ %>
		<a class="navbar-brand hello" style="font-family: 'Lobster', Georgia, Times, serif; font-size: 33px; color: #003300">
		Hello <%= request.getSession().getAttribute("user") %>!</a>
	<% } %>		
	<div class="collapse navbar-collapse text-center" id="navbar">
	<ul class="navbar-nav text-left">
		<li class="nav-item" routerLinkActive="active">
          <a id="navTitle" style="font-family: 'Lobster', Georgia, Times, serif;" href="/">Lovelacers.git</a>
        </li>
		<% if(request.getSession().getAttribute("user") != null){ %>
			<li class="nav-item" routerLinkActive="active"><a href="/myprofile?profile_id=<%= request.getSession().getAttribute("user") %> " 
			style="margin-top: 28px;">My Profile</a>		
			<li class="nav-item" routerLinkActive="active">
				<a href="/activityfeed" style="margin-top: 28px;">Activity Feed</a></li>	
		<% } else{ %>		
			<li class="nav-item" routerLinkActive="active">
				<a href="/login" style="margin-top: 28px;">Login</a></li>	
			<li class="nav-item" routerLinkActive="active">
				<a href="/register" style="margin-top: 28px;">Register</a></li>	
		<% } %>
		<li class="nav-item" routerLinkActive="active">
			<a href="/conversations" style="margin-top: 28px;">Conversations</a></li>	
		<li class="nav-item" routerLinkActive="active">
			<a href="/about.jsp" style="margin-top: 28px;">About</a></li>	
		<% if(request.getSession().getAttribute("user") != null){ %>
			<li class="nav-item" routerLinkActive="active">
				<a href="/logout" style="margin-top: 28px;">Logout</a></li>
		<% } %>		
	</ul>
    <div>
  </nav>

  <div class="container">

    <h1><%= conversation.getTitle() %>
      <a href="" style="float: right">&#8635;</a></h1>

    <hr/>

    <div id="chat">
      <ul>
    <%
      for (Message message : messages) {
        String author = UserStore.getInstance()
          .getUser(message.getAuthorId()).getName();
    %>
      <li><strong><a href="/myprofile?profile_id=<%= author%>"><%= author %>:</a></strong> <%= message.getContent() %></li>
    <%
      }
    %>
      </ul>
    </div>

    <hr/>

    <% if (request.getSession().getAttribute("user") != null) { %>
    <form action="/chat/<%= conversation.getTitle() %>" method="POST">
        <input type="text" name="message" class="form-control">
        <br/>
        <button type="submit" class="btn btn-success">Send</button>
    </form>
    <% } else { %>
      <p><a href="/login">Login</a> to send a message.</p>
    <% } %>

    <hr/>

  </div>

</body>
</html>
