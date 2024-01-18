/**
 * 
 */

let odNo = document.querySelector('#memberNumber').dataset.odno;
let memberNo = document.querySelector('#memberNumber').dataset.memberno;
showOrderItem(odNo);

function showOrderItem() {
	fetch("orderItemListJson.do?odNo=" + odNo)
		.then(result => result.json())
		.then(result => {
			console.log(result);
			result.forEach(item => {
				console.log(item);
				const newtbody = maketr(item);
				orderItemList.insertAdjacentHTML("beforeend", newtbody);
			});

			// 토탈 출력
			makeTotal();

			// 주문아이템 삭제 이벤트 등록
			removeOrderItemEvent();

			// 플러스, 마이너스 버튼 이벤트 등록
			btnEvent();

			// 카트 수정 이벤트 등록
			modifyOrderItemEvent();

			// 상품 체크박스 이벤트 등록
			allCheckboxEvent();
			selCheckboxEvent();


		})
}

function moveCart() {
    let moveCart = document.querySelector(".moveCart");
    moveCart.addEventListener("click", function () {
        window.location.href = "cartList.do";
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
					<div style="text-align: center; margin-top: 10px;"><button type="button" class="modBtn" data-orderitemNo="${item.orderitemNo}" data-bookno="${item.bookNo}" data-quantity="${item.quantity}" data-cartno="${item.cartNo}" data-name="${item.name}" data-price="${item.price}" data-img="${item.img}" style="width: 100px; padding: 7px;">수정</button></div>
				</div> <!--/ End Input Order -->
			</td>
			<td class="total-amount" data-title="Total"><span>${totalPrice}</span></td>
			<td class="action"><a href="#" class="remBtn" data-orderitemNo="${item.orderitemNo}"><i
						class="ti-trash remove-icon"></i></a></td>
		</tr>`
	return newtbody;
}



function modifyOrderItemEvent() {
	let modOrderItems = document.querySelectorAll("#orderItemList .modBtn");
	modOrderItems.forEach(modOrderItem => {
		modOrderItem.addEventListener("click", function (e) {
			e.preventDefault();
			if (confirm("수정하시겠습니까?")) {
				let orderitemNo = modOrderItem.dataset.orderitemno
				let curQuantity = modOrderItem.dataset.quantity
				let modquantity = modOrderItem.parentElement.parentElement.childNodes[3].value
				console.log(orderitemNo, curQuantity, modquantity);
				if (curQuantity != modquantity) {
					fetch("modifyOrderItem.do?itemno=" + orderitemNo + "&quan=" + modquantity)
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

function removeOrderItemEvent() {
	let remOrderItems = document.querySelectorAll("#orderItemList .remBtn");
	remOrderItems.forEach(remOrderItem => {
		remOrderItem.addEventListener("click", function (e) {
			console.log(remOrderItem);
			e.preventDefault();
			if (confirm("삭제하시겠습니까?")) {
				let orderitemNo = remOrderItem.dataset.orderitemno;
				console.log(orderitemNo);
				fetch("remveOrderItem.do?orderitemNo=" + orderitemNo)
					.then(result => result.json())
					.then(result => {
						if (result.retCode == "OK") {
							alert('삭제됨.');
							// remCart.closest("tr").remove();
							// orderItemList.innerHTML = '';
							// addPoint.innerHTML = '';
							// totalAmount.innerHTML = '';
							// showOrderItem(odNo);
							location.reload();
						} else {
							alert('삭제 중 오류발생.');
						}
					})
			}
		})
	})
}

function allCheckboxEvent() {
	$('.main-hading').find(':input').on('click', function () {
		$('#orderItemList').find(':checkbox').prop('checked', this.checked);
		makeTotal();
	});

}

function selCheckboxEvent() {
	let selChecks = document.querySelectorAll(".selCheck");
	selChecks.forEach(selCheck => {
		selCheck.addEventListener("change", function () {
			makeTotal();
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
	let checks = document.querySelectorAll('#orderItemList .selCheck');
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
