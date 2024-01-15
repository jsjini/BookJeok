<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div class="topbar">
			<div class="container">
				<div class="row">
					<div class="col-lg-5 col-md-12 col-12">
						<!-- 공간주기 위함 : 나중에 수정필요 -->
					</div>
					<div class="col-lg-7 col-md-12 col-12">
						<!-- Top Right : 오른쪽 상단 메뉴 -->
						<div class="right-content">
							<ul class="list-main">
								<li><i class="login"></i><a href="login.html#">로그인</a></li>
								<li><i class="join"></i><a href="login.html#">회원가입</a></li>
								<li><i class="infomem"></i><a href="#">회원안내</a></li>
							</ul>
						</div>
						<!-- End Top Right -->
					</div>
				</div>
				
				
			</div>
		</div>
		<!-- End Topbar -->
		<div class="middle-inner">
			<div class="container">
				<div class="row">
					<div class="col-lg-2 col-md-2 col-12">
						<!-- Logo : 로고 -->
						<div class="logo">
							<a href="#"><img src="images/logo.png" alt="logo" class="w-75"></a>
						</div>
						<!--/ End Logo -->
						<!-- Search Form 검색창 -->
						<div class="search-top">
							<div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
							<!-- Search Form -->
							<div class="search-top">
								<form class="search-form">
									<input type="text" placeholder="검색 도서를 입력해주세요" name="search">
									<button value="search" type="submit"><i class="ti-search"></i></button>
								</form>
								
							</div>
							<!--/ End Search Form -->
							
						</div>
						<!--/ End Search Form -->
						<div class="mobile-nav"></div>
					</div>
					<div class="col-lg-8 col-md-7 col-12">
						<div class="search-bar-top">
							<div class="search-bar">
								<form action="bookSearchList.jsp" method="get">
									<input name="search" placeholder="도서명을 입력해주세요~" type="search">
									<button class="btnn"><i class="ti-search"></i></button>
								</form>
							</div>
						</div>
						<div class="text-center">
								<!-- 인기검색어 -->
								<c:forEach var="item" items="${searchVO }">
									<span>${item.keyword }</span>
								
								</c:forEach>
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-12">
						<div class="right-bar">
							<!-- Search Form -->
							<div class="sinlge-bar">
								<a href="#" class="single-icon"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
							</div>
							<div class="sinlge-bar">
								<a href="#" class="single-icon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
							</div>
							<div class="sinlge-bar shopping">
								<a href="#" class="single-icon"><i class="ti-bag"></i> <span class="total-count">2</span></a>
								<!-- Shopping Item -->
								<div class="shopping-item">
									<div class="dropdown-cart-header">
										<span>2 Items</span>
										<a href="#">View Cart</a>
									</div>
									<ul class="shopping-list">
										<li>
											<a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
											<a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
											<h4><a href="#">Woman Ring</a></h4>
											<p class="quantity">1x - <span class="amount">$99.00</span></p>
										</li>
										<li>
											<a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
											<a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
											<h4><a href="#">Woman Necklace</a></h4>
											<p class="quantity">1x - <span class="amount">$35.00</span></p>
										</li>
									</ul>
									<div class="bottom">
										<div class="total">
											<span>Total</span>
											<span class="total-amount">$134.00</span>
										</div>
										<a href="checkout.html" class="btn animate">Checkout</a>
									</div>
								</div>
								<!--/ End Shopping Item -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
