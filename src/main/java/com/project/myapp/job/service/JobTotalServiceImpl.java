package com.project.myapp.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.job.dao.JobRepository;
import com.project.myapp.page.model.Criteria;

@Service
public class JobTotalServiceImpl implements JobTotalService{
	
	@Autowired
	JobRepository jobRepository;
	
	@Override
	public int JobTotal(Criteria cri) {
		return jobRepository.jobTotal(cri);
	}
}
