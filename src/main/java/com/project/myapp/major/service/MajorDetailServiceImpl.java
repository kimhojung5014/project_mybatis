package com.project.myapp.major.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.major.dao.MajorRepository;
import com.project.myapp.major.model.MajorVo;

@Service
public class MajorDetailServiceImpl implements MajorDetailService{
	
	@Autowired
	MajorRepository majorRepository;
	
	@Override
	public MajorVo majorDetail(String major) {
		return majorRepository.majorDetail(major);
	}
}
