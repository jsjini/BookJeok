<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="shopping-cart section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Shopping Summery -->
					<table class="table shopping-summery" id="memberNumber" data-memberno="${sessionScope.memberNo}">
						<thead>
							<tr class="main-hading">
								<th class="text-center">순번</th>
								<th class="text-center">주문일</th>
								<th class="text-center">주문자</th>
								<th class="text-center">배송 주소</th>
								<th class="text-center">총 결제금액</th>
								<th class="text-center">주문상태</th>
								<th class="text-center"><i class="ti-trash remove-icon"></i></th>
							</tr>
						</thead>
						<tbody id="orderList" style="text-align: center;">
						
						</tbody>
					</table>
					<!--/ End Shopping Summery -->
				</div>
			</div>
		</div>
	</div>
	
	<script src="js2/orderList.js"></script>