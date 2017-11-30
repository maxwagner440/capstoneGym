
<%@include file ="/WEB-INF/jsp/common/header1.jspf" %>

<title>Client Profile</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="/Users/annakurchak/workspace/exercises/untitled folder/clientProfile.css">
 <script src="https://code.jquery.com/jquery-3.2.1.min.js">
          </script>
                     <style>
                /* The Modal (background) */
                .modal {
                    display: none; /* Hidden by default */
                    position: fixed; /* Stay in place */
                    z-index: 1; /* Sit on top */
                    padding-top: 100px; /* Location of the box */
                    left: 0;
                    top: 0;
                    width: 100%; /* Full width */
                    height: 100%; /* Full height */
                    overflow: auto; /* Enable scroll if needed */
                    background-color: rgb(0,0,0); /* Fallback color */
                    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                }
                
                /* Modal Content */
                .modal-content {
                    background-color: #7d97a5;
                    margin: auto;
                    padding: 20px;
                    border: 1px solid #7d97a5;
                    width: 80%;
                }
                
                /* The Close Button */
                .close {
                    color: #fdfafa;
                    float: right;
                    font-size: 28px;
                    font-weight: bold;
                }
                
                .close:hover,
                .close:focus {
                    color: #222a2e;
                    text-decoration: none;
                    cursor: pointer;
                }
                </style>
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<body class="w3-theme-l5">

<!-- Navbar -->
<div class="navBar">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large" id="navBarCSS">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
 <c:url var="home" value="/"/>
    <a href="${home }" class="w3-bar-item-home w3-button"><b>Raise the Bar</b></a>
  <c:url var="workouts" value="/allWorkouts"/>
  <a href="${workouts}" class="w3-bar-item w3-button">Workouts</a>
  <a href="" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="News"><i class="fa fa-globe"></i></a>
   <c:url var="clientHome" value="/clientDashboard"/>
  <a href="${clientHome }" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Account Settings"><i class="fa fa-user"></i></a>
  <c:url value="/currentWorkoutPlan" var="currentWorkoutPlan"/>
      <a href="${currentWorkoutPlan}" class="w3-bar-item w3-button">See Your Workout</a>
  <c:url value="/viewMyMessages" var="viewMessages"/>
  <a href="${viewMessages }" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages"><i class="fa fa-envelope"></i></a>
  <c:url var="allTrainers" value="/findAllTrainers"/>
  <a href="${allTrainers }" class="w3-button">Select a Trainer</a>
    <div class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"> <c:url value="/logout" var="logout"/>
  <form action="${logout}" method="POST">
		<input type="submit" value="Logout"/>
	</form></div>
 </div>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Client Name</a>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center"><c:out value="${user.getFullName() }"/></h4>
         <p class="w3-center"><c:url value="/img/womanRopes.jpg" var="womanRopesPic"/>
            <img class="womanRopes" src="${womanRopesPic}" alt="woman working ropes" style="height:106px;width:106px"></p>
         <hr>
         <p><strong>Don't Forget Why You Started: <c:out value="${user.goals }"/></strong>
        </div>
      </div>
      <br>
      
      <!-- Accordion -->
      <div class="w3-card w3-round">
        <div class="w3-white">
          <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My Training Groups</button>
          <div id="Demo1" class="w3-hide w3-container">
            <p>Some text..</p>
          </div>
          <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</button>
          <div id="Demo3" class="w3-hide w3-container">
          	<p>Link to pictures uploaded in the future</p>
         <div class="w3-row-padding">
         
         <br>
           <div class="w3-half">
             <img src="/w3images/lights.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/mountains.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/forest.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/fjords.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
         </div>
          </div>
        </div>      
      </div>
      <br>
      
      <!-- Interests --> 
      <div class="w3-card w3-round w3-white w3-hide-small">
        <div class="w3-container">
          <p>Training Interests</p>
          <p>
            <span class="w3-tag w3-small w3-theme-d5">Weight gain</span>
            <span class="w3-tag w3-small w3-theme-d4">Fat loss</span>
            <span class="w3-tag w3-small w3-theme-d3">Sports Perfomance</span>
            <span class="w3-tag w3-small w3-theme-d2">Lacrosse</span>
            <span class="w3-tag w3-small w3-theme-d1">Friends</span>
            <span class="w3-tag w3-small w3-theme">Games</span>
            <span class="w3-tag w3-small w3-theme-l1">Football</span>
            <span class="w3-tag w3-small w3-theme-l2">Food</span>
            <span class="w3-tag w3-small w3-theme-l3">Hiking</span>
          </p>
        </div>
      </div>
      <br>
 
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">

      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <img src="/w3images/avatar2.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity">1 min</span>
        <h4>Trainer Posting on Wall</h4><br>
        <hr class="w3-clear">
        <p>Text for article.</p>
          <div class="w3-row-padding" style="margin:0 -16px">
          <div class="w3-half">
          
          <c:url value="/img/tenTrails.jpg" var="tenTrailsPic"/>
    	  <img class="tenTrails" src="${tenTrailsPic}" alt="10 must hike trails" width="99%">
            
              <!-- <img src="/w3images/lights.jpg" style="width:100%" alt="Image" class="w3-margin-bottom"> -->
            </div>
            <div class="w3-half">
            
          <c:url value="/img/nuts.jpg" var="nutsPic"/>
    	  <img class="nuts" src="${nutsPic}" alt="nuts magazine article" width="99%">
            
              <!-- <img src="/w3images/nature.jpg" style="width:100%" alt="image" class="w3-margin-bottom"> -->
          </div>
        </div>
        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
      </div>
      
     
      
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <p>Upcoming Available Events:</p>
          
          <c:url value="/img/backViewHoldingBar.png" var="backViewHoldingBar"/>
    	  <img class="backViewHoldingBar" src="${backViewHoldingBar}" alt="back view of man holding bar" width="99%">
    	  
          <!-- <img src="/w3images/forest.jpg" alt="Image here" style="width:60%; height:40%;"> -->
          <p><strong>Get a jumpstart on losing holiday weight!</strong></p>
          <p>Friday 4:00pm</p>
          <p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
        </div>
      </div>
      <br>
     
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>
 
			<div id="successful-request-modal" class="modal">
                
                  <!-- Modal content -->
                  <div class="modal-content">
                    <span class="close">&times;</span>
                    <p><c:out value="${message}"/></p>
                  </div>
                
                </div>
                
                 <script>
                 $(function(){
                	 
               
                // Get the modal
                var modal = document.getElementById('successful-request-modal');
                
           
                // Get the <span> element that closes the modal
                var span = document.getElementsByClassName("close")[0];
                
                // When the user clicks the button, open the modal 
                 <c:if test="${!empty(message)}">
                    modal.style.display = "block";
                </c:if>
                
                // When the user clicks on <span> (x), close the modal
                span.onclick = function() {
                    modal.style.display = "none";
                }
                
                // When the user clicks anywhere outside of the modal, close it
                window.onclick = function(event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
                 });
                </script>
                
<!-- Footer -->

<footer class="w3-container w3-theme-d5">
  <p>Copyright &copy; Raise the Bar 2017</p>
</footer>
 
<script>
// Accordion
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-theme-d1";
    } else { 
        x.className = x.className.replace("w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-theme-d1", "");
    }
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}


</script>

</body>
</html> 