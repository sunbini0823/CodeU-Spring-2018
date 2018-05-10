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
<!DOCTYPE html>
<html>
<head>
  <title>CodeU Chat App</title>
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lobster|Lobster+Two:400i|Cabin" rel="stylesheet">
  <link rel="stylesheet" href="/css/main.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
  
  <style>

    #add{
      font-size: 18px;
      width: 60%;
      margin-left: auto;
      margin-right: auto;
      font-family: 'Cabin', Helvetica, Arial, sans-serif;
    }
    .name{
      
      color: black;
      text-align: center;
      padding-top: 10px;
      padding-bottom: 10px;
      font-size: 24px;
      margin-left: 1%;
      margin-right: 1%;
      width: 110%;
      height: 50%;
      margin-bottom: 40px;
      font-family: 'Lobster Two', cursive;
      -webkit-transition-duration: 0.4s; /* Safari */
      transition-duration: 0.4s;
    }

    .name:hover{
      background-color: #F78888;
      color: white;
    }

    .n1{
      background-color: #ECECEC; color: black;
    }

    .n2{
        background-color: #90CCF4; color: black;
    }

    .n3{
      background-color: #1789E8; color: black;
    }

    .n4{
      background-color: #B3D7F0; color: black;
    }
    .n5{
      background-color: #B8F5F7; color: black;
    }
    img{
	  margin-bottom: 30px;	
	}
  </style>
</head>
<body>
  <nav>
   <a id="navTitle" href="/">CodeU Chat App</a>   
   <% if(request.getSession().getAttribute("user") != null){ %>
     <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
	 <a href="/myprofile?profile_id=<%= request.getSession().getAttribute("user") %>">My Profile</a>
	 <a href="/activityfeed">Activity Feed</a>
	 <a href="/logout">Logout</a>
   <% } else{ %>
     <a href="/login">Login</a>
     <a href="/register">Register</a>
   <% } %>
	 <a href="/conversations">Conversations</a>
     <a href="/about.jsp">About</a>
  </nav>
   
 <div class="container">
    <div style="text-align: center; margin-top: 30px; margin-bottom: 30px;">
      <h2 style="font-family: 'Lobster', Georgia, Times, serif; font-size: 35px; color: #F78888">Team Lovelacers</h2>
    </div>

    <div class="row justify-content-center text-center">
	  <div class="col-2">
        <img src="https://lh4.googleusercontent.com/-MpFXB1m7qPQ/AAAAAAAAAAI/AAAAAAAAATw/z5JAJJ1iJ9w/s64/photo.jpg" alt="Aditi" class="rounded img-fluid" width="120" height="120"/> 
	  </div>
	  <div class="col-2">
        <img src="https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/29791847_1915226268529605_3315042041827335933_n.jpg?_nc_cat=0&oh=d87fd1c7a791551c0aeece29203d48c7&oe=5B56FBA3" alt="Anujin" class="rounded img-fluid" width="150" height="150"/> 
	  </div>
	  <div class="col-2">
        <img src="https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/12079421_989283934468701_6142647328162868473_n.jpg?_nc_cat=0&oh=2b0285d2b8c7582fc3a495dc392ca80c&oe=5B720085" alt="Inbar" class="rounded img-fluid" width="150" height="150"/> 
	  </div>
	  <div class="col-2">
        <img src="https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/13423851_1125291940855328_8717554326577718503_n.jpg?_nc_cat=0&oh=28506dbed6670def52f672ca4cb531bc&oe=5B6B1994" alt="Sunbin" class="rounded img-fluid" width="150" height="150"/> 
	  </div>
	  <div class="col-2">
        <img src="https://scontent-sea1-1.xx.fbcdn.net/v/t1.0-9/15781765_1235894409791591_7251308027829391949_n.jpg?_nc_cat=0&oh=010a20d68d738c11dfcfce3273e97dee&oe=5B92F249" alt="Sophie" class="rounded img-fluid" width="150" height="120"/>  
	  </div>
	</div>
	<div class="row justify-content-center">
	  <div class="col-2"> 
	    <button class="btn name n1" onclick="aditi()">PA- Aditi Jain</button>
	  </div>
      <div class="col-2"> 
	    <button class="btn name n2" onclick="anujin()">Anujin Munkhbat</button>
	  </div>
	  <div class="col-2"> 
        <button class="btn name n3" onclick="inbar()">Inbar Kodesh</button>	  
	  </div>
	  <div class="col-2"> 
        <button class="btn name n4" onclick="sunbin()">Sunbin Kim</button>  
	  </div>
	  <div class="col-2"> 
        <button class="btn name n5" onclick="sophie()">Sophie Wu</button>	  
	  </div>
	</div>
  
	
	<div>
    <p id="add"> </p>

    <script>
      var add = document.getElementById("add");
      function aditi(){
        add.innerHTML = "My name is Aditi Jain and I'm the Project Advisor for Team Lovelacers. I oversee code reviews and project management. I have been at Google for a year and a half and recently graduated from Carnegie Mellon in 2016 with a double major in Math and Computer Science. I grew up in Mountain View and moved back here after college- safe to say I'm ready to move somewhere new! I love the usual bay area things- hiking, skiing, and avocado toast. I have been a vegetarian my whole life but just last week I tried salmon for the first time.. I have definitely been missing out. My passion outside of work that I would like to explore more is the intersection of education, business, and technology.";
      }

      function anujin(){
        add.innerHTML = "My name is Anujin Munkhbat. I am a sophomore at Whitworth University, it's in Spokane, WA. I'm majoring in Computer Science with an Accounting minor. I actually came as a Business Administration major and then discovered coding, which was a major shift in my life and so far the best one. I really want to find a way to combine and implement both business and technology in my life. More on bio, I was born in Mongolia, but grew up in Ukraine, then moved back to Mongolia. I did a study abroad program in middle school in Japan, where I found that I want to travel more and learn about different cultures. I also love dogs, the big ones. I think small dogs look like toys!";
      }

      function inbar(){
        add.innerHTML = "My name is Inbar Kodesh. I am a sophomore at Stanford studying Computer Science and Economics but am originally from Seattle, WA (one of the best cities). I have always loved entrepreneurship and the intersection of business and technology. I worked at GE Digital last summer where I began to get a glimpse of working on software within a team, and the surprising challenges associated with collaboration. Outside of schoolwork, I am involved with a consulting club on campus and enjoy dancing and basketball in my free time.";
      }

      function sunbin(){
        add.innerHTML = "My name is Sunbin Kim and I am a sophomore at UC Berkeley. I major in Computer Science and minor in Education. I was born and raised in Busan, South Korea, which is a beach town with lots of fresh seafood! I love seafood, especially sushi! I have been dancing for K-pop since middle school and I have recently started to post cover videos on Instagram and Youtube. I also love animals! Lastly, I am very interested in equal access to education and feminism!!";
      }

      function sophie(){
        add.innerHTML = "My name is Sophie Wu and I am a sophomore at University of Southern California (USC). I am studying Computer Science with a minor in Applied Computer Security. I grew up in Tainan, Taiwan and it has the best food in the world. In my free time I enjoy going to hackathons, building cool projects, and experimenting with new technology. I love cats and big dogs and I dream of having a Alaskan malamute and three cats as pets, assuming the dog does not eat/attack the cats.";
      }

    </script>

    </div>
  </div>
</body>
</html>
