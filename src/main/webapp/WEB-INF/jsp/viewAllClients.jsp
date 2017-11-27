<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="css/test_css.css" rel="stylesheet" title="logincss"/>
    <!-- <script src="js/login.js"></script> -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Raise The Bar</title>
</head>
<body class="color-back">
<h1>All Clients</h1>
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
                <p><c:out value="${client.goal}"/>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            </div>
            <div class="btns">    
            	<c:url var="viewClient" value="/viewAllClients"/>
				<form action="${viewClient}" method="POST">
				<button type="submit" name ="userID" value="${client.id }" class="view-btn">View Client</button>
				</form>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>