<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="utf-8">    

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
            <input type="reset" value="다시 입력" class="btn btn-warning">
          </td>
        </tr>
      </tbody>
    </table>
  </form>  
 
