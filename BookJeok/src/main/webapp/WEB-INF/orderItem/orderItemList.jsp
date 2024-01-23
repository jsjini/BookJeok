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

		#sample4_postcode {
			width: 80px;
		}

		#sample4_roadAddress {
			width: 350px;
		}

		#sample4_detailAddress {
			width: 350px;
		}

		#deliveryMessage {
			width: 704px;
		}
	</style>

	<!-- Breadcrumbs -->
	<div class="breadcrumbs" style="padding-bottom: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<div class="orderStepN" style="margin-top:20px; 
						border: 1px solid #aaa;
						border-radius: 15px;
						padding: 27px;
						color: rgb(71, 71, 66); text-align: center;"
					">
							<h2 id="memberNumber" data-memberno="${sessionScope.memberNo}" data-odno="${odNo}">주문 / 결제
							</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->
	<div class="breadcrumbs" style="padding-bottom: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<div>
							
							<div style="float: right;"><button class="btn" id="moveCart">카트로 이동</button></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Shopping Cart -->
	<div class="shopping-cart section" style="padding-top: 0px;">
		<div class="container mb-5">
			<div class="row">
				<div class="col-12">
					<h4 style="padding: 15px;">주문도서내역</h4>
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
				<h4 class="mt-5 md-5" style="padding: 15px;">배송지 정보</h4>
				<table class="table">
					<tbody>
						<tr>
							<th>이름</th>
							<td>
								<input id="memberName" type="text" maxlength="20"><button class="btn ml-3" style="height: 40px;" id="membetInfo">회원정보와
									동일</button>
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
								<!-- <div>
									<input type="text">
									<a href="#">주소 찾기</a>
								</div>
								<input type="text" id="order_add1">
								<input type="text" id="order_add2"> -->
								<input class="mb-2"type="text" id="sample4_postcode" placeholder="우편번호" readonly>
								<input class="btn ml-3 mb-2" style="height: 40px;" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample4_roadAddress" placeholder="도로명주소" readonly>
								<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="sample4_detailAddress" placeholder="상세주소">
								<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
							</td>
						</tr>
						<!-- <tr>
							<th>
								배송요청사항
							</th>
							<td>
								<input type="text" id="deliveryMessage" maxlength="80"
									placeholder="택배기사님께 전달할 메시지를 남겨주세요.">
								<div>
									<span style="font-size: smaller;"> * 북적북적 요청사항이 아닌 택배사 송장에 표기되는 메시지입니다.</span>
								</div>
							</td>
						</tr> -->
					</tbody>
				</table>
			</div>
			<div class="col-12">
				<div class="row">
					<div class="col-11">
						<div class="right">
							<table class="table">
								<tbody>
									<tr>
										<th>보유 포인트</th>
										<td><span id="memberPoint"></span><span>&nbsp;P</span></td>
									</tr>
									<tr>
										<th>사용 포인트</th>
										<td><input id="usePoint" value=0 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><button style="height: 40px;" class="btn ml-3 pointUseBtn pointUseBtn_Y"
												data-state="Y">모두사용</button><button class="btn ml-3 pointUseBtn pointUseBtn_N"
												data-state="N" style="display: none; height: 40px;">사용취소</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12" id="totalAmount" style=":hover background-color: yellow;">
				<!-- Total Amount -->
				<div class="total-amount">
					<div class="row">

						<div class="col-11">
							<div class="right">
								<ul>
									<li>주문도서 금액<span>&nbsp;원</span><span class="sumPrice"
											style="font-weight: bold;"></span></li>
									<li>주문도서 수량<span>권)</span><span class="totalQuantity"
											style="font-size: small;"></span><span>(</span><span
											style="font-weight: bold;">&nbsp;종</span><span class="totalType"
											style="font-weight: bold;"></span></li>
									<li>배송비<span class="deliveryPrice" style="font-weight: bold;"></span></li>
									<li>사용 포인트<span>&nbsp;P</span><span class="usePoint"
											style="font-weight: bold;"></span></li>
									<li class="last">최종 결제 금액<span>&nbsp;원</span><span class="totalPrice"
											style="font-weight: bold; font-size: larger;"></span></li>
								</ul>
								<div class="button5">
									<a href="#" class="btn" id="addOrderBtn"
										style="font-weight: bold; font-size: larger;">결제하기</a>
								</div>

							</div>
						</div>
					</div>
					<!--/ End Total Amount -->
				</div>
			</div>
		</div>
		<!--/ End Shopping Cart -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
		<script>
			let memberNo1 = document.querySelector('#memberNumber').dataset.memberno;
			let today = getToday();
			let orderToday = today.slice(2);
			let orderNos = today.split('/');
			let orderNo = parseInt(orderNos.join('') + memberNo1);
			var list = ${ orders };
			let userPoint = 0;
			console.log(list);
			list.forEach(item => {
				console.log(item);
				const newtbody = maketr(item);
				orderItemList.insertAdjacentHTML("beforeend", newtbody);
			});


			moveCart();

			memberInfo();

			fullUseBtnEvent();
			emptyUseBtnEvent();

			// deliveryMessageEvent();

			makeTotal();

			usePointChange();

			addOrderBtnEvent();

			function usePointChange() {
				let totalPrice = document.querySelector(".totalPrice").innerText;
				let totalPayment = 0;
				let useInput = document.querySelector("#usePoint");
				useInput.addEventListener("focusout", function () {
					const maxPoint = parseInt(document.querySelector("#memberPoint").innerText);
					let usePoint = parseInt(document.querySelector("#usePoint").value);
					if (usePoint < 0 || document.querySelector("#usePoint").value == '') {
						document.querySelector("#usePoint").value = 0;
						document.querySelector(".usePoint").innerText = 0;
						totalPayment = parseInt(totalPrice) - parseInt(document.querySelector(".usePoint").innerText);
						document.querySelector(".totalPrice").innerText = totalPayment;
					} else if (usePoint > maxPoint) {
						document.querySelector("#usePoint").value = maxPoint;
						document.querySelector(".usePoint").innerText = maxPoint;
						totalPayment = parseInt(totalPrice) - parseInt(document.querySelector(".usePoint").innerText);
						document.querySelector(".totalPrice").innerText = totalPayment;
						document.querySelector(".pointUseBtn_N").style.display = "inline-block";
						document.querySelector(".pointUseBtn_Y").style.display = "none";
					} else {
						document.querySelector(".usePoint").innerText = usePoint;
						totalPayment = parseInt(totalPrice) - parseInt(document.querySelector(".usePoint").innerText);
						document.querySelector(".totalPrice").innerText = totalPayment;
					}
				})
			}

			function fullUseBtnEvent() {
				document.querySelector('.pointUseBtn_Y').addEventListener("click", function () {
					const memberPoint = document.querySelector("#memberPoint").innerText;
					let sumPrice = document.querySelector(".sumPrice").innerText;
					let totalPayment = 0;
					document.querySelector("#usePoint").value = 0;
					document.querySelector(".usePoint").innerText = 0;
					document.querySelector(".totalPrice").innerText = sumPrice;
					document.querySelector("#usePoint").value = memberPoint;
					document.querySelector(".usePoint").innerText = memberPoint;
					totalPayment = parseInt(sumPrice) - parseInt(memberPoint);
					document.querySelector(".totalPrice").innerText = totalPayment;
					document.querySelector(".pointUseBtn_N").style.display = "inline-block";
					document.querySelector(".pointUseBtn_Y").style.display = "none";
				})
			}

			function emptyUseBtnEvent() {
				document.querySelector('.pointUseBtn_N').addEventListener("click", function () {
					const memberPoint = document.querySelector("#memberPoint").innerText;
					let sumPrice = document.querySelector(".sumPrice").innerText;
					let totalPayment = 0;
					document.querySelector("#usePoint").value = 0;
					document.querySelector(".usePoint").innerText = 0;
					totalPayment = parseInt(sumPrice);
					document.querySelector(".totalPrice").innerText = totalPayment;
					document.querySelector(".pointUseBtn_Y").style.display = "inline-block";
					document.querySelector(".pointUseBtn_N").style.display = "none";
				})
			}

			function maketr(item) {
				console.log(item.bookImg, item.bookName, item.bookNo, item.bookPirce);
				let bookPirce1 = makeComma(item.bookPirce);
				let totalPrice = item.bookPirce * item.quantity;
				let totalPrice1 = makeComma(totalPrice);
				const newtbody1 = `<tr>
				<td class="image" data-cartno="\${item.cartNo}" data-totalprice="\${totalPrice}" data-bookno="\${item.bookNo}" data-quantity="\${item.quantity}" data-img="\${item.bookImg}" data-name="\${item.bookName}" data-price="\${item.bookPirce}" data-title="No"><a href="bookDetail.do?bookNo=\${item.bookNo}"><img src="images/\${item.bookImg}"
					alt="#"></a></td>
				<td>
				<p class="product-name">
					<a href="bookDetail.do?bookNo=\${item.bookNo}">\${item.bookName}</a>
				</p>
				</td>
				<td class="product-des" data-title="Description">
				<p class="product-des">내일 수령</p>
				</td>
				<td class="price" data-title="\${item.bookPirce}"><span>\${bookPirce1}</span></td>
				<td class="qty" data-title="Qty">
					<p class="qty-value">\${item.quantity}</p>
				</td>
				<td class="total-amount" data-title="Total"><span>\${totalPrice1}</span></td>
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
				let usePoint = 0;
				let totalPayment = 0;
				images.forEach(image => {
					totalPrice += parseInt(image.dataset.totalprice);

					totalQuantity += parseInt(image.dataset.quantity);

					for (i = 1; i <= 100; i++) {
						if (image.dataset.bookno == i) {
							totalType++;
						}
					}
				})
				usePoint = document.querySelector("#usePoint").value;
				totalPoint = totalPrice * 0.05;
				totalPayment = totalPrice - usePoint;
				document.querySelector(".totalPoint").innerText = totalPoint;
				document.querySelector(".totalQuantity").innerText = totalQuantity;
				document.querySelector(".totalType").innerText = totalType;
				document.querySelector(".totalPrice").innerText = totalPayment;
				document.querySelector(".deliveryPrice").innerText = deliveryPrice;
				document.querySelector(".sumPrice").innerText = totalPrice;
				document.querySelector(".usePoint").innerText = usePoint;
			}

			function moveCart() {
				let moveCart = document.querySelector("#moveCart");
				moveCart.addEventListener("click", function (e) {
					e.preventDefault();
					window.location.href = "cartList.do";
				})
			}

			function memberInfo() {
				fetch("orderItemListJson.do?memberNo=" + memberNo1)
					.then(result => result.json())
					.then(result => {
						userPoint = result.point;
						document.querySelector('#memberPoint').innerText = userPoint;
						let memberInfo = document.querySelector('#membetInfo');
						memberInfo.addEventListener("click", function (e) {
							e.preventDefault();
							let phones = result.phone.split('-');
							console.log(phones);
							document.querySelector('#memberName').value = result.mName;
							document.querySelector('#order_phone01').value = phones[0];
							document.querySelector('#order_phone02').value = phones[1];
							document.querySelector('#order_phone03').value = phones[2];
							// document.querySelector('#order_add1').value = ;
							// document.querySelector('#order_add1').value = ;
						})
					})
			}

			function deliveryMessageEvent() {
				let deliveryMessage = document.querySelector("#deliveryMessage");
				deliveryMessage.addEventListener("mouseenter", function () {
					console.log('마우스 올라감');

				})
				deliveryMessage.addEventListener("mouseleave", function () {

				})

			}

			function addOrderBtnEvent() {
				let addOrderBtn = document.querySelector("#addOrderBtn");
				addOrderBtn.addEventListener("click", function (e) {
					e.preventDefault();
					let memberName = document.querySelector("#memberName").value;
					let memberaddress1 = document.querySelector("#sample4_roadAddress").value;
					let memberaddress2 = document.querySelector("#sample4_detailAddress").value;
					let memberaddress = memberaddress1 + " " + memberaddress2;
					let orderStatus = "주문완료";
					let orderPrice = parseInt(document.querySelector(".sumPrice").innerText);
					let point = parseInt(document.querySelector(".usePoint").innerText);
					let totalPayment = parseInt(document.querySelector(".totalPrice").innerText);
					let phone1 = document.querySelector("#order_phone01").value;
					let phone2 = document.querySelector("#order_phone02").value;
					let phone3 = document.querySelector("#order_phone03").value;
					let userPhone = phone1 + "-" + phone2 + "-" + phone3;
					let images = document.querySelectorAll('#orderItemList .image');
					let memberPoint = parseInt(document.querySelector('#memberPoint').innerText);
					let totalPoint = parseInt(document.querySelector(".totalPoint").innerText);
					let remainPoint = memberPoint - point + totalPoint;
					console.log(remainPoint);
					if (memberName != '' && memberaddress1 != '' && memberaddress2 != '' && phone1 != '' && phone2 != '' && phone3 != '') {
						fetch("checkOrderNo.do?memberNo=" + memberNo1)
							.then(result => result.json())
							.then(result => {
								console.log(result);
								let addOrderNo = 0;
								if(result == null){
									addOrderNo = orderNo;
								} else {
									addOrderNo = parseInt(result) + 1;
								}
								console.log(addOrderNo);
								let orderInfo = {
									method: "POST",
									headers: {
										'Content-Type': 'application/x-www-form-urlencoded'
									},
									body:
										'odNo=' + addOrderNo + '&odTg=' + memberName
										+ '&odAd=' + memberaddress + '&odt=' + orderToday
										+ '&odStatus=' + orderStatus + '&odPrice=' + orderPrice
										+ '&usePoint=' + point + '&odTotal=' + totalPayment
										+ '&memberNo=' + memberNo1 + '&phone=' + userPhone
										+ '&remainPoint=' + remainPoint
								};
								fetch("addOrder.do", orderInfo)
									.then(result => result.json())
									.then(result => {
										if (result.retCode == "OK") {
											images.forEach(image => {
												let bookNumber = image.dataset.bookno;
												let quanti = image.dataset.quantity;
												let cartNumber = image.dataset.cartno;
												const orderItemInfo = {
													method: "POST",
													headers: {
														'Content-Type': 'application/x-www-form-urlencoded'
													},
													body:
														'odNo=' + result.odNo + '&bookNo=' + bookNumber
														+ '&quantity=' + quanti
												};
												const cartInfo = {
													method: "POST",
													headers: {
														'Content-Type': 'application/x-www-form-urlencoded'
													},
													body:
													'cartNo=' + cartNumber
												}
												fetch("addOrderItem.do", orderItemInfo);
												fetch("removeCart.do", cartInfo);
											})
											const pointInfo = {
												method: "POST",
												headers: {
													'Content-Type': 'application/x-www-form-urlencoded'
												},
												body:
													'remainPoint=' + result.point + '&memberNo=' + memberNo1
											}
											fetch("modifyPoint.do", pointInfo);
											Swal.fire({
												text: "결제가 완료되었습니다!",
												confirmButtonText: `<a href="orderList.do">확인</a>`
											})
											
										} else {
											Swal.fire({
												text: "결제 실패. 다시 시도해주세요.",
												confirmButtonText: `확인`
											})
										}
									})
							})
					} else {
						alert("모든 정보를 입력해주세요.")
					}
				})
			}
			// function checkCart(memberNo, bookNo) {
			// 	console.log(memberNo)
			// 	Swal.fire({
			// 		text: "결제가 완료되었습니다!",
			// 		showCancelButton: true,
			// 		confirmButtonText: '추가상품 구매하기',
			// 		cancelButtonText: `<a href="cartList.do?memberNo=${memberNo}&bookNo=${bookNo}">주문내역 페이지로 이동</a>`
			// 	}).then((result) => {
			// 		if (result.value) {
			// 			//"삭제" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
			// 		}
			// 	})
			// }

			function getToday() {
				let date = new Date();
				let year = date.getFullYear();
				let month = ("0" + (1 + date.getMonth())).slice(-2);
				let day = ("0" + date.getDate()).slice(-2);
				return year + "/" + month + "/" + day;
			}










			function sample4_execDaumPostcode() {
				new daum.Postcode({
					oncomplete: function (data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
			}
		</script>

		<!-- <script src="js2/orderItemList.js"></script> -->