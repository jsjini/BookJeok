<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!-- Breadcrumbs -->
	<div class="breadcrumbs" style="padding-bottom: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-11" style="margin: 0 auto;">
					<div class="bread-inner">
						<div class="orderStepN"
							style="margin-top: 20px; border: 1px solid #aaa; border-radius: 15px; padding: 27px; color: rgb(71, 71, 66); text-align: center;">
							<h2 id="memberNumber" data-memberno="${sessionScope.memberNo}">쇼핑
								카트</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->
	<!-- Shopping Cart -->
	<div class="shopping-cart section">
		<div class="container">
			<div class="row">
				<div class="col-11" style="margin: 0 auto;">
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
						<tbody id="cartList" style="text-align: center;">

						</tbody>
					</table>
					<!--/ End Shopping Summery -->
				</div>
			</div>
			<div class="col-11" style="margin: 0 auto;">
				<div id="addPoint">
					<div class="cart_point_total"
						style="padding: 17px; text-align: right; border-bottom: 1px solid #aaa; font-size: 17px;">
						<span>적립 예정 포인트&nbsp;&nbsp;&nbsp;&nbsp;</span> <span class="totalPoint"
							style="font-weight: bold;"></span> <span>&nbsp;P</span>
					</div>
				</div>
			</div>
			<div class="row"></div>
			<!-- <div class="col-10" id="totalAmount"> -->
			<!-- Total Amount -->
			<div class="total-amount">
				<div class="row">
					<div class="col-11" style="margin: 0 auto;">
						<div class="right" id="orderbutton">
							<ul>
								<li>주문도서 수량<span>권)</span><span class="totalQuantity"
										style="font-size: small;"></span><span>(</span><span
										style="font-weight: bold;">&nbsp;종</span><span class="totalType"
										style="font-weight: bold;"></span></li>
								<li>배송비<span class="deliveryPrice" style="font-weight: bold;"></span></li>
								<li class="last">주문 합계 금액<span>&nbsp;원</span><span class="totalPrice"
										style="font-weight: bold; font-size: larger;"></span></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- </div> -->
			</div>
			<!--/ End Total Amount -->
		</div>
	</div>
	<!--/ End Shopping Cart -->
	<form id="formOrder" action="orderItemPageList.do" method="post">
		<input type="hidden" name="orders" id="orders">
	</form>
	<script src="js2/cartList.js"></script>
	<script>

	</script>