package com.cafe24.shoppingmall_front.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.cafe24.shoppingmall_front.dto.JSONResult;
import com.cafe24.shoppingmall_front.vo.ProductVo;

@Service
public class GoodsService {
	private final String BASE_URL = "http://localhost:8080/api";
	
	@Autowired
	private RestTemplate restTemplate;

	public ProductVo getProduct(Long no){
		JSONResultProduct result = restTemplate.getForObject(BASE_URL + "/product/" + no, JSONResultProduct.class);
		ProductVo vo = result.getData();
		
		return vo;
	}
	
	private static class JSONResultProduct extends JSONResult<ProductVo> {
	}
}