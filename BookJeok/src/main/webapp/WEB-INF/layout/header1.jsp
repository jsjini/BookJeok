<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<li><i class="login"></i><a data-toggle="modal" data-target="#loginModal" href="login.html#">로그인</a></li>
						<li><i class="join"></i><a data-toggle="modal" data-target="#joinModal" href="join.html#">회원가입</a></li>
						<li><i class="infomem"></i><a href="#">회원안내</a></li>
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
					<a href="index.html"><img src="images/logo.png" alt="logo"></a>
				</div>
				<!--/ End Logo -->
			</div>
			<div class="col-lg-8 col-md-7 col-12">
				<!-- 검색창 -->
				<div class="search-bar-top ">
					<div class="search-bar">
						<form>
							<input name="search" placeholder="도서명을 입력해주세요~" type="search">
							<button class="btnn">
								<i class="ti-search"></i>
							</button>
						</form>
					</div>
				</div>
				<!-- 검색창 끝. -->
			</div>
			<div class="col-lg-2 col-md-3 col-12">
				<div class="right-bar">
					<!-- 오른쪽 아이콘 -->
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
					</div>
					<!-- 오른쪽 아이콘 끝. -->
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 로그인모달 -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">LOGIN</h5>
        </button>
      </div>
      <div class="modal-body">
        <form action="loginbook.do" method="post">
    <table class="table">
      <tbody>
        <tr>
          <th colspan="2">북적북적 회원 로그인 해주세요
          <br> 회원이 아닌 손님은 회원가입을 진행해주세요 :)</th>
          
        </tr>
        <tr>
          <th>아이디</th><td><input type="text" name="id"></td>
        </tr>
        <tr>
          <th>비밀번호</th><td><input type="password" name="pw"></td>
        </tr>
        <tr>
          <td colspan="2" align="center">
            <input type="submit" value="로그인" class="btn btn-primary">
            <input type="reset" value="다시 입력" class="btn btn-warning">
          </td>
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
<div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="joinModallabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">JOIN US!</h5>     
        </button>
      </div>
      <div class="modal-body">
        <form action="memberJoin.do" method="post">
    <table class="table">
      <tbody>
        <tr>
          <th colspan="2">회원가입</th>
        </tr>
        <tr>
          <th>아이디</th><td><input type="text" name="id" id="id"></td>
        </tr>
        <tr>
          <th>이름</th><td><input type="text" name="mName" id="name"></td>
        </tr>
        <tr>
          <th>비밀번호</th><td><input type="password" name="pw" id="pw"></td>
        </tr>
        <tr>
          <th>이메일주소</th><td><input type="text" name="email" placeholder="ex. info@bookjk.com" id="email"></td>
        </tr>
        
        <tr>
          <th>연령대(선택)</th><td><input type="radio" name="userAge" id="userAge" checked>선택안함</td>
          <td><input type="radio" name="userAge" value="20">20대</td>
          <td><input type="radio" name="userAge" value="30">30대</td>
          <td><input type="radio" name="userAge" value="40">40대</td>
          <td><input type="radio" name="userAge" value="50">50대</td>
          <td><input type="radio" name="userAge" value="60">60대 이상</td>      
        </tr>        
        <tr>
          <th>휴대폰번호</th><td><input type="text" name="phone" id="phone" placeholder="ex. 010-1111-1111"></td>
        </tr>
        <tr>
          <th>관심분야(중복가능)</th><td><input type="checkbox" name="likes" id="social">인문/사회</td>
          <td><input type="checkbox" name="likes" value="com">컴퓨터/IT</td>
          <td><input type="checkbox" name="likes" value="science">자연과학/공학</td>
          <td><input type="checkbox" name="likes" value="drama">영화/드라마</td>
          <td><input type="checkbox" name="likes" value="mystery">미스터리/스릴러</td>
          <td><input type="checkbox" name="likes" value="kid">가정/육아</td>
          <td><input type="checkbox" name="likes" value="economy">경제/경영</td>
        </tr>
        <tr>
          <th>SMS알림수신동의</th><td><input type="radio" name="sms" value="yes">동의함</td>
          <td><input type="radio" name="sms"  value="no">동의안함</td>
        </tr>
        <tr>
          <td colspan="3" align="center">
            <input type="submit" value="가입신청" class="btn btn-primary">
            <!-- 가입신청 누르면 회원가입 완료창 하나 더 뜨게. join.jsp -->
            <input type="reset" value="다시 입력" class="btn btn-warning">
          </td>
        </tr>
      </tbody>
    </table>
  </form>  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">회원가입 취소</button>
      </div>
    </div>
  </div>
</div>

