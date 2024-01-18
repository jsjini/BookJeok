<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="js2/addBookToCart.js"></script>
<style>
.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>
<!--  템플릿만 분리해서 들고옴- body와 href 링크 연결시킴. 목록 출력 안됨 -->
<div class="product-area most-popular section">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-title">
					<h2>신간도서</h2>
				</div>
			</div>
		</div>
		<div class="row">
						
			<div class="col-12">
				<div class="owl-carousel popular-slider">
					<!-- Start Single Product -->
					
					<!-- End Single Product -->
					<!-- Start Single Product -->
					<c:forEach var="vo" items="${bookNewList}">
					<div class="single-product">
						<div class="product-img">
							<a href="bookDetail.do?bookNo=${vo.bookNo}"> <img class="default-img"
								src="images/${vo.img}" alt="#"> <img
								class="hover-img" src="images/${vo.img}"
								alt="#">
							</a>
							<div class="button-head">
								<div class="product-action">
										<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>찜하기</span></a> 
								</div>
								<div class="product-action-2">
									<a title="Add to cart" href="#" onclick="addToCart(${sessionScope.memberNo},${vo.bookNo})">장바구니에 담기</a>
								</div>
							</div>
						</div>
						<div class="product-content">
							<h3>
								<a href="bookDetail.do?bookNo=${vo.bookNo}">${vo.name}</a>
							</h3>
							<div class="product-price">
								<span>${vo.price}원</span>
							</div>
						</div>
					</div>
		</c:forEach>
					<!-- End Single Product -->
				</div>
			</div>
		</div>
		<div id="paging" class="pagination"></div>
	</div>
</div>
<script>
function showList(page){
	ul.innerHTML = '';
	fetch('replyListJson.do?bno='+bno+ "&page="+page) //get 방식이라 방식은 안적어줘도 되고 url만 기재하면 됨 
	.then(str => str.json())
	.then(result => {
		result.forEach(reply=> {
			let li = makeLi(reply);
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
	pagingAjax.open('get','pagingListJson.do?bno='+bno+"&page="+page);
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
</script>
