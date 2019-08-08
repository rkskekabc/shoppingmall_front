package com.cafe24.shoppingmall_front.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.cafe24.shoppingmall_front.dto.JSONResult;
import com.cafe24.shoppingmall_front.vo.MemberVo;

@Service
public class CustomUserDetailService implements UserDetailsService {
	private final String BASE_URL = "http://localhost:8080/api";
	
	@Autowired
	private RestTemplate restTemplate;
	
	public MemberVo getMemberById(String id) {
		JSONResultMember result = restTemplate.getForObject(BASE_URL + "/member/" + id, JSONResultMember.class);
		MemberVo vo = result.getData();
		
		return vo;
	}
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		MemberVo vo = getMemberById(id);
		return new SecurityMember(vo);
	}
	
	private static class JSONResultMember extends JSONResult<MemberVo> {
	}
}
