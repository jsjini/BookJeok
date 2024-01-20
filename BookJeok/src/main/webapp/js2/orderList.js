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
		<th scope="row"><img src="images/8901276534_2.jpg" alt="#"></th>
		<td style="padding: 0px 0px 0px 80px;">
			<div style="padding: 0px 7px 10px 7px; font-size: 15px;"><span>${odt}&nbsp;&nbsp;결제</span></div>
			<div style="padding: 7px; font-size: 20px;"><span>혼자 공부하는 자바</span><span style="padding: 7px 7px 7px 20px;"> 총 2건</span></div>
			<div style="padding: 7px; font-size: 20px;"><span>${item.odTotal}&nbsp;&nbsp;원</span></div>
			<div style="padding: 7px 7px 0px 7px; font-size: 17px;"><a href=""><span style="color: rgb(3, 202, 136);">주문상세></span></a></div>
		</td>
	</tr>
	`
	return newtbody1;
}