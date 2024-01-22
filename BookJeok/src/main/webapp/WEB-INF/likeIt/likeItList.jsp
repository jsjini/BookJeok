<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>

<!-- Breadcrumbs -->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="bread-inner">
					<div class="orderStepN"
						style="margin-top: 20px; border: 1px solid #aaa; border-radius: 15px; padding: 30px; color: rgb(71, 71, 66);">
						<h2 id="memberNumber" data-memberno="${sessionScope.memberNo}">찜 목록</h2>
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
							<th><input type="checkbox"></th>
							<th class="text-center">책표지</th>
							<th class="text-center">도서명</th>
							<th class="text-center">저자</th>
							<th class="text-center">출판사</th>
							<th class="text-center">금액</th>
							<th class="action"><button class="remBtn" id="delChecked"
									data-bookno="${likeIt.bookNo }" data-memberno="${memberNo}">
									<i class="ti-trash remove-icon"></i>
								</button></th>
						</tr>
					</thead>

					<tbody id="selectList" style="text-align: center;">
						<c:forEach var="likeIt" items="${LikeItVO}">
							<tr>
								<td><input type="checkbox" class="selCheck"></td>
								<td><a href="bookDetail.do?bookNo=${likeIt.bookNo }"><img
										src="images/${likeIt.img }" alt="#"></a></td>
								<td><a href="bookDetail.do?bookNo=${likeIt.bookNo }">${likeIt.name }</a></td>
								<td>${likeIt.author }</td>
								<td>${likeIt.comp }</td>
								<td>${likeIt.price }</td>
								<td class="action"><button class="remBtn"
										data-bookno="${likeIt.bookNo }" data-memberno="${memberNo}">
										<i class="ti-trash remove-icon"></i>
									</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!--/ End Shopping Summery -->
			</div>
		</div>

	</div>
	<!--/ End Shopping Cart -->

</div>
<script src="js2/likeItList.js"></script>
<form id="formOrder" action="orderItemPageList.do" method="post">
	<input type="hidden" name="orders" id="orders">
</form>
<script>
	document.querySelector('#selectList').addEventListener("click", function() {

		if (event.target.nodeName == "TR") { //tag 이름은 무조건 대문자
			//event.target.
		}
	})
</script>