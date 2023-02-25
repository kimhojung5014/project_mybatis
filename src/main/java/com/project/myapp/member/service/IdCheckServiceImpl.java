package com.project.myapp.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.myapp.member.dao.JoinRepository;
@Service
public class IdCheckServiceImpl implements IdCheckService{
	
	@Autowired
	JoinRepository joinRepository;
	
	@Override
	public boolean idCheck(String id) {
		
		return joinRepository.idCheck(id);
	}
}
