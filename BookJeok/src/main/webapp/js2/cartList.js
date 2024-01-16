/**
 * cartList.js
 */


showCart();


function showCart() {
	fetch("cartListJson.do?memberNo=3")
		.then(result => result.json())
		.then(result => {
			console.log(result);
			let lastPrice = 0;
			let totalPoint = 0;
			result.forEach(item => {
				console.log(item);
				lastPrice += item.price;
				totalPoint += item.addPoint;
				const newtbody = maketr(item);
				cartList.insertAdjacentHTML("beforeend", newtbody);
			});

			
			// 포인트 출력
			let addPoint = document.getElementById("addPoint");
			const addpoint = `<div class="cart_point_total" style="padding: 17px; text-align: right; border-bottom: 1px solid #aaa; font-size: 17px;"><span>적립 예정 포인트&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="totalPoint" style="font-weight: bold;">${totalPoint}</span><span>&nbsp;P</span></div>
			<div class="row">`;
			addPoint.insertAdjacentHTML("beforeend", addpoint);
			
			// 포인트 변화
			makePoint();
			
			// 토탈 출력
			let totalAmount = document.getElementById("totalAmount");
			const totalAmo = makeTotal();
			totalAmount.insertAdjacentHTML("beforeend", totalAmo);


			// 카트 삭제 이벤트 등록
			removeCartEvent();

			// 플러스, 마이너스 버튼 이벤트 등록
			btnEvent();

			// 카트 수정 이벤트 등록
			modifyCartEvent();
			
			// 상품 선택체크 이벤트 등록
			allCheckboxEvent();

		})
}





function maketr(item) {
	const newtbody = `<tr>
			<td><input type="checkbox" checked></td>
			<td class="image" data-title="No"><img src="${item.img}"
					alt="#"></td>
			<td>
				<p class="product-name">
					<a href="#">${item.name}</a>
				</p>
			</td>
			<td class="product-des" data-title="Description">
				<p class="product-des">${item.putDate}</p>
			</td>
			<td class="price" data-title="${item.price}"><span>${item.price}</span></td>
			<td class="qty" data-title="Qty">
				<!-- Input Order -->
				<div class="input-group">
					<div class="button minus">
						<button type="button" class="minusBtn btn btn-primary btn-number"
							data-type="minus" data-field="quant[1]">
							<i class="ti-minus"></i>
						</button>
					</div>
					<input type="text" name="quant[1]" class="input-number" data-min="1"
						data-max="100" value="${item.quantity}">
					<div class="button plus">
						<button type="button" class="plusBtn btn btn-primary btn-number" data-type="plus"
							data-field="quant[1]">
							<i class="ti-plus"></i>
						</button>
					</div>
					<div style="text-align: center; margin-top: 10px;"><button type="button" class="modBtn" data-memberno="${item.memberNo}" data-bookno="${item.bookNo}" data-quantity="${item.quantity}" data-cartno="${item.cartNo}" data-name="${item.name}" data-price="${item.price}" data-img="${item.img}" style="width: 100px; padding: 7px;">수정</button></div>
				</div> <!--/ End Input Order -->
			</td>
			<td class="total-amount" data-title="Total"><span>${item.totalPrice}</span></td>
			<td class="action"><a href="#" class="remBtn" data-cartno="${item.cartNo}"><i
						class="ti-trash remove-icon"></i></a></td>
		</tr>`
	return newtbody;
}


function addCartEvent() {
	
}

function allCheckboxEvent() {
	$(':checkbox').first().on('click', function() { 
		if ($('#cartList template td').text != 'user1') {
			$('#list').find(':checkbox').prop('checked', this.checked); 
		}
	});
}

