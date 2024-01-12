package com.yedam.common;
// 컨트롤러 역할 : url 요청에 따른 실행 서블릿을 매칭 시켜주는 서블릿.

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.board.command.AddBoardControl;
import com.yedam.board.command.BoardFormControl;
import com.yedam.board.command.BoardListControl;
import com.yedam.board.command.GetBoardControl;
import com.yedam.board.command.ModifyBoardControl;
import com.yedam.board.command.ModifyFormControl;
import com.yedam.board.command.RemoveBoardControl;
import com.yedam.board.command.RemoveFormControl;
import com.yedam.member.command.GetMemberControl;
import com.yedam.member.command.LoginControl;
import com.yedam.member.command.LoginFormControl;
import com.yedam.member.command.LogoutControl;
import com.yedam.member.command.MemberAddJson;
import com.yedam.member.command.MemberDelJson;
import com.yedam.member.command.MemberListAjax;
import com.yedam.member.command.MemberListControl;
import com.yedam.member.command.MemberListJson;
import com.yedam.member.command.ReplyCountJson;
import com.yedam.reply.command.AddReplyJson;
import com.yedam.reply.command.ChartForm;
import com.yedam.reply.command.DelReplyJson;
import com.yedam.reply.command.MapForm;
import com.yedam.reply.command.PagingListJson;
import com.yedam.reply.command.ReplyListJson;
import com.yedam.student.command.StudInfoCont;
import com.yedam.student.command.StudentListCon;

// @webServlet("*.do")

public class FrontController extends HttpServlet {
//생명주기 : 프로그램이 실행됐다가 사라지는것. 톰캣이 정함.
	// : 생성자 -> init() -> service() -> destroy() ( () << 메소드라는 의미)

	Map<String, Control> map; // <키(url) ,value(서블릿)>

	public FrontController() {
		System.out.println("생성자 호출");
		map = new HashMap<String, Control>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 호출");
//		map.put("/main.do", new MainControl()); // 메인쩜두가 들어오면 메인 컨트롤러 실행
//		map.put("/sub.do", new SubControl()); // 서브쩜두가 들어오면 서브 컨트롤 실행

		// 게시판 관련
		map.put("/boardList.do", new BoardListControl());
		map.put("/boardForm.do", new BoardFormControl());
		map.put("/addBoard.do", new AddBoardControl());
		map.put("/getBoard.do", new GetBoardControl());
		map.put("/modifyForm.do", new ModifyFormControl());
		map.put("/modifyBoard.do", new ModifyBoardControl());
		map.put("/removeForm.do", new RemoveFormControl());
		map.put("/removeBoard.do", new RemoveBoardControl());

// url 패턴 - 컨트롤 - jsp
//boardList.do -> BoardListControl -> boardList.jsp
//boardForm.do -> BoardFormControl -> addBoardForm.jsp //등록하는 화면을 열어주는 것.
//addBoard.do -> AddBoardControl -> resp.sendRedirect();boardList.jsp
//getBoard.do(프론트컨트롤에 등록) -> GetBoardControl(글번호 하나 읽어와서 내용 조회) -> getBoard.jsp(읽어온 글을 여기로 전달하고 페이지 재지정)
//수정
//modifyForm.do -> ModifyFormControl(데이터를 가져옴) -> modBoardForm.jsp(화면을 보여줌)
//modifyBoard.do ->ModifyBoardControl ->resp.sendRedirect(); (수정 내용을 저장해줌)
		//읽어올 파라메타 : 글 번호, 글 내용
//삭제
//removeForm.do -> removeFormControl(데이터를 가져옴) -> remBoardForm.jsp(화면을 보여줌)
//removeBoard.do ->removeBoardControl ->resp.sendRedirect();
		
		
		
		//회원관련
		map.put("/loginForm.do", new LoginFormControl());
		map.put("/login.do", new LoginControl());
		map.put("/logout.do", new LogoutControl());
		
		//관리자
		map.put("/memberList.do", new MemberListControl());
		map.put("/memberList.do", new MemberListAjax());
		map.put("/getMember.do", new GetMemberControl());
		
		//회원관련데이터(json)처리
		map.put("/memberListJson.do", new MemberListJson());
		map.put("/memberAddJson.do", new MemberAddJson());
		map.put("/memberDelJson.do", new MemberDelJson());
		
		//tiles.관련
		map.put("/studentList.do", new StudentListCon());
		map.put("/studInfo.do", new StudInfoCont());
		
		//댓글 관련. json 포맷의 데이터를 생성해서 반환.
		map.put("/replyListJson.do", new ReplyListJson());
		map.put("/delReplyJson.do", new DelReplyJson());
		map.put("/addReplyJson.do", new AddReplyJson());
		//페이지 생성하기 위한 json
		map.put("/pagingListJson.do", new PagingListJson());
		
		//chart
		map.put("/chart.do", new ChartForm());
		map.put("/replyCountJson.do", new ReplyCountJson());
		
		//코로나19 공공데이터 활용 
		map.put("/covid19.do", new Covid19Form());
		
		//지도 api
		map.put("/map.do", new MapForm());
		
		
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		System.out.println("service() 호출");
		String url = req.getRequestURI(); // /BoardWeb/main.do
		String context = req.getContextPath(); // /BoardWeb 값을 가져옴.
		String path = url.substring(context.length()); // 메인쩜두와 서브쩜두를 구분하는 키 역할.
		System.out.println(path);

		Control ctrl = map.get(path);
		ctrl.execute(req, resp);
	}

	@Override
	public void destroy() {
		System.out.println("destroy() 호출");
	}
}
