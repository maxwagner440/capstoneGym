<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/navBar.jspf" />
<!DOCTYPE html>
<html lang="en">
<head>
	<link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">
	<link href="css/getAll.css" rel="stylesheet" title="getallcss"/>
	<!-- <link href="css/navBar.css" rel="stylesheet" title="navbarcss"/> -->
    
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
<h1>All My Clients</h1>
<div class="search-page">
    <c:forEach var="client" items="${clients}">
        <div class="profile">
            <div class="left-prof">
                <div class="head-two">
                    <h2><c:out value="${client.getFullName()}"/></h2>
                </div>
                <div class="prof-pic">
                    <img src="https://cdn.shopify.com/s/files/1/1222/3190/products/i_am_mr_meeseeks_rick_and_morty_tv_show_tshirt_in_India_by_silly_punter_4adada1e-1912-47dd-865b-e78ce7608415.jpg?v=1504446230"/>
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
            	<c:url var="viewMyClient" value="/trainerNotes"/>
				<form action="${viewMyClient}" method="POST">
				<button type="submit" name ="userID" value="${client.clientId}" class="view-btn">View Client</button>
				</form>
            </div>
            <div class="btns">    
            	<c:url var="viewMyClient" value="/viewAllClients"/>
				<form action="${viewMyClient}" method="POST">
				<button type="submit" name ="userID" value="${client.clientId}" class="view-btn">View Client</button>
				</form>
				
           		<br>
           		
                <c:url value="/replyMessage" var="replyMessage"/>
                <form action="${replyMessage}" method="GET">
				<input type="hidden" name="receiverId" value="${client.id}"/>
                <button type="submit" class="view-btn">Message</button>
                </form>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>