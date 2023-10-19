<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="fmt"
	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<br>
<br>
<br>
<div class="container">
	<p style="font-size: 18px; font-weight: bold;">Số lượng đơn hàng đã
		đặt: ${orderCount}</p>

	<div class="row">
		<div class="col-6">
			<form:form action="/ordermuahang" method="post" modelAttribute="item">
				<div class="form-group">
					<label for="id">ID:</label>
					<form:input path="id" class="form-control" type="text"
						style="max-width: 300px;" />
				</div>
				<form:input path="date" class="form-control" type="hidden" />
				<form:input path="price" class="form-control" type="hidden" />
				<form:input path="quantity" class="form-control" type="hidden" />
				<form:input path="address" class="form-control" type="hidden" />
				<div class="form-group">
					<label for="trangThai">Trang Thai:</label>
					<form:select path="trangThai" class="form-control"
						style="max-width: 300px;">
						<form:option value="chuagiao">Chua giao</form:option>
						<form:option value="dagiao">Da giao</form:option>
						<form:option value="huy">Huy</form:option>
					</form:select>
				</div>
				<button formaction="/admin/orderupdate" class="btn btn-info">Update</button>
			</form:form>
		</div>

		<div class="col-6">
			<form action="/filter" method="post" class="form-inline">
				<div class="form-group mx-2">
					<label for="ngayBatDau" class="mr-2">Ngày bắt đầu:</label> <input
						type="date" id="ngayBatDau" name="ngayBatDau" class="form-control"
						required>
				</div>
				<div class="form-group mx-2">
					<label for="ngayKetThuc" class="mr-2">Ngày kết thúc:</label> <input
						type="date" id="ngayKetThuc" name="ngayKetThuc"
						class="form-control" required>
				</div>
				<button type="submit" class="btn btn-primary mx-2">Lọc</button>
			</form>
		</div>
	</div>

	<h1 style="font-size: 24px; color: #333;">Danh sách các đơn hàng</h1>
	<table style="border-collapse: collapse; width: 100%;">
		<tr>
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">ID
				đơn hàng</th>
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Ngày
				đặt</th>
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Số
				tiền</th>
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Số
				lượng</th>


			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Địa
				chỉ giao hàng</th>
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Trạng
				thái</th>
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Công
				cụ</th>

			<!-- Thêm các cột khác theo nhu cầu -->
		</tr>

		<c:forEach items="${page.content}" var="order">
			<tr>
				<td style="border: 1px solid #000; padding: 8px;">${order.id}</td>
				<td style="border: 1px solid #000; padding: 8px;">${order.date}</td>
				<td style="border: 1px solid #000; padding: 8px;"><fmt:formatNumber
						maxFractionDigits="3" value="${order.price}" /> <span> vnđ</span></td>
				<td style="border: 1px solid #000; padding: 8px;">${order.quantity}</td>
				<td style="border: 1px solid #000; padding: 8px;">${order.address}</td>
				<td style="border: 1px solid #000; padding: 8px;">${order.trangThai}</td>
				<td style="border: 1px solid #000; padding: 8px;"><a
					href="/admin/orderedit/${order.id}" class="btn btn-primary">Edit</a>
					<a href="/admin/orderchitiet/${order.id}" class="btn btn-primary">Xem chi tiết</a>
					
				<!-- Thêm các cột khác theo nhu cầu -->
			</tr>
		</c:forEach>
	</table>
	<nav aria-label="Page navigation" class="mt-4">
		<ul class="pagination justify-content-start">
			<li class="page-item"><a class="page-link"
				href="/ordermuahang?p=0" aria-label="First"> First </a></li>
			<li class="page-item"><a class="page-link"
				href="/ordermuahang?p=${page.number-1}" aria-label="Previous">
					Previous </a></li>
			<li class="page-item"><a class="page-link"
				href="/ordermuahang?p=${page.number+1}" aria-label="Next"> Next
			</a></li>
			<li class="page-item"><a class="page-link"
				href="/ordermuahang?p=${page.totalPages-1}" aria-label="Last">
					Last </a></li>
		</ul>
	</nav>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
