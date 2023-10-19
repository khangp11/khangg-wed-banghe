<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	
<div class="row">
	<div class="col-md-12 m-b-30">
		<!-- begin page title -->
		<div class="d-block d-lg-flex flex-nowrap align-items-center">
			<div class="page-title mr-4 pr-4 border-right">
				<h1>User Manager</h1>
			</div>

			<div
				class="ml-auto d-flex align-items-center secondary-menu text-center">

			</div>
		</div>
		<!-- end page title -->
	</div>
</div>
<!-- end row -->
<!-- begin row -->
<div class="row">
	<div class="col-md-12">
		<div class="card card-statistics">
			<div class="card-header">
				<div class="card-heading">
					<h4 class="card-title">Edit Account</h4>
				</div>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-4 text-center">
						<label> <c:if test="${not empty item.photo}">
								<img src="/images/${item.photo}" height="220px" width="220px" />
							</c:if>

						</label>
					</div>
					<div class="col-md-8">

						<form:form action="/admin/user" modelAttribute="item"
							enctype="multipart/form-data" method="post">
							<form:input path="password"	class="form-control" type="hidden" />
							
							<form:input path="username" placeholder="Username"
								class="form-control" />
							<form:errors path="username" cssClass="mga_error" />	
							<hr>
							<form:input path="fullname" placeholder="Fullname"
								class="form-control" />
							<form:errors path="fullname" cssClass="mga_error" />	
							<hr>
							<form:input path="email" placeholder="Email"
								class="form-control" />
							<form:errors path="email" cssClass="mga_error" />	
							<hr>
							<form:radiobuttons path="activated" items="${activated}" /> <br>
							<form:errors path="activated" cssClass="mga_error" />	
							<hr>
							<div class="mb-3">
								<label for="formFileSm" class="form-label">Choose Image</label>
								<input type="file" name="avatar">
							</div>
							<hr>
							<button formaction="/admin/userCreate" class="btn btn-primary">Create</button>
							<button formaction="/admin/userupdate" class="btn btn-info">Update</button>
							<button formaction="/admin/resest" class="btn btn-secondary">Reset</button>
							<button formaction="/admin/userdelete/${item.username}"
								class="btn btn-dark">Delete</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12 ">
		<div class="card card-statistics">
			<div class="card-header">
				<div class="card-heading">
					<div class="row">
						<div class="col-md-6 text-left">
							<h4 class="card-title">Account Table</h4>
						</div>
						<div class="col-md-6">
							<form class="justify-content-end">
								<div class="form-group">
									<input
										oninput="angular.element(this).scope().search(this.value)"
										type="text" class="form-control" placeholder="Search">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-hover table-bordered">
						<thead class="thead-light">
							<tr>
								<th scope="col">Username</th>
								<th scope="col">Fullname</th>
								<th scope="col">Email</th>
								<th scope="col">Active</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="a" items="${page.content}">
								<tr>
									<td>${a.username}</td>
									<td>${a.fullname}</td>
									<td>${a.email}</td>
									<td>${a.activated?'Yes':'No'}</td>
									<td class="text-right"><input value="${a.password }"
										type="hidden"> <a href="/admin/useredit/${a.username}"
										class="btn btn-primary">Edit</a> <a
										href="/admin/userdelete/${a.username}" class="btn btn-dark">Delete</a>

									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav aria-label="Page navigation" class="mt-4">
						<ul class="pagination justify-content-start">
							<li class="page-item"><a class="page-link"
								href="/admin/user?p=0" aria-label="First"> First </a></li>
							<li class="page-item"><a class="page-link"
								href="/admin/user?p=${page.number-1}" aria-label="Previous">
									Previous </a></li>
							<li class="page-item"><a class="page-link"
								href="/admin/user?p=${page.number+1}" aria-label="Next">
									Next </a></li>
							<li class="page-item"><a class="page-link"
								href="/admin/user?p=${page.totalPages-1}" aria-label="Last">
									Last </a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>