<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<label> <img ng-src="/images/account/{{account.photo}}"
							class="logo" alt="">
						</label>
					</div>
					<div class="col-md-8">

						<form:form action="/admin/role" modelAttribute="item">

							<form:input path="id" placeholder="Id?"
								class="form-control" />

							<hr>
							<form:input path="account.username" placeholder="UserName?"
								class="form-control" />

							<hr>
							<form:select path="role.role">
								<!-- Replace 'path' with the appropriate field in your model -->
								<c:forEach items="${roles}" var="roles">
									<form:option value="${roles.role}">${roles.description}</form:option>
								</c:forEach>
							</form:select>
							<hr>
							<button formaction="/admin/roleupdate" class="btn btn-info">Update</button>
							<button formaction="/admin/roleresest" class="btn btn-secondary">Reset</button>
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
								<th scope="col">Id</th>
								<th scope="col">Username</th>
								<th scope="col">Role</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="role" items="${page.content}">
								<tr>
									<td>${role.id}</td>
									<td>${role.account.username}</td>
									<td>${role.role.role}</td>
									<td class="text-right"><a href="/admin/roleEdit/${role.id}"
										class="btn btn-primary">Edit</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav aria-label="Page navigation" class="mt-4">
							<ul class="pagination justify-content-start">
								<li class="page-item"><a class="page-link"
									href="/admin/role?p=0" aria-label="First"> First </a></li>
								<li class="page-item"><a class="page-link"
									href="/admin/role?p=${page.number-1}" aria-label="Previous">
										Previous </a></li>
								<li class="page-item"><a class="page-link"
									href="/admin/role?p=${page.number+1}" aria-label="Next">
										Next </a></li>
								<li class="page-item"><a class="page-link"
									href="/admin/role?p=${page.totalPages-1}" aria-label="Last">
										Last </a></li>
							</ul>
						</nav>
				</div>
			</div>
		</div>
	</div>
</div>