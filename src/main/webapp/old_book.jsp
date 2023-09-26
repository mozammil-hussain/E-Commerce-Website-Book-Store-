<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Old Books</title>
<%@include file="all_componets/allCss.jsp"%>
</head>
<body>
	<%@include file="all_componets/navbar.jsp"%>
	
	<h2 class="text-center text-primary">Your Old Books Here</h2>

	<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center">
		${succMsg}
		</div>
		<c:remove var="succMsg" scope="session"></c:remove>

	</c:if>

	<div class="container p-5">

		<table class="table">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();

				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

				List<BookDetails> list = dao.getBookByOld(email, "old book");

				for (BookDetails b : list) {
				%>

				<tr>
					<td><%=b.getBookname()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>

				<%
				}
				%>




			</tbody>
		</table>
	</div>


</body>
</html>