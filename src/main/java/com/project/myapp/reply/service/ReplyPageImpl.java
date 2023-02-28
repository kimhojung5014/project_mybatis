package com.project.myapp.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.page.model.Criteria;
import com.project.myapp.reply.dao.ReplyRepository;
import com.project.myapp.reply.model.ReplyVo;

@Service
public class ReplyPageImpl implements ReplyMypage{
	
	@Autowired
	ReplyRepository replyRepository;
	
	@Override
	public List<ReplyVo> replyMypage(String userId, Criteria cri) {
		return replyRepository.replyMypage(userId,cri);
	}
}
