<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<%@ include file="model/head.jsp"%>
<title>Bán sách vippro123</title>
</head>
<body>
	<!-- Bao gồm phần Header -->
	<%@ include file="model/header.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<form class="modal-content" action="/cart/add" method="post">
				<div class="modal-body">
					<!-- Nội dung chi tiết sản phẩm -->
					<div>
						<input type="hidden" name="productId" value="${item.id}">
						<div class="row">
							<div class="col-md-6">
								<img src="/images/${item.image}"
									class="img-fluid product-thumbnail">
							</div>
							<div class="col-md-6">
								<h1>${item.name}</h1>
								<h5>Giá:</h5>
								<p><fmt:formatNumber maxFractionDigits="3" value="${item.price}" /> <span> vnđ</span></p>
								<h5>Mô tả:</h5>
								<p>${item.description}</p>
								<h5>Loại ghế:</h5>
								<p>${item.category.name}</p>

								<form action="your_cart_action_url" method="post">
									<label for="quantity" class="form-label">Số lượng:</label>
									<div class="input-group">
										<input name="quantity" type="number"
											class="form-control text-center quantity-amount"
											id="quantity" value="1" min="1">
									</div>
									<div class="text-center mt-3">
										<button type="submit" class="btn btn-primary">Thêm
											vào giỏ hàng</button>
									</div>
								</form>
							</div>

						</div>
					</div>
					<!-- Chọn số lượng -->
					<!--               <div class="mb-3 col-md-3">
                    <label for="quantity" class="form-label">Số lượng:</label>
                    <div class="input-group quantity-container">
                        <button class="btn btn-outline-dark decrease" type="button">&minus;</button>
                        <input type="number" class="form-control text-center quantity-amount" id="quantity" value="1" min="1">
                        <button class="btn btn-outline-dark increase" type="button">&plus;</button>
                    </div>
                </div> -->
				</div>

			</form>
		</div>
	</div>
	<br>
	<br>
	<!-- Bao gồm phần Footer -->
	<%@ include file="model/footer.jsp"%>

</body>

</html>

