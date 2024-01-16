<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="js2/cartList.js"></script>
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
						<tbody id="cartList" style="text-align: center;">
						
						</tbody>
					</table>
					<!--/ End Shopping Summery -->
				</div>
			</div>
			<div id="addPoint"></div>
				<div class="col-12" id="totalAmount" style=":hover background-color: yellow;">
					<!-- Total Amount -->
					
					<!--/ End Total Amount -->
				</div>
			</div>
		</div>
	</div>
	<!--/ End Shopping Cart -->

	
	<script>
		

	</script>