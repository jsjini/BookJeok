/**
 * bookList.js
 */

 //장바구니에 담기 
function addToCart(memberNo,bookNo){
  event.preventDefault();	
	if(memberNo ==''){
		alert('로그인이 필요합니다')
		return;
	}
	fetch('addCart.do',{
		method:"post",
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded'
		},
		body: 'quantity='+1+'&memberNo='+memberNo+'&bookNo='+bookNo 
	})
		.then(result => result.json())
		.then(result => {
			console.log(result)
			if(result.retCode == 'OK'){
				alert("장바구니에 담았습니다");
				checkCart(memberNo,bookNo);
				
				
			} else if (result.retCode == 'CK') {
				alert("장바구니에 이미 담겨있는 상품입니다.");		
			}
			
		})
	}
	//모달?? 집에서 연습용 수정하고 정리해놓기 
function checkCart(memberNo,bookNo){
	console.log(memberNo)
		Swal.fire({
		  text: "장바구니에 담았습니다!",
		  showCancelButton: true,
		  confirmButtonText: '계속 둘러보기',
		  cancelButtonText: `<a href="cartList.do?memberNo=${memberNo}&bookNo=${bookNo}">장바구니로 이동</a>`
		}).then((result) => {
		  if (result.value) {
              //"삭제" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
		  }
		})
	}

	//찜하기 담기
	function addLikeIt(memberNo,bookNo){
	event.preventDefault();	
	if(memberNo ==''){
		alert('로그인이 필요합니다')
		return;
		}
	fetch('addLikeIt.do',{
		method:"post",
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded'
		},
		body: '&memberNo='+memberNo+'&bookNo='+bookNo 
	})
		.then(result => result.json())
		.then(result => {
			console.log(result)
			if(result.retCode == 'OK'){
				checkCart();
			} else if (result.retCode == 'CK') {
				alert("이미 찜이 되어있습니다!");		
			}
			
		})
	}
	
	
	//페이징용
	function showList(bookNo,page){
	fetch('pagingList.do',{
		method: 'post',
		headers:{
			'Content-Type': 'application/x-www-form-urlencoded'
		},
		body: 'bookno='+bookNo+'&page='+page
	})
	.then(str => str.json())
	.then(result => {
		console.log(result);
		})
		.catch(reject => console.log(reject));
	}
	showList(pageInfo);
	
	
	