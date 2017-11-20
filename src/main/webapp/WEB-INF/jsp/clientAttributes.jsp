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
	<div class="form">  
	    <ul class="tab-group">
	      <li class="tab active">Fill Out Your Bio</li>
	    </ul>
	    <div>
	    	<c:url value="/clientAttributes" var="clientPathing"/> 
	    	<form:form method="POST" action="${clientPathing}" modelAttribute="client">
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
	    	</form:form>
	    </div>     
    </div>
   
</body>
</html>