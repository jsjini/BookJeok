<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="js2/bookList.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<!--  템플릿만 분리해서 들고옴- body와 href 링크 연결시킴. 목록 출력 안됨 -->
<div class="product-area most-popular section">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-title">
					<h2>신간도서</h2>
					<span>새로 출간된 도서들을 만나보세요!</span>
				</div>
			</div>
		</div>
		<div class="row">
						
			<div class="col-12">
				<div class="owl-carousel popular-slider">
					<!-- Start Single Product -->
					
					<!-- End Single Product -->
					<!-- Start Single Product -->
					<c:forEach var="vo" items="${bookNewList}">
					<div class="single-product">
						<div class="product-img">
							<a href="bookDetail.do?bookNo=${vo.bookNo}"> <img class="default-img"
								src="images/${vo.img}" alt="#"> <img
								class="hover-img" src="images/${vo.img}"
								alt="#">
							</a>
							<div class="button-head">
								<div class="product-action">
										<a title="Wishlist" href="#"
												onclick="addLikeIt('${sessionScope.memberNo}',${vo.bookNo})"><i
												class=" ti-heart "></i><span>찜하기</span></a>
								</div>
								<div class="product-action-2">
									<a title="Add to cart" href="#" onclick="addToCart('${sessionScope.memberNo}',${vo.bookNo})">장바구니에 담기</a>
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
		</c:forEach>
					<!-- End Single Product -->
				</div>
			</div>
		</div>
	</div>
</div>

