
<%@page import="com.entity.*"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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
/* toast */

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */

</style>
</head>
<body>
<%
	User u = (User) session.getAttribute("userobj");
	%>

	<c:if test="${not empty addCart}">
		<div id="toast">${addCart}</div>
		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

	<c:remove var="addCart" scope="session"/>
	</c:if>
	
	
	<%@include file="all_componets/navbar.jsp"%>

	<div class="container mt-3">
		<div class="row">
			<% 
			BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list1 = dao1.getAllNewBooks();
			for (BookDetails b : list1) 
			{
			%>
			<div class="col-md-3 p-2">
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
								
								%>
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
									class="btn btn-danger btn-sm ml-1"><i
									class="fas fa-cart-plus"></i>Add Cart</a>

								<% 
								} 
								%>
						
							<a href=""
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
	</div>

</body>
</html>