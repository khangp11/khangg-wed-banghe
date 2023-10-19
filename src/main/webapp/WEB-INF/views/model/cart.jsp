<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="untree_co-section before-footer-section">
  <div class="container">
    <div class="row mb-5">
      <form class="col-md-12" method="post">
        <div class="site-blocks-table">
          <table class="table">
            <thead>
              <tr>
                <th class="product-thumbnail">Hình ảnh</th>
                <th class="product-name">Sản phẩm</th>
                <th class="product-price">Giá</th>
                <th class="product-quantity">Số lượng</th>
                <th class="product-total">Tổng cộng</th>
                <th class="product-remove">Xóa</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${cartItems}" var="cartItem">
              <tr>
                <td class="product-thumbnail">
                  <img src="images/${cartItem.product.image}" alt="Hình ảnh" class="img-fluid">
                </td>
                <td class="product-name">
                  <h2 class="h5 text-black">${cartItem.product.name}</h2>
                </td>
                <td><fmt:formatNumber maxFractionDigits="3" value="${cartItem.product.price}" /> <span> vnđ</span></td>
                <td>
                  <div class="input-group mb-3 d-flex align-items-center quantity-container" style="max-width: 120px;">
                    <div class="input-group-prepend">
                      <a href="/cart/update/${cartItem.product.id}/dis" class="btn btn-outline-black decrease" type="button">&minus;</a>
                    </div>
                    <input type="text" class="form-control text-center quantity-amount" value="${cartItem.quantity}" placeholder="" aria-label="Ví dụ văn bản với nút kèm theo" aria-describedby="button-addon1">
                    <div class="input-group-append">
                      <a href="/cart/update/${cartItem.product.id}/plus" class="btn btn-outline-black increase" type="button">&plus;</a>
                    </div>
                  </div>
                </td>
                <td><fmt:formatNumber maxFractionDigits="3" value="${cartItem.product.price * cartItem.quantity}" /> <span> vnđ</span></td>
                <td><a href="/cart/remove/${cartItem.product.id}" class="btn btn-black btn-sm">Xóa</a></td>
              </tr>
				</c:forEach>
              <!-- <tr>
                <td class="product-thumbnail">
                  <img src="images/product-2.png" alt="Hình ảnh" class="img-fluid">
                </td>
                <td class="product-name">
                  <h2 class="h5 text-black">Sản phẩm 2</h2>
                </td>
                <td>$49.00</td>
                <td>
                  <div class="input-group mb-3 d-flex align-items-center quantity-container" style="max-width: 120px;">
                    <div class="input-group-prepend">
                      <button class="btn btn-outline-black decrease" type="button">&minus;</button>
                    </div>
                    <input type="text" class="form-control text-center quantity-amount" value="1" placeholder="" aria-label="Ví dụ văn bản với nút kèm theo" aria-describedby="button-addon1">
                    <div class="input-group-append">
                      <button class="btn btn-outline-black increase" type="button">&plus;</button>
                    </div>
                  </div>
                </td>
                <td>$49.00</td>
                <td><a href="#" class="btn btn-black btn-sm">Xóa</a></td>
              </tr> -->
            </tbody>
          </table>
        </div>
      </form>
    </div>

    <div class="row">
      <div class="col-md-6">
        <div class="row mb-5">

          <div class="col-md-6">
            <a href="/index" class="btn btn-outline-black btn-sm btn-block">Tiếp tục mua sắm</a>
          </div>
        </div>

      </div>
      <div class="col-md-6 pl-5">
        <div class="row justify-content-end">
          <div class="col-md-7">
            <div class="row">
              <div class="col-md-12 text-right border-bottom mb-5">
                <h3 class="text-black h4 text-uppercase">Tổng cộng trong giỏ hàng</h3>
              </div>
            </div>
            <div class="row mb-3">
              <div class="col-md-6">
                <span class="text-black">Tổng tiền</span>
              </div>
              <div class="col-md-6 text-right">
                <strong class="text-black"> <fmt:formatNumber maxFractionDigits="3" value="${Amout}" /> <span> vnđ</span></strong>
              </div>
            </div>


            <div class="row">
              <div class="col-md-12">
                <a href="/order" class="btn btn-black btn-lg py-3 btn-block">Tiến hành thanh toán</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
