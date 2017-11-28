<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="css/getAll.css" rel="stylesheet" title="logincss"/>
    <!-- <script src="js/login.js"></script> -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Raise The Bar</title>
</head>
<body class="color-back">
<h1>All Trainers</h1>
<div class="search-page">
	<div>
		<c:url var="searchTrainers" value="/searchTrainers"/>
		<form action="${searchTrainers}" method="POST" >
			<input id="searchBox"  type="search" name="keyword" placeholder="Search for a trainer">
		</form>
	</div>
	<c:out value="${message}"/>
	<c:choose>
	<c:when test="${trainers == null || trainers.size() == 0 }">
	    <div class="no-trainer-div">
	        <p class="no-trainer">No trainers by that name, please try again.</p>
	    </div>
        </c:when>
        <c:otherwise>	
            <c:forEach var="trainer" items="${trainers}">
        		<div class="profile">
            		<div class="left-prof">
                		<div class="head-two">
                    		<h2><c:out value="${trainer.getFullName()}"/></h2>
                		</div>
                		<div class="prof-pic">
                    		<img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png"/>
                		</div>
                		<div class="small-info">
                    		<h4>Location: New York<c:out value=""/></h4>
                    		<h4>Other Stuff: More Stuff</h4>
                		</div>
            		</div>
            		<div class="info">
                		<h3>Bio: </h3>
                		<p><c:out value="${trainer.bio}"/></p>
                	</div>
           			<div class="btns">    
                		<c:url var="signupWithTrainer" value="/findAllTrainers"/>
                		<form action="${signupWithTrainer}" method="POST">
                			<button type="submit" name ="userID" value="${trainer.id }" class="view-btn">View Trainer</button>
                		</form>
            		</div>
        		</div>
    		</c:forEach>
    	</c:otherwise>
    </c:choose>
</div>
</body>
</html>