<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@include file="allCss.jsp"%>
<style>
a{
	text-decoration: none;
	color: black;
}
a:hover {
	text-decoration: none;
	color: black;
}

</style>

</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"></c:redirect>
	
	</c:if>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
			<a href="add_books.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fas fa-plus-square fa-3x text-primary"></i><br>
						<h4>Add Book</h4>
						------------------


					</div>
				</div>
				</a>
			</div>

			<div class="col-md-3">
			<a href="all_books.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fas fa-book-open fa-3x text-danger"></i><br>
						<h4>All books</h4>
						------------------
					</div>
				</div>
			</a>
			</div>

			<div class="col-md-3">
			<a href="order.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fas fa-box-open fa-3x text-warning"></i><br>
						<h4>Order</h4>
						------------------
					</div>
				</div>
				</a>
			</div>

			<div class="col-md-3">
			<a href="order.jsp">
				<div class="card">
				
				
				<a data-toggle="modal" data-target="#exampleModal">
					<div class="card-body text-center">
						<i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
				    		<h4>Logout</h4>
						   ------------------


					</div>
				</a>
				</div>
				</a>
			</div>
		</div>
	</div>
<div style="margin-top: 200px">
		<%@include file="footer.jsp" %>
</div>

</body>
</html>