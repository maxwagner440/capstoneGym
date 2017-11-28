<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
		<link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">
    <link href="css/trainerNotes.css" rel="stylesheet" title="uploadcss"/>
    
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
    <!-- <header>
        <nav class="w3-top">
            <div class="w3-bar w3-white w3-wide w3-padding w3-card">
                <c:url var="home" value="/"/>
                <a href="${home}" class="w3-bar-item w3-button"><b>Raise the Bar</b></a>
                //Float links to the right. Hide them on small screens
                <div class="w3-right w3-hide-small">
            
                
                <a href="" class="w3-bar-item w3-button">About</a>
                <a href="#projects" class="w3-bar-item w3-button">Training Specialties</a>
                <a href="#trainers" class="w3-bar-item w3-button">Trainers</a>
                <a href="#contact" class="w3-bar-item w3-button">Contact</a>
                <c:url var="login" value="/login"/>
                <a href="${login}" class="w3-bar-item w3-button">Login / Sign-Up</a>
                </div>
            </div>
        </nav>
    </header> -->
    <scetion id="full-container">
        <div id="space-one"></div>
        <section id="client-container">
            <section id="client-prof">
                <div class="client-name">
                    <h2><c:out value="${client.getFullName()}"/>NAME</h2>
                </div>
                <div class="client-image">
                    <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png">
                </div>
            </section>
            <section id="client-info">
                <div class="client-height">
                    <h2>Height:</h2>
                    <p><c:out value="${client.height}"/>42</p>
                </div>
                <div class="client-weight">
                    <h2>Weight:</h2>
                    <p><c:out value="${client.weight}"/>42</p>    
                </div>
                <div class="client-goal">
                    <h2>Goal:</h2>
                    <p><c:out value="${client.goal}"/>Lorem ipsum dolor sit amet, ei noster melius laboramus mea, ipsum tempor eu quo. Quo choro diceret delicata cu, dolorem facilisi mei ea. At eos summo admodum, reque iudicabit qui ne. Facer recteque nam an. Cu facer corpora vix. Mei tale voluptatibus ut.</p>        
                </div>
            </section>
            <section id="workout">
				<c:url var=""/>
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
						<c:forEach var="note" items="${notes}">
							<div class="general-note-section">
								<p><c:out value="${client.note.content}"/>Lorem ipsum dolor sit amet, ei noster melius laboramus mea, ipsum tempor eu quo. Quo choro diceret delicata cu, dolorem facilisi mei ea. At eos summo admodum, reque iudicabit qui ne. Facer recteque nam an. Cu facer corpora vix. Mei tale voluptatibus ut.
									
									Ornatus platonem id pro, ridens aliquam veritus sit cu. Ludus laudem legimus est an. Imperdiet consetetur vel et, te stet mucius quodsi sit, blandit consequat id pri. His ad dicant essent deterruisset, ex pri viris exerci. Stet fabulas constituam duo ea, errem petentium ex eum.</p>
							</div>
						</c:forEach>
						<div class="general-note-btns">
							<button class="add-note-btn" type="input">+ New Note</button>
							<button class="remove-note-btn" type="input">Remove Note</button>
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
								<p><c:out value="${workout.note.content}"/>There is content here.</p>
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