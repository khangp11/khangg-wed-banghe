<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<%@ include file="model/head.jsp"%>
<title>Ghế Việt nâng đờ lưng sống việt</title>
</head>

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

	<%@ include file="model/product.jsp"%>
	<!-- Bao gồm phần Footer -->
	<%@ include file="model/footer.jsp"%>
</body>
</html>
