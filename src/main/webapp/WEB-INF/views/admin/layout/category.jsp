<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-md-12 m-b-30">
		<!-- begin page title -->
		<div class="d-block d-lg-flex flex-nowrap align-items-center">
			<div class="page-title mr-4 pr-4 border-right">
				<h1>Categories Manager</h1>
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
					<h4 class="card-title">Edit Categories</h4>
				</div>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-4 text-center"></div>
					<div class="col-md-8">

						<form:form action="/admin/category" modelAttribute="item">

							<form:input path="id" placeholder="Id?" class="form-control"
								readonly="true" />

							<hr>
							<form:input path="name" placeholder="Category Name?"
								class="form-control" />

							<hr>
							<button formaction="/admin/categoryCreate"
								class="btn btn-primary">Create</button>
							<button formaction="/admin/categoryupdate" class="btn btn-info">Update</button>
							<button formaction="/admin/categoryresest"
								class="btn btn-secondary">Reset</button>
							<button formaction="/admin/categorydelete/${item.id }"
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
								<th scope="col">Id</th>
								<th scope="col">Name</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${page.content}">
								<tr>
									<td>${c.id}</td>
									<td>${c.name}</td>
									<td class="text-right"><a
										href="/admin/categoryEdit/${c.id}" class="btn btn-primary">Edit</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
						<nav aria-label="Page navigation" class="mt-4">
							<ul class="pagination justify-content-start">
								<li class="page-item"><a class="page-link"
									href="/admin/category?p=0" aria-label="First"> First </a></li>
								<li class="page-item"><a class="page-link"
									href="/admin/category?p=${page.number-1}" aria-label="Previous">
										Previous </a></li>
								<li class="page-item"><a class="page-link"
									href="/admin/category?p=${page.number+1}" aria-label="Next">
										Next </a></li>
								<li class="page-item"><a class="page-link"
									href="/admin/category?p=${page.totalPages-1}" aria-label="Last">
										Last </a></li>
							</ul>
						</nav>
					
				</div>
			</div>
		</div>
	</div>
</div>