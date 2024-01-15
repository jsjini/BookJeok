/**
 * cartList.js
 */
function showCartList() {

}
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

		// 카트 삭제 이벤트 등록
		const cartNos = result.forEach(item => {
			cartNos.push(item.cartNo);
		})
		removeCartEvent();

		// 포인트 출력
		let addPoint = document.getElementById("addPoint");
		const addpoint = `<div class="cart_point_total" style="padding: 10px; text-align: right; border-bottom: 1px solid #aaa;"><span>적립 예정 포인트</span><span style="font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;${totalPoint}</span></div>
			<div class="row">`;
		addPoint.insertAdjacentHTML("beforeend", addpoint);
		
		// 토탈 출력
		let totalAmount = document.getElementById("totalAmount");
		const totalAmo = makeTotal(lastPrice);
		totalAmount.insertAdjacentHTML("beforeend", totalAmo);

	})


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
			<td class="price" data-title="Price"><span>${item.price}</span></td>
			<td class="qty" data-title="Qty">
				<!-- Input Order -->
				<div class="input-group">
					<div class="button minus">
						<button type="button" class="btn btn-primary btn-number" disabled="disabled"
							data-type="minus" data-field="quant[1]">
							<i class="ti-minus"></i>
						</button>
					</div>
					<input type="text" name="quant[1]" class="input-number" data-min="1"
						data-max="100" value="${item.quantity}">
					<div class="button plus">
						<button type="button" class="btn btn-primary btn-number" data-type="plus"
							data-field="quant[1]">
							<i class="ti-plus"></i>
						</button>
					</div>
					<div style="text-align: center; margin-top: 10px;"><button type="button" style="width: 100px; padding: 7px;">수정</button></div>
				</div> <!--/ End Input Order -->
			</td>
			<td class="total-amount" data-title="Total"><span>${item.totalPrice}</span></td>
			<td class="action" data-title="Remove"><i
						class="ti-trash remove-icon"></i></td>
		</tr>`
		return newtbody;
}



function removeCartEvent(cartNo) {
	
	console.log(cartNo);
	let remCarts = document.querySelectorAll("#cartList td:last-child");
	console.log(remCarts);
	remCarts.forEach(remCart => {

		remCart.addEventListener("click", function () {
			fetch("removeCart.do?cartNo="+cartNo)
			.then(result => result.json())
			.then(result => {
				if (result.retCode == "OK") {
					alert('삭제됨.');
					remCart.closest("tr").remove();
				} else {
					alert('삭제 중 오류발생.');
				}
			})
		})
	})
}


function makeTotal(lastPrice) {
		const totalAmo = `<div class="total-amount">
			<div class="row">
				<div class="col-lg-8 col-md-5 col-12">
					<div class="left">
						<div class="coupon">
							<form action="#" target="_blank">
								<p style="padding: 15px;"><span>사용가능한 포인트</span><span>&nbsp;&nbsp;&nbsp;&nbsp;5,000 P</span></p>

								<input name="Coupon" placeholder="사용할 포인트 입력">
								<button class="btn"> 포인트 사용</button>
							</form>
						</div>
						<div class="checkbox">
							<label class="checkbox-inline" for="2"><input name="news" id="2"
									type="checkbox"> Shipping (+10$)</label>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-7 col-12">
					<div class="right">
						<ul>
							<li>주문도서 금액 합계<span style="font-weight: bold;">${lastPrice} + 원</span></li>
							<li>주문도서 수량<span style="font-size: small;">&nbsp;(1권)</span><span style="font-weight: bold;">1종</span></li>
							<li>사용 포인트<span style="font-weight: bold;">1,500 P</span></li>
							<li class="last">주문 합계 금액<span style="font-weight: bold; font-size: larger;">28,500 원</span></li>
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


