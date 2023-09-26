<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.*" %>
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
						<h4 class="text-center">Edit Books</h4>
						
			
							
							<%
							int id = Integer.parseInt(request.getParameter("id"));
							
							BookDAOImpl dao =new BookDAOImpl(DBConnect.getConn());
							BookDetails b = dao.getBookById(id);
							
							%>

						<form action="../editBook" method="post">
						<input type="hidden" name="id" value="<%=b.getBookId()%>">
							
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" name="book_name" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" value="<%=b.getBookname() %>">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" name="book_author" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" value="<%=b.getAuthor() %>">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" name="book_price" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" value="<%=b.getPrice() %>">

							</div>
							

							<div class="form-group">
								<label for="inputStatus">Book Status</label> <select
									id="inputState" name="book_status" class="form-control">
									<%if("Active".equalsIgnoreCase(b.getStatus()))
									{
										%>
										<option value="Active">active</option>
										<option value="Inactive">inactive</option>
										
										<%
			
											
									}
									else
									{%>
									<option value="Inactive">inactive</option>
									<option value="Active">active</option>
									
									<%	
									}
										
										
									%>
									
									
								</select>

							</div>
 
						<!--  	<div class="form-group">
								<label for="exampleFormControlFile1">Upload photo</label> <input
									name="book_img" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
					-->
						 



							<button type="submit" class="btn btn-primary">Update</button>
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