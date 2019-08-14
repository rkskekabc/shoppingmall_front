package com.cafe24.shoppingmall_front.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.cafe24.shoppingmall_front.dto.JSONResult;
import com.cafe24.shoppingmall_front.dto.OptionDetailInfoDto;
import com.cafe24.shoppingmall_front.vo.CartVo;
import com.cafe24.shoppingmall_front.vo.MemberVo;

@Service
public class MemberService {
	private final String BASE_URL = "http://localhost:8080/api";
	
	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public String insert(MemberVo vo) {
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		vo.setType("ROLE_USER");
		
		ResponseEntity<JSONResultLong> result = restTemplate.postForEntity(BASE_URL + "/member", vo, JSONResultLong.class);
		JSONResultLong returnVal = result.getBody();
		
		
		if(result.getStatusCode().is2xxSuccessful()) {
			return returnVal.getResult();
		} else {
			return "fail";
		}
	}

	public List<Map<String, Object>> getCartList(Long memberNo) {
		List<Map<String, Object>> returnList = new ArrayList<Map<String, Object>>();
		JSONResultCartList result = restTemplate.getForObject(BASE_URL + "/cart/" + memberNo, JSONResultCartList.class);
		List<CartVo> list = result.getData();
		for(CartVo vo : list) {
			Map<String, Object> map = new HashMap<String, Object>();
			JSONResultOptionDetailInfoDto dtoResult = restTemplate.getForObject(BASE_URL + "/optiondetail/" + vo.getOptionDetailNo(), JSONResultOptionDetailInfoDto.class);
			OptionDetailInfoDto dto = dtoResult.getData();
			map.put("cart", vo);
			map.put("dto", dto);
			
			returnList.add(map);
		}
		
		return returnList;
	}

	public String order(Long memberNo) {
		ResponseEntity<JSONResultBoolean> result = restTemplate.postForEntity(BASE_URL + "/order/cart/" + memberNo, memberNo, JSONResultBoolean.class);
		JSONResultBoolean returnVal = result.getBody();

		if(result.getStatusCode().is2xxSuccessful()) {
			return returnVal.getResult();
		} else {
			return "fail";
		}
	}

	private static class JSONResultLong extends JSONResult<Long> {
	}

	private static class JSONResultBoolean extends JSONResult<Boolean> {
	}
	
	private static class JSONResultOptionDetailInfoDto extends JSONResult<OptionDetailInfoDto> {
	}

	private static class JSONResultCartList extends JSONResult<List<CartVo>> {
	}
}
