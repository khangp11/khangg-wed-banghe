<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<br>
<br>
<br>
<div
	style="font-family: Arial, sans-serif; text-align: center; background-color: #f5f5f5;">
	<div
		style="max-width: 600px; margin: 0 auto; padding: 20px; background-color: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);">
		<h1 style="color: #333;">Cảm ơn bạn đã tin tưởng và đặt hàng của
			chúng tôi</h1>

		<h3 style="margin-top: 20px; margin-bottom: 10px; color: #333;">Đơn
			hàng của bạn bao gồm</h3>

		<div
			style="border: 1px solid #ddd; padding: 10px; margin: 10px 0; background-color: #f9f9f9;">
			<%-- <div>${userDetail.username}</div> --%>
			<div>Tên người nhận: ${userDetail.fullname}</div>
			<div>Email: ${userDetail.email}</div>
			<div>Địa chỉ: ${order.address}</div>
			<div>Ngày tạo: ${order.createDate}</div>
		</div>

		<h3 style="color: #333;">Danh sách sản phẩm</h3>
		<table style="width: 100%; border-collapse: collapse;">
			<tr style="border: 1px solid #ddd; background-color: #f9f9f9;">
				<th style="border: 1px solid #ddd; padding: 10px;">Tên sản phẩm</th>
				<th style="border: 1px solid #ddd; padding: 10px;">Số lượng</th>
				<th style="border: 1px solid #ddd; padding: 10px;">Giá</th>
				<th style="border: 1px solid #ddd; padding: 10px;">Thành tiền</th>
			</tr>
			<c:forEach items="${cartItems}" var="cartItem">
				<tr style="border: 1px solid #ddd; background-color: #f9f9f9;">
					<td style="border: 1px solid #ddd; padding: 10px;">${cartItem.product.name}</td>
					<td style="border: 1px solid #ddd; padding: 10px;">${cartItem.quantity}</td>
					<td style="border: 1px solid #ddd; padding: 10px;"><fmt:formatNumber maxFractionDigits="3" value="${cartItem.product.price}" /> <span> vnđ</span></td>
					<td style="border: 1px solid #ddd; padding: 10px;"><fmt:formatNumber maxFractionDigits="3" value="${cartItem.product.price * cartItem.quantity}" /> <span> vnđ</span></td>
				</tr>
			</c:forEach>
		</table>

		<div
			style="border: 1px solid #ddd; padding: 10px; margin: 10px 0; background-color: #f9f9f9;">
			<div class="total-amount"> Tổng tiền :<fmt:formatNumber maxFractionDigits="3" value="${Amount}" /> <span> vnđ</span></div>
		</div>

		<a href="/orderdetail"
			style="text-decoration: none; color: #007bff; display: block;">Chi
			tiết các đơn đặt hàng</a>
	</div>
</div>


