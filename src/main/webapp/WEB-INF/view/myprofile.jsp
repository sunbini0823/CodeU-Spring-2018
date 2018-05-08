<!DOCTYPE html>
<html>
<head>
 <title>My Profile</title>
 <link rel="stylesheet" href="/css/main.css">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

 <style>
   .boxed {
	 padding-top: 30px;
	 padding-bottom: 30px;
     	 border: 2px solid black;
	 background-color: #eaeffa;
   }
   .form-check-inline .form-check-input{
	 margin-right: 0.5rem !important;
         margin-left: 1rem !important;	 
   }
   .form-check-inline .form-check-label{
	 font-size: 50px;
   }
   .form-check-inline .form-check-label p{
	 font-size: large;
	 font-weight: 600;
	 margin: 0 !important;
   }
   .nav-link {
	 color: black;
	 font-weight: 700;
   }
   .nav-item a:hover{
	 background-color: #014308;
   }
   .tab-content #profile label {
	 font-size: 30px;
	 padding-right: 10px;
   }
   .col-md-4 img {
	 border: 2px solid #ddd;
	 border-radius: 4px;
	 padding: 5px;
   }
   @media screen and (max-width: 992px){
	 .form-check .form-check-label {
	    font-size: 25px
     	 }
	 .form-check-inline .form-check-input{
	    margin-right: 0.1rem !important;
        margin-left: 0.3rem !important;	 
     	 }
	 .form-check .form-check-label p{
		font-size: 20px;
	    font-weight: 200;
	 }
   }
   
   @media screen and (max-width: 600px){
	 .form-check .form-check-label {
	    font-size: 15px
     	 }
	 .form-check-inline .form-check-input{
	    margin-right: 0.2rem !important;
        margin-left: 0.5rem !important;	 
     	 }
	 .form-check .form-check-label p{
		font-size: 15px;
	    font-weight: 100;
	 }
   }
   
 </style>
</head>
<body>

 <nav>
   <a id="navTitle" href="/">CodeU Chat App</a>
   <a href="/conversations">Conversations</a>
   <% if(request.getSession().getAttribute("user") != null){ %>
     <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
	 <a href="/myprofile?profile_id=<%= request.getSession().getAttribute("user") %>">My Profile</a>
	 <a href="/logout">Logout</a>
   <% } else{ %>
     <a href="/login">Login</a>
	 <a href="/register">Register</a>
   <% } %>
     <a href="/about.jsp">About</a>
 </nav>
