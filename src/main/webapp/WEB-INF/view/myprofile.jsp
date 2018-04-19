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
   .boxed {
     border: 2px solid blue;
	 background-color: #eaeffa;
   }
   .row {
     display: flex;
   }
   .column35 {
     flex: 35%;
   } 
   .column65 {
     flex: 65%;
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

 <div id="container" style="width:60%; margin-left:auto; margin-right:auto; margin-top: 50px;">		
	<div>
		<h1>My Profile</h1>	
	</div>
	<div class="row boxed">
		<div class="column35" style="padding: 25px;"> 
			<img src="https://i1.wp.com/www.winhelponline.com/blog/wp-content/uploads/2017/12/user.png?resize=256%2C256&quality=100" alt="img" width="200" height="200"/>
		</div>
		<div class="column65" align="center"> 
			<h1>Name and other info here</h1>
		</div>
	</div>
 
 </div>
</body>
</html>