<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file ="/WEB-INF/jsp/common/header.jspf" %>

<body>
<script type="text/javascript">
	$(document).ready(function () {
	
		$("#signup form").validate({		
			rules : {
				firstName : {
					required : true
				},			
				lastName : {
					required : true
				},
				age : {
					required : true,
					min: 13
				},
				username : {
					required : true
				},
				email : {
					required : true,
					email: true
				},
				password : {
					minlength: 15,
					capitals: true,
					required : true
				},
				confirmPassword : {
					required : true,
					equalTo : "#password"
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
					minlength: "Must be 15 characters long",
					capitals: "Must contain a capital letter",
					required : "Please enter a valid passowrd."
				},
				confirmPassword : {
					required : "Please enter a matching password.",
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error",
		});	
		
		$("#login form").validate({
			rules: {
				email : {
					required: true
				},
				password : {
					required: true
				}
			},
			messages : {
				email : {
					required: "Login info invalid."
				},
				password :{
					required: "Login info invalid."
				}
			}
			
		});
	});
</script>
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
	       		<input type="hidden" path="destination" value="${param.destination}"/>
	 			<input type="hidden" path="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
	 			<input type="hidden" path="${id}"/>  
	        
	         	<div class="top-row">
	          		<div class="field-wrap">
	            		 <form:input placeholder="First Name" path="firstName"/>
	            		 <form:errors path="firstName" cssClass="error"/> 
	           		</div>
	          		<div class="field-wrap">
	            		 <form:input placeholder="Last Name" path="lastName"/>
	            		 <form:errors path="lastName" cssClass="error"/> 
	           		</div>
	         	</div>
	         	<div class="field-wrap">
	          		<form:input type="text" placeholder="Age" path="age"/>
	          		<form:errors path="age" cssClass="error"/> 
	         	</div>
	         	<div class="field-wrap">
	        		<form:input placeholder="Username" path="username"/>
	        		<form:errors path="username" cssClass="error"/> 
	      		</div>
	         	<div class="field-wrap">
	          		<form:input type="email" placeholder="Email Address" path="email"/>
	          		<form:errors path="email" cssClass="error"/>  
	         	</div>
		        <div class="field-wrap">
		         	<input type="password" placeholder="Password" name="password"/>
		         	
		        </div>
	         
		        <div class="field-wrap">
		         	<input type="password" placeholder="Confirm Password" name="confirmPassword" />
		         
		        </div>        
		        <div class="field-wrap">
		        	<form:select path="role" class="drop-box">
			            <option value="(No Selection)" selected>(No Selection)</option>
			            <form:option path="role" value="Client">Client</form:option>
			            <form:option path="role" value="Trainer">Trainer</form:option>
		       		</form:select>
		       		
		        </div>
	         	<button type="submit" class="button button-block" id="register">Get Started</button>  
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
	            	<input type="email"required autocomplete="off" placeholder="Email Address" name="email"/>
	          	</div>
          
          		<div class="field-wrap">
            		<input type="password"required autocomplete="off" placeholder="Password" name ="password"/><br>
          		  <div class="loginError">${message}</div>
          		</div>
        
          <br>
          <div> <c:if test="${!empty(loginMessage) && user.id == -1}"> 
           <c:out value="${loginMessage }"/>
           </c:if> 
           </div>
          <br>
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
	      	
	      	$('#register').on('click', function(event){
	      		$('#signup_tab').addClass('active');
	      		$('#login_tab').removeClass('active');
	      	});
      });
          
          </script>
          
          <button class="button button-block">Log In</button>
          
          </form>

        </div>
        
      </div> <!-- /form -->
</body>
</html>