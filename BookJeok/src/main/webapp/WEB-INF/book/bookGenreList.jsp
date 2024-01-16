<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- 아직 건들이지 못함. 화면 출력안됨 -->
<div class="product-area section">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-title">
					<h2>분야별 인기서적</h2>

				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="product-info">
					<div class="nav-main">
						<!-- Tab Nav -->
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#man" role="tab">전체</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#poetry" role="tab">시/에세이</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#human" role="tab">인문/교양</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#sci" role="tab">자연과학/공학</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#it" role="tab">컴퓨터/IT</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#child" role="tab">유아/어린이</a></li>
						</ul>
						<!--/ End Tab Nav -->
					</div>
				
					<div class="tab-content" id="myTabContent">
						<!-- Start Single Tab -->
						<div class="col-xl-3 col-lg-4 col-md-4 col-12">
							<c:forEach var="vo" items="${bookGenreList}">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html"> <img class="default-img"
											src="images/${vo.img}" alt="#"> <span
											class="out-of-stock">Hot</span>
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal"
													title="Quick View" href="#"><i class=" ti-eye"></i><span>상세보기</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>찜하기</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="#">장바구니에 넣기</a>
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
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!--/ End Single Tab -->
		</div>
	</div>
</div>


