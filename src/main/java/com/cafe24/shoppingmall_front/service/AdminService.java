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
import com.cafe24.shoppingmall_front.dto.OptionChildForm;
import com.cafe24.shoppingmall_front.dto.OptionDetailInfoDto;
import com.cafe24.shoppingmall_front.dto.OptionDetailInfoDtoForm;
import com.cafe24.shoppingmall_front.dto.OptionParentForm;
import com.cafe24.shoppingmall_front.vo.CategoryVo;
import com.cafe24.shoppingmall_front.vo.MemberVo;
import com.cafe24.shoppingmall_front.vo.OptionChildVo;
import com.cafe24.shoppingmall_front.vo.OptionDetailVo;
import com.cafe24.shoppingmall_front.vo.OptionParentVo;
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
	
	public List<CategoryVo> getChildCategory() {
		JSONResultCategoryList result = restTemplate.getForObject(BASE_URL + "/category/child", JSONResultCategoryList.class);
		List<CategoryVo> list = result.getData();
		
		return list;
	}

	public CategoryVo getCategoryByNo(Long no) {
		JSONResultCategory result = restTemplate.getForObject(BASE_URL + "/category/" + no, JSONResultCategory.class);
		CategoryVo vo = result.getData();
		
		return vo;
	}

	@Transactional
	public String insertOptionParent(List<OptionParentVo> optionParents) {
		try {
			for(OptionParentVo vo : optionParents) {
				if(!"".equals(vo.getName())) 
					restTemplate.postForEntity(BASE_URL + "/option/parent", vo, JSONResult.class);
			}
			return "success";
		} catch(Exception e) {
			return "fail";
		}
	}

	public OptionParentForm getOptionParentSet() {
		List<OptionParentVo> optionParentList = new ArrayList<OptionParentVo>();
		for(int i=0; i<4; i++) {
			OptionParentVo optionParentVo = new OptionParentVo();
			optionParentList.add(optionParentVo);
		}
		
		return new OptionParentForm(optionParentList);
	}

	public List<OptionParentVo> getOptionParent() {
		JSONResultOptionParentList result = restTemplate.getForObject(BASE_URL + "/option/parent", JSONResultOptionParentList.class);
		List<OptionParentVo> list = result.getData();
		
		return list;
	}

	public OptionChildForm getOptionChildSet() {
		List<OptionChildVo> optionChildList = new ArrayList<OptionChildVo>();
		for(int i=0; i<4; i++) {
			OptionChildVo optionChildVo = new OptionChildVo();
			optionChildList.add(optionChildVo);
		}
		
		return new OptionChildForm(optionChildList);
	}

	public OptionParentVo getOptionParentByNo(Long parentNo) {
		JSONResultOptionParent result = restTemplate.getForObject(BASE_URL + "/option/parent/" + parentNo, JSONResultOptionParent.class);
		OptionParentVo vo = result.getData();
		
		return vo;
	}

	public List<OptionChildVo> getOptionChild() {
		JSONResultOptionChildList result = restTemplate.getForObject(BASE_URL + "/option/child", JSONResultOptionChildList.class);
		List<OptionChildVo> list = result.getData();
		
		return list;
	}

	public List<OptionChildVo> getOptionChild(Long parentNo) {
		JSONResultOptionChildList result = restTemplate.getForObject(BASE_URL + "/option/child/parent/" + parentNo, JSONResultOptionChildList.class);
		List<OptionChildVo> list = result.getData();
		
		return list;
	}

	public String insertOptionChild(List<OptionChildVo> optionChilds) {
		try {
			for(OptionChildVo vo : optionChilds) {
				if(!"".equals(vo.getName())) 
					restTemplate.postForEntity(BASE_URL + "/option/child", vo, JSONResult.class);
			}
			return "success";
		} catch(Exception e) {
			return "fail";
		}
	}

	public OptionDetailInfoDtoForm getOptionDetailInfoDtoSet() {
		List<OptionDetailInfoDto> optionDetailInfoDtoList = new ArrayList<OptionDetailInfoDto>();
		for(int i=0; i<4; i++) {
			OptionDetailInfoDto optionDetailInfoDto = new OptionDetailInfoDto();
			optionDetailInfoDtoList.add(optionDetailInfoDto);
		}
		
		return new OptionDetailInfoDtoForm(optionDetailInfoDtoList);
	}

	public List<OptionDetailInfoDto> getOptionDetailInfoDto(Long productNo) {
		JSONResultOptionDetailInfoDtoList result = restTemplate.getForObject(BASE_URL + "/optiondetail/product/" + productNo, JSONResultOptionDetailInfoDtoList.class);
		List<OptionDetailInfoDto> list = result.getData();
		
		return list;
	}

	public String insertOptionDetail(List<OptionDetailInfoDto> optionDetailInfoDtos) {
		try {
			for(OptionDetailInfoDto dto : optionDetailInfoDtos) {
				if(dto.getStock() != null) {
					OptionDetailVo vo = OptionDetailVo.of(dto);
					restTemplate.postForEntity(BASE_URL + "/optiondetail", vo, JSONResult.class);
				}
			}
			return "success";
		} catch(Exception e) {
			return "fail";
		}
	}

	public List<MemberVo> getMemberList() {
		JSONResultMemberList result = restTemplate.getForObject(BASE_URL + "/member", JSONResultMemberList.class);
		List<MemberVo> list = result.getData();
		
		return list;
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
	
	private static class JSONResultOptionParentList extends JSONResult<List<OptionParentVo>> {
	}
	
	private static class JSONResultOptionParent extends JSONResult<OptionParentVo> {
	}
	
	private static class JSONResultOptionChildList extends JSONResult<List<OptionChildVo>> {
	}
	
	private static class JSONResultOptionDetailInfoDtoList extends JSONResult<List<OptionDetailInfoDto>> {
	}
	
	private static class JSONResultMemberList extends JSONResult<List<MemberVo>> {
	}
}
