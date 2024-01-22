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

//HOT SPAN 판매기준 출력 // 적용 어떻게??
fetch('bookBestList.do', {
 })
 .then(result => result.json())
 .then(result => {
	 //console.log(result);
	 
	 result.forEach((item, idx) => {
		 console.log(item);
		 if(idx < 2) {
			 let newSpan = document.createElement('span');
			 newSpan.innerHTML = `Hot`;
			 document.querySelector('.default-img new-img-size').appendChild(newSpan);
			 document.querySelector('.default-img new-img-size span').setAttribute('class', 'out-of-stock');
		 }
	 })
 })

/*
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

