<!DOCTYPE html>
<html>
<head>
 <title>Register</title>
 <link rel="stylesheet" href="/css/main.css">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

 <style>
   label {
     display: inline-block;
     width: 100px;
   }
   .container{
	 padding-top: 50px;
   }
   .btn{
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
	 <a href="/logout">Logout</a>
   <% } else{ %>
     <a href="/login">Login</a>
     <a href="/register">Register</a>
   <% } %>
     <a href="/about.jsp">About</a>
 </nav>

 <div class="container text-center">
   <h1>Register</h1>
   </br>
   <% if(request.getAttribute("error") != null){ %>
       <h3 style="color:red"><%= request.getAttribute("error") %></h3>
   <% } %>

   <% if(request.getAttribute("notice") != null){ %>
       <h3 style="color:purple"><%= request.getAttribute("notice") %></h3>
   <% } %>

   <form action="/register" method="POST">
     <div class="form-group row justify-content-center">
	      <label for="username" class="col-2 col-form-label">Username: </label>
	      <div class="col-6">
		       <input type="text" class="form-control" name="username" id="username">
	      </div>
     </div>
    <div class="form-group row justify-content-center">
	    <label for="email" class="col-2 col-form-label">Email: </label>
	    <div class="col-6">
		    <input type="text" class="form-control" name="email" id="email">
	    </div>
    </div>
    <div class="form-group row justify-content-center">		
	    <label for="password" class="col-2 col-form-label">Password: </label>
	    <div class="col-6">
		    <input type="password" class="form-control" name="password" id="password">
	    </div>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
   </form>
 </div>
</body>
</html>
