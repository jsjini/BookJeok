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
						<div class="btn-group-vertical float-right btns">
							<c:choose>
								<c:when test="${empty logId }">
									<button type="button" class="btn mb-3 mt-5 noPurchase">바로구매</button>
									<button type="button" class="btn mb-3 noCartBtn">장바구니</button>
									<button type="button" class="btn mb-3 noLike">내 서재</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn mb-3 mt-5 addPurchase" data-bookimg="${vo.img }" data-bookname="${vo.name }" data-bookpirce="${vo.price }" data-bookno="${vo.bookNo }">바로구매</button>
									<button type="button" class="btn mb-3 addCartBtn" data-bookno="${vo.bookNo }" data-memberno="${memberNo }">장바구니</button>
									<button type="button" class="btn mb-3 addLike">내 서재</button>
								</c:otherwise>
							</c:choose>
							
						</div>

					</div>
				</div>

			</div>
		</c:forEach>
		<form id="formOrder" action="orderItemPageList.do" method="post"><input type="hidden" name="orders" id="orders"></form>
	</div>

	<script>		
		// 바로구매, 장바구니, 내서재 버튼 전체에 클릭 그룹이벤트
		$('.btns').on('click', function () {
			let memberNum = event.target.dataset.memberno;
			let bookNum = event.target.dataset.bookno;
			
			if (event.target.classList.contains("addCartBtn")){ // 1. 장바구니 (로그인O)
				alert('클릭됨');
				
				// fetch 함수
				fetch('addCart.do?memberNo=' + memberNum + '&bookNo=' + bookNum)
				.then(str => str.json())
				.then(result => {
					console.log(result);
					
					if (result.retCode == 'NG') {
						alert("장바구니에 추가를 하지 못하였습니다.");
					} else if (result.retCode == 'OK') {
						if(confirm("장바구에 추가되었습니다. 장바구니로 이동하시겠습니까?")){
							location.href = 'cartList.do';							
						}
					} else if (result.retCode == 'CK') {
						alert("장바구니에 추가된 상품입니다.");
					} else if (result == '5') {
						alert("로그인이 필요합니다.");
					}
					
				})
				.catch(err => console.error(err));
			
			} else if(event.target.className == "btn mb-3 mt-5 addPurchase") { // 2. 바로구매 (로그인O)
				alert('바로구매');
				let bookNo = event.target.dataset.bookno;
				let bookImg = event.target.dataset.bookimg;
				let bookName = event.target.dataset.bookname;
				let bookPirce = event.target.dataset.bookpirce;
				let quantity = 1; // 책 한권만 넘어감
				
				let orders = [{ "bookNo": bookNo, "bookImg": bookImg, "bookName": bookName, "bookPirce": bookPirce, "quantity": quantity }];
				
				let orders1 = JSON.stringify(orders);
				document.querySelector('#orders').value = orders1;
				formOrder.submit();
	
			} else if (event.target.className == "btn mb-3 addLike") { // 3. 내서재	(로그인O)
				alert("내서재");
			
			} else if (event.target.className == "btn mb-3 noCartBtn" | "btn mb-3 mt-5 noPurchase" | "btn mb-3 noLike") { // 4. 장바구니 | 바로구매 | 내서재 (로그인X)
				alert('로그인이 필요합니다.');
			} 
			
			
		})
	</script>