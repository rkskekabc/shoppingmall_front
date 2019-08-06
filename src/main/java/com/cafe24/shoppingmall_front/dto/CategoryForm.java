package com.cafe24.shoppingmall_front.dto;

import java.util.List;

import com.cafe24.shoppingmall_front.vo.CategoryVo;

public class CategoryForm {
	private List<CategoryVo> categories;
	

	public CategoryForm(List<CategoryVo> categories) {
		this.categories = categories;
	}

	public List<CategoryVo> getCategories() {
		return categories;
	}

	public void setCategories(List<CategoryVo> categories) {
		this.categories = categories;
	}
	
}
