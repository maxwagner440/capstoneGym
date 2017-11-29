<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!DOCTYPE html>
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
<h1>All My Clients</h1>
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
            	<c:url var="viewMyClient" value="/viewAllClients"/>
				<form action="${viewMyClient}" method="POST">
				<button type="submit" name ="userID" value="${client.clientId}" class="view-btn">View Client</button>
				</form>
            </div>
            <div class="btns">    
            	<c:url var="viewMyClient" value="/viewAllClients"/>
				<form action="${viewMyClient}" method="POST">
				<button type="submit" name ="userID" value="${client.clientId}" class="view-btn"> Client</button>
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