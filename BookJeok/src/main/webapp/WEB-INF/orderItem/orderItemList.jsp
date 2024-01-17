<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="js2/orderItemList.js"></script>
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
							<h2>주문 / 결제</h2>
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
						<div class="right">
							<button class="moveCart">카트로 가기</button>
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
				<table cellpadding="0" cellspacing="0" width="728">
					<colgroup>
						<col width="140">
						<col width="588">
					</colgroup>
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