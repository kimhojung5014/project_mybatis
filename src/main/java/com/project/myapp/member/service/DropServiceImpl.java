package com.project.myapp.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.member.dao.JoinRepository;

@Service
public class DropServiceImpl implements DropService{
	
	@Autowired
	JoinRepository joinRepository;
	@Override
	public void drop(String userId) {
		joinRepository.drop(userId);
	}
}
