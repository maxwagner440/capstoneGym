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
<script type="text/javascript">
	$(document).ready(function () {
	
		$("form").validate({		
			rules : {
				price : {
					required : true
				},			
				philosophy : {
					required : true
				},
				bio : {
					required : true
				},
				experience : {
					required: true
				}
			},
			messages : {
				price : {
					required : "Please enter your going rate."
				},
				philosophy : {
					required : "Please enter your personal philosophy."
				},
				bio : {
					required : "Please enter some information about yourself."
				},
				experience : {
					required : "Please enter training experience."
				}
			},
			errorClass : "error"
		});
	});
</script>
	<div class="reg-whole">     
	    <div class="reg-form">
	     	<h2 class="reg-head">Fill In Your Bio</h2>
	    	<c:url value="/trainerAttributes" var="trainerPathing"/> 
	    	<form:form method="POST" action="${trainerPathing}" modelAttribute="trainer">
	    		<input type="hidden" name="firstName" value="${user.firstName}"/>
		    	<input type="hidden" name="lastName" value="${user.lastName}"/>
		    	<input type="hidden" name="email" value="${user.email}"/>
		    	<input type="hidden" name="username" value="${user.username}"/>
		    	<input type="hidden" name="age" value="${user.age}"/>
		    	<input type="hidden" name="role" value="${user.role}"/>
		    	
	    		<div class="field-wrap">
	    			<form:input class="text-line" path="trainerHourlyPrice" placeholder="Set your hourly rate"/>
                </div>
	    		<div class="field-box">
	    			<form:textarea class="text-box" path="exercisePhilosophy" placeholder="What motivates you?"></form:textarea>
	    		</div>
	    		<div class="field-box">
	    			<form:textarea class="text-box" path="bio" placeholder="What would you like your clients to know about you?"></form:textarea>
	    		</div>
	    		<div class="field-box">
	    			<form:textarea class="text-box" path="pastExperience" placeholder="What is your training experience?"></form:textarea>
	    		</div>
	    		<div>
	    			<input class="button button-block" type="submit" value="Submit"/>
	    		</div>
	    		
	    	</form:form>
	    </div> 
    </div>
</body>
</html>