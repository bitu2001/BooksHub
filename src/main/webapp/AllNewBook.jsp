<%@page import="com.entity.User"%>
<%@page import="com.db.Dbconnect"%>
<%@page import="com.datao.BookDataImpl"%>
<%@page import="com.entity.Bookdetails"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="allcomponents/allcss.jsp" %>
<title>All New Books</title>
<style type="text/css">
.crd-hv:hover{
background-color: #7d7b7a;
	color:white
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
<body style="background-color: #4f4f4f">
<%User u=(User)session.getAttribute("userobj"); %>
    <%@include file="allcomponents/Navbar.jsp" %>
    
    <div class="container">
        <h3 class="text-center text-white">New Books</h3>
        <div class="row">
					<c:if test="${not empty Addcart}">
                      <div id="toast">${Addcart} </div>

						<script type="text/javascript">
								showToast();
								function showToast(content)
								{
								    $('#toast').addClass("display");
								    $('#toast').html(content);
								    setTimeout(()=>{
								        $("#toast").removeClass("display");
								    },4000)
								}	
						</script>

                      <c:remove var="Addcart" scope="session"/>
                      </c:if>
                      
      				  <c:if test="${not empty NotAddcart}">
        			  <p class="text-danger text-center">${NotAddcart}</p>
       				  <c:remove var="NotAddcart" scope="session"/>
         			  </c:if>
        
        <%
        BookDataImpl data=new BookDataImpl(Dbconnect.getConn());
        List <Bookdetails> list=data.getAllNewBooks();
        for(Bookdetails b:list){
        	%>
        	        <div class="col-md-4 mt-4">
        	<div class="card crd-hv">
        <div class="card-body text-center">
        <img alt="" src="book/<%=b.getPhotoName() %>" style="width:150px; height:200px;" class="img-thumblin">
        <p><%=b.getBookname() %></p>
        <p>Author:<%=b.getAuthor() %></p>
        <p>Category:<%=b.getBookcatagory() %></p>
        <div class="row text-center">
 <% if(u==null){%>
        	       <a href="login.jsp" class="btn btn-primary  btn-sm ml-3"><i class="fa-solid fa-cart-shopping"></i>Add to cart</a>
        	
        <%}else{%>
               <a href="cartServlet?bid=<%=b.getBookid() %>&&uid=<%=u.getId()%>" class="btn btn-primary  btn-sm ml-3"><i class="fa-solid fa-cart-shopping"></i>Add to cart</a>
        <%}
        
        %>       <a href="ViewBookDetails.jsp?bid=<%=b.getBookid()%>" class="btn btn-success btn-sm ml-2"><i class="fa-solid fa-circle-info"></i>View Details</a>
       <a href="" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-indian-rupee-sign"></i>  <%=b.getPrice() %></a>
       
        </div>
        </div>
        </div>
        </div>
        	<%
        	
        }
        %> 
        </div>
        </div>

  <%@include file="allcomponents/Footer.jsp" %>
</body>
</html>