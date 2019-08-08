package com.cafe24.shoppingmall_front.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.cafe24.shoppingmall_front.dto.JSONResult;
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

	private static class JSONResultLong extends JSONResult<Long> {
	}
}
