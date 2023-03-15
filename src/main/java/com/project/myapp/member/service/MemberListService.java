package com.project.myapp.member.service;

import java.util.List;

import com.project.myapp.member.model.JoinVo;
import com.project.myapp.page.model.Criteria;

public interface MemberListService {
	public List<JoinVo> memberList(Criteria cri);
}
