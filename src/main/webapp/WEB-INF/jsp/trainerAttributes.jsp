<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%-- <c:import url="/WEB-INF/jsp/common/header.jspf" /> --%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link href="css/capstone.css" rel="stylesheet" title="logincss"/>
    <script src="js/login.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Raise The Bar</title>
</head>
<body>
	<div class="reg-whole">  
	    <h2 class="reg-head">Fill In Your Bio</h2>
	    <div class="reg-form">
	    	<c:url value="/usersTrainerAttributes" var="trainerPathing"/> 
	    	<form:form method="POST" action="${trainerPathing}">
	    	
	    		<div class="field-wrap">
	    			<label name="trainerHourlyPrice">Set Your Hourly Rate: </label>
	    			<form:input path="price" placeholder="Set your hourly rate"/>
	    		</div>
	    		<div class="field-box">
	    			<label name="exercisePhilosophy">Training Philosophy: </label>
	    			<form:input path="philosophy" placeholder="What motivates you?"/>
	    		</div>
	    		<div class="field-box">
	    			<label name="bio">Personal Bio: </label>
	    			<form:input path="bio" placeholder="What would you like your clients to know about you?"/>
	    		</div>
	    		<div class="field-box">
	    			<label name="pastExperience">Personal Training Experience: </label>
	    			<form:input path="experience" placeholder="What is your training experience?"/>
	    		</div>
	    		<div>
	    			<input class="button button-block" type="submit" value="Submit"/>
	    		</div>
	    	</form:form>
	    </div> 
    </div>
</body>
</html>