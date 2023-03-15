package com.project.myapp.reply.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.reply.dao.ReplyRepository;
@Service
public class ReplyMypageTotalServiceImpl implements ReplyMypageTotalService{
	
	@Autowired
	ReplyRepository replyRepository;
	
	@Override
	public int replyMypageTotal(String userId) {
		return replyRepository.replyMypageTotal(userId);
	}
}
