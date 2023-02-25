package com.project.myapp.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.myapp.page.model.Criteria;
import com.project.myapp.reply.dao.ReplyRepository;
import com.project.myapp.reply.model.ReplyVo;

@Service
public class ReplyListServiceImpl implements ReplyListService{
	
	@Autowired
	ReplyRepository replyReositoryImpl;
	
	@Override
	public List<ReplyVo> replyList(int writeNum, Criteria cri) {
		return replyReositoryImpl.replyList(writeNum, cri);
	}
}
