<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row">
	<div class="col-md-12 m-b-30">
		<!-- begin page title -->
		<div class="d-block d-lg-flex flex-nowrap align-items-center">
			<div class="page-title mr-4 pr-4 border-right">
				<h1>Product Manager</h1>
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
					<div class="row">
						<div class="col-md-9">
							<h4 class="card-title">Edit Product</h4>
						</div>
						<div class="col-md-3 text-right">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#exampleModal">Edit Category</button>
						</div>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-12">

						<div class="row">
							<div class="col-md-4">
								<div class="container">

									<label> <c:if test="${not empty item.image}">
											<img src="/images/${item.image}" height="220px" width="220px" />
										</c:if>

									</label>
								</div>
							</div>
							<div class="col-md-8">
								<div class="row">
									<div class="col-md-12">
										<form:form modelAttribute="item" action="/admin/product"
											method="post" enctype="multipart/form-data">
											<form:input type="hidden" path="id" id="name"
												value="${item.id }" />

											<div class="form-group">
												<label for="name">Name:</label>
												<form:input path="name" placeholder="name"
													class="form-control" />
												<form:errors path="name" cssClass="mga_error" />
											</div>
											<div class="form-group ">
												<label for="price">Price:</label>
												<form:input path="price" placeholder="price"
													class="form-control" />
												<form:errors path="price" cssClass="mga_error" />
											</div>
											<div class="form-group ">
												<label>Create Date</label>
												<input readonly="true" value="${item.createDate}" type="text"
													class="form-control" />
												<form:errors path="createDate" cssClass="mga_error" />
											</div>
											<div class="form-group ">
												<label for="price">Category:</label>

												<form:select path="category.id">
													<!-- Replace 'path' with the appropriate field in your model -->
													<c:forEach items="${category}" var="c">
														<form:option value="${c.id}">${c.name}</form:option>
													</c:forEach>
												</form:select>
												<form:errors path="category.id" cssClass="mga_error" />

											</div>
											<div class="form-group">
												<label for="available">Available:</label>
												<form:radiobuttons path="available" items="${available}" />
											</div>
											<div class="form-group">
												<label for="image">Image:</label> <input type="file"
													name="imageUpload">
											</div>
											<div class="form-group">
												<label for="attach">Description:</label>
												<textarea name="description" id="description">${item.description}</textarea>
											</div>
											<div class="mt-3">
												<button formaction="/product/create" class="btn btn-primary">Create</button>
												<button formaction="/product/update" class="btn btn-info">Update</button>
												<button formaction="/product/reset" class="btn btn-default">Reset</button>
												<button formaction="/product/delete/${item.id}"
													class="btn btn-dark">Delete</button>
											</div>
										</form:form>
									</div>
								</div>
							</div>
						</div>
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
							<h4 class="card-title">Product Table</h4>
						</div>
						<div class="col-md-6">
							<form class="justify-content-end"
								action="/product/search-and-page" method="post">
								<div class="form-group">
									<input class="form-control" name="keywords"
										placeholder="Search name ?">
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-hover table-bordered ">
						<thead class="thead-light">
							<tr>
								<th scope="col">#</th>
								<th scope="col">Name</th>
								<th scope="col">Price</th>
								<th scope="col">Create Date</th>
								<th scope="col">Description</th>
								<th scope="col">Image</th>
								<th scope="col">Category</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${page.content}">
								<tr>
									<td>${item.id}</td>
									<td>${item.name}</td>
									<td>${item.price}</td>
									<td>${item.createDate}</td>
									<td>${item.description}</td>
									<td><img src="/images/${item.image}" height="50px"
										width="50px"></img></td>
									<td>${item.category.id}</td>
									<td><a href="/product/edit/${item.id}">Edit</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<nav aria-label="Page navigation example">
					<ul class="pagination mt-3 justify-content-center">
						<li class="page-item"><a class="page-link"
							href="/admin/product?p=0">First</a></li>
						<li class="page-item"><a class="page-link"
							href="/admin/product?p=${page.number -1 }">Previous</a></li>
						<li class="page-item"><a class="page-link"
							href="/admin/product?p=${page.number +1 }">Next</a></li>
						<li class="page-item"><a class="page-link"
							href="/admin/product?p=${page.totalPages -1 }">Last</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>