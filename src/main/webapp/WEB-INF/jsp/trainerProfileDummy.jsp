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
<h1>Trainer Profile Page</h1>
<c:out value="${trainer.getFullName() }"/>

<div id="signup-for-trainer">
	<c:url var="signupWithTrainer" value="/signUpWithTrainer"/>
	<form action="${signupWithTrainer}" method="POST">
		<input type="hidden" name="trainerId" value="${trainer.id }"/>

		<input type="submit"/>
	</form>
</div>

<div id="send-trainer-message">
	<for>


</div>
