<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<c:import url="/WEB-INF/jsp/common/header.jspf" />
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
	
		$("signup").validate({		
			rules : {
				weight : {
					required : true
				},			
				height : {
					required : true
				},
				goals : {
					required : true,
					min: 13
				},
				modality : {
					required: true
				}
			},
			messages : {
				firstName : {
					required : "Please enter your first name."
				},
				lastName : {
					required : "Please enter your last name."
				},
				age : {
					required : "Please enter your age.",
					min: "You must be 13 years of age or older."
				},
				username : {
					required : "Please enter a username."
				},
				email : {
					required : "Please enter an email.",
					email: "Please enter a valid email"
				},
				password : {
					required : "Please enter a valid passowrd."
				},
				confirmPassword : {
					required : "Please enter a matching password.",
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error",			
	});
</script>
	<div class="form">  
	    <ul class="tab-group">
	      <li class="tab active">Fill Out Your Bio</li>
	    </ul>
	    <div>
	    	<c:url value="/clientAttributes" var="clientPathing"/> 
	    	<form:form method="POST" action="${clientPathing}" modelAttribute="client">
		    	<input type="hidden" name="firstName" value="${user.firstName}"/>
		    	<input type="hidden" name="lastName" value="${user.lastName}"/>
		    	<input type="hidden" name="email" value="${user.email}"/>
		    	<input type="hidden" name="username" value="${user.username}"/>
		    	<input type="hidden" name="age" value="${user.age}"/>
		    	<input type="hidden" name="role" value="${user.role}"/>
	    	
	    		<form:errors path="*"/>
	    		<%-- <div class="field-wrap">
	    			<label name="age">Age: </label>
	    			<form:input path="age" placeholder="Enter your age"/>
	    		</div> --%>
	    		<div class="field-wrap">
	    			
	    			<form:input path="weightInPounds" placeholder="Enter your weight"/>
	    			<form:errors path="weightInPounds" cssClass="error"/> 
	    		</div>
	    		<div class="field-box">
	    			
	    			<form:input path="modalityPreference" placeholder="What are you looking to train in?"/>  
	    			<form:errors path="modalityPreference" cssClass="error"/> 
	    			  
	    		</div>
	    		<div class="field-box">
	    		
	    			<form:input path="goals" placeholder="What are your goals?"/>
	    			<form:errors path="goals" cssClass="error"/> 
	    		</div>
	    		<div class="field-box">
	    		
	    			<form:input path="heightInInches" placeholder="What Is Your Height In Inches?"/>
	    			<form:errors path="heightInInches" cssClass="error"/> 
	    		</div>
	    		<div>
	    			<input class="button button-block" type="submit" value="Submit"/>
	    		</div>
	    	</form:form>
	    </div>     
    </div>
   
</body>
</html>