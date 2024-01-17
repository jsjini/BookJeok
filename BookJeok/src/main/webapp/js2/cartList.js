/**
 * cartList.js
 */


let memberNo = 3;
showCart(memberNo);


function showCart() {
	fetch("cartListJson.do?memberNo=" + memberNo)
		.then(result => result.json())
		.then(result => {
			console.log(result);
			result.forEach(item => {
				console.log(item);
				const newtbody = maketr(item);
				cartList.insertAdjacentHTML("beforeend", newtbody);
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
	let totalPrice = item.price * item.quantity;
	const newtbody = `<tr>
			<td><input type="checkbox" class="selCheck" checked></td>
			<td class="image" data-title="No"><img src="images/${item.img}"
					alt="#"></td>
			<td>
				<p class="product-name">
					<a href="#">${item.name}</a>
				</p>
			</td>
			<td class="product-des" data-title="Description">
				<p class="product-des">내일 수령</p>
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
			<td class="total-amount" data-title="Total"><span>${totalPrice}</span></td>
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
			type: 'GET',
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
	} else if (result.retCode == 'OK') {
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

function modifyCartEvent() {
	let modCarts = document.querySelectorAll("#cartList .modBtn");
	modCarts.forEach(modCart => {
		modCart.addEventListener("click", function (e) {
			e.preventDefault();
			if (confirm("수정하시겠습니까?")) {
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
								// cartList.innerHTML = '';
								// addPoint.innerHTML = '';
								// totalAmount.innerHTML = '';
								// showCart(parseInt(memberNo));
								location.reload();
							} else {
								alert('수정 중 오류발생.');
							}
						})
				} else {
					alert("수량이 동일합니다.");
				}
			}
		})
	})
}

function removeCartEvent() {
	let remCarts = document.querySelectorAll("#cartList .remBtn");
	remCarts.forEach(remCart => {
		remCart.addEventListener("click", function (e) {
			e.preventDefault();
			if (confirm("삭제하시겠습니까?")) {
				let cartNo = remCart.dataset.cartno;
				fetch("removeCart.do?cartNo=" + cartNo)
					.then(result => result.json())
					.then(result => {
						if (result.retCode == "OK") {
							alert('삭제됨.');
							// remCart.closest("tr").remove();
							// cartList.innerHTML = '';
							// addPoint.innerHTML = '';
							// totalAmount.innerHTML = '';
							// showCart(memberNo);
							location.reload();
						} else {
							alert('삭제 중 오류발생.');
						}
					})
			}
		})
	})
}

function btnEvent() {
	$(".plusBtn").on("click", function () {
		let price = $(this).closest("tr").find(".price").find("span").text();
		let quantity = $(this).parent("div").parent("div").find("input").val();
		$(this).parent("div").parent("div").find("input").val(++quantity);
		$(this).closest("td").next("td").find("span").text(price * quantity);
		// makePoint();
	});

	$(".minusBtn").on("click", function () {
		let price = $(this).closest("td").prev().find("span").text();
		let quantity = $(this).parent("div").parent("div").find("input").val();
		if (quantity > 1) {
			$(this).parent("div").parent("div").find("input").val(--quantity);
		}
		$(this).closest("td").next("td").find("span").text(price * quantity);
		// makePoint();
	});
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
}
