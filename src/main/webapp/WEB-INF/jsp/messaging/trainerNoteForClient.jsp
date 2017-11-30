<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="css/trainerNotes.css" rel="stylesheet" title="uploadcss"/>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js">
    </script>
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
                  	<div class="message-head">
                  		<span class="close">&times;</span>
                  		<h2>New Note</h2>
                  	</div>
    				<div class="message-body">
                    <c:url var="makeNote" value="/trainerNotes"/>
	                    <form action="${makeNote}" method="POST">
	                    	<textarea class="note-input" type="text" name="note"></textarea>
	                    	<input type="hidden" name="clientId" value="${client.clientId}"/>
	   						<input class="note-submit" type="submit" style="
								    width: 75px;
								    height: 50px;
								    background: #5f5fb4;
								    color: #fff;
								    border: none;
								    font-size: 1em;
								    border-radius: 5px;
								">
	                    </form>
                    </div>
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
                  	
                    <c:forEach items="${notes}" var="note">
               			<div class="general-note-section">
	               			<div class="view-notes-heading">
		                    	<span class="close">&times;</span>
		                    	<h2>View Notes</h2>
	                    	</div>
	                    	<div class="view-note-body">
		               			<div class="note-content">
		               				<c:out value="${note.content}"/>
		               			</div>
		               			<div class="note-timestamp">
		               				<c:out value="Date: ${note.getDate()}  Time: ${note.getTime() }"/>
		               			</div>
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
                <a href="${home}" class="home-one"><strong>Raise the Bar</strong></a>
                <!-- Float links to the right. Hide them on small screens -->
            </div>
            <div class="nav-bar-links"> 
                <a href="#profile" class="linked">Profile</a>
                <p>|</p>
                <a href="#projects" class="linked">Training Specialties</a>
                <p>|</p>
                <a href="#trainers" class="linked">Trainers</a>
                <p>|</p>
                <a href="#contact" class="linked">Contact</a>
                <p>|</p>
                <c:url var="login" value="/login"/>
                <a href="${login}" class="linked">Login / Sign-Up</a>
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
                    <img src="https://cdn.shopify.com/s/files/1/1222/3190/products/i_am_mr_meeseeks_rick_and_morty_tv_show_tshirt_in_India_by_silly_punter_4adada1e-1912-47dd-865b-e78ce7608415.jpg?v=1504446230">
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