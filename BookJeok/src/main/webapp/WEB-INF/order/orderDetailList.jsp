<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="breadcrumbs" style="padding-bottom: 0px;">
        <div class="container">
            <div class="row">
                <div class="col-10" style="margin: 0 auto;">
                    <div class="bread-inner">
                        <div class="orderStepN"
                            style="margin-top: 20px; border: 1px solid #aaa; border-radius: 15px; padding: 27px; color: rgb(71, 71, 66); text-align: center;">
                            <h2 id="memberNumber" data-memberno="${sessionScope.memberNo}">주문 상세정보</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="shopping-cart section" style="padding-bottom: 0px;">
        <div class="container">
            <div class="row">
                <div class="col-10" style="margin: 0 auto;">
                    <div>
                        <h5 id="orderNo" style="padding: 5px;"></h5>
                        <h5 id="orderDate" style="padding: 5px;"></h5>
                        <h5 id="orderStatus" style="padding: 5px;"></h5>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="shopping-cart section" style="padding-bottom: 0px;">
        <div class="container">
            <div class="row">
                <div class="col-10 outside1" style="margin: auto;">
                    <table class="table shopping-summery">
                        <tbody id="makeList" style="text-align: center;">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="shopping-cart section" style="padding-bottom: 0px;">
        <div class="container">
            <div class="row">
                <div class="col-10" style="margin: 0 auto;">
                    <div>
                        <h3 style="margin-bottom: 20px;">배송지 정보</h3>
                        <table class="table" style="font-size: 20px;">
                            <tr>
                                <td>주문자</td>
                                <td id="orderTg"></td>
                            </tr>
                            <tr>
                                <td>연락처</td>
                                <td id="orderPhone"></td>
                            </tr>
                            <tr>
                                <td>배송지</td>
                                <td id="orderAddr"></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="shopping-cart section">
        <div class="container">
            <div class="row">
                <div class="col-10" style="margin: 0 auto;">
                    <div>
                        <h3 style="margin-bottom: 20px;">결제 정보</h3>
                        <table class="table" style="font-size: 20px;">
                            <tr>
                                <td>상품 금액</td>
                                <td id="orderPrice"></td>
                            </tr>
                            <tr>
                                <td>사용 포인트</td>
                                <td id="orderUsePoint"></td>
                            </tr>
                            <tr>
                                <td>결제 금액</td>
                                <td id="orderTotal"></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        let memberNo1 = document.querySelector('#memberNumber').dataset.memberno;

				// "odPrice": odPrice, "usePoint": usePoint, "odTotal": odTotal,
        console.log(memberNo1);
        var details = ${ orderDetail3 };
        console.log(details);


        showOrderDetailList();
        showOrderInfo();

        function showOrderInfo() {
            orderNo.innerHTML = "▶&nbsp;주문번호:&nbsp;&nbsp;&nbsp;"+details.odNo;
            orderDate.innerHTML = "▶&nbsp;주문일자:&nbsp;&nbsp;&nbsp;"+details.odt;
            orderStatus.innerHTML = "▶&nbsp;주문상태:&nbsp;&nbsp;&nbsp;"+details.odStatus;
            orderTg.innerHTML = details.odTg;
            orderPhone.innerHTML = details.phone;
            orderAddr.innerHTML = details.odAd;
            let odprice1 = makeComma(details.odPrice)+"&nbsp;&nbsp;원";
            let usePoint1 = makeComma(details.usePoint)+"&nbsp;&nbsp;P";
            let odTotal1 = makeComma(details.odTotal)+"&nbsp;&nbsp;원";
            orderPrice.innerHTML = odprice1;
            orderUsePoint.innerHTML = usePoint1;
            orderTotal.innerHTML = odTotal1;
        }

        function showOrderDetailList(callback) {
            fetch("orderDetailListJson.do?odNo=" + details.odNo)
                .then(result => result.json())
                .then(result => {
                    result.forEach(item => {
                        const newtbody = maketr(item);
                        makeList.insertAdjacentHTML("afterbegin", newtbody);
                    });

                    // 재구매 버튼 이벤트
                    repurChase();

                    // 리뷰 있는지 없는지 체크
                    checkReview();

                    // 리뷰 있으면 데이터 나옴
                    checkReviewBtn();

                    // 리뷰 없으면 등록창 나옴
                    addReviewButton();

                    // 리뷰 등록버튼 이벤트
                    addReviewBtn();

                    // 리뷰 삭제버튼 이벤트
                    delReviewBtn();

                })
        }

        function maketr(item) {
            let price = makeComma(item.price);
            const newtbody1 =
                `
                <tr>
                    <td></td>
                    <td><a href="bookDetail.do?bookNo=\${item.bookNo}"><img style="width: 120px;" src="images/\${item.img}" alt="#"></a></td>
                    <td style="padding: 0px 0px 0px 80px;">
                        <div><a href="bookDetail.do?bookNo=\${item.bookNo}"><span style="font-size: 18px;">\${item.name}</span></a></div>
                    </td>
                    <td>
                        <div><span style="font-size: 18px;">\${price}&nbsp;&nbsp;원</span></div>
                    </td>
                    <td>
                        <div><span>수량</span><br><span style="font-size: 18px;">\${item.quantity}&nbsp;&nbsp;권</span></div>
                    </td>
                    <td class="startPosition" data-bookno="\${item.bookNo}" data-orderitemno="\${item.orderitemNo}"><button class="btn repurChaseBtn" data-bookno="\${item.bookNo}" style="width: 140px;">재구매</button><br><button class="btn addReview reviewBtn_Y" data-bookno="\${item.bookNo}" data-orderitemno="\${item.orderitemNo}" style="width: 140px;">리뷰쓰기</button>
                        <button class="btn reviewBtn reviewBtn_N" data-state="N" data-bookno="\${item.bookNo}" data-orderitemno="\${item.orderitemNo}" style="display: none; width: 140px;">리뷰확인</button></td>
                </tr>
                <tr class="reviewAdd" hidden>
                    <td></td>
                    <td colspan="4"><textarea maxlength="80" placeholder="리뷰를 입력하세요." class="rvcontent"></textarea></td>
                    <td><button class="btn addReviewBtn" data-bookno="\${item.bookNo}" data-orderitemno="\${item.orderitemNo}" style="width: 140px;">등록</button></td>
                    
                </tr>
                <tr class ="checkrv" hidden>
                    <td colspan="2"><span class="rvdt"></span></td>
                    <td colspan="3"><span class="rvcontents" style="font-size: 16px;"></span></td>
                    <td><a href="#" class="remBtn" data-bookno="\${item.bookNo}" data-orderitemno="\${item.orderitemNo}"><i
						class="ti-trash remove-icon" style="font-size: 20px;"></i></a></td>
                    
                </tr>
                `
            return newtbody1;
        }

        let bookNo1 = 0;
        let orderitemNo1 = 0;

        function delReviewBtn() {
            let remBtns = document.querySelectorAll("#makeList .remBtn");
            remBtns.forEach(remBtn => {
                remBtn.addEventListener("click", function (e) {
                    e.preventDefault();
                    if (confirm("리뷰를 삭제 하시겠습니까?")) {
                        bookNo1 = remBtn.dataset.bookno;
                        orderitemNo1 = remBtn.dataset.orderitemno;
                        console.log(bookNo1, orderitemNo1);
                        fetch("checkReviewNo.do?bookNo1=" + bookNo1 + "&orderitemNo1=" + orderitemNo1 + "&memberNo=" + memberNo1)
                            .then(result => result.json())
                            .then(result => {
                                console.log(result);

                                fetch("removeReview.do?reviewNo=" + result)
                                    .then(str => str.json())
                                    .then(str => {
                                        if (str.retCode == "OK") {
                                            warningAlert("리뷰가 삭제 되었습니다.");
                                            remBtn.closest("tr").hidden = true;
                                            remBtn.closest("tr").previousElementSibling.previousElementSibling.querySelector(".reviewBtn_N").style.display = "none";
                                            remBtn.closest("tr").previousElementSibling.previousElementSibling.querySelector(".reviewBtn_Y").style.display = "inline-block";
                                            // location.reload();
                                        } else if (str.retCode == "NG") {
                                            warningAlert("리뷰 삭제 실패하였습니다.");
                                        }

                                    })

                            })
                    }
                })
            })
        }

        function repurChase() {
            let repurChaseBtns = document.querySelectorAll("#makeList .repurChaseBtn");
            repurChaseBtns.forEach(repurChaseBtn => {
                repurChaseBtn.addEventListener("click", function () {
                    bookNo1 = repurChaseBtn.dataset.bookno;
                    if (confirm("재구매를 하시겠습니까?")) {
                        fetch("addCart.do?memberNo=" + memberNo1 + "&bookNo=" + bookNo1)
                            .then(str => str.json())
                            .then(result => {
                                if (result.retCode == 'NG') {
                                    warningAlert("장바구니에 추가를 하지 못하였습니다.");
                                } else if (result.retCode == 'OK') {
                                    cartOkModal(memberNo1);
                                } else if (result.retCode == 'CK') {
                                    cartCKModal();
                                }
                            })
                    }
                })
            })
        }

        function checkReview() {
            let startPositions = document.querySelectorAll("#makeList .startPosition");
            startPositions.forEach(startPosition => {
                bookNo1 = startPosition.dataset.bookno;
                orderitemNo1 = startPosition.dataset.orderitemno;
                console.log(startPosition.parentNode.nextElementSibling.nextElementSibling.querySelector(".rvcontents"));
                let content = '';
                let reviewdt = '';
                fetch("checkReview.do?bookNo1=" + bookNo1 + "&orderitemNo=" + orderitemNo1 + "&memberNo=" + memberNo1)
                    .then(result => result.json())
                    .then(result => {
                        console.log(result);
                        if (result == null) {
                            console.log("널입니다.");

                        } else {
                            content = result.contents;
                            reviewdt = result.rdt;
                            console.log(content, reviewdt);
                            startPosition.parentNode.nextElementSibling.nextElementSibling.querySelector(".rvdt").innerHTML = reviewdt;
                            startPosition.parentNode.nextElementSibling.nextElementSibling.querySelector(".rvcontents").innerHTML = content;
                            startPosition.querySelector(".reviewBtn_N").style.display = "inline-block";
                            startPosition.querySelector(".reviewBtn_Y").style.display = "none";
                        }
                    })
            })
        }

        function checkReviewBtn() {
            let checkReviewBtns = document.querySelectorAll("#makeList .reviewBtn");
            checkReviewBtns.forEach(checkReviewBtn => {
                checkReviewBtn.addEventListener("click", function (e) {
                    e.preventDefault();
                    console.log(this);
                    let checkrv1 = this.closest("tr").nextElementSibling.nextElementSibling;
                    if (checkrv1.hidden == true) {
                        checkrv1.hidden = false;
                    } else if (checkrv1.hidden == false) {
                        checkrv1.hidden = true;
                    }
                })
            })

        }

        function addReviewButton() {
            let addReviewBtns = document.querySelectorAll("#makeList .addReview");
            addReviewBtns.forEach(addReviewBtn => {
                addReviewBtn.addEventListener("click", function (e) {
                    e.preventDefault();
                    let checkrv1 = this.closest("tr").nextElementSibling;
                    if (checkrv1.hidden == true) {
                        checkrv1.hidden = false;
                    } else if (checkrv1.hidden == false) {
                        checkrv1.hidden = true;
                    }
                })
            })
        }

        function addReviewBtn() {
            let addReviewBtns = document.querySelectorAll("#makeList .addReviewBtn");
            addReviewBtns.forEach(reviewBtn => {
                reviewBtn.addEventListener("click", function (e) {
                    e.preventDefault();
                    console.log(this);
                    bookNo1 = this.dataset.bookno;
                    orderitemNo1 = this.dataset.orderitemno;
                    let contents1 = this.closest("tr").querySelector(".rvcontent").value;
                    if (contents1 != "") {
                        if (confirm("리뷰를 등록하시겠습니까?")) {
                            fetch("addReview.do?contents=" + contents1 + "&memberNo=" + memberNo1 + "&bookNo=" + bookNo1 + "&orderitemNo=" + orderitemNo1)
                                .then(result => result.json())
                                .then(result => {
                                    if (result.retCode == "OK") {
                                        // warningAlert("리뷰가 등록 되었습니다.");
                                        // this.closest("tr").style.display = "none";
                                        // this.closest("tr").previousElementSibling.querySelector(".reviewBtn_Y").style.display = "none";
                                        // this.closest("tr").previousElementSibling.querySelector(".reviewBtn_N").style.display = "inline-block";
                                        alert("등록 성공");
                                        location.reload();
                                    } else {
                                        alert("등록 실패");
                                    }
                                })
                        }
                    } else {
                        alert("등록하실 글을 작성해주세요.");
                    }
                })
            })
        }

    </script>
    <script src="js2/orderDetailList.js"></script>