function modifyCartEvent() {
	let modCarts = document.querySelectorAll("#cartList .modBtn");
	modCarts.forEach(modCart => {
		modCart.addEventListener("click", function (e) {
			e.preventDefault();
			let cartNo = modCart.dataset.cartno
			let curQuantity = modCart.dataset.quantity
			let modquantity = modCart.parentElement.parentElement.childNodes[3].value
			let memberNo = modCart.dataset.memberno
			let bookNo = modCart.dataset.bookno
			let name = modCart.dataset.name
			let price = modCart.dataset.price
			let img = modCart.dataset.img
			console.log(cartNo, curQuantity, modquantity, memberNo, bookNo, name, price, img);
			if (curQuantity != modquantity) {
				fetch("modifyCart.do?cno=" + cartNo + "&quan=" + modquantity + "&mno=" + memberNo + "&bno=" + bookNo + "&bookName=" + name + "&bookPrice=" + price + "&bookImg=" + img)
					.then(result => result.json())
					.then(result => {
						if (result.retCode == "OK") {
							alert('수정되었습니다.');
							// modCart.parentElement.parentElement.childNodes[3].value = quantity;
							cartList.innerHTML = '';
							addPoint.innerHTML = '';
							totalAmount.innerHTML = '';
							showCart();
						} else {
							alert('수정 중 오류발생.');
						}
					})
			} else {
				alert("수량이 동일합니다.");
			}
		})
	})
}


function removeCartEvent() {
	let remCarts = document.querySelectorAll("#cartList .remBtn");
	remCarts.forEach(remCart => {
		remCart.addEventListener("click", function (e) {
			console.log(remCart);
			e.preventDefault();
			let cartNo = remCart.dataset.cartno;
			console.log(cartNo);
			fetch("removeCart.do?cartNo=" + cartNo)
				.then(result => result.json())
				.then(result => {
					if (result.retCode == "OK") {
						alert('삭제됨.');
						// remCart.closest("tr").remove();
						cartList.innerHTML = '';
						addPoint.innerHTML = '';
						totalAmount.innerHTML = '';
						showCart();
					} else {
						alert('삭제 중 오류발생.');
					}
				})
		})
	})
}


function btnEvent() {
	$(".plusBtn").on("click", function () {
		let price = $(this).closest("tr").find(".price").find("span").text();
		let quantity = $(this).parent("div").parent("div").find("input").val();
		$(this).parent("div").parent("div").find("input").val(++quantity);
		$(this).closest("td").next("td").find("span").text(price * quantity);
		makePoint();
	});

	$(".minusBtn").on("click", function () {
		let price = $(this).closest("td").prev().find("span").text();
		let quantity = $(this).parent("div").parent("div").find("input").val();
		if (quantity > 1) {
			$(this).parent("div").parent("div").find("input").val(--quantity);
		}
		$(this).closest("td").next("td").find("span").text(price * quantity);
		makePoint();
	});
}

// let quantity = $(".input-grop").find("input").val();


function makePoint() {
	let sumPrice = document.querySelectorAll("#cartList .total-amount");
	let sumPrice2 = 0;
	sumPrice.forEach(td => {
		sumPrice2 += parseInt(td.childNodes[0].innerText);
	})
	$(".totalPoint").text(sumPrice2 * 0.05);
}


function makeTotal() {
	let sumPrices = document.querySelectorAll("#cartList .total-amount");
	let totalPrice = 0;
	sumPrices.forEach(sumPrice => {
		totalPrice += parseInt(sumPrice.innerText);
	})
	
	let quantitys = document.querySelectorAll("#cartList .input-number");
	totalQuantity = 0;
	quantitys.forEach(quantity => {
		totalQuantity += parseInt(quantity.value);
	})

	let types = document.querySelectorAll("#cartList .modBtn");
	let totalType = 0;
	types.forEach(type => {
		for(i = 1; i <= 100; i++){
			if(type.dataset.bookno == i){
				totalType++;
			}
		}
	})
	const totalAmo = `<div class="total-amount">
			<div class="row">
				
				<div class="col-11">
					<div class="right">
						<ul>
						<li>주문도서 수량<span style="font-size: small;">&nbsp;(${totalQuantity}권)</span><span style="font-weight: bold;">${totalType}종</span></li>
						<li>도서 금액<span style="font-weight: bold;">${totalPrice} 원</span></li>
						<li>배송비<span style="font-weight: bold;">무료</span></li>
							<li class="last">주문 합계 금액<span style="font-weight: bold; font-size: larger;">${totalPrice} 원</span></li>
						</ul>
						<div class="button5">
							<a href="#" class="btn" style="font-weight: bold; font-size: larger;">주문하기</a> <a href="#" class="btn" style="font-weight: bold; font-size: larger;">쇼핑 계속하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>`;
	return totalAmo;
}


