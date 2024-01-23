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

    <div class="shopping-cart section">
        <div class="container">
            <div class="row">
                <div class="col-10 outside1" style="margin: auto;">
                    <table class="table shopping-summery" id="memberNumber" data-memberno="${sessionScope.memberNo}">
                        <tbody id="makeList" style="text-align: center;">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        let memberNo1 = document.querySelector('#memberNumber').dataset.memberno;

        console.log(memberNo1);
        var details = ${ orderDetail3 };
        console.log(details);


        showOrderDetailList();


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
            const newtbody1 =
                `
                <tr>
                    
                    <td><a href="bookDetail.do?bookNo=\${item.bookNo}"><img src="images/\${item.img}" alt="#"></a></td>
                    <td style="padding: 0px 0px 0px 80px;">
                        <div><a href="bookDetail.do?bookNo=\${item.bookNo}"><span>\${item.name}</span></a></div>
                    </td>
                    <td>
                        <div><span>\${item.price}&nbsp;&nbsp;원</span></div>
                    </td>
                    <td>
                        <div><span>주문수량 : </span><span>\${item.quantity}&nbsp;&nbsp;권</span></div>
                    </td>
                    <td class="startPosition" data-bookno="\${item.bookNo}" data-orderitemno="\${item.orderitemNo}"><button class="repurChaseBtn" data-bookno="\${item.bookNo}">재구매</button><br><button class="addReview reviewBtn_Y" data-bookno="\${item.bookNo}" data-orderitemno="\${item.orderitemNo}">리뷰쓰기</button>
                        <button class="reviewBtn reviewBtn_N" data-state="N" data-bookno="\${item.bookNo}" data-orderitemno="\${item.orderitemNo}" style="display: none;">리뷰확인</button></td>
                </tr>
                <tr class="reviewAdd" style="display: none;">
                    <td><input type="textarea" class="rvcontent"></td>
                    <td><button class="btn addReviewBtn" data-bookno="\${item.bookNo}" data-orderitemno="\${item.orderitemNo}">등록</button></td>
                    
                </tr>
                <tr class ="checkrv" style="display: none;">
                    <td><span class="rvdt"></span></td>
                    <td><span class="rvcontents"></span></td>
                    <td><a href="#" class="remBtn" data-bookno="\${item.bookNo}" data-orderitemno="\${item.orderitemNo}"><i
						class="ti-trash remove-icon"></i></a></td>
                    
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
                                            remBtn.closest("tr").style.display = "none";
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
                    if (checkrv1.style.display == "none") {
                        checkrv1.style.display = "inline-block";
                    } else if (checkrv1.style.display == "inline-block") {
                        checkrv1.style.display = "none";
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
                    if (checkrv1.style.display == "none") {
                        checkrv1.style.display = "inline-block";
                    } else if (checkrv1.style.display == "inline-block") {
                        checkrv1.style.display = "none";
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