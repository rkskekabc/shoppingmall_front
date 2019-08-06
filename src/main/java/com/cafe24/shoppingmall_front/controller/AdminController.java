package com.cafe24.shoppingmall_front.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.shoppingmall_front.dto.CategoryForm;
import com.cafe24.shoppingmall_front.service.AdminService;
import com.cafe24.shoppingmall_front.vo.CategoryVo;
import com.cafe24.shoppingmall_front.vo.ProductVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;

	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}
	
	@GetMapping({"", "/product"})
	public String productList(Model model) {
		model.addAttribute("list", adminService.getProductList());
		return "admin/productlist";
	}
	
	@GetMapping("/product/{no}")
	public String productDetail(@PathVariable Long no, Model model) {
		model.addAttribute("detail", adminService.getProduct(no));
		return "admin/productdetail";
	}
	
	@GetMapping("/product/add")
	public String main(@RequestParam(required=false) String result, Model model) {
		model.addAttribute("result", result);
		return "admin/productadd";
	}
	
	@PostMapping("/product")
	public String insertProduct(@ModelAttribute ProductVo vo) {
		return "redirect:/admin?result=" + adminService.insertProduct(vo);
	}
	
	@GetMapping("/category")
	public String categoryList(@RequestParam(required=false) String result, Model model) {
		CategoryForm categoryForm = adminService.getCategorySet();
		List<CategoryVo> categoryList = adminService.getCategory();
		
		model.addAttribute("result", result);
		model.addAttribute("categoryForm", categoryForm);
		model.addAttribute("categoryList", categoryList);
		return "admin/category";
	}
	
	@GetMapping("/childcategory/{no}")
	public String categoryList(@PathVariable Long no, Model model) {
		CategoryForm categoryForm = adminService.getCategorySet();
		CategoryVo vo = adminService.getCategoryByNo(no);
		List<CategoryVo> categoryList = adminService.getCategory();
		
		model.addAttribute("vo", vo);
		model.addAttribute("categoryForm", categoryForm);
		model.addAttribute("categoryList", categoryList);
		return "admin/childcategory";
	}
	
	@PostMapping("/category")
	public String insertCategory(@ModelAttribute("categoryForm") CategoryForm categoryForm) {
		return "redirect:/admin/category?result=" + adminService.insertCategory(categoryForm.getCategories());
	}
}
