package com.project.myapp.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.myapp.member.dao.JoinRepository;
@Service
public class SearchIdServiceImpl implements SearchIdService{
	
	@Autowired
	JoinRepository joinRepository;
	
	@Override
	public String searchId(String userName, String eMail, String telNumber) {
		return joinRepository.searchId(userName, eMail, telNumber);
	}
}
