<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- bootstrap@5.3.2의 css -->
<link href="css2/bootstrap5_3_2.css">
<script src="js2/alert.js"></script>
<script src="js2/bookList.js"></script>
<script src="js2/commonFunc.js"></script>

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
					<c:forEach var="vo" items="${bookBestList}" varStatus="status">
						<div class="col-xl-3 col-lg-4 col-md-4 col-12">
							<div class="single-product">
								<div class="product-img">

									<a href="bookDetail.do?bookNo=${vo.bookNo}"> <img
										class="default-img new-img-size" src="images/${vo.img}">
									
									</a>
									<div class="button-head">
										<div class="product-action">
											<a title="Wishlist" href="#"
												onclick="addLikeIt('${sessionScope.memberNo}',${vo.bookNo})"><i
												class=" ti-heart "></i><span>찜하기</span></a>
										</div>
										<div class="product-action-2">
											<a title="Add to cart" href="#"
												onclick="addToCart('${sessionScope.memberNo}',${vo.bookNo})">장바구니에
												담기</a>
										</div>
									</div>
								</div>
								<div class="product-content pricebook">
									<h3>
										<a href="bookDetail.do?bookNo=${vo.bookNo}">${vo.name}</a>
									</h3>
									<div>
										<span class="price" data-price="${vo.price}">${vo.price}원</span>
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