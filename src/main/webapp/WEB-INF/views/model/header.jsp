<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- <style>
.sticky {
	position: sticky;
	top: 0;

}
</style> -->


<!-- Start Header/Navigation -->
<nav
	class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark sticky-top"
	arial-label="Furni navigation bar">

	<div class="container ">
		<a class="navbar-brand" href="/index">Furni<span>.</span></a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarsFurni" aria-controls="navbarsFurni"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsFurni">
			<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
				<li><a class="nav-link" href="/index">Home</a></li>
				<li><a class="nav-link" href="/list">Shop</a></li>
				<li><c:if test="${not empty sessionScope.user }">
						<li><a class="nav-link" href="orderdetail">Welcome
								${sessionScope.user.fullname }</a></li>
						<li><a class="nav-link" href="/logout">Logout</a></li>
					</c:if></li>
				<c:if test="${empty sessionScope.user }">
					<li><a class="nav-link" href="/login">Login</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.userAdmin}">
					<li><a class="nav-link" href="/admin">Admin Tool</a></li>
				</c:if>
			</ul>

			<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
				<li><a class="nav-link" href="/user"><img
						src="/images/user.svg"></a></li>
				<li class="position-relative"><a class="nav-link " href="/cart"><img
						src="/images/cart.svg"></a> <span
					class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">${count != null ? count: 0}</span>
				</li>
			</ul>
		</div>
	</div>

</nav>
<!-- End Header/Navigation -->