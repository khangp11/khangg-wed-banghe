<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chào mừng</title>
<%@ include file="model/head.jsp"%>
<link href="/css/login.css" rel="stylesheet">
</head>
<body>

	<!-- Bao gồm phần Header -->
	<%@ include file="model/header.jsp"%>
	<br>
	<br>
	<div class="cont">
    <form method="post" action="/login" class="form sign-in text-center">
        <h2>Chào mừng</h2>
        <label for="CustomerEmail"><span>Tài khoản</span></label>
        <input type="text" name="username" id="CustomerEmail" class="form-control" autocorrect="off" autocapitalize="off" autofocus="" />

        <label for="CustomerPassword"><span>Mật khẩu</span></label>
        <input type="password" value="" name="password" id="CustomerPassword" class="form-control" />

        <p class="forgot-pass"><a href="forgot-password">Quên mật khẩu?</a></p>

        <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>

        <c:if test="${not empty message}">
            <div class="mt-3">
                <i style="color: red; font-weight: bold">${message}</i>
            </div>
        </c:if>
        
        <c:if test="${loginSuccess}">
            <div class="mt-3">
                <a href="index">Về trang chủ</a>
            </div>
        </c:if>
    </form>

    <div class="sub-cont">
        <div class="img">
            <div class="img__text m--up">
                <h3>Bạn chưa có tài khoản? Vui lòng Đăng ký!</h3>
            </div>
            <div class="img__text m--in">
                <h3>Nếu bạn đã có tài khoản, hãy đăng nhập.</h3>
            </div>
            <div class="img__btn">
                <span class="m--up">Đăng ký</span> <span class="m--in">Đăng nhập</span>
            </div>
        </div>
        <form:form modelAttribute="account" name="frmregister" method="post" action="/register" id="CustomerLoginForm" accept-charset="UTF-8" class="contact-form form sign-up">
            <h2>Tạo tài khoản của bạn</h2>

            <label for="FirstName"><span>Tài khoản</span></label>
            <input path="username" ng-model="username" name="username" required="required" placeholder="" id="FirstName" autofocus="" class="form-control" />

            <label for="FullName"><span>Họ và tên</span></label>
            <input path="fullname" ng-model="fullname" name="fullname" required="required" placeholder="" id="FullName" autofocus="" class="form-control" />

            <label for="CustomerEmail"><span>Email</span></label>
            <input path="email" ng-model="email" name="email" required="required" placeholder="" id="CustomerEmail" class="form-control" autocorrect="off" autocapitalize="off" autofocus="" />

            <label for="CustomerPassword"><span>Mật khẩu</span></label>
            <input path="password" ng-model="password" value="" required="required" name="password" placeholder="" id="CustomerPassword" class="form-control" />

            <button type="button navbar-toggler btn btn-primary btn-block" class="submit">Đăng ký</button>
        </form:form>
    </div>
</div>


	<!-- Bao gồm phần Footer -->
	<%@ include file="model/footer.jsp"%>

	<script>
		document.querySelector('.img__btn').addEventListener(
				'click',
				function() {
					document.querySelector('.cont').classList
							.toggle('s--signup');
				});
	</script>
</body>
</html>
