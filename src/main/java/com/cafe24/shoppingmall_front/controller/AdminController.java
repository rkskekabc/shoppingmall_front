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
import com.cafe24.shoppingmall_front.dto.OptionChildForm;
import com.cafe24.shoppingmall_front.dto.OptionDetailInfoDto;
import com.cafe24.shoppingmall_front.dto.OptionDetailInfoDtoForm;
import com.cafe24.shoppingmall_front.dto.OptionParentForm;
import com.cafe24.shoppingmall_front.dto.ProductWithFileDto;
import com.cafe24.shoppingmall_front.service.AdminService;
import com.cafe24.shoppingmall_front.vo.CategoryVo;
import com.cafe24.shoppingmall_front.vo.OptionChildVo;
import com.cafe24.shoppingmall_front.vo.OptionParentVo;
import com.cafe24.shoppingmall_front.vo.ProductVo;
import com.google.gson.Gson;

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
	public String productList(@RequestParam(required=false) String result, Model model) {
		model.addAttribute("result", result);
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
	public String insertProduct(@ModelAttribute ProductWithFileDto dto) {
		return "redirect:/admin?result=" + adminService.insertProduct(dto);
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
	
	@GetMapping("/childcategory/{parentNo}")
	public String categoryChildList(@PathVariable Long parentNo, Model model) {
		CategoryForm categoryForm = adminService.getCategorySet();
		CategoryVo vo = adminService.getCategoryByNo(parentNo);
		List<CategoryVo> categoryList = adminService.getCategory();
		List<CategoryVo> childList = adminService.getChildCategoryByParent(parentNo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("categoryForm", categoryForm);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("childList", childList);
		return "admin/childcategory";
	}
	
	@PostMapping("/category")
	public String insertCategory(@ModelAttribute("categoryForm") CategoryForm categoryForm) {
		return "redirect:/admin/category?result=" + adminService.insertCategory(categoryForm.getCategories());
	}
	
	@GetMapping("/productoption")
	public String optionParentList(@RequestParam(required=false) String result, Model model) {
		OptionParentForm optionParentForm = adminService.getOptionParentSet();
		List<OptionParentVo> optionParentList = adminService.getOptionParent();
		
		model.addAttribute("result", result);
		model.addAttribute("optionParentForm", optionParentForm);
		model.addAttribute("optionParentList", optionParentList);
		return "admin/optionparent";
	}
	
	@PostMapping("/optionparent")
	public String insertOptionParent(@ModelAttribute("optionParentForm") OptionParentForm optionParentForm) {
		return "redirect:/admin/productoption?result=" + adminService.insertOptionParent(optionParentForm.getOptionParents());
	}
	
	@GetMapping("/optionchild/{parentNo}")
	public String optionChildList(@PathVariable Long parentNo, Model model) {
		OptionChildForm optionChildForm = adminService.getOptionChildSet();
		OptionParentVo vo = adminService.getOptionParentByNo(parentNo);
		List<OptionChildVo> optionChildList = adminService.getOptionChild(parentNo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("optionChildForm", optionChildForm);
		model.addAttribute("optionChildList", optionChildList);
		return "admin/optionchild";
	}
	
	@PostMapping("/optionchild")
	public String insertOptionChild(@ModelAttribute("optionChildForm") OptionChildForm optionChildForm) {
		return "redirect:/admin/productoption?result=" + adminService.insertOptionChild(optionChildForm.getOptionChilds());
	}

	@GetMapping("/optiondetail/{productNo}")
	public String optionDetailList(@PathVariable Long productNo, Model model) {
		List<CategoryVo> parentCategories = adminService.getCategory();
		List<CategoryVo> childCategories = adminService.getChildCategory();
		List<OptionParentVo> optionParents = adminService.getOptionParent();
		List<OptionChildVo> optionChilds = adminService.getOptionChild();
		
		OptionDetailInfoDtoForm optionDetailInfoDtoForm = adminService.getOptionDetailInfoDtoSet();
		ProductVo vo = adminService.getProduct(productNo);
		List<OptionDetailInfoDto> optionDetailInfoDtoList = adminService.getOptionDetailInfoDto(productNo);

		Gson gson = new Gson();
		model.addAttribute("vo", vo);
		model.addAttribute("parentCategories", parentCategories);
		model.addAttribute("childCategories", gson.toJson(childCategories));
		model.addAttribute("optionParents", optionParents);
		model.addAttribute("optionChilds", gson.toJson(optionChilds));
		model.addAttribute("optionDetailInfoDtoForm", optionDetailInfoDtoForm);
		model.addAttribute("optionDetailInfoDtoList", optionDetailInfoDtoList);
		return "admin/optiondetail";
	}
	
	@PostMapping("/optiondetail")
	public String insertOptionDetail(@ModelAttribute("optionDetailInfoDtoForm") OptionDetailInfoDtoForm optionDetailInfoDtoForm) {
		return "redirect:/admin/product?result=" + adminService.insertOptionDetail(optionDetailInfoDtoForm.getOptionDetailInfoDtos());
	}
	
	@GetMapping("/member")
	public String memberList(Model model) {
		model.addAttribute("list", adminService.getMemberList());
		return "admin/memberlist";
	}
	
	@GetMapping("/order")
	public String orderList(Model model) {
		model.addAttribute("list", adminService.getOrderList());
		return "admin/orderlist";
	}
}
