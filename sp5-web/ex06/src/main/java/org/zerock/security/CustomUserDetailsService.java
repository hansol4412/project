package org.zerock.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.UserDetails;
import org.zerock.mapper.MemberMapper;
import org.zerock.security.domain.CustomUser;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	@Setter(onMethod_= @Autowired)
	private MemberMapper mapper;
	
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException{
		log.warn("Load User By Username : " + userName);
		MemberVO vo = mapper.read(userName);
		log.warn("queried by member mapper: "+vo);
		return vo == null? null: new CustomUser(vo) ;
	}
}
