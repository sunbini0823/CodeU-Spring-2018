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
  <style>

    nav a:hover {
      color: white;
      display: inline-block;
      font-size: 24px;
      margin: 15px;
      text-decoration: none;
    }
    #add{
      font-size: 18px;
      width: 60%;
      margin-left: auto;
      margin-right: auto;
      font-family: 'Cabin', Helvetica, Arial, sans-serif;
    }
    .name{
      float:left;
      color: black;
      text-align: center;
      padding-top: 10px;
      padding-bottom: 10px;
      font-size: 24px;
      margin-left: 1%;
      margin-right: 1%;
      width: 16%;
      height: 50px;
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

  </style>
</head>
<body>

  <div class="container-fluid">

    <nav>
     <a id="navTitle" href="/">CodeU Chat App</a>
     <a href="/conversations">Conversations</a>
     <% if(request.getSession().getAttribute("user") != null){ %>
       <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
     <% } else{ %>
	   <a href="/myprofile">My Profile</a>
       <a href="/login">Login</a>
       <a href="/register">Register</a>
     <% } %>
     <a href="/about.jsp">About</a>
   </nav>

    <div style="text-align: center; margin-top: 30px; margin-bottom: 30px;">
      <h2 style="font-family: 'Lobster', Georgia, Times, serif; font-size: 35px; color: #F78888">Team Lovelacers</h2>
    </div>

    <div style="margin-left: 12.5%;">
      <button class="btn name n1" onclick="aditi()">PA- Aditi Jain</button>
      <button class="btn name n2" onclick="anujin()">Anujin Munkhbat</button>
      <button class="btn name n3" onclick="inbar()">Inbar Kodesh</button>
      <button class="btn name n4" onclick="sunbin()">Sunbin Kim</button>
      <button class="btn name n5" onclick="sophie()">Sophie Wu</button>
    </div>

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
</body>
</html>
