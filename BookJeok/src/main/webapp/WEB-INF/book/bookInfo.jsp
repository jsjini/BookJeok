<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 상세페이지 시작 -->
<div class="container text-center">
	<section class="mt-8">
		<div class="row">
			<!-- 좌측 이미지 -->
			<div class="col-md-6">
				<!-- img -->
				<img src="images/${vo.img }">
			</div>
			<!-- 우측 정보 -->
			<div class="col-md-6">
				<div class="ps-lg-10 mt-6 mt-md-0">
					<!-- hr -->
					<hr class="my-6">
					<!-- 제목상단 카테고리 -->
					<p class="text-left">
						<a class="mb-1 d-block">${vo.category} </a>
					</p>
					<!-- heading (책제목) -->
					<div class="pb-2">
						<h4 class="py-3">
							<p class="text-left">${vo.name }</p>
							</h1>
					</div>
				</div>

				<div>
					<!-- table -->
					<table class="table table-borderless mb-0">
						<tbody>
							<tr>
								<td><b>가격:</b></td>
								<td><b>${vo.price}</b></td>
							</tr>
							<tr>
								<td>저자:</td>
								<td>${vo.author}</td>
							</tr>
							<tr>
								<td>출판사:</td>
								<td>${vo.comp}</td>
							</tr>
							<tr>
								<td>카테고리 :</td>
								<td>${vo.category }</td>
							</tr>
							<tr>
								<td>출간일 :</td>
								<td>${vo.dt }</td>
							</tr>
							<tr>
								<td>배송:</td>
								<td>무료배송</td>
							</tr>
							<tr>
								<td>ISBN code:</td>
								<td>${vo.isbn }</td>
							</tr>

						</tbody>
					</table>
				</div>
				<!-- hr -->
				<hr class="my-6">

				<!-- button -->
				<div class="d-flex justify-content-center">
					<div class="d-grid gap-2">
						<!-- 카트 추가 버튼 -->
						<button type="button" class="btn btnCart"
							data-memberno="${sessionScope.memberNo}"
							data-bookno="${vo.bookNo}">
							<i class="feather-icon icon-shopping-bag me-2"></i> 장바구니
						</button>

						<!-- 찜하기 버튼 -->
						<button type="button" class="btn btnLikeIt"
							data-memberno="${sessionScope.memberNo}"
							data-bookno="${vo.bookNo}">
							<i class="feather-icon icon-shopping-bag me-2"></i>♥찜하기
						</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 우측 정보 끝. -->

	</section>



	<!-- 하단 탭 메뉴(상세정보 및 리뷰) -->
	<section class="mt-lg-14 mt-8">
		<hr class="my-6">

		<div class="row">
			<div class="col-md-12">
				<ul class="nav nav-pills nav-lb-tab" id="myTab" role="tablist">
					<!-- nav item -->
					<li class="nav-item" role="presentation">
						<!-- btn (상세정보 탭) -->
						<button class="btn" id="product-tab" data-bs-toggle="tab"
							data-bs-target="#product-tab-pane" type="button" role="tab"
							aria-controls="product-tab-pane" aria-selected="true"
							tabindex="-1">상세정보</button>
					</li>
					<!-- nav item : (리뷰 탭) -->
					<li class="nav-item" role="presentation">
						<!-- btn -->
						<button class="btn" id="details-tab" data-bs-toggle="tab"
							data-bs-target="#details-tab-pane" type="button" role="tab"
							aria-controls="details-tab-pane" aria-selected="true"
							tabindex="-1">도서리뷰</button>
					</li>

				</ul>
				<!-- tab content -->
				<div class="tab-content" id="myTabContent">
					<!-- tab pane -->
					<div class="tab-pane fade show active" id="product-tab-pane"
						role="tabpanel" aria-labelledby="product-tab" tabindex="0">
						<div class="my-8">
							<div class="mb-5">
								<!-- text -->
								<h4 class="mb-1">책 소개</h4>
								<p class="mb-0">${vo.about }</p>
							</div>
						</div>
						<div class="my-8">
							<div class="mb-5">
								<!-- text -->
								<h4 class="mb-1">책 리뷰</h4>
								<c:forEach var="review" items="${reviewVO }">
									<p class="mb-3">${review.reviewNo}.${review.mname}:
										${review.contents} (${review.rdt})</p>

								</c:forEach>





							</div>
						</div>
					</div>
					<!-- tab pane -->

				</div>
			</div>
	</section>
	<!-- 하단 탭 메뉴(상세정보 및 리뷰) 끝. -->
</div>
<!-- 상세페이지 끝. -->





<script>
	<!-- 카트 추가 -->
	$('.btnCart').on('click', function () {
		event.preventDefault();

		var memberNo = $(this).data('memberno');
		var bookNo = $(this).data('bookno');

		if (memberNo == '') {
			alert('로그인이 필요합니다');
			return;
		}

		fetch('addCart.do', {
			method: 'post',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			body: 'quantity=' + 1 + '&memberNo=' + memberNo + '&bookNo=' + bookNo
		})
			.then(result => result.json())
			.then(result => {
				console.log(result);
				if (result.retCode == 'OK') {
					alert('장바구니에 담았습니다');
				} else if (result.retCode == 'CK') {
					alert('장바구니에 이미 추가되어져 있습니다.');
				}
			});
	});
	
	
	<!-- 찜하기 추가 -->
	$('.btnLikeIt').on('click', function () {
		event.preventDefault();

		var memberNo = $(this).data('memberno');
		var bookNo = $(this).data('bookno');

		if (memberNo == '') {
			alert('로그인이 필요합니다');
			return;
		}

		fetch('addLikeIt.do', {
			method: 'post',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			body: 'quantity=' + 1 + '&memberNo=' + memberNo + '&bookNo=' + bookNo
		})
			.then(result => result.json())
			.then(result => {
				console.log(result);
				if (result.retCode == 'OK') {
					alert('찜목록에 추가했습니다');
				} else if (result.retCode == 'CK') {
					alert('찜목록에 이미 추가되어져 있습니다.');
				}
			});
	});
	
	
	
</script>