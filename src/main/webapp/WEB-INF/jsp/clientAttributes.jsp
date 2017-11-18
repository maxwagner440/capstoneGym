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
	<div class="form">  
	    <ul class="tab-group">
	      <li class="tab active">Fill Out Your Bio</li>
	    </ul>
	    <div>
	    	<c:url value="/usersClientAttributes" var="clientPathing"/> 
	    	<form:form method="POST" action="${clientPathing}">
	    		<div class="field-wrap">
	    			<label name="age">Age: </label>
	    			<form:input path="age" placeholder="Enter your age"/>
	    		</div>
	    		<div class="field-wrap">
	    			<label name="weight">Weight: </label>
	    			<form:input path="weight" placeholder="Enter your weight"/>
	    		</div>
	    		<div class="field-box">
	    			<label name="modality">Type of Exercise: </label>
	    			<form:input path="classOffer" placeholder="What are you looking to train in?"/>    
	    		</div>
	    		<div class="field-box">
	    			<label name="goal">Personal Goals: </label>
	    			<form:input path="goal" placeholder="What are your goals?"/>
	    		</div>
	    		<div>
	    			<input class="button button-block" type="submit" value="Submit"/>
	    		</div>
	    	</form:form>
	    </div>     
    </div>
   
</body>
</html>