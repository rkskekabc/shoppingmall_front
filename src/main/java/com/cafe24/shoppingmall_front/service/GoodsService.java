package com.cafe24.shoppingmall_front.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.cafe24.shoppingmall_front.dto.Goods;
import com.cafe24.shoppingmall_front.dto.JSONResult;

@Service
public class GoodsService {
	
	@Autowired
	private RestTemplate restTemplate;

	public Goods getList(Long no){
		String endpoint = "http://localhost:8888/v1/hello";
		JSONResultGoods jsonResult = restTemplate.getForObject(endpoint, JSONResultGoods.class);
		return jsonResult.getData();
	}

	
	public String getList(){
		String endpoint = "http://localhost:8888/v1/hello";
		JSONResultGoodsList jsonResult = restTemplate.getForObject(endpoint, JSONResultGoodsList.class);
		System.out.println( jsonResult );
		return jsonResult.getData();
	}
	
	// DTO Class
	private static class JSONResultGoods extends JSONResult<Goods> {
	}
	
	private static class JSONResultGoodsList extends JSONResult<String> {
	}
}