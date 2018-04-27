<!DOCTYPE html>
<html>
<head>
 <title>My Profile</title>
 <link rel="stylesheet" href="/css/main.css">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

 <style>
   .boxed {
	 padding-top: 30px;
	 padding-bottom: 30px;
     border: 2px solid blue;
	 background-color: #eaeffa;
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

 <div class="container" style="width:60%; margin-left:auto; margin-right:auto; margin-top: 50px;">		
	<div>
	   <h1>My Profile</h1>	
	</div>
	<% if(request.getAttribute("error") != null){ %>
	<h2 style="color:red"><%= request.getAttribute("error") %></h2>
	<% } %>
	<div class="row boxed justify-content-center">
	   <div class="col-3"> 
		    <img src="<%= request.getSession().getAttribute("photo_url") %>" alt="img" width="200" height="200"/>
	   </div>
	   <div class="col-6 align-text-center"> 
		    <h3>Username: <%= request.getSession().getAttribute("user") %>!</h3>
		    <form action="/myprofile" method="POST">
		      <div id="load_url" class="form-group row justify-content-center">
		        <label for="photo_url" class="col-2 col-form-label">URL: </label>
		      <div class="col-6">
		    	<input type="text" class="form-control" name="photo_url" id="photo_url">
		      </div>
		      <button type="submit" class="btn btn-primary">Update</button>
		     </div>
		   </form>
	   </div>
	</div>
 </div>
</body>
</html>
