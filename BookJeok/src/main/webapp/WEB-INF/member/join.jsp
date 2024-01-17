<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  
  <%
    String msg = (String) request.getAttribute("message");
  %>
  
  <% if (msg != null) { %>
  <p><%=msg %></p>
  <% } %>
  
<html>
<head>
<meta charset="UTF-8">
<title>가입완료</title>
</head>
<body>
<!-- 환영합니다 뜨면서 alert으로 알리고 닫으면 메인 보이게 해보기-->


<script>
alert("<%=msg %>")
</script>
  ${msg }
<p>회원이 되신 걸 환영합니다. 로그인 해주세요.</p>

</body>
</html>