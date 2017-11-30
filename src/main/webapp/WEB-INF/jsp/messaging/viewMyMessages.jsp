<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE <!DOCTYPE html>
<html lang="en">
<head>
    <link href="css/getAll.css" rel="stylesheet" title="logincss"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Raise the Bar</title>
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
<h1>All Messages</h1>
<div class="search-page">
    <c:forEach var="message" items="${messages}">
        <div class="profile">
            <div class="left-prof">
                <div class="head-two">
                    <h2>Username: <c:out value="${message.username}"/></h2>
                </div>
                <!-- <div class="prof-pic">
                    <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png"/>
                </div> -->
                <div class="small-info">
                    <h4>Date: <c:out value="${message.getDate()}"/></h4>
                    <h4>Location: New York
                    <h4>Other Stuff: More Stuff</h4>
                </div>
            </div>
            <div class="info">
                <h3>Message: </h3>
                <p><c:out value="${message.content}"/></p>
            </div>
            <div class="btns">
                <div class="view-btn-div">
	                <c:url value="/replyMessage" var="replyMessage"/>
	                <form action="${replyMessage}" method="GET">
					<input type="hidden" name="receiverId" value="${message.messageCreatorUserId}"/>
	                <button type="submit" class="view-btn">Reply</button>
	                </form>
                </div>
                <div class="msg-btn-div">
                    <button class="msg-btn">Archive?</button>
                </div>
                <div class="rqst-btn-div">
                    <button class="delete-btn">Delete</button>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>