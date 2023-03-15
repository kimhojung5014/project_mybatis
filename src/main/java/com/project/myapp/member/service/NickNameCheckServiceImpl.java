package com.project.myapp.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.myapp.member.dao.JoinRepository;
@Service
public class NickNameCheckServiceImpl implements NickNameCheckService{
	@Autowired
	JoinRepository joinRepository;
	
	@Override
	public int nickNameCheck(String nickName) {
		return joinRepository.nickNameCheck(nickName);
	}
}
