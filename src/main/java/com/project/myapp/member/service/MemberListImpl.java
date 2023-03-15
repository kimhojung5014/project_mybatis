package com.project.myapp.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.member.dao.JoinRepository;
import com.project.myapp.member.model.JoinVo;
import com.project.myapp.page.model.Criteria;

@Service
public class MemberListImpl implements MemberListService{
	
	@Autowired
	JoinRepository joinRepository;
	
	@Override
	public List<JoinVo> memberList(Criteria cri) {
		return joinRepository.memberList(cri);
	}
}
