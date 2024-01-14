<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<div class="orderStepN" style="margin-top:20px; 
						border: 1px solid #aaa;
						border-radius: 15px;
						padding: 30px;
						color: rgb(71, 71, 66);
					">
							<h2>쇼핑 카트</h2>
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
						<tbody>
							<tr>
								<td><input type="checkbox" checked></td>
								<td class="image" data-title="No"><img src="https://via.placeholder.com/100x100"
										alt="#"></td>
								<td>
									<p class="product-name">
										<a href="#">혼자공부하는 자바</a>
									</p>
								</td>
								<td class="product-des" data-title="Description">
									<p class="product-des">2024-01-16</p>
								</td>
								<td class="price" data-title="Price"><span>30,000 원</span></td>
								<td class="qty" data-title="Qty">
									<!-- Input Order -->
									<div class="input-group">
										<div class="button minus">
											<button type="button" class="btn btn-primary btn-number" disabled="disabled"
												data-type="minus" data-field="quant[1]">
												<i class="ti-minus"></i>
											</button>
										</div>
										<input type="text" name="quant[1]" class="input-number" data-min="1"
											data-max="100" value="1">
										<div class="button plus">
											<button type="button" class="btn btn-primary btn-number" data-type="plus"
												data-field="quant[1]">
												<i class="ti-plus"></i>
											</button>
										</div>
										<div style="text-align: center; margin-top: 10px;"><button type="button" style="width: 100px; padding: 7px;">수정</button></div>
									</div> <!--/ End Input Order -->
								</td>
								<td class="total-amount" data-title="Total"><span>$220.88</span></td>
								<td class="action" data-title="Remove"><a href="#"><i
											class="ti-trash remove-icon"></i></a></td>
							</tr>
						</tbody>
					</table>
					<!--/ End Shopping Summery -->
				</div>
			</div>
			<div class="cart_point_total" style="padding: 10px; text-align: right; border-bottom: 1px solid #aaa;"><span>적립 예정 포인트</span><span style="font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;1,500 P</span></div>
			<div class="row">
				<div class="col-12">
					<!-- Total Amount -->
					<div class="total-amount">
						<div class="row">
							<div class="col-lg-8 col-md-5 col-12">
								<div class="left">
									<div class="coupon">
										<form action="#" target="_blank">
											<p style="padding: 15px;"><span>사용가능한 포인트</span><span>&nbsp;&nbsp;&nbsp;&nbsp;5,000 P</span></p>

											<input name="Coupon" placeholder="사용할 포인트 입력">
											<button class="btn"> 포인트 사용</button>
										</form>
									</div>
									<div class="checkbox">
										<label class="checkbox-inline" for="2"><input name="news" id="2"
												type="checkbox"> Shipping (+10$)</label>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-7 col-12">
								<div class="right">
									<ul>
										<li>주문도서 금액 합계<span style="font-weight: bold;">30,000 원</span></li>
										<li>주문도서 수량<span style="font-size: small;">&nbsp;(1권)</span><span style="font-weight: bold;">1종</span></li>
										<li>사용 포인트<span style="font-weight: bold;">1,500 P</span></li>
										<li class="last">주문 합계 금액<span style="font-weight: bold; font-size: larger;">28,500 원</span></li>
									</ul>
									<div class="button5">
										<a href="#" class="btn" style="font-weight: bold; font-size: larger;">주문하기</a> <a href="#" class="btn" style="font-weight: bold; font-size: larger;">쇼핑 계속하기</a>
									</div>
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