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
<h1>Trainer Dashboard Page</h1>

<div id="trainer-privacy">
	<c:out value="Your privacy is currently ${user.visibility ? 'public' : 'private'}"/>
	<c:url var="changePrivacy" value="/trainerDashboard"/>
	<form action="${changePrivacy}" method="POST">
		<input type="submit"/>
	</form>
</div>