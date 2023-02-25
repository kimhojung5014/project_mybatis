package com.project.myapp.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.board.dao.BoardRepository;
import com.project.myapp.board.model.BoardVo;

@Service
public class GetBoardServiceImpl implements GetBoardService{
	
	@Autowired
	BoardRepository boardRepository;
	
	@Override
	public BoardVo getBoard(int writeNum) {
		boardRepository.boardViews(writeNum);
		
		return boardRepository.getBoard(writeNum);
	}

}
