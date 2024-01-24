<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js2/alert.js"></script>
<script src="js2/commonFunc.js"></script>
<script src="js2/bookList.js"></script>
<!-- ���ι�� -->
<section class="hero-slider">
	<!-- Single Slider -->
	<div class="single-slider">
		<div class="container">
			<div class="row no-gutters">
				<div class="col-lg-9 offset-lg-3 col-12">
					<div class="text-inner">
						<div class="row">
							<div class="col-lg-7 col-12">
								<div class="hero-text"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ End Single Slider -->
</section>
<!-- ���ι�� ��. -->
<!-- �Ű����� -->
<div class="product-area most-popular section pricebook">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-title">
					<h2>������ ��õ ����</h2>

				</div>
			</div>
		</div>
		<div class="row">

			<div class="col-12">
				<div class="owl-carousel popular-slider ">
					<!-- Start Single Product -->

					<!-- End Single Product -->
					<!-- Start Single Product -->
					<c:forEach var="vo" items="${bookRandomList}">
						<div class="single-product">
							<div class="product-img">
								<a href="bookDetail.do?bookNo=${vo.bookNo}"> <img
									class="default-img new-img-size" src="images/${vo.img}" alt="#">
								</a>
								<div class="button-head">
									<div class="product-action">
										<a title="Wishlist" href="#"
											onclick="addLikeIt('${sessionScope.memberNo}',${vo.bookNo})"><i
											class=" ti-heart "></i><span>���ϱ�</span></a>
									</div>
									<div class="product-action-2">
										<a title="Add to cart" href="#"
											onclick="addToCart('${sessionScope.memberNo}',${vo.bookNo})">��ٱ��Ͽ�
											���</a>
									</div>
								</div>
							</div>
							<div class="product-content">
								<h3>
									<a href="bookDetail.do?bookNo=${vo.bookNo}">${vo.name}</a>
								</h3>
								<div class="product-price">
									<span class="price" data-price="${vo.price}">${vo.price}��</span>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- End Single Product -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- �Ű����� ��. -->

<!-- �߰� ���(������å ���)  -->
<section class="midium-banner">
	<div class="container">
		<div class="row">
			<!-- Single Banner  -->
			<div class="col-lg-6 col-md-6 col-12">
				<div class="single-banner">
					<img src="images/thisyearbest.jpg" alt="#">
					<div class="content">

						<a href="bookDetail.do?bookNo=77">View Now</a>
					</div>
				</div>
			</div>
			<!-- /End Single Banner  -->
			<!-- Single Banner  -->
			<div class="col-lg-6 col-md-6 col-12">
				<div class="single-banner">
					<img src="images/recommand.jpg" alt="#">
					<div class="content">

						<a href="bookDetail.do?bookNo=76" class="btn">Shop Now</a>
					</div>
				</div>
			</div>
			<!-- /End Single Banner  -->
		</div>
	</div>
</section>
<!-- �߰� ���(������å ���) ��. -->
<div class="product-area most-popular section">
<section class="shop-home-list section">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6 col-12 pricebook">
					<div class="row">
						<div class="col-12">
							<div class="shop-section-title">
								<h1>������ ���׵𼿷�</h1>
							</div>
						</div>
					</div>
					<!-- Start Single List  -->
					<c:forEach var="vo" items="${bookRandomList}" begin="0" end="4">
					<div class="single-list">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-12">
								<div class="list-image overlay">
									<img src="images/${vo.img}" alt="#"> <a title="Add to cart"
										href="#" onclick="addToCart('${sessionScope.memberNo}',${vo.bookNo})"class="buy"><i class="fa fa-shopping-bag"></i></a>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12 no-padding">
								<div class="content">
									<h4 class="title">
										<a href="bookDetail.do?bookNo=${vo.bookNo}">${vo.name}</a>
									</h4>
									<p>${vo.author}</p>
									<p class="price" data-price="${vo.price}">${vo.price}</p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- End Single List  -->

			</div>
			<div class="col-lg-4 col-md-6 col-12 pricebook">
				<div class="row">
					<div class="col-12">
						<div class="shop-section-title">
							<h1>ã�� å�� ���ٸ� �̰� ���?</h1>
						</div>
					</div>
				</div>
									<!-- Start Single List  -->
					<c:forEach var="vo" items="${bookRandomList}" begin="5" end="9">
					<div class="single-list">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-12">
								<div class="list-image overlay">
									<img src="images/${vo.img}" alt="#"> <a title="Add to cart"
										href="#" onclick="addToCart('${sessionScope.memberNo}',${vo.bookNo})"class="buy"><i class="fa fa-shopping-bag"></i></a>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12 no-padding">
								<div class="content">
									<h4 class="title">
										<a href="bookDetail.do?bookNo=${vo.bookNo}">${vo.name}</a>
									</h4>
									<p>${vo.author}</p>
									<p class="price" data-price="${vo.price}">${vo.price}</p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- End Single List  -->

			</div>
			<div class="col-lg-4 col-md-6 col-12 pricebook">
				<div class="row">
					<div class="col-12">
						<div class="shop-section-title">
							<h1>�������� �α⵵��</h1>
						</div>
					</div>
				</div>
				<!-- Start Single List  -->
					<c:forEach var="vo" items="${bookRandomList}" begin="10" end="15">
					<div class="single-list">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-12">
								<div class="list-image overlay">
									<img src="images/${vo.img}" alt="#"> <a title="Add to cart"
										href="#" onclick="addToCart('${sessionScope.memberNo}',${vo.bookNo})"class="buy"><i class="fa fa-shopping-bag"></i></a>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12 no-padding">
								<div class="content">
									<h4 class="title">
										<a href="bookDetail.do?bookNo=${vo.bookNo}">${vo.name}</a>
									</h4>
									<p>${vo.author}</p>
									<p class="price" data-price="${vo.price}">${vo.price}</p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- End Single List  -->
			</div>
		</div>
	</div>
</section>
</div>
<!-- å ���(3���� ����) ��.  -->
