<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- bootstrap@4.6.2의 css -->
<link href="css2/bootstrap4_6_2.css">
<script src="js2/alert.js"></script>
<script src="js2/bookList.js"></script>
<!-- 아직 건들이지 못함. 화면 출력안됨 -->
<div class="product-area section">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-title">
					<h2>분야별 서적</h2>
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
														class="default-img new-img-size" src="images/${vo.img}"
														alt="#"> <img class="hover-img"
														src="images/${vo.img}" alt="#">

													</a>
													<div class="button-head">
														<div class="product-action">

															<a title="찜하기" href="#"
																onclick="addLikeIt('${sessionScope.memberNo}',${vo.bookNo})"><i
																class=" ti-heart "></i><span>찜하기</span></a>

														</div>
														<div class="product-action-2">

															<a title="장바구니에 넣기" href="#"
																onclick="addToCart('${sessionScope.memberNo}',${vo.bookNo})">장바구니에
																넣기</a>
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
							<div id="paging" style="text-align: center">

								<nav aria-label="Page navigation example">
									<input type="hidden" name="pageNum" value="${dto.currPage}">
									<ul class="pagination justify-content-center"
										style="text-align: center">
										<c:if test="${dto.prev}">
											<li class="page-item" style="display: inline-block"><a
												class="page-link"
												href="bookGenreList.do?categories=${vo.categories[0]}&categories=${vo.categories[1]}&page=${dto.startPage-1}"
												aria-label="Previous" role="button"> <span
													aria-hidden="true">&laquo;</span></a></li>
										</c:if>
										<c:forEach var="i" begin="${dto.startPage}" end="${dto.lastPage}">
											<c:choose>
												<c:when test="${empty vo.categories}">
													<li class="page-item" style="display: inline-block"><a
														class="page-link" href="bookGenreList.do?page=${i}">${i}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item" style="display: inline-block"><a
														class="page-link"
														href="bookGenreList.do?categories=${vo.categories[0]}&categories=${vo.categories[1]}&page=${i}">${i}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${dto.next}">
											<li class="page-item" style="display: inline-block"><a
												class="page-link"
												href="bookGenreList.do?categories=${vo.categories[0]}&categories=${vo.categories[1]}&page=${dto.lastPage +1}"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
											</li>
										</c:if>
									</ul>
								</nav>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>