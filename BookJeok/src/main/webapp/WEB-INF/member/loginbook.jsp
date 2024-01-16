<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 로그인하면 메인에서 로그아웃보이고 OOO님, 환영합니다 뜨게 -->
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