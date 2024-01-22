<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 내 정보 기본값으로 보이고 문의내역, 내 서재, 주문 내역-->

<style>
   #container {
      word-wrap: break-word;
      overflow: hidden;
      text-overflow: ellipsis;
      position: relative; 
    }

    .info a {
      display: block;
      padding: 10px; 
      background-color: #00ca5d ;
      color: white;
      border: 1px solid #ddd; 
      border-radius: 5px; 
    }
    
    .qna a {
      display: block;
      padding: 10px; 
      background-color: #009e49 ;
      color: white;
      border: 1px solid #ddd; 
      border-radius: 5px; 
    }
    
    .zzim a {
      display: block;
      padding: 10px; 
      background-color: #006a31 ;
      color: white;
      border: 1px solid #ddd; 
      border-radius: 5px; 
    }
    
    .orderlist a {
      display: block;
      padding: 10px; 
      background-color: #002f16 ;
      color: white;
      border: 1px solid #ddd; 
      border-radius: 5px; 
    }
    
    table{
	border-collapse: separate;
	border-spacing: 10px 10px;
    }
    
  </style>

<div class="container">
  <div class="row mt-4">
    <div class="col-md-12 mb-3 info">
      <a href="#"><h5>내 정보</h5></a>
      <hr>
<form>
<table>

<tr>
	<td><h6>회원번호 : ${vo.memberNo}</h6></td>
</tr>
<tr>
	<td><h6>아이디 : ${vo.id}</h6></td>
</tr>
<tr>
	<td><h6>이름 : ${vo.getMName()}</h6></td>
</tr>
<tr>
	<td><h6>이메일 : ${vo.email}</h6></td>
</tr>
<tr>
	<td><h6>연락처 : ${vo.phone}</h6></td>
</tr>
<tr>
	<td><h6>관심분야 : ${vo.likes}</h6></td>
</tr>
<tr>
	<td><h6>나의 포인트 : ${vo.point}</h6></td>
</tr>


</table>

</form>
    </div>
  </div>

  <div class="row mt-4">
    <div class="col-md-12 mb-3 qna">
      <a href="#"><h5>나의 리뷰 보기</h5></a>
      <hr>
    </div>
  </div>

  <div class="row mt-4">
    <div class="col-md-12 mb-3 zzim">
      <a href="likeIt.do?memberNo=${memberNo }"><h5>내 서재</h5></a>
      <hr>
    </div>
  </div>

  <div class="row mt-4">
    <div class="col-md-12 mb-3 orderlist">
      <a href="cartList.do?memberNo=${memberNo }"><h5>주문내역</h5></a>
      <hr>
    </div>
  </div>
</div>



<c:if test="${not empty member}">
        <p>회원번호: ${member.memberNo}</p>
        <p>아이디: ${member.id}</p>
        <p>이름: ${member.mName}</p>
        <p>이메일: ${member.email}</p>
        <p>연락처: ${member.phone}</p>
        <p>관심분야: ${member.likes}</p>
        <p>포인트: ${member.point}</p>             
</c:if>
    
<script>

/*
function MyInfo() {
    fetch(`/members/${memberNo}`)
      .then(response => response.json())
      .then(data => {
        document.querySelector()
      })
      .catch(error => console.error('Error:', error));
  }
  */
  
  /*
  function MyInfo(){
	  location.href = ""
  }
  */

</script>
