package com.project.myapp.reply.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.reply.dao.ReplyRepository;

@Service
public class ReplyDeleteServiceImpl implements ReplyDeleteService{
	@Autowired
	ReplyRepository replyRepository;
	
	@Override
	public void replyDelete(int commentNum) {
		replyRepository.replyDelete(commentNum);
	}
}