<div class="container">
    <div>
	   <h1>My Profile</h1>	
	</div>
	<% if(request.getAttribute("error") != null){ %>
	<h2 style="color:red"><%= request.getAttribute("error") %></h2>
	<% } %>
	
 <div id="myprofile" class="row boxed justify-content-center" >		
	<div class="col-md-4"> 
	    <% if (request.getSession().getAttribute("is_self") != null && ((String)request.getSession().getAttribute("is_self")).equals("true")) { %>
	    <img src="<%= request.getSession().getAttribute("photo_url") %>" class="img-fluid" alt="img" width="200" height="200"/>
	    <%} else {%>
	    <img src="<%= request.getAttribute("photo_url") %>" class="img-fluid" alt="img" width="200" height="200"/>
	    <%}%>
	</div>
	<div class="col-md-6 align-text-center"> 
	    <ul class="nav nav-tabs mb-3" id="tab" role="tablist">
            <li class="nav-item">
               <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="true">Profile</a>			
	    </li>
	    <% if (request.getSession().getAttribute("is_self") != null && ((String)request.getSession().getAttribute("is_self")).equals("true")) { %>
            <li class="nav-item">
               <a class="nav-link" id="update-tab" data-toggle="tab" href="#update" role="tab" aria-controls="update" aria-selected="false">Update</a>			
	    </li>
	    <% } %>
        </ul>
	<div class="tab-content" id="tabContent">
	    <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
		<% if (request.getSession().getAttribute("is_self") != null && ((String)request.getSession().getAttribute("is_self")).equals("true")) { %>
		<h5>Username: <%= request.getSession().getAttribute("user") %></h5>
		<h5>About: <%= request.getSession().getAttribute("about")%></h5>		
		<h5>Skills:</h5>
			   
               <% String my_skills = (String)request.getSession().getAttribute("user_skills");
		   if (my_skills != null){
			String[] s = my_skills.split(",");	   
			for (String skill : s) { 
				switch(skill){
					case "python":
						%><label class="form-check-label" for="python"><i class="fab fa-python"></i></label> <%
						break;
					case "java":
						%><label class="form-check-label" for="java"><i class="fab fa-java"></i></label> <%
						break;
					case "php":
						%><label class="form-check-label" for="php"><i class="fab fa-php"></i></label> <%
						break;
					case "c++":
						%><label class="form-check-label" for="c++"><p>C++</p></label> <%
						break;
					case "c#":
						%><label class="form-check-label" for="c#"><p>C#</p></label> <%
						break;
					case "pearl":
						%><label class="form-check-label" for="pearl"><p>Pearl</p></label> <%
						break;
					case "ionic":
						%><label class="form-check-label" for="ionic"><p>Ionic</p></label> <%
						break;
					case "angular":
						%><label class="form-check-label" for="angular"><i class="fab fa-angular"></i></label> <%
						break;
					case "react":
						%><label class="form-check-label" for="react"><i class="fab fa-react"></i></label> <%
						break;
					case "vue":
						%><label class="form-check-label" for="vue"><i class="fab fa-vuejs"></i></label> <%
						break;
					case "js":
						%><label class="form-check-label" for="js"><i class="fab fa-js-square"></i></label> <%
						break;	
					case "html":
						%><label class="form-check-label" for="html"><i class="fab fa-html5"></i></label> <%
						break;
					case "css":
						%><label class="form-check-label" for="css"><i class="fab fa-css3-alt"></i></label> <%
						break;
					case "nodejs":
						%><label class="form-check-label" for="nodejs"><i class="fab fa-node"></i></label> <%
						break;
					default:
						break;
					}
				}
			    } %>	
		<% } else { %>
		<h5>Username: <%= request.getAttribute("user") %></h5>
		<h5>About: <%= request.getAttribute("about")%></h5>		
		<h5>Skills:</h5>
			   
               <% String my_skills = (String)request.getAttribute("user_skills");
		   if (my_skills != null){
			   String[] s = my_skills.split(",");	   
			   for (String skill : s) { 
				  switch(skill){
					 case "python":
						%><label class="form-check-label" for="python"><i class="fab fa-python"></i></label> <%
						break;
					case "java":
						%><label class="form-check-label" for="java"><i class="fab fa-java"></i></label> <%
						break;
					case "php":
						%><label class="form-check-label" for="php"><i class="fab fa-php"></i></label> <%
						break;
					case "c++":
						%><label class="form-check-label" for="c++"><p>C++</p></label> <%
						break;
					case "c#":
						%><label class="form-check-label" for="c#"><p>C#</p></label> <%
						break;
					case "pearl":
						%><label class="form-check-label" for="pearl"><p>Pearl</p></label> <%
						break;
					case "ionic":
						%><label class="form-check-label" for="ionic"><p>Ionic</p></label> <%
						break;
					case "angular":
						%><label class="form-check-label" for="angular"><i class="fab fa-angular"></i></label> <%
						break;
					case "react":
						%><label class="form-check-label" for="react"><i class="fab fa-react"></i></label> <%
						break;
					case "vue":
						%><label class="form-check-label" for="vue"><i class="fab fa-vuejs"></i></label> <%
						break;
					case "js":
						%><label class="form-check-label" for="js"><i class="fab fa-js-square"></i></label> <%
						break;	
					case "html":
						%><label class="form-check-label" for="html"><i class="fab fa-html5"></i></label> <%
						break;
					case "css":
						%><label class="form-check-label" for="css"><i class="fab fa-css3-alt"></i></label> <%
						break;
					case "nodejs":
						%><label class="form-check-label" for="nodejs"><i class="fab fa-node"></i></label> <%
						break;
					default:
						break;
					}
				}
			    } %>
		    <% } %>	   
			   
		    </div>
		    <% if (request.getSession().getAttribute("is_self") != null && ((String)request.getSession().getAttribute("is_self")).equals("true")) { %>
		    <div class="tab-pane fade" id="update" role="tabpanel" aria-labelledby="update-tab">
			<form action="/myprofile" method="POST">
				<!-- Photo url update -->
				<div id="load_url" class="form-group row justify-content-start">
				   <label for="photo_url" class="col-3 col-form-label">Photo url: </label>
				   <div class="col-9">
					  <input type="text" class="form-control" name="photo_url"
					  value="<%= request.getSession().getAttribute("photo_url") %>" id="photo_url">
				   </div>
				</div>
				<!-- Skills part (checkboxes) -->
				<div class="form-check form-check-inline">
				   <input class="form-check-input" type="checkbox" name="python" id="python">
				   <label class="form-check-label" for="python"><i class="fab fa-python"></i></label>

				   <input class="form-check-input" type="checkbox" name="java" id="java">
				   <label class="form-check-label" for="java"><i class="fab fa-java"></i></label>

				   <input class="form-check-input" type="checkbox" name="php" id="php">
				   <label class="form-check-label" for="php"><i class="fab fa-php"></i></label>

				   <input class="form-check-input" type="checkbox" name="c++" id="c++">
				   <label class="form-check-label" for="c++"><p>C++</p></label>

				   <input class="form-check-input" type="checkbox" name="c#" id="c#">
				   <label class="form-check-label" for="c#"><p>C#</p></label>

				   <input class="form-check-input" type="checkbox" name="perl" id="perl">
				   <label class="form-check-label" for="perl"><p>Perl</p></label>
				</div>
				<div class="form-check form-check-inline">
				   <input class="form-check-input" type="checkbox" name="angular" id="angular">
				   <label class="form-check-label" for="angular"><i class="fab fa-angular"></i></label>

				   <input class="form-check-input" type="checkbox" name="react" id="react">
				   <label class="form-check-label" for="react"><i class="fab fa-react"></i></label>

				   <input class="form-check-input" type="checkbox" name="vue" id="vue">
				   <label class="form-check-label" for="vue"><i class="fab fa-vuejs"></i></label>

				   <input class="form-check-input" type="checkbox" name="ionic" id="ionic">
				   <label class="form-check-label" for="ionic"><p>Ionic</p></label>
				</div>
				<div class="form-check form-check-inline">
				   <input class="form-check-input" type="checkbox" name="js" id="js">
				   <label class="form-check-label" for="js"><i class="fab fa-js-square"></i></label>

				   <input class="form-check-input" type="checkbox" name="html" id="html">
				   <label class="form-check-label" for="html"><i class="fab fa-html5"></i></label>

				   <input class="form-check-input" type="checkbox" name="css" id="css">
				   <label class="form-check-label" for="css"><i class="fab fa-css3-alt"></i></label>

				   <input class="form-check-input" type="checkbox" name="nodejs" id="nodejs">
				   <label class="form-check-label" for="nodejs"><i class="fab fa-node"></i></label>
				</div>						
				<!--About and the updtae button -->
				<div>
				   <label for="about" class="col-form-label">About: </label>
				   <div>
					 <textarea type="text" class="form-control" rows="3" name="about"
					 id="about"><%= request.getSession().getAttribute("about")%></textarea>
				   </div>
				</div></br>
				<button type="submit" class="btn btn-success">Update</button>
			</form>
     		</div>
		<% } %>
	    </div>
	</div>
 </div>
</div>
</body>
</html>
