<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container mt-5">
  <div class="row">
    <div class="col">
    	<div class="section-title">
			<h2>검색결과</h2>
		</div>
    </div>
  </div>
  <c:forEach var="vo" items="${resultVO }">
	  <div class="row my-5">
	    <div class="col-10">
	    	<div class="thumb col-6 float-left">
					<a href="bookDetail.do?bookNo=${vo.bookNo }"><img src="images/${vo.img }"></a>
			</div>
			<ul class="col-4 float-left list-group list-group-flush">
				<li class="list-group-item"><a href="bookDetail.do?bookNo=${vo.bookNo }"><h5>${vo.name }</h5></a></li>
				<li class="list-group-item">${vo.category }</li>
				<li class="list-group-item">${vo.author } 저 | ${vo.comp } | ${vo.dt }</li>
				<li class="list-group-item">${vo.price }원</li>
			</ul>
	    </div>
	    <div class="col-2">
	    	<div class="btn-group-vertical float-right">
		    	<button type="button" class="btn my-1"><a href="#">바로구매</a></button>
				<button type="button" class="btn my-1" >
				<h1></h1>
				<c:choose>
					<c:when test="${empty logId }">
						<a href="loginbook.do">장바구니</a>
					</c:when>
					<c:otherwise>
						<a href="addCart.do?bookNo=${vo.bookNo }&memberNo=${memberNo }">장바구니</a>
					</c:otherwise>				
				</c:choose>
				</button>
				<button type="button" class="btn my-1"><a href="#">내 서재</a></button>
	    	</div>
	    	
	    </div>
	  </div>
  </c:forEach>
  
</div>

<script>

</script>