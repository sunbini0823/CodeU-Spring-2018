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

<!DOCTYPE html>
<html>
<head>
  <title>Activity Feed</title>
  <link rel="stylesheet" href="/css/main.css">
</head>
<body>

  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <a href="/conversations">Conversations</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
	  <a href="/myprofile">My Profile</a>
    <% } else{ %>
      <a href="/login">Login</a>
	  <a href="/register">Register</a>
    <% } %>
    <a href="/about.jsp">About</a>
  </nav>

  <div id="container">


    <h1>Activity Feed</h1>
	<hr/>
	
	<h3>Conversation Activity</h3>
    <%
    List<String> conversationactivity = (List<String>) request.getAttribute("conversationactivity");
	%>
      <ul class="mdl-list">
    <%
      for(String ca : conversationactivity){
    %>
      <li><%=ca %></li>
    <%
      }
    %>
      </ul>
      
      
    <h3>Message Activity</h3>
    <%
    List<String> messageactivity = (List<String>) request.getAttribute("messageactivity");
	%>
      <ul class="mdl-list">
    <%
      for(String ma : messageactivity){
    %>
      <li><%=ma %></li>
    <%
      }
    %>
      </ul>
      
    <h3>User Activity</h3>
    <%
    List<String> useractivity = (List<String>) request.getAttribute("useractivity");
	%>
      <ul class="mdl-list">
    <%
      for(String ua : useractivity){
    %>
      <li><%=ua %></li>
    <%
      }
    %>
      </ul>

    
  </div>
</body>
</html>
