package com.project.myapp.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.myapp.member.dao.JoinRepository;

@Service
public class ResetPwServiceImpl implements ResetPwService{
	
	@Autowired
	JoinRepository joinRepository;
	
	@Override
	public void resetPw(String userId, String pw) {
		joinRepository.resetPw(userId, pw);
	}
}
