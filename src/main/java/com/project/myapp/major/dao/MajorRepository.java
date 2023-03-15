package com.project.myapp.major.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.myapp.major.model.MajorTest;
import com.project.myapp.major.model.MajorVo;
import com.project.myapp.page.model.Criteria;

public interface MajorRepository {
	
	public List<MajorVo> majorList(Criteria cri);
	
	public MajorVo majorDetail(String major);
	
	public int majorTotal(Criteria cri);
	
	public int majorRecommendTotal(MajorTest majorTest);
	
	public List<MajorVo> majorRecommend(@Param("majorTest")MajorTest majorTest,@Param("cri") Criteria cri);
}
