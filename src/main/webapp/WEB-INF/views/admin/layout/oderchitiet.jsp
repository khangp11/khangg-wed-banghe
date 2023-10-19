<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="container">
	<br>
	<br>
	<br>
	
	<a
					href="/admin/ordermuahang" class="btn btn-primary">back</a>
	<h1 style="font-size: 24px; color: #333;">Danh sách các đơn hàng</h1>
	<table style="border-collapse: collapse; width: 100%;">
		<tr>
			
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Tên
				tài khoản</th>
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Tên
				sản phẩm</th>
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Giá
				sản phẩm</th>
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Số
				lượng</th>
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Ngày
				tạo</th>
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Địa
				chỉ giao hàng</th>
		</tr>

		<c:forEach items="${items}" var="order">
			<tr>
				
				<td style="border: 1px solid #000; padding: 8px;">${order.account.username} <input type="hidden" value="${oder.id }"></input></td>
				<td style="border: 1px solid #000; padding: 8px;">${order.product.name}</td>
				<td style="border: 1px solid #000; padding: 8px;"><fmt:formatNumber
						maxFractionDigits="3" value="${order.product.price}" /> <span>
						vnđ</span></td>
				<td style="border: 1px solid #000; padding: 8px;">${order.quantity}</td>
				<td style="border: 1px solid #000; padding: 8px;">${order.createDate}</td>
				<td style="border: 1px solid #000; padding: 8px;">${order.address}</td>
			</tr>
		</c:forEach>
	</table>
</div>