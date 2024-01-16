<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!--  템플릿만 분리해서 들고옴- body와 href 링크 연결시킴. 목록 출력 안됨 -->
<div class="product-area most-popular section">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-title">
					<h2>신간도서</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="owl-carousel popular-slider">
					<!-- Start Single Product -->
					<div class="single-product">
						<c:forEach var="vo" items="${bookNewList}">
							<div class="product-img">
								<a href="product-details.html"> <img class="default-img"
									src="images/${vo.img}" alt="#"> <span class="out-of-stock">New</span>
								</a>
								<div class="button-head">
									<div class="product-action">
										<a data-toggle="modal" data-target="#exampleModal"
											title="Quick View" href="#"><i class=" ti-eye"></i><span>상세보기</span></a>
										<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>찜하기</span></a>
									</div>
									<div class="product-action-2">
										<a title="Add to cart" href="#">장바구니에 담기</a>
									</div>
								</div>
							</div>
							<div class="product-content">
								<h3>
									<a href="product-details.html">${vo.name}</a>
								</h3>
								<div class="product-price">
									<span>${vo.price}원</span>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- End Single Product -->
				</div>
			</div>
		</div>
	</div>
</div>
