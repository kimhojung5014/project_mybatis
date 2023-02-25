package com.project.myapp.job.dao;

import java.util.List;

import com.project.myapp.job.model.JobDetailVo;
import com.project.myapp.job.model.JobListVo;
import com.project.myapp.page.model.Criteria;



public interface IJobRepository {
	
	public List<JobListVo> JobList(Criteria cri);
	
	public List<JobDetailVo> jobRecommendList(Criteria cri);
	
	public JobDetailVo Jobdetail(String job);
	
	public int JobTotal(Criteria cri);
	
	public int JobRecommendTotal(Criteria cri);
	}
