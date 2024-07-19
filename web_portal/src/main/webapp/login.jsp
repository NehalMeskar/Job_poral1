<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="all_component/all_css.jsp"%>

</head>
<body style="background-color: #f01f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="continer-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Login Page</h5>
						</div>
						<c:if test="${not empty succMsg}">
							<h4 class="text-center text-danger">${succMSg }</h4>
							<c:remove var="succMsg" />
						</c:if>
						<form action="Login" method="post">
							<div class="form-group">
								<label>Enter Email</label><input type="email"
									required="required" class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="email">
							</div>

							<div class="form-group">
								<label for="exmapleInputPassword1">Enter Password</label><input
									required="required" type="password" class="form-control"
									id="exampleleInputPassword1" name="password">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 70px;">
			<%@include file="all_component/footer.jsp"%>
		</div>
</body>
</html>