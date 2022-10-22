package com.mycompany.project.common.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.mycompany.project.common.model.dto.UserDTO;


public class UserService implements UserDetailsService {
	@Inject
	SqlSession sqlSession;

	public UserService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		
		Map<String, Object> user = sqlSession.selectOne("user.detail", userid);
		
		
		if (user == null) {
			throw new UsernameNotFoundException(userid);
		} else {
			
		}
		
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		
		authority.add(new SimpleGrantedAuthority(user.get("authority").toString()));
		
		return new UserDTO(user.get("username").toString(), user.get("password").toString(), 
				(Integer) Integer.valueOf(user.get("enabled_YN").toString()) == 1, true, true, true, authority,
				user.get("user_name").toString());
	}
}