/**
 * 
 */

let memberNo1 = document.querySelector('#memberNumber').dataset.memberno;
console.log(memberNo1);
showOrder(memberNo1);


function showOrder() {
	fetch("orderListJson.do?memberNo=" + memberNo1)
		.then(result => result.json())
		.then(result => {
			console.log(result);
			result.forEach(item => {
				console.log(item);
				const newtbody = maketr(item);
				orderList.insertAdjacentHTML("beforeend", newtbody);
			});

			orderListInfo();

			moveOrderDetaliPage();

			removeOrderBtn();
		})
}

function maketr(item) {
	let odt = item.odt.split(' ')[0];
	let price = makeComma(item.odTotal);
	const newtbody1 =
		`
	<tr>
		<th scope="row" style="padding: 0px 0px 10px 0px; font-size: 17px;">${item.odStatus}</th>
		<td class="right"><a href="#" class="remBtn" data-odno="${item.odNo}"><i class="ti-trash remove-icon" style="font-size: 20px;"></i></a></td>
	</tr>
	<tr>
		<th scope="row" style="padding: 0px 0px 20px 0px;"><img src="images/8901276534_2.jpg" alt="#" class="bookImg"></th>
		<td style="padding: 0px 0px 20px 80px;">
			<div style="padding: 0px 7px 10px 7px; font-size: 15px;"><span>${odt}&nbsp;&nbsp;결제</span></div>
			<div style="padding: 7px; font-size: 20px;"><span class="bookName">혼자 공부하는 자바</span><span style="padding: 7px 7px 7px 20px;"><span>총</span><span class="totalQuan">2</span><span>건</span></span></div>
			<div style="padding: 7px; font-size: 20px;"><span>${price}&nbsp;&nbsp;원</span></div>
			<div style="padding: 7px 7px 0px 7px; font-size: 17px;"><a href="#" class="orderDetail" data-odno="${item.odNo}"
			data-odstatus="${item.odStatus}" data-odt="${odt}" data-memberno="${item.memberNo}"
			data-odtg="${item.odTg}" data-phone="${item.phone}" data-odad="${item.odAd}" data-odprice="${item.odPrice}"
			data-usepoint="${item.usePoint}" data-odtotal="${item.odTotal}">
			<span style="color: rgb(3, 202, 136);">주문상세></span></a></div>
		</td>
	</tr>
	`
	return newtbody1;
}


function orderListInfo() {

}

function delAlert() {
	Swal.fire({
		title: "함께 주문한 전체 상품의 결제내역이 삭제되어 복구할 수 없으며, 삭제 이후 상품에 대한 리뷰작성 및 삭제가 불가능합니다.",
		text: "정말 삭제하시겠습니까?",
		icon: "warning",
		showCancelButton: true,
		confirmButtonColor: "#badc58",
		cancelButtonColor: "#568A35",
		confirmButtonText: "삭제하기"
	}).then((result) => {
		if (result.isConfirmed) {

			Swal.fire({
				title: "삭제완료",
				text: "주문삭제가 성공했습니다.",
				icon: "success",
				confirmButtonColor: "#badc58",
				confirmButtonText: "확인"
			});
		}
	});
}

function removeOrderBtn() {
	let remBtns = document.querySelectorAll("#orderList .remBtn");
	remBtns.forEach(remBtn => {
		remBtn.addEventListener("click", function (e) {
			e.preventDefault();
			Swal.fire({
				title: "함께 주문한 전체 상품의 결제내역이 삭제되어 복구할 수 없으며, 삭제 이후 상품에 대한 리뷰작성 및 삭제가 불가능합니다.",
				text: "정말 삭제하시겠습니까?",
				icon: "warning",
				showCancelButton: true,
				confirmButtonColor: "#badc58",
				cancelButtonColor: "#568A35",
				confirmButtonText: "삭제하기"
			}).then((result) => {
				if (result.isConfirmed) {
					let orderNo = remBtn.dataset.odno;
					console.log("클릭됨" + orderNo);
					fetch("removeOrderItem.do?orderNo=" + orderNo);
					fetch("removeOrder.do?orderNo=" + orderNo)
						.then(result => result.json())
						.then(result => {
							if (result.retCode == "OK") {
								// alert("주문삭제가 성공했습니다.");
								Swal.fire({
									title: "삭제완료",
									text: "주문삭제가 성공했습니다.",
									icon: "success",
									confirmButtonColor: "#badc58",
									confirmButtonText: "확인"
								})
								location.reload();
							} else {
								alert("주문 삭제에 실패하였습니다.");
							}
						})

				}
			});

		})
	})
}

function moveOrderDetaliPage() {
	let odDetails = document.querySelectorAll("#orderList .orderDetail");
	let orderDetail = {};
	odDetails.forEach(odDetail => {
		odDetail.addEventListener('click', function () {
			let odNo = this.dataset.odno;
			let odStatus = this.dataset.odstatus;
			let odt = this.dataset.odt;
			let odTg = this.dataset.odtg;
			let phone = this.dataset.phone;
			let odAd = this.dataset.odad;
			let odPrice = this.dataset.odprice;
			let usePoint = this.dataset.usepoint;
			let odTotal = this.dataset.odtotal;
			orderDetail = {
				"odNo": odNo, "odStatus": odStatus, "odt": odt, "memberNo": memberNo1, "odTg": odTg, "phone": phone, "odAd": odAd,
				"odPrice": odPrice, "usePoint": usePoint, "odTotal": odTotal,
			};
			let orderDetail1 = JSON.stringify(orderDetail);
			document.querySelector('#orderDetail3').value = orderDetail1;
			formOrder.submit();
		})
	})
	// document.querySelector("#orderList .orderDetail").addEventListener("click", function (e) {
	// 	e.preventDefault();
	// 	let orderDetails = [];
	// 	odDetails.forEach(odDetail => {
	// 		let odNo = odDetail.dataset.odno;
	// 		let odStatus = odDetail.dataset.odstatus;
	// 		let odt = odDetail.dataset.odt;
	// 		let odTg = odDetail.dataset.odtg;
	// 		let phone = odDetail.dataset.phone;
	// 		let odAd = odDetail.dataset.odad;
	// 		let odPrice = odDetail.dataset.odprice;
	// 		let usePoint = odDetail.dataset.usepoint;
	// 		let odTotal = odDetail.dataset.odtotal;
	// 		let orderDetail = {
	// 			"odNo": odNo, "odStatus": odStatus, "odt": odt, "memberNo": memberNo1, "odTg": odTg, "phone": phone, "odAd": odAd,
	// 			"odPrice": odPrice, "usePoint": usePoint, "odTotal": odTotal,
	// 		};
	// 		console.log(orderDetail);
	// 	})

	// 	let orderDetail1 = JSON.stringify(orderDetail);
	// document.querySelector('#orderDetail3').value = orderDetail1;
	// formOrder.submit();
	// })

}