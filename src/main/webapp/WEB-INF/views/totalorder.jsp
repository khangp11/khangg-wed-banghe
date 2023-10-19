<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<%@ include file="model/head.jsp"%>
<title>Giỏ hàng</title>
</head>
<body>
	<!-- Bao gồm phần Header -->
	<%@ include file="model/header.jsp"%>

	<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
								<h1>Lịch sử mua hàng</h1>
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->

	<%@ include file="model/ordertotal.jsp"%>
	<!-- Bao gồm phần Footer -->
	<%@ include file="model/footer.jsp"%>
</body>
</html>
