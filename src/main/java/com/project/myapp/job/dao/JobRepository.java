package com.project.myapp.job.dao;

import java.util.List;

import com.project.myapp.job.model.JobDetailVo;
import com.project.myapp.job.model.JobListVo;
import com.project.myapp.page.model.Criteria;



public interface JobRepository {
	
	public List<JobListVo> jobList(Criteria cri);
	
	public List<JobDetailVo> jobRecommendList(Criteria cri);
	
	public JobDetailVo jobdetail(String job);
	
	public int jobTotal(Criteria cri);
	
	public int jobRecommendTotal(Criteria cri);
	}
