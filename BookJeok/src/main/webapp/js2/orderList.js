/**
 * 
 */

let memberNo = document.querySelector('#memberNumber').dataset.memberno;
console.log(memberNo);
showOrder(memberNo);


function showOrder() {
	fetch("orderListJson.do?memberNo=" + memberNo)
		.then(result => result.json())
		.then(result => {
			console.log(result);
			result.forEach(item => {
				console.log(item);
				const newtbody = maketr(item);
				orderList.insertAdjacentHTML("beforeend", newtbody);
			});

			moveOrderDetaliPage();
		})
}

function maketr(item) {
	let odt = item.odt.split(' ')[0];
	const newtbody1 =
		`
	<tr>
		<th scope="row" style="padding: 0px 0px 10px 0px; font-size: 17px;">${item.odStatus}</th>
		<td class="right"><a href="#" class="remBtn" data-odno="${item.odNo}"><i class="ti-trash remove-icon" style="font-size: 20px;"></i></a></td>
	</tr>
	<tr>
		<th scope="row" style="padding: 0px 0px 20px 0px;"><img src="images/8901276534_2.jpg" alt="#"></th>
		<td style="padding: 0px 0px 20px 80px;">
			<div style="padding: 0px 7px 10px 7px; font-size: 15px;"><span>${odt}&nbsp;&nbsp;결제</span></div>
			<div style="padding: 7px; font-size: 20px;"><span>혼자 공부하는 자바</span><span style="padding: 7px 7px 7px 20px;"> 총 2건</span></div>
			<div style="padding: 7px; font-size: 20px;"><span>${item.odTotal}&nbsp;&nbsp;원</span></div>
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

function moveOrderDetaliPage() {
	let odDetails = document.querySelectorAll("#orderList .orderDetail");
	let orderDetail = {};
	odDetails.forEach(odDetail => {
		odDetail.addEventListener('click', function () {
			let odNo = this.dataset.odno;
			let odStatus = this.dataset.odstatus;
			let odt = this.dataset.odt;
			let memberNo = this.dataset.memberno;
			let odTg = this.dataset.odtg;
			let phone = this.dataset.phone;
			let odAd = this.dataset.odad;
			let odPrice = this.dataset.odprice;
			let usePoint = this.dataset.usepoint;
			let odTotal = this.dataset.odtotal;
			orderDetail = {
				"odNo": odNo, "odStatus": odStatus, "odt": odt, "memberNo": memberNo, "odTg": odTg, "phone": phone, "odAd": odAd,
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
	// 		let memberNo = odDetail.dataset.memberno;
	// 		let odTg = odDetail.dataset.odtg;
	// 		let phone = odDetail.dataset.phone;
	// 		let odAd = odDetail.dataset.odad;
	// 		let odPrice = odDetail.dataset.odprice;
	// 		let usePoint = odDetail.dataset.usepoint;
	// 		let odTotal = odDetail.dataset.odtotal;
	// 		let orderDetail = {
	// 			"odNo": odNo, "odStatus": odStatus, "odt": odt, "memberNo": memberNo, "odTg": odTg, "phone": phone, "odAd": odAd,
	// 			"odPrice": odPrice, "usePoint": usePoint, "odTotal": odTotal,
	// 		};
	// 		console.log(orderDetail);
	// 	})

	// 	let orderDetail1 = JSON.stringify(orderDetail);
	// document.querySelector('#orderDetail3').value = orderDetail1;
	// formOrder.submit();
	// })

}