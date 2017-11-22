<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <link href="css/capstone.css" rel="stylesheet" title="logincss"/>
    <!-- <script src="js/login.js"></script> -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Raise The Bar</title>
</head>
<body class="color-back">
<h1>All Trainers</h1>
<div class="search-page">
    <c:forEach var="trainer" items="${trainers}">
        <div class="trainer-profile">
            <div class="left-prof">
                <div class="head-two">
                    <h2><c:out value="${trainer.firstName + trainer.lastName}"/>NAME</h2>
                </div>
                <div class="trainer-prof-pic">
                    <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png"/>
                </div>
                <div class="small-info">
                    <h4>Location: New York<c:out value="${trainer.location}"/></h4>
                    <h4>Other Stuff: More Stuff</h4>
                </div>
            </div>
            <div class="bio-info">
                <h3>Bio: </h3>
                <p><c:out value="${trainer.bio}"/>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            </div>
            <div class="btns">
                <div class="view-btn-div">
                    <button class="view-btn">View Trainer</button>
                </div>
                <div class="msg-btn-div">
                    <button class="msg-btn">Message</button>
                </div>
                <div class="rqst-btn-div">
                    <button class="rqst-btn">Request</button>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</body>