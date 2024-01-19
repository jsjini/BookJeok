<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="js2/bookList.js"></script>
<div class="product-area section">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-title">
					<h2>베스트 도서</h2>
					<span>이번 달 가장 많이 찾은 도서를 한 눈에!</span>
				</div>
			</div>
		</div>
		<!-- Start Single Tab -->
		<div class="tab-pane fade show active" id="man" role="tabpanel">
			<div class="tab-single">
				<div class="row">
					<c:forEach var="vo" items="${bookBestList}">
						<div class="col-xl-3 col-lg-4 col-md-4 col-12">
							<div class="single-product">
								<div class="product-img">
									<a href="bookDetail.do?bookNo=${vo.bookNo}"> <img class="default-img"
										src="images/${vo.img}">
									</a>
									<div class="button-head">
										<div class="product-action">
											<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>찜하기</span></a>
										</div>
										<div class="product-action-2">
											<a title="Add to cart" href="#" onclick="addToCart(${sessionScope.memberNo},${vo.bookNo})">장바구니에 담기</a>
										</div>
									</div>
								</div>
								<div class="product-content">
									<h3>
										<a href="bookDetail.do?bookNo=${vo.bookNo}">${vo.name}</a>
									</h3>
									<div class="product-price">
										<span>${vo.price}원</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
