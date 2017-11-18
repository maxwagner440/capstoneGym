<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%-- <c:import url="/WEB-INF/jsp/common/header.jspf" /> --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="css/capstone.css" rel="stylesheet" title="logincss"/>
    <!-- <script src="js/login.js"></script> -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Raise The Bar</title>
</head>
<body>
	<div class="form">  
    <ul class="tab-group">
   	  <li id="login_tab" class="tab active"><a href="#login">Log In</a></li>
      <li id="signup_tab" class="tab"><a href="#signup">Sign Up</a></li>
    </ul>
      
      <div class="tab-content">
        <div id="signup">   
        <h1>Sign Up for Free</h1>
	       <c:url var="registerAction" value="/newUserRegistration"/> 
	       <form:form action="${registerAction}" method="POST" modelAttribute="user">
	       		<form:input type="hidden" path="destination" value="${param.destination}"/>
	 			<form:input type="hidden" path="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
	 			<form:input type="hidden" path="${id}"/>
	        
	         	<div class="top-row">
	          		<div class="field-wrap">
	            		 <form:input type="text" required autocomplete="off" placeholder="First Name" path="firstName"/>
	           		</div>
	          		<div class="field-wrap">
	            		 <form:input type="text"required autocomplete="off" placeholder="Last Name" path="lastName"/>
	           		</div>
	         	</div>
	         	<div class="field-wrap">
	          		<form:input type="text"required autocomplete="off" placeholder="Age" path="age"/>
	         	</div>
	         	<div class="field-wrap">
	        		<form:input type="text"required autocomplete="off" placeholder="Username" path="username"/>
	      		</div>
	         	<div class="field-wrap">
	          		<form:input type="email"required autocomplete="off" placeholder="Email Address" path="emailAddress"/>
	         	</div>
		        <div class="field-wrap">
		         	<form:input type="password"required autocomplete="off" placeholder="Set Password" path="password"/>
		        </div>
	         
		        <div class="field-wrap">
		         	<form:input type="password"required autocomplete="off" placeholder="Confirm Password" path=""/>
		        </div>        
		        <div class="field-wrap">
		        	<form:select path="select" class="drop-box">
			            <option value="(No Selection)" selected>(No Selection)</option>
			            <form:option path="role" value="Client">Client</form:option>
			            <form:option path="role" value="Trainer">Trainer</form:option>
		       		</form:select>
		        </div>
	         	<button type="submit" class="button button-block">Get Started</button>  
	       	 </form:form>
	    </div>  

        </div>
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          <c:url var="loginAction" value="/login"/>
          	<form action="${loginAction}" method="POST">
	        <input type="hidden" name="destination" value="${param.destination}"/>
	  		<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
	            <div class="field-wrap">
	            	<input type="email"required autocomplete="off" placeholder="Email Address" name="emailAddress"/>
	          	</div>
          
          		<div class="field-wrap">
            		<input type="password"required autocomplete="off" placeholder="Password" name ="password"/>
          		</div>
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          <script
			src="https://code.jquery.com/jquery-3.2.1.min.js">
          </script>
          
          <script>
          $(document).ready(function(){
        	  $('#signup').hide();
	          $('#signup_tab').on('click', function(event) {
	      		$('#login').hide();
	      		$('#signup').show();
	      		$('#signup_tab').addClass('active');
	      		$('#login_tab').removeClass('active');
	      	   });
	      	

	      	$('#login_tab').on('click', function(event) {
	      		$('#signup').hide();
	      		$('#login').show();
	      		$('#login_tab').addClass('active');
	      		$('#signup_tab').removeClass('active');
	      	});
      });
          
          </script>
          
          <button class="button button-block">Log In</button>
          
          </form>

        </div>
        
      </div> <!-- /form -->
</body>
</html>