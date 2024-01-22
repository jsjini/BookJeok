<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:if test="${message != null }">
			<p>${message }</p>
		</c:if>

		<!-- 로그인모달 -->
		<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel"
			aria-hidden="true">
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
										<td colspan="2" align="center"><input type="submit" value="로그인" class="btn btn-primary"> <input
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

		<script>
		window.onload = function () {
			document.querySelector('body').classList.add("modal-open");
		}
		</script>