<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

	<style>
		.topLine {
			width: 110px;
		}

		.inp {
			width: 80px;
		}

		.inp_w240 {
			width: 240px;
		}

		.h2_side1 {
			background-color: #666464;
			color: #fff;
			padding: 5px;
		}
	</style>

	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<div class="orderStepN" style="margin-top:20px; 
						border: 1px solid #aaa;
						border-radius: 15px;
						padding: 27px;
						color: rgb(71, 71, 66);
					">
							<h2 id="memberNumber" data-memberno="${sessionScope.memberNo}" data-odno="${odNo}">주문 / 결제
							</h2>
							<div><button class="btn" id="moveCart">카트로 이동</button></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<div>
							<h5>주문도서내역</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Shopping Cart -->
	<div class="shopping-cart section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Shopping Summery -->
					<table class="table shopping-summery">
						<thead>
							<tr class="main-hading">
								<th colspan="2">도서명</th>
								<th>배송예정일</th>
								<th class="text-center">도서금액</th>
								<th class="text-center">수량</th>
								<th class="text-center">합계</th>
							</tr>
						</thead>
						<tbody id="orderItemList" style="text-align: center;">

						</tbody>
					</table>
					<!--/ End Shopping Summery -->
				</div>
			</div>
			<div id="addPoint">
				<div class="cart_point_total"
					style="padding: 17px; text-align: right; border-bottom: 1px solid #aaa; font-size: 17px;"><span>적립
						예정 포인트&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="totalPoint"
						style="font-weight: bold;"></span><span>&nbsp;P</span></div>
				<div class="row">
				</div>
			</div>
			<div>
				<h3>배송지 정보<span><a href="#">회원정보와 동일</a></span></h3>
				<table>
					<tbody>
						<tr>
							<th>이름</th>
							<td>
								<input type="text" maxlength="20">
							</td>
						</tr>
						<tr>
							<th>휴대폰번호</th>
							<td>
								<input class="inp" type="text" id="order_phone01" maxlength="3">
								<input class="inp" type="text" id="order_phone02" maxlength="4">
								<input class="inp" type="text" id="order_phone03" maxlength="4">
							</td>
						</tr>
						<tr>
							<th>배송주소</th>
							<td>
								<div>
									<input type="text">
									<a href="#">주소 찾기</a>
								</div>
								<input type="text" id="order_add1">
								<input type="text" id="order_add2">
							</td>
						</tr>
						<tr>
							<th>
								택배사
								<br>
								전달사항
							</th>
							<td>
								<input type="text">
								<div>
									<span> * 북적북적 요청사항이 아닌 택배사 송장에 표기되는 메시지입니다.</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="col-12" id="totalAmount" style=":hover background-color: yellow;">
				<!-- Total Amount -->
				<div class="total-amount">
					<div class="row">

						<div class="col-11">
							<div class="right">
								<ul>
									<li>주문도서 수량<span>권)</span><span class="totalQuantity"
											style="font-size: small;"></span><span>(</span><span
											style="font-weight: bold;">&nbsp;종</span><span class="totalType"
											style="font-weight: bold;"></span></li>
									<li>배송비<span class="deliveryPrice" style="font-weight: bold;"></span></li>
									<li class="last">주문 합계 금액<span>&nbsp;원</span><span class="totalPrice"
											style="font-weight: bold; font-size: larger;"></span></li>
								</ul>
								<div class="button5">
									<a href="#" class="btn" style="font-weight: bold; font-size: larger;">결제하기</a>
								</div>

							</div>
						</div>
					</div>
					<!--/ End Total Amount -->
				</div>
			</div>

		</div>
		<!--/ End Shopping Cart -->

		<script>
			var list = ${ orders };
			console.log(list);

			list.forEach(item => {
				const newtbody = maketr(item);
				orderItemList.insertAdjacentHTML("beforeend", newtbody);
			});

			makeTotal();

			moveCart();


			function maketr(item) {
				let totalPrice = item.bookPirce * item.quantity;
				const newtbody1 = `<tr>
				<td class="image" data-bookno="${item.bookNo}" data-quantity="${item.quantity}" data-img="${item.bookImg}" data-name="${item.bookName}" data-price="${item.bookPirce}" data-title="No"><img src="images/${item.bookImg}"
					alt="#"></td>
				<td>
				<p class="product-name">
					<a href="#">${item.bookName}</a>
				</p>
				</td>
				<td class="product-des" data-title="Description">
				<p class="product-des">내일 수령</p>
				</td>
				<td class="price" data-title="${item.bookPirce}"><span>${item.bookPirce}</span></td>
				<td class="qty" data-title="Qty">
					<p class="qty-value">${item.quantity}</p>
				</td>
				<td class="total-amount" data-title="Total"><span>${totalPrice}</span></td>
				</tr>`
				return newtbody1;
			}

			function makeTotal() {
				let images = document.querySelectorAll('#orderItemList .image');
				console.log(images);
				let totalPoint = 0;
				let totalQuantity = 0;
				let totalType = 0;
				let deliveryPrice = "무료";
				let totalPrice = 0;
				images.forEach(image => {
					totalPrice += parseInt(image.dataset.price);

					totalQuantity += parseInt(image.dataset.quantity);

					for (i = 1; i <= 100; i++) {
						if (image.dataset.bookno == i) {
							totalType++;
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

			function moveCart() {
				let moveCart = document.querySelector("#moveCart");
				moveCart.addEventListener("click", function (e) {
					e.preventDefault();
					window.location.href = "cartList.do";
				})
			}

		</script>
		<!-- <script src="js2/orderItemList.js"></script> -->