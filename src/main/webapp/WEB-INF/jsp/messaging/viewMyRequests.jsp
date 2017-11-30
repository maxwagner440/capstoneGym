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
<h1>Clients Making A Request</h1>
<div class="search-page">
    <c:forEach var="client" items="${clients}">
        <div class="profile">
            <div class="left-prof">
                <div class="head-two">
                    <h2><c:out value="${client.getFullName()}"/></h2>
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
                <h3>Goal: </h3>
                <p><c:out value="${client.goals}"/></p>
            </div>
            
            <div class="btns">    
            	<c:url var="acceptReq" value="/acceptRequest"/>
				<form action="${acceptReq}" method="POST">
				<button type="submit" name ="clientId" value="${client.clientId}" class="view-btn"> Accept</button>
				</form>
				
           		<br>
           		
                <c:url value="/denyRequest" var="denyReq"/>
                <form action="${denyReq}" method="POST">

                <button type="submit" class="delete-btn" name ="clientId" value="${client.clientId}">Deny</button>
                </form>
            </div>
            
         
        </div>
    </c:forEach>
</div>
</body>
</html>