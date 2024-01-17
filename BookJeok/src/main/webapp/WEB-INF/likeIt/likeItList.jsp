<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<!-- <script src="js2/likeItList.js"></script> -->
<!-- Breadcrumbs -->
<h3>${LikeItVO }</h3>
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="bread-inner">
					<div class="orderStepN"
						style="margin-top: 20px; border: 1px solid #aaa; border-radius: 15px; padding: 30px; color: rgb(71, 71, 66);">
						<h2>찜 목록</h2>
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
							<th class="text-center">책표지</th>
							<th class="text-center">도서명</th>
							<th class="text-center">저자</th>
							<th class="text-center">출판사</th>
							<th class="text-center">금액</th>
							<th class="text-center"><i class="ti-trash remove-icon"></i></th>
						</tr>
					</thead>
					
					<tbody id="cartList" style="text-align: center;">
					<!-- forEach 반복문 추가해야됨. -->
							<td><input type="checkbox" class="selCheck"></td>
							<td><img src="${LikeItVO[1].img}" alt="#"></td>
							<td>${LikeItVO[1].name }</td>							
							<td>${LikeItVO[1].author }</td>
							<td>${LikeItVO[1].comp }</td>							
							<td>${LikeItVO[1].price }</td>
							<td class="action"><a href="#" class="remBtn" data-cartno=""><i	class="ti-trash remove-icon"></i></a></td>
					<!-- cartList.js랑 비교해서 데이터 db에서 삭제하는 기능 추가해야됨. -->
							
						</tr>
					</tbody>
				</table>
				<!--/ End Shopping Summery -->
			</div>
		</div>

	</div>
	<!--/ End Shopping Cart -->

</div>
	<script>
		
	</script>