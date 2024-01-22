/**
 * alert.js
 */

// 알림창 공통 모달

// '로그인 필요' 모달. 
function loginModal() {
	Swal.fire({
		icon: "info",
		text: "로그인이 필요합니다.",
		cancelButtonColor: "#568A35",
    	confirmButtonColor: "#badc58",
		cancelButtonText: `계속 둘러보기`,
		confirmButtonText: '<a href="loginbook.do">로그인 하기</a>'
	})
} // end of loginModal


/** 장바구니 */
// 장바구니 담기 성공 모달  
function cartOkModal(memberNo) {
	Swal.fire({
		icon: "success",
		text: "장바구니에 담았습니다!",
		cancelButtonColor: "#568A35", // cancel 버튼 색깔 지정
    	confirmButtonColor: "#badc58", // confrim 버튼 색깔 지정
		showCancelButton: true,
		confirmButtonText: '계속 둘러보기', // confirm 버튼 텍스트 지정
		cancelButtonText: `<a href="cartList.do?memberNo=${memberNo}">장바구니로 이동</a>` // cancel 버튼 텍스트 지정
	})
}// end of cartOkModal

// 장바구니 중복 알림 모달
function cartCKModal(){
	Swal.fire({
		icon: "warning",
		text: '같은 상품이 장바구니에 있습니다',
		confirmButtonColor: "#568A35",
		confirmButtonText: '확인',
	})
}// cartCKModal


/** 내서재 */
// 내서재(찜하기) 담기 성공 모달  
function likeItOkModal(memberNo) {
	Swal.fire({
		icon: "success",
		text: "내 서재에 담았습니다!",
		cancelButtonColor: "#568A35", // cancel 버튼 색깔 지정
    	confirmButtonColor: "#badc58", // confrim 버튼 색깔 지정
		showCancelButton: true,
		confirmButtonText: '계속 둘러보기', // confirm 버튼 텍스트 지정
		cancelButtonText: `<a href="likeIt.do?memberNo=${memberNo }">내서재 이동</a>` // cancel 버튼 텍스트 지정
	})
}// end of likeItOkModal

// 내서재 중복 알림 
function likeItCKModal() {
	Swal.fire({
		icon: "warning",
		text: '이미 찜이 되어있는 상품입니다!',
		confirmButtonColor: "#568A35",
		confirmButtonText: '확인',
		
	})
} // end of likeItCKModal

//문의내역(없음)




