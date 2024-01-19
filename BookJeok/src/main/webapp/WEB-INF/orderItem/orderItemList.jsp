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
				<h3>배송지 정보<span></span></h3>
				<table>
					<tbody>
						<tr>
							<th>이름</th>
							<td>
								<input id="memberName" type="text" maxlength="20"><a href="#" id="membetInfo">회원정보와
									동일</a>
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
								<input type="text" id="sample4_postcode" placeholder="우편번호">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
								<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="sample4_detailAddress" placeholder="상세주소">
								<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
							</td>
						</tr>
						<tr>
							<th>
								배송요청사항
							</th>
							<td>
								<input type="text" id="deliveryMessage">
								<div>
									<span style="font-size: smaller;"> * 북적북적 요청사항이 아닌 택배사 송장에 표기되는 메시지입니다.</span>
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
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			let memberNo = document.querySelector('#memberNumber').dataset.memberno;
			var list = ${ orders };
			console.log(list);

			list.forEach(item => {
				console.log(item);
				const newtbody = maketr(item);
				orderItemList.insertAdjacentHTML("beforeend", newtbody);
			});

			makeTotal();

			moveCart();

			memberInfo();

			deliveryMessageEvent();

			function maketr(item) {
				console.log(item.bookImg, item.bookName, item.bookNo, item.bookPirce);
				let totalPrice = item.bookPirce * item.quantity;
				const newtbody1 = `<tr>
				<td class="image" data-totalprice="\${totalPrice}" data-bookno="\${item.bookNo}" data-quantity="\${item.quantity}" data-img="\${item.bookImg}" data-name="\${item.bookName}" data-price="\${item.bookPirce}" data-title="No"><img src="images/\${item.bookImg}"
					alt="#"></td>
				<td>
				<p class="product-name">
					<a href="#">\${item.bookName}</a>
				</p>
				</td>
				<td class="product-des" data-title="Description">
				<p class="product-des">내일 수령</p>
				</td>
				<td class="price" data-title="\${item.bookPirce}"><span>\${item.bookPirce}</span></td>
				<td class="qty" data-title="Qty">
					<p class="qty-value">\${item.quantity}</p>
				</td>
				<td class="total-amount" data-title="Total"><span>\${totalPrice}</span></td>
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
					totalPrice += parseInt(image.dataset.totalprice);

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

			function memberInfo() {
				fetch("orderItemListJson.do?memberNo=" + memberNo)
					.then(result => result.json())
					.then(result => {
						console.log(result);
						let memberInfo = document.querySelector('#membetInfo');
						console.log(memberInfo);
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

			function makeMessage() {
				const message = `<select id="deliveryMessageInfo">
				<option value="option1">부재시 경비실에 맡겨주세요.</option>
				<option value="option2">문 앞에 두고가세요.</option>
				<option value="option3">오실 때 연락주세요.</option>
				</select>`
				return message;
			}

			function deliveryMessageEvent() {
				let deliveryMessage = document.querySelector("#deliveryMessage");
				deliveryMessage.addEventListener("mouseenter", function () {
					console.log('마우스 올라감');
					const message = makeMessage();
					deliveryMessage.insertAdjacentHTML("beforeend", message);
				})
				deliveryMessage.addEventListener("mouseleave", function () {

				})

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