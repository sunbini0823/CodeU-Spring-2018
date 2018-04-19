<!DOCTYPE html>
<html>
<head>
 <title>Register</title>
<link rel="stylesheet" href="/css/main.css">
 <style>
   label {
     display: inline-block;
     width: 100px;
   }
 </style>
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

 <div id="container" align="center">
   <h1>Register</h1>

   <% if(request.getAttribute("error") != null){ %>
       <h2 style="color:red"><%= request.getAttribute("error") %></h2>
   <% } %>

   <% if(request.getAttribute("notice") != null){ %>
       <h2 style="color:purple"><%= request.getAttribute("notice") %></h2>
   <% } %>

   <form action="/register" method="POST">
     <label for="username">Username: </label>
     <input type="text" name="username" id="username">
     <br/>
     <label for="email">Email: </label>
     <input type="text" name="email" id="email">
     <br/>	 
     <label for="password">Password: </label>
     <input type="password" name="password" id="password">
     <br/><br/>
     <button type="submit">Submit</button>
   </form>
 </div>
</body>
</html>
