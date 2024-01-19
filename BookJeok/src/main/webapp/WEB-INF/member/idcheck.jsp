<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%  String id=(String)session.getAttribute("id");
  	if(id==null || id==""){
		out.println("<script>alert('아이디 또는 비밀번호를 확인해주세요!');</script>");
	}	 %>

<!-- 아이디나 비밀번호 틀리면 확인하라는 문구도 떠야함 -->
 <form action="main.do" method="post">
    <table class="table">
      <tbody>
        <tr>
          <th colspan="2">아이디 또는 비밀번호를 확인해주세요.
          <br> 회원이 아닌 손님은 회원가입을 진행해주세요 :)</th>         
        </tr>
        <tr>
          <th>아이디</th><td><input type="text" name="id" required/></td>
        </tr>
        <tr>
          <th>비밀번호</th><td><input type="password" name="pw" required/></td>
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