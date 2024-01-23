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
							<h6 class="my-3 font-weight-normal"> | ${vo.category }</h6>
							<a href="bookDetail.do?bookNo=${vo.bookNo }" class="font-weight-bold h5">${vo.name }</a>
						</li>
						<li class="list-group-item py-4">${vo.author } 저 | ${vo.comp } | ${vo.dt }</li>
						<li class="list-group-item py-4 text-danger font-weight-bold h5 price" data-price="${vo.price }"></li>
					</ul>
					<div class="col-2 float-left text-center">
						<input type="number" name="" class="input-number text-center m-5 p-2" value="1" style="width: 100px;">
						<!-- 바로구매, 장바구니, 내서재 버튼 -->						
						<div class="row-2 btn-group-vertical float-right btns">
							<button type="button" class="btn mb-3 addPurchase" data-bookimg="${vo.img }" data-bookname="${vo.name }" data-bookpirce="${vo.price }" data-bookno="${vo.bookNo }">바로구매</button>
							<button type="button" class="btn mb-3 addCartBtn" data-bookno="${vo.bookNo }">장바구니</button>
							<button type="button" class="btn mb-3 addLike" data-bookno="${vo.bookNo }" >내 서재</button>
						</div>

					</div>
				</div>

			</div>
		</c:forEach>
		<form id="formOrder" action="orderItemPageList.do" method="post"><input type="hidden" name="orders" id="orders"></form>
	</div>

<script>
	// 가격 새로 만들어서(, 추가) 추가하기
	let priceLiTags = document.querySelectorAll('.price');
	priceLiTags.forEach(tag => {
		let price = tag.dataset.price;
		let newPrice = makeComma(price);
		// console.log(newPrice);
		tag.innerHTML = newPrice + '<span> 원</span>';
		
	})
	

	//바로구매, 장바구니, 내서재 버튼 전체에 클릭 그룹이벤트
	$('.btns').on('click', function () {
		let memberNo = '${sessionScope.memberNo}';
		let logId = '${sessionScope.logId}';
		let bookNo = event.target.dataset.bookno;
		
		if(logId == ''){
			loginModal(); // 로그인 필요 알림 모달
		} else{
			if (event.target.classList.contains("addCartBtn")){ // 1. 장바구니 (로그인O)
				//alert('클릭됨');
				
				// fetch 함수
				fetch('addCart.do?memberNo=' + memberNo + '&bookNo=' + bookNo)
				.then(str => str.json())
				.then(result => {
					// console.log(result);
					
					if (result.retCode == 'NG') {
						warningAlert("장바구니에 추가를 하지 못하였습니다.");
					} else if (result.retCode == 'OK') {
						cartOkModal(memberNo);
					} else if (result.retCode == 'CK') {
						cartCKModal();
					}
					
				})
				.catch(err => console.error(err));
			
			} else if(event.target.classList.contains("addPurchase")) { // 2. 바로구매 (로그인O)

				let bookNo = event.target.dataset.bookno;
				let bookImg = event.target.dataset.bookimg;
				let bookName = event.target.dataset.bookname;
				let bookPirce = event.target.dataset.bookpirce;
				let quantity =  $(event.target).parent().parent().find('input').val() ;
				
				let orders = [{ "bookNo": bookNo, "bookImg": bookImg, "bookName": bookName, "bookPirce": bookPirce, "quantity": quantity }];
				
				let orders1 = JSON.stringify(orders);
				document.querySelector('#orders').value = orders1;
				formOrder.submit();
	
			} else if (event.target.classList.contains("addLike")) { // 3. 내서재	(로그인O)
				let bookNo = event.target.dataset.bookno;
				// console.log(memberNo, bookNo);
				
				// fetch 함수
				fetch('addLikeIt.do?memberNo=' + memberNo + '&bookNo=' + bookNo)
				.then(str => str.json())
				.then(result => {
					// console.log(result);
					
					if (result.retCode == 'NG') {
						warningAlert("내 서재에 추가하지 못했습니다.");
					} else if (result.retCode == 'OK') {
						likeItOkModal(memberNo);
					} else if (result.retCode == 'CK') {
						likeItCKModal();
					}
					
				})
				.catch(err => console.error(err));
			
			} 
		}
	})
</script>