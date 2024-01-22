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
                <div class="col-9 outside1" style="margin: auto;">
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

                    addReviewBtn();
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
                    <td><button>재구매</button><br><button class="addReview reviewBtn_Y" data-bookno="\${item.bookNo}" data-orderitemno="\${item.orderitemNo}">리뷰쓰기</button>
                        <button class="reviewBtn reviewBtn_N" data-state="N" style="display: none;">리뷰확인</button></td>
                </tr>
                <tr class="reviewAdd" style="display: none;">
                    <td><input type="textarea"></td>
                    <td><button>등록</button></td>
                    
                </tr>
                <tr class ="checkrv" style="display: none;">
                    <td><span id="rvdt"></span></td>
                    <td><span id="rvcontents"></span></td>
                    <td><a href="#" class="remBtn"><i
						class="ti-trash remove-icon"></i></a></td>
                    
                </tr>
                `
            return newtbody1;
        }

        let bookNo1 = 0;
        let orderitemNo1 = 0;

        function addReviewBtn() {
            let addReviewBtns = document.querySelectorAll("#makeList .addReview");
            console.log(addReviewBtns);
            addReviewBtns.forEach(reviewBtn => {
                let reviewBtnY = reviewBtn;
                let reviewBtnN = reviewBtn.parentNode.querySelector(".reviewBtn_N");
                let reviewAdd1 = reviewBtn.closest("tr").nextElementSibling;
                let checkrv1 = reviewBtn.closest("tr").nextElementSibling.nextElementSibling;

                bookNo1 = reviewBtn.dataset.bookno;
                orderitemNo1 = reviewBtn.dataset.orderitemno;
                console.log(bookNo1, orderitemNo1, memberNo1);
                let content = '';
                let reviewdt = '';

                fetch("checkReview.do?bookNo1=" + bookNo1 + "&orderitemNo=" + orderitemNo1 + "&memberNo=" + memberNo1)
                    .then(result => result.json())
                    .then(result => {
                        if (result == null) {
                            console.log("널입니다.");

                        } else {
                            console.log(result);
                            document.querySelector(".reviewBtn_N").style.display = "inline-block";
                            document.querySelector(".reviewBtn_Y").style.display = "none";
                            content = result.contents;
                            reviewdt = result.rdt;
                        }
                        console.log(content, reviewdt);
                        let reviewDate = reviewdt.split(" ")[0];
                        checkrv1.querySelector("#rvdt").innerText = reviewDate;
                        checkrv1.querySelector("#rvcontents").innerText = content;

                    })
                reviewBtnY.addEventListener("click", function (e) {
                    e.preventDefault();
                    console.log("리뷰쓰기클릭되었습니다");
                    if (reviewAdd1.style.display == "none") {
                        reviewAdd1.style.display = "inline-block";
                    } else if (reviewAdd1.style.display == "inline-block") {
                        reviewAdd1.style.display = "none";
                    }
                })
                reviewBtnN.addEventListener("click", function (e) {
                    e.preventDefault();
                    console.log("리뷰확인클릭되었습니다");
                    if (checkrv1.style.display == "none") {
                        checkrv1.style.display = "inline-block";
                    } else if (checkrv1.style.display == "inline-block") {
                        checkrv1.style.display = "none";
                    }
                })
            })
        }


    </script>
    <script src="js2/orderDetailList.js"></script>