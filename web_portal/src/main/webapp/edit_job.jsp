<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>
<%@ page import="com.dao.JobDAO"%>
<%@ page import="com.entity.jobs"%>
<%@ page import="java.util.*"%>
<%@ page import="com.db.dbconnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Jobs</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f01f2;">
<c:if test="${userobj.role ne 'admin'}">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						JobDAO dao = new JobDAO(dbconnect.getConn());
						jobs j = dao.getjobById(id);
						%>

						<h5>Edit Jobs</h5>
					</div>
					<form action="update" method="post">

						<input type="hidden" value="<%=j.getId()%>" name="id">
						<div class="form-group">
							<label>Enter Title</label><input type="text" name="title"
								required class="form-control" value="<%=j.getTitle()%>">

						</div>
					</form>
					<div class="form-group col-md-4">
						<label>Location</label><select name="Location"
							class="custom-select" id="inlineFormCustomerSelectPref">
							<option value="<%=j.getLocation()%>"><%=j.getLocation()%></option>
							<option value="Odisha">Odisha</option>
							<option value="Jharkhand">Jharkhand</option>
							<option value="Gujurat">Gujrat</option>
							<option value="Bhubanewar">Bhubanewar</option>
							<option value="Delhi">Delhi</option>
							<option value="Banglore">Banglore</option>
							<option value="Channai">Channai</option>
							<option value="Hydrabad">Hydrabad</option>
						</select>
					</div>
					<div class="form-group col-md-4">
						<label>Category</label><select class="custom-select"
							id="inlineformCustomSelectPref" name="category">
							<option value="<%=j.getCategory()%>"><%=j.getCategory()%></option>
							<option value="IT">IT</option>
							<option value="Devloper">Developer</option>
							<option value="Banking">Banking</option>
							<option value="Engineer">Engineer</option>
							<option value="Teacher">Teacher</option>
						</select>
					</div>

					<div class="form-group col-md-4">
						<label>Status</label><select class="form-control" name="status">
							<option class="Active" value="<%=j.getStatus()%>"><%=j.getStatus()%></option>
							<option class="Active" value="Active">Active</option>
							<option class="Inactive" value="Inactive">Inactive</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label>Enter Description</label>
					<textarea required rows="6" cols=" " name="desc"
						class="form-control"><%=j.getDescription()%></textarea>
				</div>
				<button class="btn btn-success">Update Job</button>

			</div>
		</div>
	</div>
</body>
</html>