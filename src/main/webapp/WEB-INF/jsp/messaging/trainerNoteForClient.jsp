<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">
    <link href="css/trainerNotes.css" rel="stylesheet" title="uploadcss"/>
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
    <script
        src="https://code.jquery.com/jquery-3.2.1.min.js"
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
        crossorigin="anonymous">
    </script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Raise the Bar</title>
</head>
<body>
    <script>
        $(document).ready(function(){
            $('.extend-general').on('click', function(){
				$('.general-panel').slideToggle(800);
            });
            $('.extend-specific').on('click', function(){
                $('.specific-panel').slideToggle(800);
            });
        });     
    </script>
    <!-- Modal for creating notes -->
    <div id="notesButton" class="modal">
                
                  <!-- Modal content -->
                  <div class="modal-content">
                    <span class="close">&times;</span>
                    <c:url var="makeNote" value="/trainerNotes"/>
                    <form action="${makeNote }" method="POST">
                    	<input type="text" name="note">
                    	<input type="hidden" name="clientId" value="${client.clientId}"/>
   						<input type="submit" />
                    </form>
                  </div>
                
                </div>
                
                 <script>
                 $(function(){
                	 
               
                // Get the modal
                var modal = document.getElementById('notesButton');
                
           
                // Get the <span> element that closes the modal
                var span = document.getElementsByClassName("close")[0];
                
                // When the user clicks the button, open the modal 
             	$(".add-note-btn").on("click", function(){
                    modal.style.display = "block";
             	})
                
                
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
                 <!-- Model for looking at ALL NOTES -->
                 <div id="viewNotesButton" class="modal">
                
                  <!-- Modal content -->
                  <div class="modal-content">
                    <span class="close">&times;</span>
                    
                    <c:forEach items="${notes}" var="note">
               			<div class="general-note-section">
               			<div class="note-content">
               				<c:out value="${note.content }"/>
               			</div>
               			<div class="note-timestamp">
               				<c:out value="${note.getDate()} ${note.getTime() }"/>
               			</div>
               			</div>
               			<br>
               		</c:forEach>
                    </form>
                  </div>
                
                </div>
                
                 <script>
                 $(function(){
                	 
               
                // Get the modal
                var modal = document.getElementById('viewNotesButton');
                
           
                // Get the <span> element that closes the modal
                var span = document.getElementsByClassName("close")[1];
                
                // When the user clicks the button, open the modal 
             	$(".view-note-btn").on("click", function(){
                    modal.style.display = "block";
             	})
                
                
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
                 
   <header>
    <nav id="top-nav">
        <div class="nav-bar">
            <div class="nav-raise-logo">
                <c:url var="home" value="/"/>
                <a href="${home}" class="w3-bar-item w3-button"><b>Raise the Bar</b></a>
                <!-- Float links to the right. Hide them on small screens -->
            </div>
            <div class="nav-bar-links"> 
                <a href="" class="about">About</a>
                <p>|</p>
                <a href="#projects" class="training">Training Specialties</a>
                <p>|</p>
                <a href="#trainers" class="trainers">Trainers</a>
                <p>|</p>
                <a href="#contact" class="contacts">Contact</a>
                <p>|</p>
                <c:url var="login" value="/login"/>
                <a href="${login}" class="login">Login / Sign-Up</a>
            </div>
        </div>
    </nav>
</header>
    <scetion id="full-container">
        <div id="space-one"></div>
        <section id="client-container">
            <section id="client-prof">
                <div class="client-name">
                    <h2><c:out value="${client.getFullName()}"/></h2>
                </div>
                <div class="client-image">
                    <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png">
                </div>
            </section>
            <section id="client-info">
                <div class="client-height">
                    <h2>Height:</h2>
                    <p><c:out value="${client.heightInInches}"/> inches</p>
                </div>
                <div class="client-weight">
                    <h2>Weight:</h2>
                    <p><c:out value="${client.weightInPounds}"/> pounds</p>    
                </div>
                <div class="client-goal">
                    <h2>Goal:</h2>
                    <p><c:out value="${client.goals}"/></p>        
                </div>
            </section>
            <section id="workout">
				<%-- <c:url var=""/> --%>
                <div class="client-workout">
                    <h2><c:out value="${workout.id}"/>I Workout</h2>
				</div>
				<div class="add-workout">
					<h2>+</h2>
				</div>
            </section>
            <section id="notes">
                <div class="general-notes">
                    <div class="extend-general">
                        <h3>+</h3>
                    </div>
					<h2>General Notes</h2>
					<div class="general-panel" style="display: none;">
						<%-- <c:forEach var="note" items="${notes}">
							<div class="general-note-section">
								<p><c:out value="${note.content}"/>
									
									</p>
							</div>
						</c:forEach> --%>
						<div class="general-note-btns">
							<button class="add-note-btn" type="input">+ New Note</button>
							<button class="remove-note-btn" type="input">Remove Note</button>
							<button class="view-note-btn" type="input">View All Notes</button>
						</div> 
					</div>
                </div>
                <div class="specific-notes">
                    <div class="extend-specific">
                        <h3>+</h3>
                    </div>
					<h2>Workout Notes</h2>
					<div class="specific-panel" style="display:none;">
						<c:forEach var="note" items="${notes}">
							<div class="specific-note-section">
								<%-- <p><c:out value="${workout.note.content}"/> --%>There is content here.</p>
							</div>	
						</c:forEach>
						<div class="specific-note-btns">
							<label for="file" class="file-customize">Upload Workout</label>
							<input type="file" id="file" name="file">
							<button class="add-note-btn" type="input">+ New Note</button>
							<button class="remove-note-btn" type="input">Remove Note</button>
						</div>
                </div>
            </section>
    </section>
    <div id="space-two"></div>
</scetion>
</body>
</html>