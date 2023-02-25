package com.project.myapp.reply.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.reply.dao.ReplyRepository;

@Service
public class ReplyTotalServiceImpl implements ReplyTotalService{
	
	@Autowired
	ReplyRepository replyRepository;
	
	@Override
	public int replyTotal(int writeNum) {
		return replyRepository.replyTotal(writeNum);
	}
}
