<!DOCTYPE html>
<html>
<head>
 <title>My Profile</title>
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

 <div id="container">
   <h1>My Profile</h1>

   <% if(request.getAttribute("error") != null){ %>
       <h2 style="color:red"><%= request.getAttribute("error") %></h2>
   <% } %>


 </div>
</body>
</html>