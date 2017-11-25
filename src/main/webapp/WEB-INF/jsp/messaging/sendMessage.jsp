<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div>
	YOooo This is the send messages page Yooo
</div>

<c:url var="sendMessage" value="/sendMessage"/> 
	       <form action="${sendMessage}" method="POST">
	       <input type="text" placeholder="To Whom?" name="first"/>
	       <input type="text" placeholder="To Whom?" name="last"/>
	       <input type="text" placeholder="Message" name="message"/>
	       <input type="hidden" name="loggedInId" value="${user.id }"/>
	       <input type="submit"/>
		   </form>
	            		