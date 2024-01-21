<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="header-inner">
	<div class="container">
		<div class="cat-nav-head">
			<div class="row">
				<div class="col-lg-3">
					
				</div>
				<div class="col-lg-9 col-12">
					<div class="menu-area">
						<!-- Main Menu -->
						
						<!--  베스트셀러/ 신간도서 링크 걸어놓음(genreList는 아직 화면 안보임) -->
						
						<nav class="navbar navbar-expand-lg">
							<div class="navbar-collapse">
								<div class="nav-inner">
									<ul class="nav main-menu menu navbar-nav">
										<li class="active"><a href="#">Home</a></li>
										<li><a href="bookBestList.do#">베스트셀러</a></li>
										<li><a href="bookNewList.do">신간도서</a></li>
										<li>
											<a href="bookGenreList.do">분야별 인기 서적</a>
											<ul class="dropdown">
												<li><a href="bookGenreList.do?categories=소설">소설</a></li>
												<li><a href="bookGenreList.do?categories=시&categories=에세이">시/에세이</a></li>
												<li><a href="bookGenreList.do?categories=인문&categories=교양">인문/교양</a></li>
												<li><a href="bookGenreList.do?categories=사회&categories=정치">사회/정치</a></li>
												<li><a href="bookGenreList.do?categories=자연과학&categories=공학">자연과학/공학</a></li>
												<li><a href="bookGenreList.do?categories=가정">가정</a></li>
												<li><a href="bookGenreList.do?categories=유아&categories=어린이">유아/어린이</a></li>
												<li><a href="bookGenreList.do?categories=컴퓨터&categories=IT">컴퓨터/IT</a></li>
												<li><a href="bookGenreList.do?categories=외국어">외국어</a></li>
											</ul>
										</li>
										<li><a href="mypage.do">마이페이지<i class="mypage"></i></a>
											<ul class="dropdown">
												<li><a href="likeIt.do?memberNo=${memberNo }">내 서재</a></li>
												<li><a href="cartList.do?memberNo=${memberNo }">주문내역</a></li>
											</ul>
										</li>
									</ul>
								</div>
							</div>
						</nav>
						<!--/ End Main Menu -->
					</div>
				</div>
			</div>
		</div>

	</div>
</div>

