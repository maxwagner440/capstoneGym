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
	    	<c:url value="/clientAttributes" var="clientPathing"/> 
	    	<form:form method="POST" action="${clientPathing}" modelAttribute="client">
	    	<input type="hidden" name="destination" value="${param.destination}"/>
	  		 <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/> 
	    		
	    		<div class="field-wrap">
	    			
	    			<form:input path="weightInPounds" placeholder="Enter your weight"/>
	    			<form:errors path="weightInPounds" cssClass="error"/> 
	    		</div>
	    		<div class="field-box">
	    			
	    			<form:input path="heightInInches" placeholder="How Tall Are You?"/>   
	    			<form:errors path="heightInInches" cssClass="error"/>  
	    		</div>
	    		<div class="field-box">
	    			
	    			<form:input path="modalityPreference" placeholder="What are you looking to train in?"/>   
	    			<form:errors path="modalityPreference" cssClass="error"/>  
	    		</div>
	    		<div class="field-box">
	    		
	    			<form:input path="goals" placeholder="What are your goals?"/>
	    			<form:errors path="goals" cssClass="error"/> 
	    		</div>
	    		<div>
	    			<input class="button button-block" type="submit" value="Submit"/>
	    		</div>
	    	</form:form>
	    </div>     
    </div>
   
</body>
</html>