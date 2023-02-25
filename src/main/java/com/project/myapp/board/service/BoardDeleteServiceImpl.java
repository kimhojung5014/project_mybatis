package com.project.myapp.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.board.dao.BoardRepository;

@Service
public class BoardDeleteServiceImpl implements BoardDeleteService{
	
	@Autowired
	BoardRepository boardRepository;
	
	@Override
	public void boardDelete(int writeNum) {
		boardRepository.boardDelete(writeNum);
	}
}
