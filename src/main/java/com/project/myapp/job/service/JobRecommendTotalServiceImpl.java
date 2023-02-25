package com.project.myapp.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.job.dao.JobRepository;
import com.project.myapp.page.model.Criteria;

@Service
public class JobRecommendTotalServiceImpl implements JobRecommendTotalService{
	
	@Autowired
	JobRepository jobRepository;
	
	@Override
	public int JobRecommendTotal(Criteria cri) {
		
		return jobRepository.jobRecommendTotal(cri);
	}
}
