/**
 * addBookToCart.js
 */

 
function addToCart(memberNo,bookNo){

	
	/* //const addAjax = new XMLHttpRequest();
	//frontcontroller 에 AddReplyJson.do 만들기 
	addAjax.open('post','addCart.do');
	addAjax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	addAjax.send('quantity='+1+'&memberNo='+memberNo+'&bookNo='+bookNo);
	addAjax.onload = function(){
		let result = JSON.parse(addAjax.responseText);
		if(result.retCode == 'OK'){
			alert("장바구니에 담았습니다");
		}else if(result.retCode == 'NG'){
			alert("수량이 부족합니다");
		}
	}//end of onload */
	
	fetch('addCart.do',{
		method:"post",
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded'
		},
		body: 'quantity='+1+'&memberNo='+memberNo+'&bookNo='+bookNo //addAjax.send(에 들어가는것이 body)
	})
		.then(result => result.json())
		.then(result => {
			console.log(result)
			if(result.retCode == 'OK'){
				alert("장바구니에 담았습니다");
			} else if (result == 'CK') {
				alert("장바구니에 이미 추가되어져 있습니다.");		
			}else if(result.retCode == 'NG'){
				alert("로그인이 필요합니다.");
			}
			
		})
	}