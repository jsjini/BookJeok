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
			// console.log(result);
			result.forEach(item => {
				// console.log(item);
				const newtbody = maketr(item);
				orderList.insertAdjacentHTML("beforeend", newtbody);
			});

			orderListInfo();

			moveOrderDetaliPage();

			removeOrderBtn();

			orderListInfo();
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
			<div style="padding: 7px; font-size: 20px;"><span class="bookName"></span><span style="padding: 7px 7px 7px 20px;"><span>총&nbsp;</span><span class="totalQuan"></span><span>건</span></span></div>
			<div style="padding: 7px; font-size: 20px;"><span>${price}&nbsp;원</span></div>
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
	let remBtns = document.querySelectorAll("#orderList .remBtn");
	remBtns.forEach(remBtn => {
		let orderNo = remBtn.dataset.odno;
		fetch("checkBookInfo.do?odNo=" + orderNo)
			.then(result => result.json())
			.then(result => {
				console.log(result[0]);
				let quantity3 = 0;
				for (res of result) {
					quantity3 += res.quantity;
				}
				let bookImg = result[0].img;
				let bookName = result[0].name;
				remBtn.closest("tr").nextElementSibling.querySelector(".bookName").innerHTML = bookName;
				remBtn.closest("tr").nextElementSibling.querySelector(".totalQuan").innerHTML = quantity3;
				remBtn.closest("tr").nextElementSibling.querySelector(".bookImg").src = "images/" + bookImg;
			})
	})
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
			if (confirm("함께 주문한 전체 상품의 결제내역이 삭제되어 복구할 수 없으며, 삭제 이후 상품에 대한 리뷰작성 및 삭제가 불가능합니다. 정말 삭제하시겠습니까?")) {
				// Swal.fire({
				// 	title: "함께 주문한 전체 상품의 결제내역이 삭제되어 복구할 수 없으며, 삭제 이후 상품에 대한 리뷰작성 및 삭제가 불가능합니다.",
				// 	text: "정말 삭제하시겠습니까?",
				// 	icon: "warning",
				// 	showCancelButton: true,
				// 	confirmButtonColor: "#badc58",
				// 	cancelButtonColor: "#568A35",
				// 	confirmButtonText: "삭제하기"
				// }).then((result) => {
				// 	if (result.isConfirmed) {
				let orderNo = remBtn.dataset.odno;
				fetch("removeOrderItem.do?orderNo=" + orderNo)
					.then(result => result.json())
					.then(result => {
						if (result.retCode == "OK") {
							console.log("주문아이템 삭제");
						}
					})
				console.log("주문아이템 삭제");
				console.log("포렌키...");
				console.log("흑...ㅜ");
				fetch("removeOrder.do?orderNo=" + orderNo)
					.then(result => result.json())
					.then(result => {
						if (result.retCode == "OK") {
							alert("주문내역이 삭제되었습니다.");
							// Swal.fire({
							// 	title: "삭제완료",
							// 	text: "주문내역이 삭제되었습니다.",
							// 	icon: "success",
							// 	confirmButtonColor: "#badc58",
							// 	confirmButtonText: "확인"
							// })
							location.reload();
						} else {
							alert("주문 삭제에 실패하였습니다.");
						}
					})

				// }
				// });
			}
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