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
<h1>All Trainers</h1>
<c:forEach items="${trainers }" var="trainer">
	<div class="trainer-info-summary-bar">
		<h2><c:out value="${trainer.firstName + trainer.lastName}"/>NAME</h2>
		<div class="trainer-prof-pic">
			<img src="#"/>
		</div>
		<div class="small-info">
			<h4><c:out value="${trainer.location}"/></h4>
		</div>
		<div class="bio-info">
			<h3>Bio: </h3>
			<p><c:out value="${trainer.bio}"/></p>
		</div>

		<c:url var="trainerProfile" value="/trainerProfile"/>
		<form action="${trainerProfile }" method="POST">
			<input type="hidden"  name ="trainerId" value="${trainer.id }"/>
			<input type="submit"/>
		</form>
	</div>

</c:forEach>