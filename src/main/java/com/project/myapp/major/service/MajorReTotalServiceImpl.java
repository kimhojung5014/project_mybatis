package com.project.myapp.major.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.major.dao.MajorRepository;
import com.project.myapp.major.model.MajorTest;
import com.project.myapp.page.model.Criteria;

@Service
public class MajorReTotalServiceImpl implements MajorReTotalService{
	
	@Autowired
	MajorRepository majorRepository;
	
	@Override
	public int majorRecommendTotal(MajorTest majorTest) {
		return majorRepository.majorRecommendTotal(majorTest);
	}
}
