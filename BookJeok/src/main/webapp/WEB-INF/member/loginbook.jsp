<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%  String id=(String)session.getAttribute("id");
  	if(id==null || id==""){
		out.println("<script>alert('로그인이 필요한 서비스입니다.');</script>");
	}	 %>
    
<!-- 로그인하면 메인에서 로그아웃보이고 이름보이게 완료. -->
 