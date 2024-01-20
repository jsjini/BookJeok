<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<style>
		.outside1 {
			border: 1px solid #ddd;
			padding: 18px 45px 0px 45px;
			border-radius: 15px;
		}

		.makeList {
			border: 1px solid #ddd;
			padding: 18px 45px 0px 45px;
			border-radius: 15px;
		}

		.order_status {
			padding: 5px;
		}
		.right {
			float: right;
		}
	</style>

	<div class="shopping-cart section">
		<div class="container">
			<div class="row">
				<div class="col-8 outside1" style="margin: auto;">
					<!-- Shopping Summery -->
					<table id="memberNumber" data-memberno="${sessionScope.memberNo}">
						<colgroup>
							<col style="width: 90px;">
							<col style="width: auto;">
						</colgroup>
						<tbody id="orderList">
							<div class="makeList">
							<!-- <tr>
								<th scope="row" style="padding: 0px 0px 10px 0px; font-size: 17px;">결제 완료</th>
								<td class="right"><a href="#" class="remBtn"><i class="ti-trash remove-icon" style="font-size: 20px;"></i></a></td>
							</tr>
							<tr>
								<th scope="row"><img src="images/8901276534_2.jpg" alt="#"></th>
								<td style="padding: 0px 0px 0px 80px;">
									<div style="padding: 0px 7px 10px 7px; font-size: 15px;"><span>2024. 9. 10 결제</span></div>
									<div style="padding: 7px; font-size: 20px;"><span>혼자 공부하는 자바</span><span style="padding: 7px 7px 7px 20px;"> 총 2건</span></div>
									<div style="padding: 7px; font-size: 20px;"><span>30,800 원</span></div>
									<div style="padding: 7px 7px 0px 7px; font-size: 17px;"><a href=""><span style="color: rgb(3, 202, 136);">주문상세></span></a></div>
								</td>
							</tr> -->
							</div>
						</tbody>
					</table>


					<!--/ End Shopping Summery -->
				</div>
			</div>
		</div>
	</div>

	<script src="js2/orderList.js"></script>