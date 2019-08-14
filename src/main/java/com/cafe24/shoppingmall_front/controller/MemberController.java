package com.cafe24.shoppingmall_front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.shoppingmall_front.security.SecurityMember;
import com.cafe24.shoppingmall_front.service.MemberService;
import com.cafe24.shoppingmall_front.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/login")
	public String loginForm() {
		return "member/login";
	}
	
	@GetMapping("/join")
	public String registerForm() {
		return "member/join";
	}
	
	@PostMapping("/join")
	public String register(@ModelAttribute MemberVo vo) {
		return "redirect:/member/login?result=" + memberService.insert(vo);
	}
	
	@GetMapping("/cart/{no}")
	public String registerForm(@PathVariable Long no, Model model, Authentication auth) {
		SecurityMember member = (SecurityMember)auth.getPrincipal();
		model.addAttribute("list", memberService.getCartList(no));
		model.addAttribute("member", member);
		return "member/cart";
	}
	
	@PostMapping("/order")
	public String order(@RequestParam Long memberNo) {
		memberService.order(memberNo);
		return "/member/ordercomplete";
	}
}
