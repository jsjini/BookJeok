<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="topbar">
	<div class="container">
		<div class="row">
			<div class="col-lg-5 col-md-12 col-12">
				<!-- Top Left -->
				<div class="top-left">
					<ul class="list-main">
						<li><i class="ti-headphone-alt"></i> +060 (800) 801-582</li>
						<li><i class="ti-email"></i> support@shophub.com</li>
					</ul>
				</div>
				<!--/ End Top Left -->
			</div>
			<div class="col-lg-7 col-md-12 col-12">
				<!-- Top Right -->
				<div class="right-content">
					<ul class="list-main">
						<li><i class="login"></i><a href="login.html#">로그인</a></li>
						<li><i class="join"></i><a href="login.html#">회원가입</a></li>
						<li><i class="infomem"></i><a href="#">회원안내</a></li>
						<li><i class="recentb"></i> <a href="#">최근 본 상품</a></li>
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
				<!-- Logo -->
				<div class="logo">
					<a href="index.html"><img src="images/logo.png" alt="logo"></a>
				</div>
				<!--/ End Logo -->
				<!-- Search Form -->
				<div class="search-top">
					<div class="top-search">
						<a href="#0"><i class="ti-search"></i></a>
					</div>
					<!-- Search Form -->
					<div class="search-top">
						<form class="search-form">
							<input type="text" placeholder="검색 도서를 입력해주세요" name="search">
							<button value="search" type="submit">
								<i class="ti-search"></i>
							</button>
						</form>
					</div>
					<!--/ End Search Form -->
				</div>
				<!--/ End Search Form -->
				<div class="mobile-nav"></div>
			</div>
			<div class="col-lg-8 col-md-7 col-12">
				<div class="search-bar-top">
					<div class="search-bar">
						<select>
							<option selected="selected">전체검색</option>
							<option>제목</option>
							<option>작가</option>
						</select>
						<form>
							<input name="search" placeholder="도서명을 입력해주세요~" type="search">
							<button class="btnn">
								<i class="ti-search"></i>
							</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-2 col-md-3 col-12">
				<div class="right-bar">
					<!-- Search Form -->
					<div class="sinlge-bar">
						<a href="#" class="single-icon"><i class="fa fa-heart-o"
							aria-hidden="true"></i></a>
					</div>
					<div class="sinlge-bar">
						<a href="#" class="single-icon"><i class="fa fa-user-circle-o"
							aria-hidden="true"></i></a>
					</div>
					<div class="sinlge-bar shopping">
						<a href="#" class="single-icon"><i class="ti-bag"></i> <span
							class="total-count">2</span></a>
						<!-- Shopping Item -->
						<div class="shopping-item">
							<div class="dropdown-cart-header">
								<span>2 Items</span> <a href="#">View Cart</a>
							</div>
							<ul class="shopping-list">
								<li><a href="#" class="remove" title="Remove this item"><i
										class="fa fa-remove"></i></a> <a class="cart-img" href="#"><img
										src="https://via.placeholder.com/70x70" alt="#"></a>
									<h4>
										<a href="#">Woman Ring</a>
									</h4>
									<p class="quantity">
										1x - <span class="amount">$99.00</span>
									</p></li>
								<li><a href="#" class="remove" title="Remove this item"><i
										class="fa fa-remove"></i></a> <a class="cart-img" href="#"><img
										src="https://via.placeholder.com/70x70" alt="#"></a>
									<h4>
										<a href="#">Woman Necklace</a>
									</h4>
									<p class="quantity">
										1x - <span class="amount">$35.00</span>
									</p></li>
							</ul>
							<div class="bottom">
								<div class="total">
									<span>Total</span> <span class="total-amount">$134.00</span>
								</div>
								<a href="checkout.html" class="btn animate">Checkout</a>
							</div>
						</div>
						<!--/ End Shopping Item -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- <div class="inki" id="inki">
			<div class="box box-bordered box-collapsed">
				<div class="box-header box-header-small">
					<div class="title">인기검색어</div>
					<div class="actions">
						<span class="box-collapse ui-icon ui-icon-carat-1-s"></span>
					</div>
					<div id="rankings_rolling" class="box-content" rollingid="1705206384925"
						style="width: 120px; height: 30px; position: relative; overflow: hidden;">
						<div id="1705206384925" align="left" style="position: absolute; left: 0px; top: -21px;">
							<div class="item" style="overflow: hidden; width: 120px; height: 30px;">
								<li>
									<span class="rank">
										<em>10</em></span>
									<a href="javascript:goRealTimeKwd('슬램덩크');">슬램덩크</a>
									<span class="new mark">new</span>
								</li>
							</div>
							<div class="item" style="overflow: hidden; width: 120px; height: 30px;">
								<li><span class="rank">
										<em>1</em></span>
									<a href="javascript:goRealTimeKwd('뽀로로 사운드');">뽀로로 사운드</a>
									<span class="arrow-up mark">15</span>
								</li>
							</div>
							<div class="item" style="overflow: hidden; width: 120px; height: 30px;">
								<li><span class="rank">
										<em>2</em></span>
									<a href="javascript:goRealTimeKwd('목민심서');">목민심서</a>
									<span class="new mark">new</span>
								</li>
							</div>
							<div class="item" style="overflow: hidden; width: 120px; height: 30px;">
								<li><span class="rank">
										<em>3</em></span> <a href="javascript:goRealTimeKwd('무라카미 하루키');">무라카미 하루키</a>
									<span class="arrow-up mark">15</span>
								</li>
							</div>
							<div class="item" style="overflow: hidden; width: 120px; height: 30px;">
								<li><span class="rank">
										<em>4</em></span>
									<a href="javascript:goRealTimeKwd('황금종이');">황금종이</a>
									<span class="arrow-up mark">12</span>
								</li>
							</div>
							<div class="item" style="overflow: hidden; width: 120px; height: 30px;">
								<li><span class="rank">
										<em>5</em></span> <a href="javascript:goRealTimeKwd('성경');">성경</a> <span
										class="new mark">new</span>
								</li>
							</div>
							<div class="item" style="overflow: hidden; width: 120px; height: 30px;">
								<li><span class="rank">
										<em>6</em></span> <a href="javascript:goRealTimeKwd('문학동네 세계문학');">문학동네 세계문학</a>
									<span class="new mark">new</span>
								</li>
							</div>
							<div class="item" style="overflow: hidden; width: 120px; height: 30px;">
								<li><span class="rank">
										<em>7</em></span>
									<a href="javascript:goRealTimeKwd('그리스도를 아는 지식');">그리스도를 아는 지식</a>
									<span class="new mark">new</span>
								</li>
							</div>
							<div class="item" style="overflow: hidden; width: 120px; height: 30px;">
								<li><span class="rank">
										<em>8</em></span>
									<a href="javascript:goRealTimeKwd('박경리');">박경리</a>
									<span class="new mark">new</span>
								</li>
							</div>
							<div class="item" style="overflow: hidden; width: 120px; height: 30px;">
								<li><span class="rank">
										<em>9</em></span>
									<a href="javascript:goRealTimeKwd('존 르 카레');">존 르 카레</a>
									<span class="new mark">new</span>
								</li>
							</div>
						</div>
					</div>
				</div>
				<div id="rankings1" class="box-content">
					<ul class="konan-rankings">
						<li><span class="rank">
								<em>1</em></span>
							<a href="javascript:goRealTimeKwd('뽀로로 사운드');">뽀로로 사운드</a>
							<span class="arrow-up">15</span>
						</li>
						<li><span class="rank">
								<em>2</em></span>
							<a href="javascript:goRealTimeKwd('목민심서');">목민심서</a>
							<span class="new">new</span>
						</li>
						<li><span class="rank">
								<em>3</em></span>
							<a href="javascript:goRealTimeKwd('무라카미 하루키');">무라카미 하루키</a>
							<span class="arrow-up">15</span>
						</li>
						<li><span class="rank">
								<em>4</em></span>
							<a href="javascript:goRealTimeKwd('황금종이');">황금종이</a>
							<span class="arrow-up">12</span>
						</li>
						<li><span class="rank">
								<em>5</em></span>
							<a href="javascript:goRealTimeKwd('성경');">성경</a>
							<span class="new">new</span>
						</li>
						<li><span class="rank">
								<em>6</em></span>
							<a href="javascript:goRealTimeKwd('문학동네 세계문학');">문학동네 세계문학</a>
							<span class="new">new</span>
						</li>
						<li><span class="rank"> <em>7</em></span>
							<a href="javascript:goRealTimeKwd('그리스도를 아는 지식');">그리스도를 아는 지식</a>
							<span class="new">new</span>
						</li>
						<li><span class="rank">
								<em>8</em></span> <a href="javascript:goRealTimeKwd('박경리');">박경리</a>
							<span class="new">new</span>
						</li>
						<li><span class="rank">
								<em>9</em></span>
							<a href="javascript:goRealTimeKwd('존 르 카레');">존 르 카레</a>
							<span class="new">new</span>
						</li>
						<li><span class="rank"> <em>10</em></span>
							<a href="javascript:goRealTimeKwd('슬램덩크');">슬램덩크</a>
							<span class="new">new</span>
						</li>
					</ul>
				</div>
			</div>
		</div> -->
