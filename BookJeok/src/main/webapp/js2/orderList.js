/**
 * 
 */

let memberNo = document.querySelector('#memberNumber').dataset.memberno;

showOrder(memberNo);

function showOrder() {
	fetch("orderListJson.do?memberNo=" + memberNo)
		.then(result => result.json())
		.then(result => {
			console.log(result);
			result.forEach(item => {
				console.log(item);
				// const newtbody = maketr(item);
				// orderList.insertAdjacentHTML("beforeend", newtbody);
			});
		})
}

function maketr(item) {
	console.log(item.bookImg, item.bookName, item.bookNo, item.bookPirce);
	const newtbody1 = `<tr>
	<td class="image" data-totalprice="\${totalPrice}" data-bookno="\${item.bookNo}" data-quantity="\${item.quantity}" data-img="\${item.bookImg}" data-name="\${item.bookName}" data-price="\${item.bookPirce}" data-title="No"><a href="bookDetail.do?bookNo=\${item.bookNo}"><img src="images/\${item.bookImg}"
		alt="#"></a></td>
	<td>
	<p class="product-name">
		<a href="bookDetail.do?bookNo=\${item.bookNo}">\${item.bookName}</a>
	</p>
	</td>
	<td class="product-des" data-title="Description">
	<p class="product-des">내일 수령</p>
	</td>
	<td class="price" data-title="\${item.bookPirce}"><span>\${item.bookPirce}</span></td>
	<td class="qty" data-title="Qty">
		<p class="qty-value">\${item.quantity}</p>
	</td>
	<td class="total-amount" data-title="Total"><span>\${totalPrice}</span></td>
	</tr>`
	return newtbody1;
}