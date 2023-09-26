<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: allbooks</title>
<%@include file="allCss.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"></c:redirect>
	
	</c:if>
	<h3 class="text-center">Hey Admin wassup!</h3>

	<c:if test="${not empty success_msg}">
		<h5 class="text-center text-success">${success_msg}</h5>
		<c:remove var="success_msg" scope="session" />

	</c:if>

	<c:if test="${not empty failed_msg}">
		<p class="text-center text-danger">${failed_msg}</p>
		<c:remove var="failed_msg" scope="session" />

	</c:if>

	<table class="table">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Category</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			

			</tr>
		</thead>
		<tbody>

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list = dao.getAllBooks();
			for (BookDetails b : list) {
			%>
			<tr>
				<td><%=b.getBookId()%></td>
				<td><img src="../books/<%=b.getPhoto_name()%>" style="width: 50px; height:50px;"></td>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td>
				<a href="edit_books.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary"><i class="fas fa-edit"></i> Edit</a>
				<a href="../delete?id=<%=b.getBookId()%>" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i> Delete</a>
				</td>
			</tr>


			<%
			}
			%>



		</tbody>
	</table>
	<div style="margin-top: 270px">
		<%@include file="footer.jsp"%>
	</div>




</body>
</html>