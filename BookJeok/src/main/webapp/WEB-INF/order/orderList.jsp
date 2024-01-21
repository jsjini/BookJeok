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
	<div class="breadcrumbs" style="padding-bottom: 0px;">
        <div class="container">
            <div class="row">
                <div class="col-8" style="margin: 0 auto;">
                    <div class="bread-inner">
                        <div class="orderStepN"
                            style="margin-top: 20px; border: 1px solid #aaa; border-radius: 15px; padding: 27px; color: rgb(71, 71, 66); text-align: center;">
                            <h2 id="memberNumber" data-memberno="${sessionScope.memberNo}">주문 내역</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div class="shopping-cart section">
		<div class="container">
			<div class="row">
				<div class="col-8 outside1" style="margin: auto;">
					<table>
						<colgroup>
							<col style="width: 90px;">
							<col style="width: auto;">
						</colgroup>
						<tbody id="orderList">
							
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
	<form id="formOrder" action="orderDetailList.do" method="post"><input type="hidden" name="orderDetail3" id="orderDetail3"></form>
	<script src="js2/orderList.js"></script>