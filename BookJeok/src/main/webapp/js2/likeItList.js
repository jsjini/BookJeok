/**
 * cartList.js
 */



//let memberNum = document.querySelector('#memberNumber').dataset.memberno;
/*let today = getToday();*/
/*console.log(memberNo, today);*/



// 찜하기 삭제 이벤트 등록
removeLikeItEvent();

//체크박스 선택 삭제 이벤트
delCheckEvent();

// 상품 체크박스 이벤트 등록
allCheckboxEvent();

//체크박스 선택
selCheckboxEvent();



function selCheckboxEvent() {
	let selChecks = document.querySelectorAll(".selCheck");
	selChecks.forEach(selCheck => {
		selCheck.addEventListener("change", function() {

		})
	})
}

function maketr(item) {
	const newtbody = `<tr>
			<td><input type="checkbox" class="selCheck" checked></td>
			<td class="image" data-title="No"><img src="${item.img}"
					alt="#"></td>
			<td>
				<p class="product-name">
					<a href="#">${item.name}</a>
				</p>
			</td>
			<td class="product-des" data-title="Description">
				<p class="product-des">${item.putDate}</p>
			</td>
			<td class="price" data-title="${item.price}"><span>${item.price}</span></td>
			<td class="qty" data-title="Qty">
				<!-- Input Order -->
				<div class="input-group">
					<div class="button minus">
						<button type="button" class="minusBtn btn btn-primary btn-number"
							data-type="minus" data-field="quant[1]">
							<i class="ti-minus"></i>
						</button>
					</div>
					<input type="text" name="quant[1]" class="input-number" data-min="1"
						data-max="100" value="${item.quantity}">
					<div class="button plus">
						<button type="button" class="plusBtn btn btn-primary btn-number" data-type="plus"
							data-field="quant[1]">
							<i class="ti-plus"></i>
						</button>
					</div>
					<div style="text-align: center; margin-top: 10px;"><button type="button" class="modBtn" data-memberno="${item.memberNo}" data-bookno="${item.bookNo}" data-quantity="${item.quantity}" data-cartno="${item.cartNo}" data-name="${item.name}" data-price="${item.price}" data-img="${item.img}" style="width: 100px; padding: 7px;">수정</button></div>
				</div> <!--/ End Input Order -->
			</td>
			<td class="total-amount" data-title="Total"><span>${item.totalPrice}</span></td>
			<td class="action"><a href="#" class="remBtn" data-cartno="${item.cartNo}"><i
						class="ti-trash remove-icon"></i></a></td>
		</tr>`
	return newtbody;
}



//체크박스 전체 선택/해제
function allCheckboxEvent() {
	$('.main-hading').find(':input').on('click', function() {
		console.log(this);
		$('#selectList').find(':checkbox').prop('checked', this.checked);
	});
}


//단품 삭제
function removeLikeItEvent() {
	let remLikeIts = document.querySelectorAll("#selectList .remBtn");

	remLikeIts.forEach(remLikeIt => {
		remLikeIt.addEventListener("click", async function(e) {
			console.log(remLikeIt);
			e.preventDefault();

			const result = await likeItDelAllModal();

			if (result.isConfirmed) {
				let bookNo = remLikeIt.dataset.bookno;
				fetch("removeLikeIt.do?bookNo=" + bookNo + "&memberNo=" + memberNo)
					.then(result => result.json())
					.then(result => {
						if (result.retCode == "OK") {
							likeItDelModal(); // 삭제 완료 모달 표시
							remLikeIt.closest('tr').remove();
						} else {
							alert('삭제 중 오류 발생.');
						}

					});
			}
		});
	});

}

// 체크박스 선택 전체 삭제
function delCheckEvent() {
	$('#delChecked').on('click', async function() {
		//체크여부 확인
		let checkedItems = document.querySelectorAll('#selectList .selCheck:checked');
		if (checkedItems.length === 0) {
			likeItNGModal();
			return;
		}
		
		//체크 삭제 확인
		const result = await likeItDelAllModal();

		if (result.isConfirmed) {
			let deletePromises = [];

			checkedItems.forEach(checkedItem => {
				let bookNo = checkedItem.closest('tr').querySelector('.remBtn').dataset.bookno;

				let deletePromise = fetch(`removeLikeIt.do?bookNo=${bookNo}&memberNo=${memberNo}`, {
					method: 'GET'
				})
					.then(result => result.json())
					.then(result => {
						if (result.retCode !== 'OK') {
							console.error('삭제 중 오류 발생:', result.errorMessage);
						}
					})
					.catch(error => {
						console.error('삭제 중 오류 발생:', error);
					});

				deletePromises.push(deletePromise);
			});

			// 모든 삭제 작업이 완료될 때까지 기다림
			await Promise.all(deletePromises);

			// 화면에서 삭제
			checkedItems.forEach(checkedItem => {
				checkedItem.closest('tr').remove();
			});

			likeItDelModal();
		}
	});
}