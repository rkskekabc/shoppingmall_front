package com.cafe24.shoppingmall_front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.shoppingmall_front.service.MainService;

@Controller
@RequestMapping("")
public class MainController {	
	@Autowired
	private MainService mainService;
	
	@GetMapping({"", "/main"})
	public String main(Model model) {
		model.addAttribute("productlist", mainService.getProductList());
		return "main/index";
	}
}
