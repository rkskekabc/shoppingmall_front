package com.cafe24.shoppingmall_front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.shoppingmall_front.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("{no}")
	public String list(@PathVariable("no") Long no) {
		return "goods/item";
	}
	
	@ResponseBody
	@RequestMapping("/list/{page}")
	public String list(@PathVariable("page") Integer page) {
		goodsService.getList();
		return "ok";
	}
}