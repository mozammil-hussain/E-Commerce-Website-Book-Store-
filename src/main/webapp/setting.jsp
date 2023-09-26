<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_componets/allCss.jsp"%>
<style>
a{
text-decoration: none;
color:black;

}
a:hover {
	text-decoration: none;
}

</style>
</head>
<body style="background-color: #f7f7f7">

<c:if test="${empty userobj}">
<c:redirect url="login.jsp"></c:redirect>


</c:if>
	<%@include file="all_componets/navbar.jsp"%>

	<div class="container">
	<h3 class="text-center">hello ${userobj.name }</h3>

	
		
		<div class="row p-5">
			<div class="col-md-4">
				<div class="card">
					<a href="sell_books.jsp">
						<div class="card">
							<div class="card-body text-center">
							<div class="text-primary">
							<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h3>Sell Old Books</h3>
							</div>

						</div>

					</a>

				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<a href="old_book.jsp">
						<div class="card">
							<div class="card-body text-center">
							<div class="text-primary">
							<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h3>Old Books</h3>
							</div>

						</div>

					</a>

				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<a href="edit_profile.jsp">
						<div class="card">
							<div class="card-body text-center">
							<div class="text-primary">
							<i class="fas fa-edit fa-3x"></i>
							</div>
							<h4>Login and Security(Edit Profile)</h4>
							</div>

						</div>

					</a>

				</div>
			</div>
			
			<div class="col-md-4 mt-3">
				<div class="card">
					<a href="user_address.jsp">
						<div class="card">
							<div class="card-body text-center">
							<div class="text-warning">
							<i class="fas fa-map-marker-alt fa-3x"></i>
							</div>
							<h4>Your Address</h4>
							<p>Edit address</p>
							</div>

						</div>

					</a>

				</div>
			</div>
			<div class="col-md-4 mt-3">
				<div class="card">
					<a href="order.jsp">
						<div class="card">
							<div class="card-body text-center">
							<div class="text-danger">
							<i class="fas fa-box-open fa-3x"></i>
							</div>
							<h4>My Orders</h4>
							<p>Track Your Order</p>
							</div>

						</div>

					</a>

				</div>
			</div>
			<div class="col-md-4 mt-3">
				<div class="card">
					<a href="helpline.jsp">
						<div class="card">
							<div class="card-body text-center">
							<div class="text-primary">
							<i class="fas fa-user-circle fa-3x"></i>
							</div>
							<h4>Help Center</h4>
							<p>24*7 Service Available</p>
							</div>

						</div>

					</a>

				</div>
			</div>
		</div>

	</div>
	<div class="mt-2">
		<%@include file="all_componets/footer.jsp"%>
	</div>

</body>
</html>