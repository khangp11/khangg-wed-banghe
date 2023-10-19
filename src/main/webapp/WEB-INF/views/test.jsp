<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Trang sản phẩm</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="assets/css/templatemo.css">


<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">
</head>
<body>

	<!-- Modal -->
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="" method="get"
				class="modal-content modal-body border-0 p-0">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch"
						name="q" placeholder="Search ...">
					<button type="submit"
						class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>
		</div>
	</div>



	<!-- Start Content -->
	<div class="container py-5">
		<div class="row">

			<div class="col-lg-3">
				<h1 class="h2 pb-4">Lọc</h1>
				<ul class="list-unstyled templatemo-accordion">
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						href="#"> Tác giả <i
							class="fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a>
						<ul class="collapse show list-unstyled pl-3">
							<li><input type="radio" name="tg" value="bah"> Bùi
								Anh Trang</li>
							<li><input type="radio" name="tg" value="ctcd"> Cấn
								Thị Chang Duyên</li>
						</ul></li>
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						href="#"> Nhà phát hành <i
							class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a>
						<ul id="collapseTwo" class="collapse list-unstyled pl-3">
							<li><input type="radio" name="nph" value="980">980
								Edu</a></li>
							<li><input type="radio" name="nph" value="aplha">Alphabooks</a></li>
						</ul></li>
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						href="#"> Giá <i
							class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a>
						<ul id="collapseThree" class="collapse list-unstyled pl-3">
							<div class="form-group">
								<label for="min">Min</label> <input type="number"
									class="form-control" id="min" name="min" min="0">
							</div>
							<div class="form-group">
								<label for="max">Max</label> <input type="number"
									class="form-control" id="max" name="max" min="1">
							</div>
						</ul></li>
				</ul>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pb-3 pt-1">
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#">Tât
									cả</a></li>
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#">Min</a>
							</li>
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none" href="#">Max</a></li>
						</ul>
					</div>
					<div class="col-md-6 pb-4">
						<div class="d-flex">
							<select class="form-control">
								<option>Featured</option>
								<option>A to Z</option>
								<option>Item</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="card mb-4 product-wap rounded-0">
							<div class="card rounded-0">
								<img class="card-img rounded-0 img-fluid"
									src="https://nhasachphuongnam.com/images/thumbnails/213/213/detailed/260/huong-dan-thu-vien-danh-cho-nguoi-ghet-doc.jpg">
							</div>
							<div class="card-body">
								<a href="#" class="h3 text-decoration-none">Hướng Dẫn Thư
									Viện Dành Cho Người Ghét Đọc</a>
								<p class="text-center mb-0">$250.00</p>
							</div>
							<button class="btn btn-primary" type="submit">Mua</button>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 product-wap rounded-0">
							<div class="card rounded-0">
								<img class="card-img rounded-0 img-fluid"
									src="https://nhasachphuongnam.com/images/thumbnails/213/213/detailed/260/huong-dan-thu-vien-danh-cho-nguoi-ghet-doc.jpg">
							</div>
							<div class="card-body">
								<a href="#" class="h3 text-decoration-none">Hướng Dẫn Thư
									Viện Dành Cho Người Ghét Đọc</a>
								<p class="text-center mb-0">$250.00</p>
							</div>
							<button class="btn btn-primary" type="submit">Mua</button>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 product-wap rounded-0">
							<div class="card rounded-0">
								<img class="card-img rounded-0 img-fluid"
									src="https://nhasachphuongnam.com/images/thumbnails/213/213/detailed/260/huong-dan-thu-vien-danh-cho-nguoi-ghet-doc.jpg">
							</div>
							<div class="card-body">
								<a href="#" class="h3 text-decoration-none">Hướng Dẫn Thư
									Viện Dành Cho Người Ghét Đọc</a>
								<p class="text-center mb-0">$250.00</p>
							</div>
							<button class="btn btn-primary" type="submit">Mua</button>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 product-wap rounded-0">
							<div class="card rounded-0">
								<img class="card-img rounded-0 img-fluid"
									src="https://nhasachphuongnam.com/images/thumbnails/213/213/detailed/260/huong-dan-thu-vien-danh-cho-nguoi-ghet-doc.jpg">
							</div>
							<div class="card-body">
								<a href="#" class="h3 text-decoration-none">Hướng Dẫn Thư
									Viện Dành Cho Người Ghét Đọc</a>
								<p class="text-center mb-0">$250.00</p>
							</div>
							<button class="btn btn-primary" type="submit">Mua</button>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 product-wap rounded-0">
							<div class="card rounded-0">
								<img class="card-img rounded-0 img-fluid"
									src="https://nhasachphuongnam.com/images/thumbnails/213/213/detailed/260/huong-dan-thu-vien-danh-cho-nguoi-ghet-doc.jpg">
							</div>
							<div class="card-body">
								<a href="#" class="h3 text-decoration-none">Hướng Dẫn Thư
									Viện Dành Cho Người Ghét Đọc</a>
								<p class="text-center mb-0">$250.00</p>
							</div>
							<button class="btn btn-primary" type="submit">Mua</button>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 product-wap rounded-0">
							<div class="card rounded-0">
								<img class="card-img rounded-0 img-fluid"
									src="https://nhasachphuongnam.com/images/thumbnails/213/213/detailed/260/huong-dan-thu-vien-danh-cho-nguoi-ghet-doc.jpg">
							</div>
							<div class="card-body">
								<a href="#" class="h3 text-decoration-none">Hướng Dẫn Thư
									Viện Dành Cho Người Ghét Đọc</a>
								<p class="text-center mb-0">$250.00</p>
							</div>
							<button class="btn btn-primary" type="submit">Mua</button>
						</div>
					</div>
				</div>
				<div class="row">
					<ul class="pagination pagination-lg justify-content-end">
						<li class="page-item disabled"><a
							class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0"
							href="#" tabindex="-1">1</a></li>
						<li class="page-item"><a
							class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
							href="#">2</a></li>
						<li class="page-item"><a
							class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark"
							href="#">3</a></li>
					</ul>
				</div>
			</div>

		</div>
	</div>
	<!-- End Content -->

	<!-- Start Brands -->

	<!--End Brands-->


	<!-- Start Footer -->

	<!-- End Footer -->

	<!-- Start Script -->
	<script
		src="
https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js
"></script>
	<script
		src="
https://cdn.jsdelivr.net/npm/jquery-migrate@3.4.1/dist/jquery-migrate.min.js
"></script>

	<script src="assets/js/templatemo.js"></script>

	<!-- End Script -->
</body>
</html>
</body>
</html>