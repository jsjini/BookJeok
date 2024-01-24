/**
 * cartList.js
 */


let memberNo1 = document.querySelector('#memberNumber').dataset.memberno;
let today = getToday();
console.log(memberNo1, today);
showCart(memberNo1);


function showCart() {
	fetch("cartListJson.do?memberNo=" + memberNo1)
		.then(result => result.json())
		.then(result => {
			console.log(result);
			result.forEach(item => {
				console.log(item);
				const newtbody = maketr(item);
				cartList.insertAdjacentHTML("afterbegin", newtbody);
			});

			const createBtn = createOrderBtn();
			orderbutton.insertAdjacentHTML("beforeend", createBtn);
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

			orderBtnEvent();
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
	let price1 = makeComma(item.price);
	let totalPrice = item.price * item.quantity;
	let totalPrice1 = makeComma(totalPrice);
	const newtbody = `<tr>
			<td><input type="checkbox" class="selCheck" data-cartno="${item.cartNo}" data-bookno="${item.bookNo}" data-quantity="${item.quantity}" data-img="${item.img}" data-name="${item.name}" data-price="${item.price}" checked></td>
			<td data-title="No"><a href="bookDetail.do?bookNo=${item.bookNo}"><img src="images/${item.img}"
					alt="#"></a></td>
			<td>
				<p class="product-name">
					<a href="bookDetail.do?bookNo=${item.bookNo}">${item.name}</a>
				</p>
			</td>
			<td class="product-des" data-title="Description">
				<p class="product-des">내일 수령</p>
			</td>
			<td class="price" data-title="${item.price}"><span>${price1}</span></td>
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
			<td class="total-amount" data-title="${totalPrice}"><span>${totalPrice1}</span></td>
			<td class="action"><a href="#" class="remBtn" data-cartno="${item.cartNo}"><i
						class="ti-trash remove-icon"></i></a></td>
		</tr>`
	return newtbody;
}

function cartAlert(result) {
	if (result.retCode == 'NG') {
		alert("장바구니에 추가를 하지 못하였습니다.");
	} else if (result.retCode == 'OK') {
		alert("장바구니에 추가되었습니다.");
	} else if (result == 'CK') {
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
				let bookNo = modCart.dataset.bookno
				let name = modCart.dataset.name
				let price = modCart.dataset.price
				let img = modCart.dataset.img
				console.log(cartNo, curQuantity, modquantity, memberNo1, bookNo, name, price, img);
				if (curQuantity != modquantity) {
					fetch("modifyCart.do?cno=" + cartNo + "&quan=" + modquantity + "&mno=" + memberNo1 + "&bno=" + bookNo + "&bookName=" + name + "&bookPrice=" + price + "&bookImg=" + img)
						.then(result => result.json())
						.then(result => {
							if (result.retCode == "OK") {
								alert('수정되었습니다.');
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

// function addOrderItemEvent() {

// 	let orderNo = 0;
// 	let bookNum = 0;
// 	let quan = 0;
// 	fetch("addOrderItem.do?odNo=" + orderNo + "&bookNo=" + bookNum + "&quantity=" + quan)
// 	.then(result => result.json())
// 	.then(result => {
// 		if(result.retCode == 'OK') {

// 		}
// 	})
// }

function orderBtnEvent() {
	let orderBtn = document.querySelector("#orderBtn");
	orderBtn.addEventListener("click", function (e) {
		e.preventDefault();
		
		let orders = [];
		// let order22 = '';
		let checks = document.querySelectorAll('#cartList .selCheck');
		checks.forEach(check => {
			// console.log(check);
			if (check.checked == true) {
				let cartNo = check.dataset.cartno;
				let bookNo = check.dataset.bookno;
				let bookImg = check.dataset.img;
				let bookName = check.dataset.name;
				let bookPirce = check.dataset.price;
				let quantity1 = check.dataset.quantity;
				let order = { "cartNo": cartNo, "bookNo": bookNo, "bookImg": bookImg, "bookName": bookName, "bookPirce": bookPirce, "quantity": quantity1 }
				orders.push(order);
				console.log(order);
				// order22+= "<tr>"+check.closest("tr").innerHTML +"</tr>";
			}
		})
		// console.log(order22);
		let orders1 = JSON.stringify(orders);
		// fetch("orderItemPageList.do?orders=" + orders1);
		document.querySelector('#orders').value = orders1;
		formOrder.submit();
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
		let price = $(this).closest("tr").find(".price").data("title");
		let quantity = $(this).parent("div").parent("div").find("input").val();
		$(this).parent("div").parent("div").find("input").val(++quantity);
		$(this).closest("td").next("td").find("span").text(makeComma(price * quantity));
		// makePoint();
	});

	$(".minusBtn").on("click", function () {
		let price = $(this).closest("td").prev().data("title");
		let quantity = $(this).parent("div").parent("div").find("input").val();
		if (quantity > 1) {
			$(this).parent("div").parent("div").find("input").val(--quantity);
		}
		$(this).closest("td").next("td").find("span").text(makeComma(price * quantity));
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
			totalPrice += parseInt(sumPrice.dataset.title);

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
	let totalPoint1 = makeComma(totalPoint);
	let totalPrice1 = makeComma(totalPrice);
	document.querySelector(".totalPoint").innerText = totalPoint1;
	document.querySelector(".totalQuantity").innerText = totalQuantity;
	document.querySelector(".totalType").innerText = totalType;
	document.querySelector(".totalPrice").innerText = totalPrice1;
	document.querySelector(".deliveryPrice").innerText = deliveryPrice;
}

function createOrderBtn() {
	const createBtn = `<div class="button5">
		<a href="#" class="btn" id="orderBtn" style="font-weight: bold; font-size: larger;">주문하기</a> <a href="bookGenreList.do" class="btn" style="font-weight: bold; font-size: larger;">쇼핑 계속하기</a>
	</div>`
	return createBtn;
}

function getToday() {
	var date = new Date();
	var year = date.getFullYear();
	var month = ("0" + (1 + date.getMonth())).slice(-2);
	var day = ("0" + date.getDate()).slice(-2);

	return year + month + day;
}