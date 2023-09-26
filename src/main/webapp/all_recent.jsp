
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Books</title>
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
<body>
   
	<%@include file="all_componets/navbar.jsp"%>

	<div class="container mt-3">
		<div class="row">
		<%
		BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
		List<BookDetails> list=dao.getAllRecentBooks();
		
		for(BookDetails b:list)
		{%>
			<div class="col-md-3 p-2">
				<div class="card card-hover">
					<div class="card-body text-center">
						<img src="books/<%=b.getPhoto_name() %>" class="img-thumblin"
							style="width: 180px; height: 200px">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor() %></p>
						
						<p>Categories: <%=b.getBookCategory() %></p>
						<%
						if(b.getBookCategory().equalsIgnoreCase("old book"))
						{%>
					
						<div class="row">
							<a href="" class="btn btn-success btn-sm ml-5">View Detail</a>
						    <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
						</div>	
						<%}
						else
						{%>
						
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-1"><i class="fas fa-cart-plus"></i> Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Detail</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>

						</div>
							
						<%}
						%>
						
					</div>
				</div>
			</div>
		
			
		<%}
		
		%>
		</div>
	</div>
	</div>

</body>
</html>