<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="untree_co-section product-section before-footer-section">
	<div class="product-section">
		<div class="container">
			<div class="row">
				<!-- Start Column 1 -->
				<div class="col-md-12 col-lg-3 mb-5 mb-lg-0">
					<h2 class="mb-4 section-title">Sản phẩm được tạo bằng những vật liệu tốt nhất.</h2>

						<a href="/list" class="btn">Mua ngay</a>
					</p>
				</div>
				<!-- End Column 1 -->

					<c:forEach var="item" items="${items}" varStatus="loopStatus">
						<c:if test="${loopStatus.index < 3}">
							<div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
								<a class="product-item" href="/detail/${item.id}"> <img
									src="images/${item.image}" class="img-fluid product-thumbnail">
									<h3 class="product-title">${item.name}</h3> <strong
									class="product-price"><fmt:formatNumber maxFractionDigits="3" value="${item.price}" /> <span> vnđ</span></strong> <span
									class="icon-cross"> <img src="images/cross.svg"
										class="img-fluid">
								</span>
								</a>
							</div>
						</c:if>
					</c:forEach>
			</div>
		</div>
	</div>
</div>
		
<div class="why-choose-section">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-6">
                <h2 class="section-title">Tại sao chọn chúng tôi</h2>
                <p>Chúng tôi luôn đặt chất lượng lên hàng đầu. Khách hàng là ưu tiên hàng đầu của chúng tôi. Hãy để chúng tôi phục vụ bạn.</p>

                <div class="row my-5">
                    <div class="col-6 col-md-6">
                        <div class="feature">
                            <div class="icon">
                                <img src="images/truck.svg" alt="Hình ảnh" class="imf-fluid">
                            </div>
                            <h3>Giao hàng nhanh &amp; miễn phí</h3>
                            <p>Chúng tôi cam kết giao hàng nhanh chóng và miễn phí. Hãy để chúng tôi phục vụ bạn tốt nhất.</p>
                        </div>
                    </div>

                    <div class="col-6 col-md-6">
                        <div class="feature">
                            <div class="icon">
                                <img src="images/bag.svg" alt="Hình ảnh" class="imf-fluid">
                            </div>
                            <h3>Dễ dàng mua sắm</h3>
                            <p>Chúng tôi mang đến trải nghiệm mua sắm dễ dàng và thuận tiện. Hãy lựa chọn sản phẩm mà bạn yêu thích.</p>
                        </div>
                    </div>

                    <div class="col-6 col-md-6">
                        <div class "feature">
                            <div class="icon">
                                <img src="images/support.svg" alt="Hình ảnh" class="imf-fluid">
                            </div>
                            <h3>Hỗ trợ 24/7</h3>
                            <p>Chúng tôi luôn sẵn sàng hỗ trợ bạn 24/7. Đừng ngần ngại liên hệ chúng tôi khi cần giúp đỡ.</p>
                        </div>
                    </div>

                    <div class="col-6 col-md-6">
                        <div class="feature">
                            <div class="icon">
                                <img src="images/return.svg" alt="Hình ảnh" class="imf-fluid">
                            </div>
                            <h3>Đổi/Trả hàng dễ dàng</h3>
                            <p>Chúng tôi cam kết đổi/trả hàng dễ dàng và thuận tiện. Sự hài lòng của bạn là ưu tiên của chúng tôi.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="img-wrap">
                    <img src="images/why-choose-us-img.jpg" alt="Hình ảnh" class="img-fluid">
                </div>
            </div>
        </div>
    </div>
</div>

