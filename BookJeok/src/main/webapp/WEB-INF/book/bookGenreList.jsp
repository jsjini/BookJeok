<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>
<script src="js2/bookList.js"></script>
<!-- 아직 건들이지 못함. 화면 출력안됨 -->
<div class="product-area section">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-title">
					<h2>분야별 인기서적</h2>
					<span>관심 도서를 확인해보세요!</span>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="product-info">

					<div class="tab-content" id="myTabContent">
						<!-- Start Single Tab -->
						<div class="tab-pane fade show active" id="man" role="tabpanel">
							<div class="tab-single">
								<div class="row">
									<c:forEach var="vo" items="${bookGenreList}">
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="bookDetail.do?bookNo=${vo.bookNo}"> <img
														class="default-img" src="images/${vo.img}" alt="#">
														<img class="hover-img" src="images/${vo.img}" alt="#">
														<span class="out-of-stock">Hot</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>상세보기</span></a>
															<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>찜하기</span></a>
														</div>
														<div class="product-action-2">
															
															<a title="Add to cart" href="#" onclick="addToCart(${sessionScope.memberNo},${vo.bookNo})">장바구니에 넣기</a>
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
									<div id="paging" class="pagination"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
