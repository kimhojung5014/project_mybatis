package com.project.myapp.member.service;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.project.myapp.member.dao.JoinRepository;
@Service
public class SearchPwServiceImpl implements SearchPwService{

	@Autowired
	JoinRepository joinRepository;
	
	@Override
	public int searchPw(String userId, String eMail, String telNumber) {
		return joinRepository.searchPw(userId, eMail, telNumber);
	}
}
