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
<h1>All Messages</h1>
<div class="search-page">
    <c:forEach var="message" items="${messages}">
        <div class="profile">
            <div class="left-prof">
                <div class="head-two">
                    <h2><c:out value="${message.username}"/>NAME</h2>
                </div>
                <!-- <div class="prof-pic">
                    <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png"/>
                </div> -->
                <div class="small-info">
                    <h4>Date: <c:out value="${message.dateTime}"/></h4>
                    <h4>Location: New York<c:out value="${message.location}"/></h4>
                    <h4>Other Stuff: More Stuff</h4>
                </div>
            </div>
            <div class="info">
                <h3>Message: </h3>
                <p><c:out value="${message.content}"/>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            </div>
            <div class="btns">
                <div class="view-btn-div">
                    <button class="view-btn">Reply</button>
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