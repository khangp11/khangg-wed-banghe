<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<%@ include file="model/head.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>Ghế Việt</title>
</head>

<style>
    a {
            text-decoration: none;
        }
/* CSS để điều chỉnh kích thước hình ảnh và div chứa sản phẩm */
.product-thumbnail {
	width: 306px; /* Đặt chiều rộng cố định là 306px */
	height: 306px; /* Đặt chiều cao cố định là 306px */
	object-fit: cover;
	/* Đảm bảo ảnh đầy đủ kích thước không bị biến dạng */
}

.product-item {
	width: 306px; /* Đặt chiều rộng cố định của div sản phẩm là 306px */
	height: 306px; /* Đặt chiều cao cố định của div sản phẩm là 306px */
}

.col-lg-4 {
	flex: 0 0 auto;
	width: 24.333333%;
}

body {
	margin: -25px;
}

.bg-dark {
	background: #3b5d50 !important;
}
/* Style for the outer container */
.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}

/* Style for the main product section */
.product-section {
	background-color: #f5f5f5;
	padding: 20px;
	border-radius: 10px;
}

/* Style for the top menu */
.shop-top-menu {
	list-style: none;
	padding: 0;
	display: flex;
}

.shop-top-menu li {
	margin-right: 10px;
}

.shop-top-menu a {
	text-decoration: none;
	color: #333;
	font-size: 16px;
}

/* Style for the "Tìm kiếm theo" section */
.templatemo-accordion {
	list-style: none;
	padding: 0;
}

.templatemo-accordion li {
	margin-bottom: 15px;
}

.templatemo-accordion a {
	text-decoration: none;
	color: #333;
	font-size: 18px;
	display: flex;
	justify-content: space-between;
}

/* Style for the form inputs and button in the "Khoảng giá" section */
.form-group {
	margin-bottom: 15px;
}

