package fleaMarket.a02_service;

import org.springframework.stereotype.Service;

import vo.Member;

@Service
public interface Req1000_Service {
	public Member DuplicateEmail(String email);
	public Member DuplicateMem(String name,String personalnumber);
}
