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
	
		$("form").validate({		
			rules : {
				weight : {
					required : true,
					min : 0
				},			
				height : {
					required : true,
					min : 0
				},
				goals : {
					required : true
				},
				modality : {
					required: true
				}
			},
			messages : {
				weight : {
					required : "Please enter your weight.",
					min : "Please enter a positive weight value."
				},
				height : {
					required : "Please enter your height.",
					min : "Please enter a positive height value."
				},
				modality : {
					required : "Please enter your training preferences."
				},
				goals : {
					required : "Please enter your goals."
				}
			},
			errorClass : "error"	
		});
	});
</script>
	<div class="reg-whole">  
        <div class="reg-form">
            <h2 class="reg-head">Fill In Your Bio</h2>
            <c:url value="/clientAttributes" var="clientPathing"/> 
            <form:form method="POST" action="${clientPathing}" modelAttribute="client">
		    	<input type="hidden" name="firstName" value="${user.firstName}"/>
		    	<input type="hidden" name="lastName" value="${user.lastName}"/>
		    	<input type="hidden" name="email" value="${user.email}"/>
		    	<input type="hidden" name="username" value="${user.username}"/>
		    	<input type="hidden" name="age" value="${user.age}"/>
		    	<input type="hidden" name="role" value="${user.role}"/>
		    	<div class="top-row">
                	<div class="field-wrap">
                        <input class="text-line" name="weight" path="weightInPounds" placeholder="Enter your weight (lbs.)"/>
                    </div>
                    <div class="field-wrap">
                        <input class="text-line" name="height" path="heightInInches" placeholder="Enter your height (in.)"/>
                    </div>
                </div>
                <div class="field-box">
                    <textarea class="text-box" name="modality" path="modalityPreference" placeholder="What are you looking to train in?"></textarea>    
                </div>
                <div class="field-box">
                    <textarea class="text-box" name="goals" path="goals" placeholder="What are your goals?"></textarea>
                </div>
                <div>
                    <input class="button button-block" type="submit" value="Submit"/>
                </div>
	    	
	    		<form:errors path="*"/>

	    	</form:form>
	    </div>     
    </div>
   
</body>
</html>