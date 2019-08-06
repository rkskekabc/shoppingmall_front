package com.cafe24.shoppingmall_front.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.cafe24.shoppingmall_front.dto.CategoryForm;
import com.cafe24.shoppingmall_front.dto.JSONResult;
import com.cafe24.shoppingmall_front.vo.CategoryVo;
import com.cafe24.shoppingmall_front.vo.ProductVo;

@Service
public class AdminService {
	private final String BASE_URL = "http://localhost:8080/api";
	
	@Autowired
	private RestTemplate restTemplate;
	
	public List<ProductVo> getProductList() {
		JSONResultProductList result = restTemplate.getForObject(BASE_URL + "/product", JSONResultProductList.class);
		List<ProductVo> list = result.getData();
		
		return list;
	}

	public ProductVo getProduct(Long no) {
		JSONResultProduct result = restTemplate.getForObject(BASE_URL + "/product/" + no, JSONResultProduct.class);
		ProductVo vo = result.getData();
		
		return vo;
	}
	
	public String insertProduct(ProductVo vo) {
		ResponseEntity<JSONResultLong> result = restTemplate.postForEntity(BASE_URL + "/product", vo, JSONResultLong.class);
		JSONResultLong returnVal = result.getBody();
		
		if(result.getStatusCode().is2xxSuccessful()) {
			return returnVal.getResult();
		} else {
			return "fail";
		}
	}
	
	public CategoryForm getCategorySet() {
		List<CategoryVo> categoryList = new ArrayList<CategoryVo>();
		for(int i=0; i<4; i++) {
			CategoryVo categoryVo = new CategoryVo();
			categoryList.add(categoryVo);
		}
		
		return new CategoryForm(categoryList);
	}

	@Transactional
	public String insertCategory(List<CategoryVo> categories) {
		try {
			for(CategoryVo vo : categories) {
				if(!"".equals(vo.getName())) 
					restTemplate.postForEntity(BASE_URL + "/category", vo, JSONResult.class);
			}
			return "success";
		} catch(Exception e) {
			return "fail";
		}
	}
	
	public List<CategoryVo> getCategory() {
		JSONResultCategoryList result = restTemplate.getForObject(BASE_URL + "/category", JSONResultCategoryList.class);
		List<CategoryVo> list = result.getData();
		
		return list;
	}

	public CategoryVo getCategoryByNo(Long no) {
		JSONResultCategory result = restTemplate.getForObject(BASE_URL + "/category/" + no, JSONResultCategory.class);
		CategoryVo vo = result.getData();
		
		return vo;
	}

	private static class JSONResultLong extends JSONResult<Long> {
	}
	
	private static class JSONResultProduct extends JSONResult<ProductVo> {
	}
	
	private static class JSONResultProductList extends JSONResult<List<ProductVo>> {
	}
	
	private static class JSONResultCategoryList extends JSONResult<List<CategoryVo>> {
	}
	
	private static class JSONResultCategory extends JSONResult<CategoryVo> {
	}
}
