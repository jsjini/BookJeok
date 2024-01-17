/**
 * cartList.js
 */


showCart();


function showCart() {
	fetch("likeItListJson.do?memberNo=1")
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
				likeItList.insertAdjacentHTML("beforeend", newtbody);
			});

			// 토탈 출력
			makeTotal();

			// 카트 삭제 이벤트 등록
			removeCartEvent();

			// 플러스, 마이너스 버튼 이벤트 등록
			btnEvent();

			// 카트 수정 이벤트 등록
			modifyCartEvent();

			// 상품 체크박스 이벤트 등록
			allCheckboxEvent();
			selCheckboxEvent();
		})
}

function selCheckboxEvent() {
	let selChecks = document.querySelectorAll(".selCheck");
	selChecks.forEach(selCheck => {
		selCheck.addEventListener("change", function () {
			makeTotal();
		})
	})
}

function maketr(item) {
	const newtbody = `<tr>
			<td><input type="checkbox" class="selCheck" checked></td>
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

const form = {
	memberNo: '${}',
	bookNo: '${}',
	quantity: ''
}
function addCartEvent() {
	$(".add_cart").on("click", function () {
		form.quantity = $(".quantity_input").val();
		$.ajax({
			url: 'addCart.do',
			type: 'POST',
			data: form,
			success: function (result) {
				cartAlert(result);
			}
		})
	})
}

function cartAlert(result) {
	if (result == '0') {
		alert("장바구니에 추가를 하지 못하였습니다.");
	} else if (result == '1') {
		alert("장바구니에 추가되었습니다.");
	} else if (result == '2') {
		alert("장바구니에 이미 추가되어져 있습니다.");
	} else if (result == '5') {
		alert("로그인이 필요합니다.");
	}
}

function allCheckboxEvent() {
	$('.main-hading').find(':input').on('click', function () {
		$('#cartList').find(':checkbox').prop('checked', this.checked);
		makeTotal();
	});

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



function selCheckEvent() {

	let checks = document.querySelectorAll('#cartList .selCheck');
	console.log(checks);
	let totalPrice = 0;
	let totalType = 0;
	let totalQuantity = 0;
	checks.forEach(check => {
		console.log(check);
		if (check.checked == true) {
			let sumPrice = check.closest("tr").querySelector(".total-amount");
			totalPrice += parseInt(sumPrice.innerText);

			let quantity = check.closest("tr").querySelector(".input-number");
			totalQuantity += parseInt(quantity.value);

			let type = check.closest("tr").querySelector(".modBtn");
			for (i = 1; i <= 100; i++) {
				if (type.dataset.bookno == i) {
					totalType++;
				}
			}
		}
	})
	document.querySelector(".totalPoint").innerText = totalPrice * 0.05;
	document.querySelector(".totalQuantity").innerText = totalQuantity;
	document.querySelector(".totalType").innerText = totalType;
	document.querySelector(".totalPrice").innerText = totalPrice;
}


function makeTotal() {
	let checks = document.querySelectorAll('#cartList .selCheck');
	console.log(checks);
	let totalPoint = 0;
	let totalQuantity = 0;
	let totalType = 0;
	let deliveryPrice = "무료";
	let totalPrice = 0;
	checks.forEach(check => {
		console.log(check);
		if (check.checked == true) {
			let sumPrice = check.closest("tr").querySelector(".total-amount");
			totalPrice += parseInt(sumPrice.innerText);

			let quantity = check.closest("tr").querySelector(".input-number");
			totalQuantity += parseInt(quantity.value);

			let type = check.closest("tr").querySelector(".modBtn");
			for (i = 1; i <= 100; i++) {
				if (type.dataset.bookno == i) {
					totalType++;
				}
			}
		}
	})
	totalPoint = totalPrice * 0.05;
	document.querySelector(".totalPoint").innerText = totalPoint;
	document.querySelector(".totalQuantity").innerText = totalQuantity;
	document.querySelector(".totalType").innerText = totalType;
	document.querySelector(".totalPrice").innerText = totalPrice;
	document.querySelector(".deliveryPrice").innerText = deliveryPrice;

	// const totalAmo = ``;
	// return totalAmo;

}





