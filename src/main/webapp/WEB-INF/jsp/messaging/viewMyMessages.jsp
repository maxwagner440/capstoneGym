<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:forEach items="${messages}" var="message">
<c:out value="${message.content}"/>
<c:out value="${message.getDate() }"/>
<c:out value="${message.username }"/>
</c:forEach>