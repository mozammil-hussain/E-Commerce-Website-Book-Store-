<%@page import="java.io.PrintWriter"%>
<%@page import="com.mysql.cj.jdbc.JdbcConnection"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">  
<title>Home</title>
<%@include file="all_componets/allCss.jsp"%>
<style>
.back-img {
	background: url("img/home.jpg");
	height: 60vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.card-hover:hover {
	background-color: #fcf7f7;
}
</style>

</head> 
<body style="background-color: #f7f7f7">
	
	<%
	User u = (User) session.getAttribute("userobj"); 
	%>
 
	<%@include file="all_componets/navbar.jsp"%>
	<div class="container-fluid back-img">
	<h1 style="color:transparent;">hello  </h1>
	<h1 style="color:transparent;">hello  </h1>
	<h1 class="text-center text-white" style="font-family: 'Tilt Prism', cursive;font-weight: bold">Book Store</h1>
		<h1 class="text-center text-white" style="font-family: 'Tilt Prism', cursive;font-weight: bold">All Kind Of Books Available Here !</h1>
	
	</div>



	<!-- RECENT BOOK START-->
	<div class="container mt-3">
		<h3 class="text-center">RECENT BOOKS</h3>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list = dao.getRecentBooks();

			for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card card-hover">
					<div class="card-body text-center">
						<img src="books/<%=b.getPhoto_name()%>" class="img-thumblin"
							style="width: 180px; height: 200px">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>

						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<%
						if (b.getBookCategory().equalsIgnoreCase("old book")) {
						%>

						<div class="row">
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Detail</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>

						<div class="row">
							<%
							if (u == null) {
								%>
								<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
									class="fas fa-cart-plus"></i>Add Cart</a>
								<%
								} else {
								%>
								<%
								PrintWriter writer = response.getWriter();
								writer.println(b.getBookId());
								writer.println(u.getId());
								%>
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
									class="btn btn-danger btn-sm ml-1"><i
									class="fas fa-cart-plus"></i>Add Cart</a>

								<%
								}
								%>
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Detail</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>

						</div>

						<%
						}
						%>

					</div>
				</div>
			</div>


			<%
			}
			%>



		</div>

	</div>
	<div class="text-center">
		<a href="all_recent.jsp" class="btn btn-danger btn-sm text-white mt-1">View ALL</a>
	</div>
	</div>  
	<!-- END Recent BOOK-->
	<hr>

	<!-- NEW BOOK START-->
	<div class="container">
		<h3 class="text-center">NEW BOOKS</h3>
		<div class="row">


			<%
			BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list1 = dao1.getNewBooks();
			for (BookDetails b : list1) {
			%>
			<div class="col-md-3">
				<div class="card card-hover">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhoto_name()%>"
							class="img-thumblin" style="width: 180px; height: 200px">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-cart-plus"></i>Add Cart</a>
							<%
							} else {
							%>
							<%
							PrintWriter writer = response.getWriter();
							writer.println(b.getBookId());
							writer.println(u.getId());
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-cart-plus"></i>Add Cart</a>

							<%
							}
							%>

							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Detail</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>

						</div>
					</div>
				</div>

			</div>
			<%
			}
			%>





		</div>
		<div class="text-center">
			<a href="all_new.jsp" class="btn btn-danger btn-sm text-white mt-1">View ALL</a>
		</div>
	</div>
	<!-- NEW BOOK END-->
	<hr>








	<!-- OLD BOOK START-->
	<div class="container">
		<h3 class="text-center">OLD BOOKS</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list2 = dao.getOldBooks();

			for (BookDetails b : list2) { 
			%>
			<div class="col-md-3">
				<div class="card card-hover">
					<div class="card-body text-center">
						<img src="books/<%=b.getPhoto_name()%>" class="img-thumblin"
							style="width: 180px; height: 200px">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>

						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>

	</div>
	<div class="text-center">
		<a href="all_old.jsp" class="btn btn-danger btn-sm text-white mt-1">View ALL</a>
	</div>
	<!-- OLD BOOK END-->
	<div class="mt-2">
		<%@include file="all_componets/footer.jsp"%>
	</div>







</body>
</html>