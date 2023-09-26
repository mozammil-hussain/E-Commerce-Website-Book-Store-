<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook Register</title>
<%@include file="all_componets/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_componets/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class=card>
					<div class=card-body>

						<h4 class="text-center">Registration Page</h4>
						
						<c:if test="${not empty successMsg}">
							<p class="text-center text-success">${successMsg}</p>
							<c:remove var="successMsg" scope="session"></c:remove>

						</c:if>

						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session"></c:remove>
						</c:if>
						

						<form action="register" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="fname" required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email Address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="email" required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Phone number"
									required="required" name="phno">

							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" name="check" required="required" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Check me out</label>
							</div> 
							<button type="submit" class="btn btn-primary">Register</button>
						</form>
					</div>

				</div>

			</div>
		</div>


	</div>
	<div class="register-footer">
		<%@include file="all_componets/footer.jsp"%>
	</div>

</body>
</html>