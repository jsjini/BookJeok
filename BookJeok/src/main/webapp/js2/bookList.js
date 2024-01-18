/**
 * bookList.js
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
	
	//목록 페이징
	 
	//페이지 클릭 시 페이지의 데이터 보여주도록 (a tag 클릭하면 이벤트 발생하도록 함수 생성-pageList()로 대체함)
	let pageInfo = 1; 
	function pageList(e){ //클릭할 때마다 이벤트 발생 
		e.preventDefault(); //클릭시 전체 페이지가 이동하지 않도록 이벤트 막아주기 
		pageInfo = this.getAttribute("href");	//this->이벤트 받는 대상 = a <tag>	
		showList(pageInfo); //중복되는 기능 함수로 만들어 대체하기
		//페이지 생성하는 함수 호출
		pagingList(pageInfo); //페이지 그려질 때마다 새로 보여주는 기능
	}
	
	function showList(page){
	fetch('pagingList.do',{
		method: 'post',
		headers:{
			'Content-Type': 'application/x-www-form-urlencoded'
		},
		body: 'bookno='+bookNo+'&page='+page
	})
	.then(str => str.json())
	.then(result => {
			result.forEach(book=> {
				let li = makeLi(book);
				ul.appendChild(li);
			})
		})
		.catch(reject => console.log(reject));
	}
	showList(pageInfo);
	
	
	//페이지 생성 
	//페이지 계산 
	let paging = document.querySelector('#paging');
	pagingList();
	
	function pagingList(page = 1){
		paging.innerHTML = '';
		let pagingAjax = new XMLHttpRequest();
		pagingAjax.open('get','pagingList.do=bookno='+bookNo+'&page='+page);
		pagingAjax.send();
		pagingAjax.onload= function(){
			let result = JSON.parse(pagingAjax.responseText);
			//이전
			//보여지는 페이지 이전의 페이지   -> '이전' 6 7
			if(result.prev){
				let aTag = document.createElement('a');
				aTag.href = result.startPage -1;
				aTag.innerText = '이전';
				aTag.addEventListener('click',pageList);
				paging.appendChild(aTag);
			}
			//페이지 목록 
			for(let p = result.startPage; p <= result.lastPage;p++){
				let aTag = document.createElement('a');
				if(p == page){
					aTag.setAttribute('class','active');
				}
				aTag.href = p;
				aTag.innerText = p;
				aTag.addEventListener('click',pageList);
				paging.appendChild(aTag);
			}
			//다음
			//보여지는 페이지 이후의 페이지 1 2 3 4 5 '다음'<--  
			if(result.next){
				let aTag = document.createElement('a');
				aTag.href = result.lastPage +1;
				aTag.innerText = '다음';
				aTag.addEventListener('click',pageList);
				paging.appendChild(aTag);
				
			}
		}
	}//end of pagingList