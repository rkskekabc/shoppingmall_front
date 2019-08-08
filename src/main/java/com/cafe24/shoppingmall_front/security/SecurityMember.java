package com.cafe24.shoppingmall_front.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.cafe24.shoppingmall_front.vo.MemberVo;

public class SecurityMember extends User {
	private static final long serialVersionUID = -416077208935285641L;
	private Long no;
	
	public SecurityMember(MemberVo vo) {
		super(vo.getId(), vo.getPassword(), makeGrantedAuthority(vo.getType()));
		this.no = vo.getNo();
	}
	
	private static List<GrantedAuthority> makeGrantedAuthority(String role){
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(role));
		return authorities; 
	}
}
