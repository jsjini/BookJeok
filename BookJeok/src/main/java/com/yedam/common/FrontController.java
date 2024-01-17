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
import com.yedam.book.command.BookDetailControl;
import com.yedam.book.command.BookGenreListControl;
import com.yedam.book.command.BookListControl;
import com.yedam.book.command.BookNewListControl;
import com.yedam.cart.command.AddCartControl;
import com.yedam.cart.command.CartListControl;
import com.yedam.cart.command.CartListJson;
import com.yedam.cart.command.ModifyCartControl;
import com.yedam.cart.command.RemoveCartControl;
import com.yedam.member.command.JoinControl;
import com.yedam.member.command.LoginBookControl;
import com.yedam.member.command.LogoutBookControl;
import com.yedam.member.command.MemberJoinResultControl;
import com.yedam.orderItem.command.OrderItemListControl;
import com.yedam.orderItem.command.OrderItemListJson;
import com.yedam.orderItem.command.RemoveOrderItemControl;
import com.yedam.review.command.ReviewControl;
import com.yedam.search.command.SearchKeywordControl;
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
		map.put("/review.do", new ReviewControl()); // 리뷰

		// 회원 관련
		map.put("/memberJoin.do", new JoinControl()); //회원가입, 회원등록처리
		map.put("/Joinresult.do", new MemberJoinResultControl()); //가입완료페이지
		map.put("/loginbook.do", new LoginBookControl()); //로그인화면
		map.put("/logout.do", new LogoutBookControl());//로그아웃
		//마이페이지
		
		// 장바구니
		map.put("/cartList.do", new CartListControl());
		map.put("/cartListJson.do", new CartListJson());
		map.put("/removeCart.do", new RemoveCartControl());
		map.put("/modifyCart.do", new ModifyCartControl());
		map.put("/addCart.do", new AddCartControl());

		// 주문 관련
		map.put("/orderItemList.do", new OrderItemListControl());
		map.put("/orderItemListJson.do", new OrderItemListJson());
		map.put("/remveOrderItem.do", new RemoveOrderItemControl());
		
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
