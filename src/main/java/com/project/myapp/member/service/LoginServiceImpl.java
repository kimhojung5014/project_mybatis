package com.project.myapp.member.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.myapp.member.dao.JoinRepository;
import com.project.myapp.member.model.JoinVo;
@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	JoinRepository joinRepository;
	
	@Override
	public JoinVo login(String id, String pw) {
		return joinRepository.login(id, pw);
	}
}
