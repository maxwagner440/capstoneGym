<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<%@include file ="/WEB-INF/jsp/common/header.jspf" %>
    <title>Raise The Bar</title>

<h1>Trainer Dashboard Page</h1>

<div id="trainer-privacy">
	<c:out value="Your privacy is currently ${user.visibility ? 'public' : 'private'}"/>
	<c:url var="changePrivacy" value="/trainerDashboard"/>
	<form action="${changePrivacy}" method="POST">
		<input type="submit"/>
	</form>
</div>