.form-control {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.btn-primary {
	background-color: #007BFF;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

/* Style for the product items */
.product-item {
	display: block;
	text-decoration: none;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	padding: 20px;
	border-radius: 5px;
	text-align: center;
	transition: transform 0.2s;
}

.product-item:hover {
	transform: translateY(-5px);
}

.product-thumbnail {
	max-width: 100%;
	height: auto;
}

.product-title {
	font-size: 18px;
	margin: 10px 0;
}

.product-price {
	font-size: 20px;
	color: #007BFF;
}

.icon-cross {
	display: inline-block;
	margin-top: 10px;
}

.product-item {
	margin-bottom: 20px; /* Adjust the margin as needed */
}

/* Additional styles can be added to further customize the appearance */
</style>
<body>
	<!-- Bao gồm phần Header -->
	<%@ include file="model/header.jsp"%>

	<!-- Nội dung chính của trang -->
	<div class="hero pt-5">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-5">
					<div class="intro-excerpt">
						<h1>
							<span clsas="d-block">Ghế Việt</span>
						</h1>
						<p class="mb-4">Ghế Việt nâng đờ lưng sống việt.</p>
						<p>
							<!-- 	<a href="" class="btn btn-secondary me-2">Mua ngay</a> -->

						</p>
					</div>
				</div>
				<div class="col-lg-7">
					<div class="hero-img-wrap">
						<img src="images/couch.png" class="img-fluid">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="untree_co-section product-section before-footer-section">
			<div class="product-section">
				<div class="container">
					<div class="col-lg-9">
						<div class="row">
							<div class="col-md-6">
								<ul class="list-inline shop-top-menu pb-3 pt-1">
									<li class="list-inline-item"><a
										class="h3 text-dark text-decoration-none mr-3" href="/list">Tât
											cả</a></li>
									<li class="list-inline-item"><a
										class="h3 text-dark text-decoration-none mr-3"
										href="/listsortbyprice">Giá tăng dân</a></li>
									<li class="list-inline-item"><a
										class="h3 text-dark text-decoration-none"
										href="/listsortbypriceh">Giá giảm dần</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="row">
						<!-- Start Column 1 -->

						<div class="col-2">
							<!-- Change col-md-2 to col-3 -->
							<div class="col-md-12 col-lg-12 mb-5 mb-lg-0">
								<h1 class="h2 pb-4">Tìm kiếm theo</h1>
								<ul class="list-unstyled templatemo-accordion">
									<li class="pb-3"><a
										class="collapsed d-flex justify-content-between h3 text-decoration-none"
										href="#"> Khoảng giá <i
											class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
									</a>
										<ul id="collapseThree" class="collapse list-unstyled pl-3">
											<form action="/listfind" method="post">
												<div class="form-group">
													<label for="min">Min</label> <input name="min"
														value="${param.min}" placeholder="Min Price?"
														class="form-control">
												</div>
												<div class="form-group">
													<label for="max">Max</label> <input name="max"
														value="${param.max}" placeholder="Max Price?"
														class="form-control">
												</div>
												<button class="btn-primary">Search</button>
											</form>
										</ul></li>
									<li class="pb-3"><a
										class="collapsed d-flex justify-content-between h3 text-decoration-none"
										href="#">Loại ghế <i
											class="fa fa-fw fa-chevron-circle-down mt-1"></i>
									</a>
										<ul class="collapse show list-unstyled pl-3">
											<div class="widget-content">
												<ul class="sidebar_categories">
													<c:forEach var="c" items="${categories}">
														<li class="lvl-1"><a href="list?cid=${c.id}"
															class="site-nav">${c.name}</a></li>
													</c:forEach>
												</ul>
											</div>
										</ul></li>
								</ul>
							</div>
						</div>

						<!-- End Column 1 -->

						<div class="col-10">
							<div class="row">
								<c:forEach var="item" items="${page.content}">
									<div class="col-4" w>
										<div
											style="margin-bottom: 100px; background-color: unset; border: 0px solid #e5e5e5;"
											class="product-item ">
											<a href="/detail/${item.id}"> <img
												src="images/${item.image}"
												class="img-fluid product-thumbnail">
												<h3 class="product-title">${item.name}</h3> <strong
												class="product-price"><fmt:formatNumber maxFractionDigits="3" value="${item.price}" /> <span> vnđ</span></strong> <span
												class="icon-cross"> <img src="images/cross.svg"
													class="img-fluid">
											</span>
											</a>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
<div class="d-flex justify-content-center">
        <br><br>
        <div class="pagination pagination-lg">
            <button class="btn " onclick="window.location.href='/list?p=0'">First</button>
            <button class="btn " onclick="window.location.href='/list?p=${page.number-1}'">Previous</button>
            <button class="btn " onclick="window.location.href='/list?p=${page.number+1}'">Next</button>
            <button class="btn " onclick="window.location.href='/list?p=${page.totalPages-1}'">Last</button>
        </div>
    </div>






					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- Bao gồm phần Footer -->
	<%@ include file="model/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-migrate@3.4.1/dist/jquery-migrate.min.js"></script>

	<script>
		'use strict';
		$(document).ready(function() {

			// Accordion
			var all_panels = $('.templatemo-accordion > li > ul').hide();

			$('.templatemo-accordion > li > a').click(function() {
				console.log('Hello world!');
				var target = $(this).next();
				if (!target.hasClass('active')) {
					all_panels.removeClass('active').slideUp();
					target.addClass('active').slideDown();
				}
				return false;
			});
			// End accordion

			// Product detail
			$('.product-links-wap a').click(function() {
				var this_src = $(this).children('img').attr('src');
				$('#product-detail').attr('src', this_src);
				return false;
			});
			$('#btn-minus').click(function() {
				var val = $("#var-value").html();
				val = (val == '1') ? val : val - 1;
				$("#var-value").html(val);
				$("#product-quanity").val(val);
				return false;
			});
			$('#btn-plus').click(function() {
				var val = $("#var-value").html();
				val++;
				$("#var-value").html(val);
				$("#product-quanity").val(val);
				return false;
			});
			$('.btn-size').click(function() {
				var this_val = $(this).html();
				$("#product-size").val(this_val);
				$(".btn-size").removeClass('btn-secondary');
				$(".btn-size").addClass('btn-success');
				$(this).removeClass('btn-success');
				$(this).addClass('btn-secondary');
				return false;
			});
			// End roduct detail

		});
	</script>
</body>
</html>