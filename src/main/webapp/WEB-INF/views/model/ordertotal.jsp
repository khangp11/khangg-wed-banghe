<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<br><br><br>
 <div class="container">   
<p style="font-size: 18px; font-weight: bold;">Số lượng đơn hàng đã đặt: ${orderCount}</p>

	 <form action="/filter" method="get">
        <label for="ngayBatDau">Ngày bắt đầu:</label>
        <input type="date" id="ngayBatDau" name="ngayBatDau" required>
        
        <label for="ngayKetThuc">Ngày kết thúc:</label>
        <input type="date" id="ngayKetThuc" name="ngayKetThuc" required>
        
        <button type="submit">Lọc</button>
    </form>


<h1 style="font-size: 24px; color: #333;">Danh sách các đơn hàng</h1>
<table style="border-collapse: collapse; width: 100%;">
    <tr>
        <th style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">ID đơn hàng</th>
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Ngày đặt</th>
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Số tiền</th>
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Số lượng</th>
			<th
				style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Trạng thái</th>
			<th style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Ngày tạo</th>
        <th style="border: 1px solid #000; padding: 8px; background-color: #f0f0f0;">Địa chỉ giao hàng</th>

        <!-- Thêm các cột khác theo nhu cầu -->
    </tr>
    
    <c:forEach items="${orders}" var="order">
        <tr>
            <td style="border: 1px solid #000; padding: 8px;">${order.id}</td>
				<td style="border: 1px solid #000; padding: 8px;">${order.account.username}</td>
				<td style="border: 1px solid #000; padding: 8px;">${order.product.name}</td>
				<td style="border: 1px solid #000; padding: 8px;"><fmt:formatNumber maxFractionDigits="3" value="${order.product.price}" /> <span> vnđ</span></td>
				<td style="border: 1px solid #000; padding: 8px;">${order.quantity}</td>
				<td style="border: 1px solid #000; padding: 8px;">${order.createDate}</td>
            <td style="border: 1px solid #000; padding: 8px;">${order.address}</td>

            <!-- Thêm các cột khác theo nhu cầu -->
        </tr>
    </c:forEach>
</table>
 </div> 
<br><br><br><br><br><br>
