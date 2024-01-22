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

                        <!-- <thead> -->
                        <!-- <tr class="main-hading">
								<th colspan="2">도서명</th>
								<th class="text-center">도서금액</th>
								<th class="text-center">수량</th>
								<th class="text-center">합계</th>
							</tr> -->
                        <!-- </thead> -->
                        <tbody id="makeList" style="text-align: center;">

                        </tbody>
                    </table>
                    <!-- Shopping Summery -->
                    <!-- <table id="memberNumber" data-memberno="${sessionScope.memberNo}">
                        <colgroup>
							<col style="width: 90px;">
							<col style="width: auto;">
						</colgroup>
                        <tbody id="orderDetailList">
                            <div id="makeList">
                                <td></td>
                            </div>
                        </tbody>
                    </table> -->
                    <!--/ End Shopping Summery -->
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

        function showOrderDetailList() {
            fetch("orderDetailListJson.do?odNo=" + details.odNo)
                .then(result => result.json())
                .then(result => {
                    result.forEach(item => {
                        const newtbody = maketr(item);
                        makeList.insertAdjacentHTML("afterbegin", newtbody);
                    });
                })

        }

        function maketr(item) {
            const newtbody1 =
                `
                <tr>
                    <td></td>
                    <th><a href="bookDetail.do?bookNo=\${item.bookNo}"><img src="images/\${item.img}" alt="#"></a></th>
                    <td style="padding: 0px 0px 0px 80px;">
                        <div><a href="bookDetail.do?bookNo=\${item.bookNo}"><span>\${item.name}</span></a></div>
                    </td>
                    <td>
                        <div><span>\${item.price}&nbsp;&nbsp;원</span></div>
                    </td>
                    <td>
                        <div><span>주문수량 : </span><span>\${item.quantity}&nbsp;&nbsp;권</span></div>
                    </td>
                    <td><button>재구매</button></td>
                </tr>
                `
            return newtbody1;
        }
        // <tr>
        //             <td><div style="padding: 7px 7px 0px 7px; font-size: 17px;"><a href="orderItemPageList.do?memberNo=\${memberNo1}" class="orderDetail">
        //                 <span style="color: rgb(3, 202, 136);">재구매></span></a></div></td>
        //         </tr> 

    </script>