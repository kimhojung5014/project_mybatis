package com.project.myapp.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.job.dao.JobRepository;
import com.project.myapp.job.model.JobDetailVo;

@Service
public class JobDetaiServiceImpl implements JobDetailService{
	
	@Autowired
	JobRepository jobRepository;
	
	@Override
	public JobDetailVo Jobdetail(String job) {
		return jobRepository.jobdetail(job);
	}
}
