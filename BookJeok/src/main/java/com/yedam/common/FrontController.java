package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.yedam.book.command.BookBestListControl;
import com.yedam.book.command.BookGenreListControl;
import com.yedam.book.command.BookDetailControl;
import com.yedam.search.command.SearchKeywordControl;
import com.yedam.search.command.SearchListControl;
import com.yedam.book.command.BookListControl;
import com.yedam.book.command.BookNewListControl;
import com.yedam.cart.command.CartListControl;
import com.yedam.cart.command.CartListJson;
import com.yedam.cart.command.RemoveCartControl;

import com.yedam.member.command.JoinControl;
import com.yedam.member.command.MemberJoinControl;
import com.yedam.search.command.SearchListControl;


// 컨트롤러 : url -> 서블릿 실행을 정해주는 역할
//@WebServlet("*.do")
public class FrontController extends HttpServlet {
	// 톰캣에서 정한 규칙
	// 생명주기 : 생성자 -> init() -> service() -> destroy()
	
	Map<String, Control> map;

	public FrontController() {
		System.out.println("생성자 호출");
		map = new HashMap<String, Control>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 호출");
		// 메인페이지
		map.put("/main.do", new MainControl());
		
		// 도서 관련
		map.put("/bookList.do", new BookListControl()); // 도서 목록조회
		
		map.put("/bookBestList.do", new BookBestListControl()); //도서 베스트셀러 조회
		
		map.put("/bookNewList.do", new BookNewListControl()); //도서 베스트셀러 조회
		
		map.put("/bookGenreList.do", new BookGenreListControl()); //도서 베스트셀러 조회
		
		//map.put("/bookData.do", new BookDataContol()); // API도서 저장
		
		// 목록 관련
		
		//상세페이지
		map.put("/bookDetail.do", new BookDetailControl()); // 도서 상세페이지

		// 회원 관련
		map.put("/memberJoin.do", new MemberJoinControl()); //회원가입
		map.put("/Join.do", new JoinControl()); //회원등록처리
		//map.put("/loginBook.do", new LoginBookControl()); //로그인화면
		
		// 주문 관련

		// 장바구니
		map.put("/cartList.do", new CartListControl());
		map.put("/cartListJson.do", new CartListJson());
		map.put("/removeCart.do", new RemoveCartControl());

		
		// 검색 관련
		map.put("/searchList.do", new SearchListControl()); // 검색결과목록
		map.put("/searchKeyword.do", new SearchKeywordControl()); // 인기검색어

	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 요청정보에 한글 인코딩
		
		System.out.println("service() 호출");
		String url = req.getRequestURI(); // URL에서 서버정보 빼고, /프로젝트명/main.do
		String context = req.getContextPath(); // /프로젝트명
		String page = url.substring(context.length()); // /main.do, context.length()+1 ->main.do
		System.out.println(page);
		
		Control ctrl = map.get(page);
		ctrl.execute(req, resp);
	}

	@Override
	public void destroy() {
		System.out.println("destroy() 호출");
	}

}
