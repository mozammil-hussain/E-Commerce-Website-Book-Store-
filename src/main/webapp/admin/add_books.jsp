<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">

	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"></c:redirect>
	
	</c:if>
	<div class="container">
		<div class="row p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Books</h4>
						
							<c:if test="${not empty success_msg}">
								<p class="text-center text-success">${success_msg}</p> 
								<c:remove var="success_msg" scope="session"/>
														
							</c:if>
							
							<c:if test="${not empty failed_msg}">
								<p class="text-center text-danger">${failed_msg}</p> 
								<c:remove var="failed_msg" scope="session"/>
														
							</c:if>

						<form action="../AddingBooks" method="post" enctype="multipart/form-data">
							
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" name="book_name" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" name="book_author" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" name="book_price" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" required="required">

							</div>
							<div class="form-group">
								<label for="inputState">Book category</label> <select
									id="inputState" name="book_type" class="form-control" required="required">
									<option selected>--select--</option>
									<option>New book</option>
									<option>Old book</option>
									<option>Recent book</option>
								</select>
							</div>

							<div class="form-group">
								<label for="inputStatus">Book Status</label> <select
									id="inputState" name="book_status" class="form-control" required="required">
									<option selected>--select--</option>
									<option value="Active">active</option>
									<option value="Inactive">inactive</option>
								</select>

							</div>
 
						  	<div class="form-group">
								<label for="exampleFormControlFile1">Upload photo</label> <input
									name="book_img" type="file" class="form-control"
									id="exampleFormControlFile1" required="required">
							</div>
					

							<button type="submit" class="btn btn-primary">Add</button>
						</form>    
						
					</div>
				</div>


			</div>

		</div>


	</div>
	<div style="margin-top: 80px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>