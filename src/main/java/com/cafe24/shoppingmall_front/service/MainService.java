package com.cafe24.shoppingmall_front.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.cafe24.shoppingmall_front.dto.JSONResult;
import com.cafe24.shoppingmall_front.vo.ProductVo;

@Service
public class MainService {
	private final String BASE_URL = "http://localhost:8080/api";
	
	@Autowired
	private RestTemplate restTemplate;

	public List<ProductVo> getProductList() {
		JSONResultProductList result = restTemplate.getForObject(BASE_URL + "/product", JSONResultProductList.class);
		List<ProductVo> list = result.getData();
		
		return list;
	}
	
	private static class JSONResultProductList extends JSONResult<List<ProductVo>> {
	}
}
