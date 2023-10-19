<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<%@ include file="model/head.jsp"%>
<title>Quên mật khẩu</title>
</head>

<body>
	<!-- Bao gồm phần Header -->
	<%@ include file="model/header.jsp"%>

	<div id="page-content">
			<!--Page Title-->
			<div class="page section-header text-center mt-5">
				<div class="page-title">
					<div class="wrapper">
						<h1 class="page-width">Quên mật khẩu</h1>
					</div>
				</div>
			</div>
			<!--End Page Title-->

			<div class="container">
				<div class="row">
					<div
						class="col-12 col-sm-12 col-md-6 col-lg-6 main-col offset-md-3">
						<div class="mb-4">
							<form method="post" action="/forgot-password"
								id="CustomerLoginForm" accept-charset="UTF-8"
								class="contact-form">
								<div class="row">
									<label for="CustomerEmail"><span>Tài khoản</span></label>
        							<input type="text" name="username" id="CustomerEmail" class="form-control" autocorrect="off" autocapitalize="off" autofocus="" />
									<div class="col-12 col-sm-12 col-md-12 col-lg-12">
										<div class="form-group">
											<c:if test="${not empty message }">
												<i style="color: red; font-weight: bold">${message}</i>
											</c:if>
										</div>
									</div>
								</div> <br>
								<div class="row">
									<div class="text-center col-12 col-sm-12 col-md-12 col-lg-12">
										<input type="submit" class="btn mb-3" value="Gửi">
										<p class="mb-4">
											<a href="/login" id="RecoverPassword">Login</a> &nbsp; |
											&nbsp; <a href="/login" id="customer_register_link">Tạo
												tài khoản?</a>
										</p>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<script>
			jQuery(document).mouseup(
					function(e) {
						var container = jQuery('#popup-container');
						if (!container.is(e.target)
								&& container.has(e.target).length === 0) {
							container.fadeOut();
							jQuery('#modalOverly').fadeIn(200);
							jQuery('#modalOverly').hide();
						}
					});
		</script>
		</div>

	<!-- Bao gồm phần Footer -->
	<%@ include file="model/footer.jsp"%>
</body>
</html>
