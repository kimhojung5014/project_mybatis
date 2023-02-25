package com.project.myapp.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myapp.job.dao.JobRepository;
import com.project.myapp.job.model.JobListVo;
import com.project.myapp.page.model.Criteria;

@Service
public class JobListServiceImpl implements JobListService{
	
	@Autowired
	JobRepository jobRepository;
	
	@Override
	public List<JobListVo> JobList(Criteria cri) {
		return jobRepository.jobList(cri);
	}
}
