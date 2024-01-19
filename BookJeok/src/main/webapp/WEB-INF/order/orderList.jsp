<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="shopping-cart section">
		<div class="container">
			<div class="row">
				<div class="col-10" style="margin: auto;">
					<!-- Shopping Summery -->
					<table class="table shopping-summery" id="memberNumber" data-memberno="${sessionScope.memberNo}">
						<!-- <thead>
							<tr class="main-hading">
								<th class="text-center">주문번호</th>
								<th class="text-center">주문일</th>
								<th class="text-center">주문자</th>
								<th class="text-center">배송 주소</th>
								<th class="text-center">총 결제금액</th>
								<th class="text-center">주문상태</th>
							</tr>
						</thead> -->
						<tbody id="orderList" style="text-align: center;">
						<tr><th>총 3건</th></tr>
						<tr>
							<td><img src="images/8901276534_2.jpg" alt=""></td>
						</tr>
						</tbody>
					</table>
					<!--/ End Shopping Summery -->
				</div>
			</div>
		</div>
	</div>
	
	<script src="js2/orderList.js"></script>