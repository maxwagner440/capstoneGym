<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<div class="form">  
    <ul class="tab-group">
      <li class="tab active"><a href="#signup">Sign Up</a></li>
      <li class="tab"><a href="#login">Log In</a></li>
    </ul>
      
      <div class="tab-content">
        <div id="signup">   
        <h1>Sign Up for Free</h1>
	        <c:import url="/WEB-INF/jsp/registrationClient.jspf"/>
	        <c:import url="/WEB-INF/jsp/registrationTrainer.jspf"/>
	    </div>  

        </div>
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          <c:url var="loginAction" value="/login"/>
          	<form action="${loginAction}" method="POST">
	        <input type="hidden" name="destination" value="${param.destination}"/>
	  		<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
	            <div class="field-wrap">
	            	<input type="email"required autocomplete="off" placeholder="Email Address"/>
	          	</div>
          
          		<div class="field-wrap">
            		<input type="password"required autocomplete="off" placeholder="Password"/>
          		</div>
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          <button class="button button-block">Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
</body>
</html>