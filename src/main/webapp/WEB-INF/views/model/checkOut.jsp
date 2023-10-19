<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.pay {
	list-style: none;
	display: flex;
}

.pay li {
	margin: 0 10px;
}

.pay li a {
	display: block;
}

.img {
	width: 40px;
	height: 40px;
	transition: transform 0.2s; /* Thêm hiệu ứng chuyển đổi */
}

.a:hover span img {
	transform: scale(1.1); /* Khi hover, hình ảnh sẽ phóng to 110% */
}
</style>
<br>
<br>
<br>
<div class="container">
	<div class="row">
		<div class="col-md-6 mb-5 mb-md-0">
			<h2 class="h3 mb-3 text-black">Thông tin của bạn</h2>
			<form action="/order" method="post">

				<div class="p-3 p-lg-5 border bg-white">
					<div class="form-group">
						<label for="c_fname" class="text-black">Tài khoản<span
							class="text-danger">*</span></label>
						<div>${userDetail.username}</div>
						<input path="account" name="account" type="hidden"
							value="${userDetail.username}">
					</div>
					<div class="form-group">
						<label for="c_fname" class="text-black">Họ và tên <span
							class="text-danger">*</span></label> <input disabled="disabled"
							name="fullname" value="${userDetail.fullname}"
							id="input-firstname" type="text" class="form-control">
					</div>
					<div class="form-group">
						<label for="c_address" class="text-black">Địa chỉ email <span
							class="text-danger">*</span></label> <input disabled="disabled"
							name="email" value="${userDetail.email}" id="input-email"
							type="email" class="form-control">
					</div>
					<div class="form-group">
						<label for="c_address" class="text-black">Địa chỉ <span
							class="text-danger">*</span></label> <input path="address" name="address"
							ng-model="order.address" id="input-address-1" required
							type="text" class="form-control">
					</div>
					<div class="form-group">
						<label for="input-company">Note<span class="required-f">*</span></label>
						<textarea class="form-control resize-both" rows="3"></textarea>
					</div>
				</div>
		</div>
		<div class="col-md-6">
			<div class="row mb-5">
				<div class="col-md-12">
					<h2 class="h3 mb-3 text-black">Đơn hàng của bạn</h2>
					<div class="p-3 p-lg-5 border bg-white">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col">Sản phẩm</th>
									<th scope="col">Tổng cộng</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${cartItems}" var="cartItem">
									<tr>

										<td>${cartItem.product.name}<strong class="mx-2">x</strong>
											${cartItem.quantity}
										</td>
										<input type="hidden" value="${cartItem.quantity}"
											path="quantity" name="quantity">

										<td><fmt:formatNumber maxFractionDigits="3"
												value="${cartItem.product.price*cartItem.quantity}" /><span>
												vnđ</span></td>
									</tr>
								</c:forEach>
								<tr>
									<td class="text-black font-weight-bold"><strong>Tổng
											tiền</strong></td>
									<td class="text-black"><fmt:formatNumber
											maxFractionDigits="3" value="${Amount}" /><span> vnđ</span></td>
								</tr>

								<tr>
									<td class="text-black font-weight-bold"><strong>Tổng
											đơn hàng</strong></td>
									<td class="text-black font-weight-bold"><strong><fmt:formatNumber
												maxFractionDigits="3" value="${Amount}" /> </strong><span>
											vnđ</span></td>
								</tr>
							</tbody>

						</table>

						<h3>Phương thức thanh toán</h3>



						<input type="radio" id="vnPayRadio" name="paymentMethod"
							value="vnPay"> <label for="vnPayRadio"><a
							type="button" href="/pay">Thanh toán bằng VNPAY <img
								src="https://on.net.vn/web/image/3876184-2b57e083/202166185_2021396718013233_8499389898242103910_n.png"
								style="width: 40px; height: 40px;"
								class="img-fluid product-thumbnail"></a></label> <br> <input
							type="radio" id="cashOnDeliveryRadio" name="paymentMethod"
							value="cashOnDelivery"> <label for="cashOnDeliveryRadio">Thanh
							toán trực tiếp khi nhận hàng</label><br>

						<div class="form-group">
							<button class="btn btn-dark btn-lg py-3 btn-block" type="submit">Đặt
								hàng</button>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
	<script>
		function validateForm() {
		    var cashOnDeliveryRadio = document.getElementById("cashOnDeliveryRadio");
					.getElementById("cashOnDeliveryCheckbox");

			// Kiểm tra xem ít nhất một trong hai checkbox đã được chọn
			if (cashOnDeliveryRadio.checked) {
				return true; // Cho phép gửi form nếu có ít nhất một checkbox được chọn
			} else {
				alert("Vui lòng chọn phương thức thanh toán");
				return false; // Ngăn chặn việc gửi form nếu không có checkbox nào được chọn
			}
		}
	</script>