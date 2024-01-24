/**
 * bookList.js
 */

//장바구니에 담기 
function addToCart(memberNo, bookNo) {
	event.preventDefault();
	if (memberNo == '') {
		loginModal()
		return;
	}
	fetch('addCart.do', {
		method: "post",
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded'
		},
		body: 'quantity=' + 1 + '&memberNo=' + memberNo + '&bookNo=' + bookNo
	})
		.then(result => result.json())
		.then(result => {
			console.log(result)
			if (result.retCode == 'OK') {
				cartOkModal(memberNo);
			} else if (result.retCode == 'CK') {
				cartCKModal() // 장바구니 중복알림
			}

		})
}//end of addToCart



//찜하기 담기
function addLikeIt(memberNo, bookNo) {
	event.preventDefault();
	if (memberNo == '') {
		loginModal();
		return;
	}
	fetch('addLikeIt.do', {
		method: "post",
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded'
		},
		body: '&memberNo=' + memberNo + '&bookNo=' + bookNo
	})
		.then(result => result.json())
		.then(result => {
			console.log(result)
			if (result.retCode == 'OK') {
				likeItOkModal(memberNo);
			} else if (result.retCode == 'CK') {
				likeItCKModal(); // 내서재 중복알림
			}

		})
}//end of addLikeIt

//찜하기 성공 모달  
function likeItModal(memberNo) {
	Swal.fire({
		icon: "success",
		text: "찜하기 성공!",
		cancelButtonColor: "#568A35",
		confirmButtonColor: "#badc58",
		confirmButtonText: '계속 둘러보기',
		cancelButtonText: `<a href="likeIt.do?memberNo=${memberNo}">나의 찜 목록 이동</a>`
	})
}//end of cartOkModal


function makeComma(price) {
	// toString() 숫자 -> 문자열
	// replace(정규표현식, "대체문자열")
	// 정규표현식 \B(63개 문자에 일치하는 경계), {n}(n개) \d(숫자) g(전역검색)
	// x(?=y) -> "x" 뒤에 "y"가 오는 경우에만 "x"와 일치
	// x(?!y) -> "x" 뒤에 "y"가 없는 경우에만 "x"와 일치
	if(price=='')
		return
		
	return price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


// 가격 새로 만들어서(, 추가) 추가하기
	window.addEventListener("load", (event) => {
	let priceSpans = document.querySelectorAll('.pricebook .price');
	priceSpans.forEach(span => {
		let price = span.dataset.price;
		let newPrice = makeComma(price);
		console.log(newPrice);
		console.log(priceSpans);
		span.innerHTML = newPrice + '<span> 원</span>';
	})
});


//HOT SPAN 판매기준 출력 // 적용 어떻게??
/* fetch('bookBestList.do', {
 })
 .then(result => result.json())
 .then(result => {
	 //console.log(result);
	 
	 result.forEach((item, idx) => {
		 console.log(item);
		 if(idx < 2) {
			 let newSpan = document.createElement('span');
			 newSpan.innerHTML = `Hot`;
			 document.querySelector('.default-img').appendChild(newSpan);
			 document.querySelector('.default-img').setAttribute('class', 'out-of-stock');
		 }
	 })
 })

*/