<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<div class="container mt-5">
			<div class="row">
				<div class="col">
					<div class="section-title">
						<h2>검색결과</h2>
						<c:choose>
							<c:when test="${empty resultVO }">
								<h5 class="mt-4">'${keyword }'에 대한 검색결과가 없습니다.</h5>
							</c:when>
							<c:otherwise>
								<h5 class="mt-4">'${keyword }'에 대한 검색결과입니다.</h5>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<c:forEach var="vo" items="${resultVO }">
				<div class="row my-5">
					<div class="col-12">
						<div class="thumb col-4 float-left">
							<a href="bookDetail.do?bookNo=${vo.bookNo }"><img src="images/${vo.img }" class="w-75"></a>
						</div>
						<ul class="col-6 float-left list-group list-group-flush mt-4">
							<li class="list-group-item py-4">
								<span>${vo.category }</span>
								<a href="bookDetail.do?bookNo=${vo.bookNo }">
									<h5 class="mt-3">${vo.name }</h5>
								</a>
							</li>
							<li class="list-group-item py-4">${vo.author } 저 | ${vo.comp } | ${vo.dt }</li>
							<li class="list-group-item py-4 text-danger font-weight-bold h6">${vo.price }원</li>
						</ul>
						<div class="col-2 float-left">
							<div class="btn-group-vertical float-right">
								<button type="button" class="btn mb-3 mt-5"><a href="#">바로구매</a></button>
								<h1></h1>
								<c:choose>
									<c:when test="${empty logId }">
										<button type="button" class="btn mb-3" id="noCart">장바구니</button>
									</c:when>
									<c:otherwise>
										<!-- <a href="cartList.do?${memberNo }" id="goCart" "
												data-memberno=${memberNo }>장바구니</a>  -->
										<button type="button" class="btn mb-3" id="addCartBtn" data-bookno="${vo.bookNo }"
											data-memberno="${memberNo }">
											장바구니
										</button>
									</c:otherwise>
								</c:choose>
								<button type="button" class="btn mb-3"><a href="#">내 서재</a></button>
							</div>

						</div>
					</div>

				</div>
			</c:forEach>

		</div>

		<script>
			// 로그인이 없을 경우 로그인필요 알림창 보이기
			// 이벤트가 중복되니까... 안됌...ㅠ
			/*
			document.querySelector('#noCart').addEventListener('click', function () {
				alert("로그인이 필요합니다.");
			})

			*/

			// 로그인 후 장바구니 클릭 시 fetch 사용하기
			/*
			let memberNum = document.querySelector('#addCartBtn').dataset.memberno;
			let bookNum = document.querySelector('#addCartBtn').dataset.bookno;


			console.log("회원번호", memberNum);
			console.log("책번호", bookNum);
			*/



			document.querySelector('#addCartBtn').addEventListener('click', function () {
				let memberNum = event.target.dataset.memberno;
				let bookNum = event.target.dataset.bookno;
				alert('hello')
				// fetch 함수 (댓글등록)
				fetch('addCart.do?memberNo=' + memberNum + '&bookNo=' + bookNum)
					.then(str => console.log(str))
					.then(result => {
						console.log(result);
						if (result.retCode == 'NG') {
							alert("장바구니에 추가를 하지 못하였습니다.");
						} else if (result.retCode == 'OK') {
							alert("장바구니에 추가되었습니다.");
						} else if (result == 'CK') {
							alert("장바구니에 이미 추가되어져 있습니다.");
						} else if (result == '5') {
							alert("로그인이 필요합니다.");
						}
					})
					.catch(err => console.error(err));

			})




		</script>