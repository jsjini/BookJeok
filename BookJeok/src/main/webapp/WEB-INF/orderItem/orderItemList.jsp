<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	
	<style>
		.topLine{
			width: 110px;
		}
		.inp{
			width: 80px;
		}
		.inp_w240{
			width: 240px;
		}
		.h2_side1{
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
							<h2 id="memberNumber" data-memberno="${sessionScope.memberNo}" data-odno="${odNo}">주문 / 결제</h2>
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
								<th><input type="checkbox" checked></th>
								<th colspan="2">도서명</th>
								<th>배송예정일</th>
								<th class="text-center">도서금액</th>
								<th class="text-center">수량</th>
								<th class="text-center">합계</th>
								<th class="text-center"><i class="ti-trash remove-icon"></i></th>
							</tr>
						</thead>
						<tbody id="orderItemList" style="text-align: center;">
						
						</tbody>
					</table>
					<!--/ End Shopping Summery -->
				</div>
			</div>
			<div id="addPoint">
			<div class="cart_point_total" style="padding: 17px; text-align: right; border-bottom: 1px solid #aaa; font-size: 17px;"><span>적립 예정 포인트&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="totalPoint" style="font-weight: bold;"></span><span>&nbsp;P</span></div>
			<div class="row">
			</div>
			
			<div>
				<h3 style="margin-top: 40px; margin-bottom: 30px; margin-left: 20px;">구매자 정보</h3>
				<table>
					<tr>
						<th>이름</th>
						<td>
							<input class="topLine" type="text" id="order_name" maxlength="20">
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<input class="inp" type="text" id="order_phone1" maxlength="3">
							<input class="inp" type="text" id="order_phone2" maxlength="4">
							<input class="inp" type="text" id="order_phone3" maxlength="4">
							<span style="margin-left: 5px; line-height: 20px;" class="h2_side1">
							<a href="#" id="modphone" style="padding: 4px;">등록전화번호 수정</a></span>
						</td>
					</tr>
					<tr>
						<th>E-mail</th>
						<td>
							<input type="text" id="order_email" maxlength="60">
						</td>
					</tr>
				</table>
			</div>
			<div>
				<h3>배송지 정보 입력</h3>
				<table>
					<tbody>
						<tr>
							<th>이름</th>
							<td>
								<input type="text" maxlength="20">
								<a href="#">초기화</a>
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
									<a href="#">우편번호검색</a>
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
									<li>주문도서 수량<span>권)</span><span class="totalQuantity" style="font-size: small;"></span><span>(</span><span style="font-weight: bold;">&nbsp;종</span><span class="totalType" style="font-weight: bold;"></span></li>
									<li>배송비<span class="deliveryPrice" style="font-weight: bold;"></span></li>
										<li class="last">주문 합계 금액<span>&nbsp;원</span><span class="totalPrice" style="font-weight: bold; font-size: larger;"></span></li>
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
	</div>
	<!--/ End Shopping Cart -->

<script>
	var list = ${orders};
	console.log(list);
</script>
	<script src="js2/orderItemList.js"></script>