package com.project.myapp.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.board.dao.BoardRepository;
import com.project.myapp.board.model.BoardVo;

@Service
public class BoardEditServiceImpl implements BoardEditService{
	
	@Autowired
	BoardRepository boardRepository;
	
	@Override
	public void boardEdit(BoardVo boardVo) {
		boardRepository.boardEdit(boardVo);
	}
}
