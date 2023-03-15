package com.project.myapp.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.member.dao.JoinRepository;
import com.project.myapp.page.model.Criteria;
@Service
public class MemberTotalServiceImpl implements MemberTotalService{
	
	@Autowired
	JoinRepository joinRepository;
	
	@Override
	public int memberTotal(Criteria cri) {
		return joinRepository.memberTotal(cri);
	}
}
