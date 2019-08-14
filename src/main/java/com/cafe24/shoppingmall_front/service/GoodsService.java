package com.cafe24.shoppingmall_front.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.cafe24.shoppingmall_front.dto.JSONResult;
import com.cafe24.shoppingmall_front.dto.OptionDetailInfoDto;
import com.cafe24.shoppingmall_front.vo.CartVo;
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
	
	public List<Map<String, String>> getOptionDetailInfoDto(Long productNo) {
		JSONResultOptionDetailInfoDtoList result = restTemplate.getForObject(BASE_URL + "/optiondetail/product/" + productNo, JSONResultOptionDetailInfoDtoList.class);
		List<OptionDetailInfoDto> dtoList = result.getData();
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		
		for(OptionDetailInfoDto dto : dtoList) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("no", dto.getNo().toString());
			map.put("info", dto.getInfo());
			list.add(map);
		}
		
		return list;
	}

	public String putCart(CartVo vo) {
		vo.setPrice(vo.getPrice() * vo.getNum());
		ResponseEntity<JSONResultBoolean> result = restTemplate.postForEntity(BASE_URL + "/cart", vo, JSONResultBoolean.class);
		JSONResultBoolean returnVal = result.getBody();
		
		if(result.getStatusCode().is2xxSuccessful()) {
			return returnVal.getResult();
		} else {
			return "fail";
		}
	}
	
	private static class JSONResultProduct extends JSONResult<ProductVo> {
	}
	
	private static class JSONResultBoolean extends JSONResult<Boolean> {
	}
	
	private static class JSONResultOptionDetailInfoDtoList extends JSONResult<List<OptionDetailInfoDto>> {
	}
}