package com.yedam.member.service;

import com.yedam.member.vo.MemberVO;

public interface MemberService {
	//회원가입
	public boolean joinMember(MemberVO vo);
	//로그인
	public MemberVO loginBook(String id, String pw);
	//마이페이지 myPage
	public MemberVO selectPage(int memberNo); 
	
	
	

}
