<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div class="topbar">
			<div class="container">
				<div class="row">
					<div class="col-lg-5 col-md-12 col-12">
						<!--  -->
					</div>
					<div class="col-lg-7 col-md-12 col-12">
						<!-- Top Right (우측상단 메뉴)-->
						<div class="right-content">
						
							<ul class="list-main">
								<c:choose>
									<c:when test="${empty logId }">
										<li>! 로그인해주세요 →
										<li>
									</c:when>
									<c:otherwise>
										<li>${logName }님, 좋은 하루 되세요:)
										<li>
									</c:otherwise>
								</c:choose>


						<c:choose>
							<c:when test="${empty logId }">
								<li><a class="login" data-toggle="modal"
									data-target="#loginModal" href="#">로그인</a>
								<li>
								<li><a class="join" data-toggle="modal"
									data-target="#joinModal" href="#">회원가입</a>
								<li>
							</c:when>
							<c:otherwise>
								<li><a class="logout" href="logout.do">로그아웃</a>
								<li>
							</c:otherwise>
						</c:choose>
						<li><i class="infomem"></i><a href="orderList.do">주문내역</a></li>
					</ul>
				</div>
				<!-- End Top Right -->
			</div>
		</div>
	</div>
</div>
<!-- End Topbar -->
<div class="middle-inner">
	<div class="container">
		<div class="row">
			<div class="col-lg-2 col-md-2 col-12">
				<!-- Logo(로고) -->
				<div class="logo">
					<a href="main.do"><img src="images/logo.png" alt="logo"></a>
				</div>
				<!--/ End Logo -->
			</div>
			<div class="col-lg-8 col-md-7 col-12">
				<!-- 검색창 -->
				<div class="search-bar-top ">
					<div class="search-bar">
						<form action="searchList.do" method="get" id="searchForm">
							<input name="search" placeholder="도서명을 입력해주세요~" type="search">
							<button class="btnn">
								<i class="ti-search"></i>
							</button>
						</form>
					</div>
					<div class="search-popular pt-3">
						<span>인기검색어 : </span>
					</div>
				</div>
				<!-- 검색창 끝. -->
			</div>
			<div class="col-lg-2 col-md-3 col-12">
				<div class="right-bar">
					<!-- 오른쪽 아이콘 -->
					<!-- 내서재 아이콘 -->
					<c:choose>
						<c:when test="${empty logId }">
							<div class="sinlge-bar">
								<a href="main.do" class="single-icon"><i
									class="fa fa-heart-o" aria-hidden="true"></i></a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="sinlge-bar">
								<a href="likeIt.do?memberNo=${memberNo }" class="single-icon"><i
									class="fa fa-heart-o" aria-hidden="true"></i></a>
							</div>
						</c:otherwise>
					</c:choose>
					<!-- 마이페이지 아이콘 -->
					<div class="sinlge-bar">
						<a href="likeIt.do?memberNo=1" class="single-icon"><i
							class="fa fa-user-circle-o" aria-hidden="true"></i></a>
					</div>
					<!-- 장바구니 아이콘 -->
					<c:choose>
						<c:when test="${empty logId }">
							<div class="sinlge-bar shopping">
								<a href="main.do" class="single-icon"><i class="ti-bag"></i>
									<span class="total-count">2</span></a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="sinlge-bar shopping">
								<a href="cartList.do?memberNo=${memberNo }" class="single-icon"><i
									class="ti-bag"></i> <span class="total-count">2</span></a>
							</div>
						</c:otherwise>
					</c:choose>
					<!-- 오른쪽 아이콘 끝. -->
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 로그인모달 -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
	aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">LOGIN</h5>
			</div>
			<div class="modal-body">
				<form action="loginbook.do" method="post">
					<table class="table">
						<tbody>
							<tr>
								<th colspan="2">북적북적 회원 로그인 해주세요 <br> 회원이 아닌 손님은 회원가입을
									진행해주세요 :)
								</th>

							</tr>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="id" required /></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="pw" required /></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="submit"
									value="로그인" class="btn btn-primary"> <input
									type="reset" value="다시 입력" class="btn btn-warning"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


		<!-- 회원가입모달 -->
		<div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="joinModallabel"
			aria-hidden="true">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">JOIN US!</h5>
					</div>
					<div class="modal-body">
						<form action="memberJoin.do" method="post" name="joinjoin">
							<table class="table">
								<tbody>
									<tr>
										<th colspan="2" id="joinjoin">회원가입</th>
									</tr>
									<tr>
										<th>아이디</th>
										<td><input type="text" name="id" id="id">
											<input type="button" id="confirmId" class="checkSome" value="중복 확인">
										</td>
									</tr>
									<tr>
										<th>이름</th>
										<td><input type="text" name="mName" id="name" required /></td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><input type="password" name="pw" id="pw" required /></td>
									</tr>
									<tr>
										<th>이메일주소</th>
										<td><input type="text" name="email" placeholder="ex. info@bookjk.com" id="email" required /></td>
									</tr>
									<tr>
										<th>연령대(선택)</th>
										<td><input type="radio" name="userAge" id="userAge" checked>선택안함</td>
										<td><input type="radio" name="userAge" value="10">10대</td>
										<td><input type="radio" name="userAge" value="20">20대</td>
										<td><input type="radio" name="userAge" value="30">30대</td>
										<td><input type="radio" name="userAge" value="40">40대</td>
										<td><input type="radio" name="userAge" value="50">50대</td>
										<td><input type="radio" name="userAge" value="60">60대
											이상</td>
									</tr>
									<tr>
										<th>휴대폰번호</th>
										<td><input type="text" name="phone" id="phone" placeholder="ex. 010-1111-1111" required /></td>
									</tr>
									<tr>
										<th required />관심분야(중복가능)</th>
										<td><input type="checkbox" name="likes" id="social">없음</td>
										<td><input type="checkbox" name="likes" id="social">인문/사회</td>
										<td><input type="checkbox" name="likes" value="com">컴퓨터/IT</td>
										<td><input type="checkbox" name="likes" value="science">자연과학/공학</td>
										<td><input type="checkbox" name="likes" value="drama">영화/드라마</td>
										<td><input type="checkbox" name="likes" value="mystery">미스터리/스릴러</td>
										<td><input type="checkbox" name="likes" value="kid">가정/육아</td>
										<td><input type="checkbox" name="likes" value="economy">경제/경영</td>
									</tr>
									<tr>
										<th>SMS알림수신동의</th>
										<td><input type="radio" name="sms" value="yes" checked>동의함</td>
										<td><input type="radio" name="sms" value="no">동의안함</td>
									</tr>
									<tr>
										<td colspan="3" align="center"><input type="submit" value="가입신청" class="btn btn-primary"
												id="joinsucc" onClick="return check()"> 
												<!-- 가입신청 누르면 회원가입 완료창 하나 더 뜨게. join.jsp -->
											<input type="reset" value="다시 입력" class="btn btn-warning">
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">회원가입취소</button>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>


		<!-- 회원가입 후 가입 완료 알림창. 가입 완료되고 메인이 다시 뜰 때 모달 알리기-->
		<div class="modal fade" id="joinendModal" tabindex="-1" role="dialog"
	aria-labelledby="joinendModallabel" aria-hidden="true">
	<div class="modal-dialog .modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
			</div>
			<div class="modal-body">
			<p>회원이 되신 걸 환영합니다. 로그인 해주세요.</p>
			</div>		
		</div>
	</div>
