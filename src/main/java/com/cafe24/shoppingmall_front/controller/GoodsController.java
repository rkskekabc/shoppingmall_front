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

import com.cafe24.shoppingmall_front.security.SecurityMember;
import com.cafe24.shoppingmall_front.service.GoodsService;
import com.cafe24.shoppingmall_front.vo.CartVo;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@GetMapping("/{no}")
	public String list(@PathVariable("no") Long no, Model model, Authentication auth) {
		SecurityMember member = null;
		if(auth != null) {
			member = (SecurityMember)auth.getPrincipal();
		}
		model.addAttribute("goods", goodsService.getProduct(no));
		model.addAttribute("detail", goodsService.getOptionDetailInfoDto(no));
		model.addAttribute("member", member);
		return "goods/item";
	}
	
	@PostMapping("/cart")
	public String putCart(@ModelAttribute CartVo vo, Authentication auth) {
		SecurityMember member = (SecurityMember)auth.getPrincipal();
		goodsService.putCart(vo);
		return "redirect:/member/cart/"+member.getNo();
	}
}