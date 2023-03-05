package com.project.myapp.member.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.myapp.member.dao.JoinRepository;
import com.project.myapp.member.model.JoinVo;
import com.project.myapp.member.service.DropService;
import com.project.myapp.member.service.EditService;
import com.project.myapp.member.service.IdCheckService;
import com.project.myapp.member.service.InsertJoinService;
import com.project.myapp.member.service.LoginService;
import com.project.myapp.member.service.MemberListService;
import com.project.myapp.member.service.MemberTotalService;
import com.project.myapp.member.service.NickNameCheckService;
import com.project.myapp.member.service.ResetPwService;
import com.project.myapp.member.service.SearchIdService;
import com.project.myapp.member.service.SearchPwService;
import com.project.myapp.page.model.Criteria;
import com.project.myapp.page.model.PageMakerVo;



@Controller
public class MemberController {
	
	//로그인
	@Autowired
	LoginService loginService;
	
	//회원가입
	@Autowired
	InsertJoinService joinService; 
	
	//아이디 체크
	@Autowired
	IdCheckService idCheckService;
	
	//닉네임 체크
	@Autowired
	NickNameCheckService nickNameCheckService;
	
	//마이페이지
	@Autowired
	EditService editService;
	
	//아이디 검색
	@Autowired
	SearchIdService searchidService;
	
	//비밀번호 검색
	@Autowired
	SearchPwService searchPwService;
	
	//비밀번호 리셋
	@Autowired
	ResetPwService resetPwService;

	
	@GetMapping(value = "/")
	public String home() {
		return "main/index";
	}
	
	//회원가입
	@GetMapping(value = "join")
	public String join() {
		return "member/join";
	}
	
	@PostMapping(value = "join")
	public String join(JoinVo joinVo, Model model) {
		
		joinService.insertJoin(joinVo);
		
		return "redirect:/login";
	}
	
	//로그인
	@GetMapping(value = "login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping(value = "login")
	public String login(String userId, String pw, HttpSession session) {
		
		JoinVo joinvo =  loginService.login(userId, pw);
		if (joinvo != null) {
			session.setAttribute("userData", joinvo);
			return "redirect:/";
		}else {
			return "member/loginfalse";
		}
	}
	
	//아이디 중복체크
	@GetMapping(value = "idCheck")
	public String idCheck(String userId, Model model, HttpSession session) {
		
		if (idCheckService.idCheck(userId)) {
			session.setAttribute("userId", userId);
			model.addAttribute("idCheck", "OK");
		}
		return "member/idCheck";
	}
	//닉네임 중복체크
	@GetMapping(value = "nickNameCheck")
	public String nickNameCheck(String nickName,String page, Model model, HttpSession session) {
		
		if (nickNameCheckService.nickNameCheck(nickName)) {
			session.setAttribute("nickName", nickName);
			model.addAttribute("nickCheck", "OK");
			model.addAttribute("page",page);
		}
		return "member/nickCheck";
	}
	//아이디 찾기 페이지만 이동
	@GetMapping(value = "findId")
	public String findId() {
		return "member/findid";
	}
	@PostMapping(value = "searchId")
	public String searchId(String userName, String eMail, String telNumber, Model model) {
		
		String id = searchidService.searchId(userName, eMail, telNumber);
		
		model.addAttribute("id", id);
			
		return "member/searchId";
	}
	
	//비밀번호 찾기 <- 요건 비밀번호 변경으로 바꾸기
	
	@GetMapping(value = "findPw")
	public String findPw() {
		return "member/findpw";
	}
	
	//findpw에서 입력받은 정보로 pw 검색 pw재설정 창으로 이동
	@PostMapping(value = "searchPw")
	public String searchPw(String userId, String eMail, String telNumber, Model model) {
		
		int pw = searchPwService.searchPw(userId, eMail, telNumber);
		System.out.println("서비스 실행완료");
		if (pw == 1) {
			model.addAttribute("userId",userId);
		}
			model.addAttribute("pw", pw);
		return "member/searchPw";
	}

	//비밀번호 재설정
	@PostMapping(value = "resetPw")
	public String resetPw(String userId,String pw, Model model) {
		resetPwService.resetPw(userId, pw);
		
		return "member/Msg";
	}
	
	//로그아웃 시 세션 정보 지우고 메인으로 전환
	@GetMapping(value = "logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping(value = "mypage")
	public String mypage() {
		return "member/mypage";
	}
	
	@PostMapping(value = "edit")
	public String edit(JoinVo joinVo) {
		
		editService.edit(joinVo);
		
		return "member/Msg";
	}
	
	@Autowired
	DropService DropServiceImpl;
	//회원탈퇴
	@GetMapping(value = "drop")
	public String drop(String userId, HttpSession session) {
		DropServiceImpl.drop(userId);
		session.invalidate();
		return "main/index";
	}
	//회원추방
	@GetMapping(value = "exile")
	public String exile(String userId) {
		DropServiceImpl.drop(userId);
		return "redirect:/memberList";
	}
	
	@Autowired
	MemberListService memberListServiceImpl;
	@Autowired
	MemberTotalService memberTotalServiceImpl;
	@GetMapping(value = "memberList")
	public String memberList(Criteria cri,Model model) {
		
		List<JoinVo>memberList = memberListServiceImpl.memberList(cri);
		
		int total = memberTotalServiceImpl.memberTotal(cri);
		
		PageMakerVo pageMake = new PageMakerVo(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		
		model.addAttribute("memberList", memberList);
		
		return "member/memberlist";
	}


}