</div>

<div></div>


<!-- 검색창 관련 JS -->
<script>
	const searchInput = document.querySelector('input[type=search]');

	document.querySelector('#searchForm').addEventListener('submit',
			function(e) {
				if (searchInput.value == '') {
					alert('검색어를 입력해주세요');
					e.preventDefault();
				}
			})
</script>

<!-- 빈칸이 있으면 칸 먼저 채우고 가입신청 누르면 가입완료 alert 뜨게 -->
<script>
	/* if(#joinsucc){
		document.querySelector('#joinsucc').addEventListener("click", function(){
			alert("가입이 완료되었습니다. 로그인해주세요");
		})
		
	} */

	/*$('#joinsucc').on('click', function () {
		alert("가입이 완료되었습니다. 로그인해주세요");
	}) */

	/*
	$('#joinmodal').$('#joinsucc').on("click",function(){
		alert("가입이 완료되었습니다. 로그인해주세요");
	})
	 */

	if (joinjoin.id.value == "") {
		alert("사용하실 아이디를 입력해주세요");
		joinjoin.id.focus();
		return false;
	}

	if (joinjoin.mName.value == "") {
		alert("이름을 입력해주세요");
		joinjoin.mName.focus();
		return false;
	}

	if (joinjoin.password.value.length == 0) {
		alert("사용하실 비밀번호를 입력해주세요");
		joinjoin.password.focus();
		return false;
	}

	if (joinjoin.email.value == "") {
		alert("사용하고 계신 이메일을 입력해주세요");
		joinjoin.email.focus();
		return false;
	}

	if (joinjoin.phone.value == "") {
		alert("사용하고 계신 이메일을 입력해주세요");
		joinjoin.phone.focus();
		return false;
	}


			/*
			if(joinjoin.id.value == ""){ 
				alert("사용하실 아이디를 입력해주세요");
				joinjoin.id.focus();
				return false;
			}
			
			if(joinjoin.mName.value == ""){ 
				alert("이름을 입력해주세요");
				joinjoin.mName.focus();
				return false;
			}
			
			if(joinjoin.password.value.length == 0){
				alert("사용하실 비밀번호를 입력해주세요");
				joinjoin.password.focus();
				return false;
			}
			
			if(joinjoin.email.value == ""){ 
				alert("사용하고 계신 이메일을 입력해주세요");
				joinjoin.email.focus();
				return false;
			}
			
			if(joinjoin.phone.value == ""){ 
				alert("사용하고 계신 이메일을 입력해주세요");
				joinjoin.phone.focus(); 
				return false;
			}
			*/
			
						
			let msg = '${param.msg}'
				if(msg != '')
					$('#joinendModal').modal()
							
			/*
			let msg2 = '${message }'
				if (msg2 === 1){
					console.log("1통과");
				} else if (msg === 0) */
					
			document.addEventListener("DOMContentLoaded",function(){
				let msg2 = 0;
			            if(msg === ''){
			                console.log("main.do")
			            }else if (msg === 0){
			                alert('${message }')
			            }else{
			                console.log("main.do")
			            }
			        });		
					
					
		
		</script>

