<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>

<div class="container-fluid" style="height:10px; background-color:#1a237e;"></div>

<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3><i class="fa-solid fa-book"></i>BOOKSHUB</h3>
		</div>
		


		<div class="col-md-3">
		<c:if test="${not empty userobj}">
   <div class="text-center">
    <a  class="btn btn-success text-white">
        <i class="fa-solid fa-user"></i>${userobj.name}</a>
        <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary text-white">
        <i class="fa-solid fa-right-from-bracket"></i>Logout</a>
   </div>
</c:if>
<c:if test="${empty userobj}">
    <a href="../login.jsp" class="btn btn-success text-white">
        <i class="fa-solid fa-right-to-bracket"></i>Login</a>
    <a href="../register.jsp" class="btn btn-primary text-white">
        <i class="fa-solid fa-user-plus"></i>Register</a>
</c:if>

			 
			
		</div>
	</div>
</div>

<!--Logout -->



<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
     <div class="text-center">
      <h4>Do You Want To Logout</h4>
        <button  type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        <a href="../logout" type="button" class="btn btn-danger">Logout</a>
     </div>
      </div>
    </div>
  </div>
</div>

<!--Logout -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i class="fas fa-home"></i>Home
					<span class="sr-only">(current)</span>
			</a></li>
			
		</ul>
		
	</div>
</nav>