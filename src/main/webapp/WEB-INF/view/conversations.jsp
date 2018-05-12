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
<%@ page import="codeu.model.data.User" %>

<!DOCTYPE html>
<html>
<head>
  <title>Conversations</title>
  <link rel="stylesheet" href="/css/main.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script> 
</head>
<body>

  <nav class="navbar navbar-expand-lg navbar-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar"
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
	<% if(request.getSession().getAttribute("user") != null){ %>
		<a class="navbar-brand" style="font-family: 'Lobster', Georgia, Times, serif; font-size: 33px; color: #003300">
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

    <% if(request.getAttribute("error") != null){ %>
        <h2 style="color:red"><%= request.getAttribute("error") %></h2>
    <% } %>

    <% if(request.getSession().getAttribute("user") != null){ %>
      <h1>New Conversation</h1>
      <form action="/conversations" method="POST">
          <div class="form-group row">
            <label class="col-1 col-form-label">Title:</label>
			<div class="col-3">
              <input type="text" class="form-control" name="conversationTitle">
			</div>
        </div>

        <button type="submit" class="btn btn-success">Create</button>
      </form>

      <hr/>
    <% } %>
	<div class="row justify-content-center">
	    <div class="col-md-6">
			<h1>Conversations</h1>
			<%
			List<Conversation> conversations =
			  (List<Conversation>) request.getAttribute("conversations");
			if(conversations == null || conversations.isEmpty()){
			%>
			  <p>Create a conversation to get started.</p>
			<%
			}
			else{
			%>
			  <ul class="mdl-list">
			<%
			  for(Conversation conversation : conversations){
			%>
			  <li><a href="/chat/<%= conversation.getTitle() %>">
				<%= conversation.getTitle() %></a></li>
			<%
			  }
			%>
			  </ul>
			<%
			}
			%>
	    </div>
	    <div class="col-md-6">
			<h1>Users</h1>
			<% if(request.getSession().getAttribute("user") != null){ %>
				<%
				List<User> users =
				  (List<User>) request.getAttribute("users");
				%>
				<ul class="mdl-list">
				<%
				  if (request.getAttribute("users") != null) {
					for(User user : users){
					%>
					  <li><a href="/myprofile?profile_id=<%= user.getName() %>">
						<%= user.getName() %></a><% if (user.getSkills() != null) { %>
						<p>Skills : <%= user.getSkills() %></p>
						<%} else { %>
						<p> no skills specified</p>
						<% } %>
						</li>
					<%
					}
				}
				%>
				</ul>
			<% } else { %>
				<p>Please <a href="/login">Login</a> to view other users' profiles!</p>
			<% } %>
	    </div>
	</div>	
  </div>
</body>
</html>
