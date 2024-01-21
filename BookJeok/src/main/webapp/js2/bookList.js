/**
 * bookList.js
 */

//장바구니에 담기 
function addToCart(memberNo, bookNo) {
	event.preventDefault();
	if (memberNo == '') {
		loginModal();
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
				Swal.fire({
					icon: "warning",
					text: '같은 상품이 장바구니에 있습니다',
					confirmButtonColor: "#568A35",
					confirmButtonText: '확인',
				})
			}

		})
}//end of addToCart

//'로그인 필요' 모달. 
function loginModal() {
	Swal.fire({
		icon: "info",
		text: "로그인이 필요합니다.",
		cancelButtonColor: "#568A35",
    	confirmButtonColor: "#badc58",
		cancelButtonText: `계속 둘러보기`,
		confirmButtonText: '<a href="loginbook.do">로그인 하기</a>'
	})
}
//장바구니 담기 성공 모달  
function cartOkModal(memberNo) {
	Swal.fire({
		icon: "success",
		text: "장바구니에 담았습니다!",
		cancelButtonColor: "#568A35",
    	confirmButtonColor: "#badc58",
		showCancelButton: true,
		confirmButtonText: '계속 둘러보기',
		cancelButtonText: `<a href="cartList.do?memberNo=${memberNo}">장바구니로 이동</a>`
	})
}//end of cartOkModal

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
					likeItModal(memberNo);
				} else if (result.retCode == 'CK') {
					Swal.fire({
					icon: "warning",
					text: '이미 찜이 되어있는 상품입니다!',
					confirmButtonColor: "#568A35",
					confirmButtonText: '확인',
					
				})
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

fetch('https://www.aladin.co.kr/home/welcome.aspx')
.then (res=>res.json())
.then (console.log);

/*
	//페이징용
	function showList(bookNo, page) {
		fetch('pagingList.do', {
			method: 'get',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			body: 'bookno=' + bookNo + '&page=' + page
		})
			.then(str => str.json())
			.then(result => {
				console.log(result);
			})
			.catch(reject => console.log(reject));
	}
	showList(bookNo,page); */

