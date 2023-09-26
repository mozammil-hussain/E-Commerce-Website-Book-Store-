<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_componets/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_componets/navbar.jsp"%>


	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">  

						<h5 class="text-center text-primary p-1">Sell Old Books</h5>
						<c:if test="${not empty success_msg}">
							<p class="text-center text-success">${success_msg}</p>
							<c:remove var="success_msg" scope="session" />

						</c:if>

						<c:if test="${not empty failed_msg}">
							<p class="text-center text-danger">${failed_msg}</p>
							<c:remove var="failed_msg" scope="session" />

						</c:if>
						<form action="add_old_book" method="post"
							enctype="multipart/form-data">


							<input type="hidden" value="${userobj.email }" name="user">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" name="book_name" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email" required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" name="book_author" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email" required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" name="book_price" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">

							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload photo</label> <input
									name="book_img" type="file" class="form-control"
									id="exampleFormControlFile1" required="required">
							</div>





							<button type="submit" class="btn btn-primary">Sell</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>