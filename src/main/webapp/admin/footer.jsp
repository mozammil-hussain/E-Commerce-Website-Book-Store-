<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>


<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"></c:redirect>
	
	</c:if>
<div class="container-fluid text-center text-white p-3 mt3 footer" style="background-color: #8080ff">
<h5>Design and Developed by Kabeer</h5>


</div>